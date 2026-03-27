---
title: Expression cookbook for cloud flows - Power Automate
description: 30 ready-to-use expression patterns for text, dates, arrays, JSON, math, and logic in Power Automate cloud flows.
author: matow
ms.author: matow
ms.reviewer:
ms.topic: reference
ms.date: 03/19/2026
ms.subservice: cloud-flow
---

# Expression cookbook for cloud flows

30 ready-to-use expression patterns for common scenarios in Power Automate cloud flows. Copy, adapt, and use these patterns in your flows.

> [!NOTE]
> These expressions work in all Power Automate cloud flow license tiers. For the full function reference, see [Workflow expression functions](/azure/logic-apps/workflow-definition-language-functions-reference).

## Text operations

### 1. Convert to uppercase or lowercase

**Scenario**: Normalize user input before comparison or storage.

**Expression**: `toUpper(variables('input'))` or `toLower(variables('input'))`

**Example**: `toLower('John.Smith@Contoso.COM')` returns `john.smith@contoso.com`

> [!IMPORTANT]
> `toUpper()` is case-sensitive when used in comparisons. If you use `toUpper(A) = B`, make sure you apply it to both sides. `toUpper(A) = B` fails if B is mixed case.

### 2. Extract substring (left, right, mid)

**Scenario**: Pull a specific portion out of a text value. Get the first N characters, last N, or a range from the middle.

**Expression**:

- Left: `substring(variables('text'), 0, 5)`
- Right: `substring(variables('text'), sub(length(variables('text')), 5), 5)`
- Mid: `substring(variables('text'), 3, 4)`

**Example**: `substring('Invoice-2026-0042', 8, 4)` returns `2026`

> [!TIP]
> The second parameter is the start index (0-based), the third is the **length**, not the end index. `substring('ABCDE', 1, 3)` returns `BCD`, not `BC`.

### 3. Replace text

**Scenario**: Clean up or transform text values. Remove characters, swap delimiters, fix formatting.

**Expression**: `replace(variables('input'), 'old', 'new')`

**Example**: `replace('2026/03/18', '/', '-')` returns `2026-03-18`

> [!NOTE]
> `replace()` is case-sensitive. `replace('Hello', 'hello', 'Hi')` returns `Hello` unchanged. Convert to a common case first if needed.

### 4. Split string into array

**Scenario**: Break a delimited value (CSV, semicolon-separated emails) into individual items for looping.

**Expression**: `split(variables('input'), ',')`

**Example**: `split('alice@contoso.com,bob@contoso.com,carol@contoso.com', ',')` returns `["alice@contoso.com","bob@contoso.com","carol@contoso.com"]`

> [!TIP]
> Spaces after the delimiter are preserved. `split('a, b, c', ',')` returns `["a"," b"," c"]` with leading spaces. Use `trim()` on each item in a Select action afterward.

### 5. Concatenate with line breaks (for emails)

**Scenario**: Build a multi-line message body for email or Teams notifications.

**Expression**: `concat('Line 1', decodeUriComponent('%0A'), 'Line 2')`

**Example**: Use `decodeUriComponent('%0A')` for a newline or `decodeUriComponent('%0D%0A')` for Windows-style line breaks.

> [!IMPORTANT]
> Using `\n` directly in expressions doesn't produce a line break. It outputs the literal characters `\n`. Always use the `decodeUriComponent` approach, or use `<br>` if the output is HTML.

### 6. Check if string contains text

**Scenario**: Route a flow based on whether a subject line, email body, or field contains a keyword.

**Expression**: `contains(toLower(triggerBody()?['subject']), 'urgent')`

**Example**: `contains('Project Alpha Review', 'Alpha')` returns `true`

> [!NOTE]
> `contains()` is case-sensitive. Always wrap both the haystack and needle in `toLower()` for case-insensitive matching: `contains(toLower(value), toLower(search))`.

## Date and time

### 7. Get current date/time in a specific format

**Scenario**: Stamp a file name, log entry, or email with the current date and time.

**Expression**: `formatDateTime(utcNow(), 'yyyy-MM-dd HH:mm')`

**Example**: Returns `2026-03-18 14:30` (UTC). Use `convertTimeZone()` for local time.

> [!TIP]
> `utcNow()` is always UTC. For local time, chain with `convertTimeZone(utcNow(), 'UTC', 'Eastern Standard Time', 'yyyy-MM-dd HH:mm')`.

### 8. Add or subtract days from a date

**Scenario**: Calculate a due date, expiration, or reminder date relative to today.

**Expression**: `addDays(utcNow(), 7)` or `addDays(utcNow(), -30)`

**Example**: If today is `2026-03-18`, `addDays(utcNow(), 7)` returns `2026-03-25T...Z`

> [!NOTE]
> `addDays()` also accepts fractional values, but `addHours()` or `addMinutes()` are clearer for sub-day offsets. Don't use `addDays(utcNow(), 0.5)` when you mean `addHours(utcNow(), 12)`.

### 9. Convert string to date (parse)

**Scenario**: A text field contains a date like `03/18/2026` and you need to use it in date functions.

**Expression**: `parseDateTime(variables('dateString'), 'en-US')`

**Example**: `parseDateTime('03/18/2026', 'en-US')` returns a proper datetime value.

> [!IMPORTANT]
> Without the locale parameter, parsing depends on the flow's regional settings and can swap month/day. Always specify the locale explicitly to avoid `03/04/2026` being interpreted as April 3rd vs. March 4th.

### 10. Get day of week

**Scenario**: Run different logic on weekdays vs. weekends, or generate a "Monday report."

**Expression**: `dayOfWeek(utcNow())`

**Example**: Returns `0` for Sunday, `1` for Monday, ..., `6` for Saturday.

> [!TIP]
> Sunday is `0`, not `7`. Use `or(equals(dayOfWeek(...), 0), equals(dayOfWeek(...), 6))` for weekend checks. A condition like `dayOfWeek(utcNow()) > 5` catches Saturday but misses Sunday.

### 11. Calculate difference between two dates

**Scenario**: Determine how many days elapsed between a request date and a completion date.

**Expression**: `div(sub(ticks(variables('endDate')), ticks(variables('startDate'))), 864000000000)`

**Example**: If start is `2026-03-01` and end is `2026-03-18`, returns `17`.

> [!NOTE]
> There's no built-in `dateDiff()` function. You must use the ticks approach. The divisor `864000000000` converts ticks to days. For hours, use `36000000000`; for minutes, use `600000000`.

### 12. Format date for display

**Scenario**: Convert a datetime value to a human-readable format for emails or reports.

**Expression**: `formatDateTime(variables('myDate'), 'MMMM dd, yyyy')` or `formatDateTime(variables('myDate'), 'MM/dd/yyyy')`

**Example**: `formatDateTime('2026-03-18T14:30:00Z', 'MMMM dd, yyyy')` returns `March 18, 2026`

> [!IMPORTANT]
> `MM` is months, `mm` is minutes. `formatDateTime(value, 'mm/DD/yyyy')` produces `30/18/2026` (minutes and day) instead of `03/18/2026`. Use `dd` (lowercase) for day of month.

## Arrays and collections

### 13. Filter an array by condition

**Scenario**: Get only the items from an array that match a specific criterion.

**Expression**: Use the **Filter array** action with: `@item()?['Status']` is equal to `'Active'`

**Example**: Input `[{Name:'A', Status:'Active'}, {Name:'B', Status:'Closed'}]` returns `[{Name:'A', Status:'Active'}]`

> [!NOTE]
> You can't use a `where`-style filter expression inline. Use the Filter array action (not an expression). For expression-based filtering, use `@equals(item()?['Status'], 'Active')` in the Filter array's advanced mode.

### 14. Get first or last item from array

**Scenario**: Retrieve the most recent record or the first match from a list.

**Expression**: `first(variables('myArray'))` or `last(variables('myArray'))`

**Example**: `first(body('Get_items')?['value'])` returns the first item from a SharePoint query.

> [!TIP]
> `first()` on an empty array returns `null`, not an error. Always follow with a null check: `if(empty(variables('myArray')), null, first(variables('myArray')))`.

### 15. Count items in array

**Scenario**: Check how many results a query returned, or validate that a list has enough items.

**Expression**: `length(variables('myArray'))`

**Example**: `length(body('Get_items')?['value'])` returns the number of items from a SharePoint list query.

> [!NOTE]
> `length()` works on both arrays and strings. `length('hello')` returns `5` (character count). Make sure you're passing an array, not a string that looks like an array.

### 16. Create comma-separated string from array (join)

**Scenario**: Convert a list of names, emails, or IDs into a single delimited string for display or an API call.

**Expression**: `join(variables('myArray'), ', ')`

**Example**: `join(createArray('Alice', 'Bob', 'Carol'), '; ')` returns `Alice; Bob; Carol`

> [!TIP]
> `join()` works on arrays of strings. If your array contains objects, use a **Select** action first to extract the field you want, then join the result.

### 17. Check if array contains a value

**Scenario**: Determine if a specific item exists in a list before proceeding.

**Expression**: `contains(variables('myArray'), 'searchValue')`

**Example**: `contains(createArray('North', 'South', 'East', 'West'), 'East')` returns `true`

> [!NOTE]
> For arrays of objects, `contains()` checks for the entire object, not a property value. To check if any object has a matching property, use a Filter array action and then check `length()` of the result.

## JSON and objects

### 18. Parse JSON string

**Scenario**: An HTTP action or custom connector returns a JSON string that you need to work with as structured data.

**Expression**: `json(body('HTTP'))`

**Example**: `json('{"name":"Alice","age":30}')` returns an object you can access with `?['name']`.

> [!IMPORTANT]
> Don't double-parse. If the action already returns parsed JSON (most connector actions do), wrapping it in `json()` again causes an error. Use `json()` only on raw string responses, not on action outputs that are already objects.

### 19. Get nested property from JSON

**Scenario**: Access a value deep inside a JSON response, for example, `response.data.items[0].name`.

**Expression**: `body('HTTP')?['data']?['items']?[0]?['name']`

**Example**: For `{"data":{"items":[{"name":"Widget"}]}}`, returns `Widget`.

> [!IMPORTANT]
> Don't forget the `?` (safe navigation). `body('HTTP')['data']['items']` throws an error if any level is null. Always use `?['key']` to safely traverse: each `?` returns null instead of failing if the parent is missing.

### 20. Create JSON object from values

**Scenario**: Build a request body for an HTTP action from flow variables and dynamic content.

**Expression**: `json(concat('{"name":"', variables('name'), '","status":"', variables('status'), '"}'))`

**Example**: With name=`Alice` and status=`Active`, returns `{"name":"Alice","status":"Active"}`.

> [!TIP]
> If any variable contains quotes or special characters, the JSON will be malformed. For robust construction, use a **Compose** action with `createObject('name', variables('name'), 'status', variables('status'))` or build it in a Compose action directly.

### 21. Convert object to string

**Scenario**: Log a JSON object to a text field, or pass structured data as a string parameter.

**Expression**: `string(variables('myObject'))`

**Example**: `string(json('{"a":1}'))` returns `{"a":1}` as a string.

> [!NOTE]
> `string()` on an array or object produces compact JSON (no pretty-printing). There's no built-in `prettyPrint()`. Accept compact JSON or build formatted text manually.

### 22. Handle null or empty values safely

**Scenario**: Prevent errors when a field might be null, empty, or missing entirely.

**Expression**: `coalesce(triggerBody()?['optionalField'], 'default value')`

**Example**: If `optionalField` is null, returns `'default value'`. If it has a value, returns that value.

> [!IMPORTANT]
> `coalesce()` only handles `null`, not empty strings. For empty strings, combine with a condition: `if(empty(triggerBody()?['field']), 'default', triggerBody()?['field'])`. The `empty()` function returns true for both null and empty string `''`.

## Numbers and math

### 23. Round a number

**Scenario**: Display a percentage or currency value with a fixed number of decimal places.

**Expression**: `formatNumber(variables('value'), 'N2')` (for display) or `div(mul(variables('value'), 100), 100)` (for truncation)

**Example**: `formatNumber(3.14159, 'N2')` returns `3.14` as a string.

> [!NOTE]
> `formatNumber()` returns a string, not a number. If you need to do further math on the rounded value, parse it back: `float(formatNumber(variables('value'), 'N2'))`.

### 24. Convert string to number (and back)

**Scenario**: A form or email gives you a number as text, and you need to do math with it.

**Expression**: `int(variables('textNumber'))` or `float(variables('textNumber'))` and `string(variables('numericValue'))`

**Example**: `int('42')` returns `42`. `float('3.14')` returns `3.14`. `string(42)` returns `'42'`.

> [!IMPORTANT]
> `int('3.14')` throws an error. It won't truncate a decimal string. Use `float()` first, then convert: `int(float('3.14'))` if you need an integer from a decimal string.

### 25. Calculate percentage

**Scenario**: Show what fraction one value is of another (for example, completion rate, utilization).

**Expression**: `mul(div(float(variables('part')), float(variables('total'))), 100)`

**Example**: With part=`75` and total=`200`, returns `37.5`.

> [!IMPORTANT]
> Integer division truncates. `div(75, 200)` returns `0` because both are integers. Always convert to float first: `div(float(75), float(200))` returns `0.375`.

## Conditionals and logic

### 26. If/then/else in an expression

**Scenario**: Return different values based on a condition, without adding a Condition action to the flow.

**Expression**: `if(equals(variables('status'), 'Approved'), 'Proceed', 'Wait')`

**Example**: If status is `Approved`, returns `Proceed`. Otherwise returns `Wait`.

> [!NOTE]
> The `if()` function doesn't support `>`, `<` operators directly. Use helper functions: `if(greater(variables('count'), 10), 'Over', 'Under')`. Available comparisons: `equals()`, `greater()`, `less()`, `greaterOrEquals()`, `lessOrEquals()`.

### 27. Coalesce (first non-null value)

**Scenario**: Try multiple fields and use the first one that has a value, for example, preferred name, display name, email.

**Expression**: `coalesce(triggerBody()?['preferredName'], triggerBody()?['displayName'], triggerBody()?['email'], 'Unknown')`

**Example**: If preferredName is null and displayName is `'Alice'`, returns `Alice`.

> [!TIP]
> `coalesce()` skips `null` but not empty strings `''`. An empty string is a valid non-null value. Combine with a helper if empty strings should also be skipped: `coalesce(if(empty(A), null, A), if(empty(B), null, B), 'default')`.

### 28. Check if value is null or empty

**Scenario**: Validate that a required field has a usable value before processing.

**Expression**: `empty(variables('input'))`

**Example**: `empty('')` returns `true`. `empty(null)` returns `true`. `empty('hello')` returns `false`.

> [!IMPORTANT]
> `empty()` doesn't work on numbers. `empty(0)` throws an error. For numbers, use `equals(variables('num'), null)` or check the type first.

### 29. Compare dates (is date A after date B?)

**Scenario**: Check if a deadline has passed, or if one event happened before another.

**Expression**: `greater(ticks(variables('dateA')), ticks(variables('dateB')))`

**Example**: `greater(ticks('2026-03-18'), ticks('2026-03-15'))` returns `true` (March 18 is after March 15).

> [!IMPORTANT]
> Comparing date strings directly with `greater('2026-03-18', '2026-03-15')` happens to work for ISO format (YYYY-MM-DD) because it sorts lexicographically. But it fails for other formats. `greater('03/18/2026', '12/01/2025')` returns `false` because `0` < `1`. Always use `ticks()` for reliable date comparison.

### 30. Boolean logic (AND/OR in conditions)

**Scenario**: Combine multiple conditions in a single expression, for example, approved AND amount > 1000.

**Expression**: `and(equals(variables('status'), 'Approved'), greater(variables('amount'), 1000))`

**Example**: Returns `true` only if status equals `Approved` and amount is greater than 1000.

> [!NOTE]
> You can't chain `and`/`or` with `&&`/`||` syntax. Always use the function form. For complex logic, nest them: `or(and(A, B), and(C, D))`. Readability degrades with deep nesting. Consider using a Condition action with multiple rows instead.

## Quick reference card

| Task | Expression |
|---|---|
| Uppercase | `toUpper(value)` |
| Lowercase | `toLower(value)` |
| Substring | `substring(value, start, length)` |
| Replace | `replace(value, old, new)` |
| Split | `split(value, delimiter)` |
| Contains (text) | `contains(toLower(value), toLower(search))` |
| Now (formatted) | `formatDateTime(utcNow(), 'yyyy-MM-dd')` |
| Add days | `addDays(date, count)` |
| Day of week | `dayOfWeek(date)` (0=Sun) |
| Days between | `div(sub(ticks(end), ticks(start)), 864000000000)` |
| First item | `first(array)` |
| Last item | `last(array)` |
| Count | `length(array)` |
| Join | `join(array, delimiter)` |
| Parse JSON | `json(stringValue)` |
| Safe property | `object?['key']` |
| Null fallback | `coalesce(value, default)` |
| Is empty | `empty(value)` |
| If/else | `if(condition, trueVal, falseVal)` |
| Compare dates | `greater(ticks(dateA), ticks(dateB))` |
| Int from string | `int(stringValue)` |
| Float from string | `float(stringValue)` |
| AND | `and(condA, condB)` |
| OR | `or(condA, condB)` |

## See also

- [Cloud flow error code reference](error-reference.md)
- [Troubleshoot cloud flow errors](troubleshoot-flow-errors.md)
- [Use expressions in conditions](/power-automate/use-expressions-in-conditions)
- [Workflow expression functions reference](/azure/logic-apps/workflow-definition-language-functions-reference)
- [Power Automate limits and configuration](/power-automate/limits-and-config)
