---
title: Convert a time zone
description: Learn how to convert a time zone to the intended time zone in a Power Automate trigger or action.
author: anaggar
contributors:
  - anaggar
  - aartig13
  - v-aangie
ms.author: anaggar
ms.reviewer: angieandrews
ms.topic: conceptual
ms.date: 01/31/2024
ms.subservice: cloud-flow
---

# Convert a time zone

This article provides steps to convert the time zone to the intended time zone in a Power Automate trigger or action.

When passing datetimes through triggers and actions in Power Automate flows, you might find that the time zone isn't what you expected, or you might wish to convert the time zone (frequently in Coordinated Universal Time (UTC)) to your local time. You can do this using the **Convert time zone** action or the `convertTimeZone` expression.

Dates are passed through services in varying formats or time zones, so each connector might use a different datetime format or time zone. Some services strictly use UTC time to avoid confusion.

## Convert a time zone using an action

Power Automate has a built-in operation called **Convert time zone**.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Find your flow and select **Edit** to add an action.
1. In the **Search** box, type **convert time zone** and choose the built-in **Convert time zone** operation.

   :::image type="content" source="media/convert-time-zone/convert-time-zone-action.svg" alt-text="Screenshot to search for the convert time zone action in a flow.":::

1. Add the required and optional inputs for the **Convert time zone** operation.

   - **Base time**: The datetime you wish to convert.
   - **Source time zone**: The time zone that the datetime is currently in.
   - **Destination time zone**: The time zone you want to convert your date to.
   - **Format string** *(Optional)*: The string that specifies the desired format of the converted time.

   For ways to find the current time zone, go to the [Common format scenarios](#common-format-scenarios) section in this article.

## Convert a time zone using an expression

Power Automate has an expression function `convertTimeZone` that converts a timestamp from the source time zone to the target time zone.



:::image type="content" source="media/convert-time-zone/expression.png" alt-text="Screenshot shows that Power Automate has an expression function for converting the time zone.":::

Here's an example of the function in the console:

```console
convertTimeZone(timestamp: string, sourceTimeZone: string, destinationTimeZone: string, format?: string)
```

The function takes the following parameters:

- `timestamp`: The datetime you wish to convert.
- `sourceTimeZone`: The time zone the datetime is currently in.
- `destinationTimeZone`: The time zone you want to convert your date to.
- `format` (optional): The format of the time zone you wish to convert your date to.

### Example: Convert a time zone

This example converts a time zone to the specified time zone and format.

```console
convertTimeZone('2018-01-01T80:00:00.0000000Z', 'UTC', 'Pacific Standard Time', 'D')
```

It returns the result: `Monday, January 1, 2018`.

### Example: Use dynamic content

 This is an example of using dynamic content in the expression. Here, the `triggerBody()?['Date']` timestamp is the dynamic content you want to format. The source time zone is `UTC`. The destination time zone is `Eastern Standard Time`. The format is the custom format string `HH:mm`.

```console
convertTimeZone(triggerBody()?['Date'],'UTC','Eastern Standard Time','HH:mm')
```

To learn more about this expression function, go to [convertTimeZone](/azure/logic-apps/workflow-definition-language-functions-reference#convertTimeZone).

To learn more about the format string parameter, go to [standard date and time format strings](/dotnet/standard/base-types/standard-date-and-time-format-strings) and [custom date and time format strings](/dotnet/standard/base-types/custom-date-and-time-format-strings).

## Common format scenarios

This section covers various scenarios and how to apply the appropriate format.

#### Decipher a datetime

- Datetimes might have different formats. If your datetime has a `Z` at the end, it means it's in UTC time.

  **Example**: `2020-04-10T01:28:14.0406387Z`

- You might receive an error that states your date time string isn't in the correct format.

    **Example**: 'The date time string must match ISO8601 format.'

    To learn more about how to correctly format your datetime string, go to [convertTimeZone](/azure/logic-apps/workflow-definition-language-functions-reference).

#### Check the time zone of an output

If you're unsure what format the datetime time zone is currently in, you can run your flow and see the datetime output format.

In this example, the **Get forecast for today** operation outputs the timestamp for when you got the forecast.

:::image type="content" source="media/convert-time-zone/get-forecast.png" alt-text="Screenshot shows an example of checking the datetime output format.":::

This datetime uses the ISO-8601 datetime format. This operation outputs the datetime in the UTC time zone.

#### Convert a timestamp to or from UTC

To convert a timestamp from the source time zone to UTC, or from UTC to the target time zone, use the [convertFromUtc](/azure/logic-apps/workflow-definition-language-functions-reference#convertfromutc) and [convertToUtc](/azure/logic-apps/workflow-definition-language-functions-reference#converttoutc) expression functions.

## Limitations

There might be limitations in some connectors for how the time zone displays. To learn more about each connector, go to [Connector reference overview](/connectors/connector-reference/).

## Related information

- [Customize or format date and time values in a flow](date-time-values.md)
- [Reference guide to workflow expression functions in Azure Logic Apps and Power Automate](/azure/logic-apps/workflow-definition-language-functions-reference)
