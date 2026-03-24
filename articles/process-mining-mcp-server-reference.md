---
title: Process Mining MCP server reference
description: Technical reference for the Process Mining Model Context Protocol (MCP) server tools, request/response structures, and filtering capabilities.
author: praak
contributors:
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: reference
ms.date: 03/23/2026
ms.author: praveenkumar-ak
ms.reviewer: angieandrews
search.audienceType:
  - processanalyst
  - flowmaker
  - enduser
---


# Process Mining MCP server reference

## What is the Process Mining MCP server?

The Process Mining MCP server is a specialized implementation of the Model Context Protocol that exposes Process Mining analytics capabilities to AI agents and conversational applications. It provides programmatic access to process mining data, enabling natural language interactions with process analytics through MCP-compatible clients like Microsoft Copilot Studio.

**Key capabilities:**
- **Process discovery**: List and explore available processes and their metadata
- **Analytics and metrics**: Retrieve bottleneck analysis, variants, cases, edges, and aggregated metrics
- **Correlation analysis**: Identify attribute influences on process performance
- **Advanced filtering**: Apply complex filters across attributes, timeframes, metrics, subprocesses, and sequences
- **Long-running operations**: Support for complex queries with progress notifications

**Architecture:**
- **Server-side component**: Integrates with Power Platform and Dataverse
- **Authentication**: Azure AD-based with environment context
- **Connector**: Available as a prebuilt [Process Mining connector](https://learn.microsoft.com/en-us/connectors/processmining/) in the Power Platform connectors catalog
- **Protocol**: Model Context Protocol (MCP) standard

> [!NOTE]
>
> Prerequisites for using the Process Mining MCP server:
> - Active Process Mining license
> - Process Mining environment configured in Power Platform with at least one ingested process
> - Azure AD authentication
> - MCP-compatible client (e.g., Copilot Studio) with the [Process Mining connector](https://learn.microsoft.com/en-us/connectors/processmining/) configured


## Available MCP tools

The server exposes 9 tools organized by purpose. Each tool accepts specific parameters and returns structured analytics data.

### Process discovery tools

Use these tools to discover available processes and their configuration.

| Tool name | Purpose | Key parameters |
|-----------|---------|----------------|
| [get_processes](#get_processes) | Lists all processes with IDs and names | None (uses environment context) |
| [get_process_details](#get_process_details) | Retrieves attributes, custom metrics, business rules | processId (Guid) |
| [get_attribute_values](#get_attribute_values) | Gets values for specific attribute with pagination | processId, attributeName, itemsPerPage, itemsToSkip |

#### get_processes

Lists all processes accessible to the authenticated user in the current environment.

**Parameters:**

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| None | - | - | - | Uses authentication context to determine environment |

**Returns:**
- Array of EntityListItem with processId and processName

**Example usage:**
```
User: "What processes are available?"
Tool: get_processes
Response: List of processes with IDs
```

**When to use:**
- First tool to call when discovering available processes
- Obtain valid process IDs for subsequent tool calls
- Verify user has access to specific processes

#### get_process_details

Retrieves comprehensive metadata for a specific process including attributes, custom metrics, and business rules.

**Parameters:**

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| processId | Guid | - | Yes | Unique identifier for the process |

**Returns:**
- GetAnalyticsMetadataResult containing:
  - **Attributes**: Case-level and event-level attributes
  - **Custom metrics**: User-defined metrics
  - **Business rules**: Configured rules for the process

**Example usage:**
```
User: "Tell me about the Order-to-Cash process attributes"
Tool: get_process_details with processId
Response: Attributes (Department, Customer, Activity), custom metrics, business rules
```

**When to use:**
- Before constructing filters (to discover valid attribute names)
- Understanding process schema and available metrics
- Identifying case-level vs event-level attributes (important for correlation analysis)

> [!TIP]
>
> Always call get_process_details before using get_correlation to verify the attribute is case-level.

#### get_attribute_values

Retrieves all values for a specific attribute with pagination support.

**Parameters:**

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| processId | Guid | - | Yes | Unique identifier for the process |
| attributeName | string | - | Yes | Name of attribute to retrieve values for |
| itemsPerPage | int | 20 | No | Number of items per page (max varies by deployment) |
| itemsToSkip | int | 0 | No | Offset for pagination |

**Returns:**
- McpAnalyticsListResult with:
  - **items**: Array of dictionaries containing attribute values and associated metrics
  - **offset**: Current pagination offset
  - **limit**: Page size
  - **totalCount**: Total available records

**Example usage:**
```
User: "What departments are in the Order-to-Cash process?"
Tool: get_attribute_values with processId, attributeName="Department"
Response: List of department values (Sales, Finance, Warehouse)
```

**When to use:**
- Discovering valid values for filtering
- Exploring attribute distributions
- Building dynamic filter UIs


### Analytics and metrics tools

Use these tools to analyze process performance, identify bottlenecks, and retrieve metrics.

| Tool name | Purpose | Key parameters |
|-----------|---------|----------------|
| [get_process_overall_metrics](#get_process_overall_metrics) | Aggregated process-level metrics | processId, filterOptions |
| [get_bottleneck_analysis](#get_bottleneck_analysis) | Activities with highest duration | processId, filterOptions |
| [get_variants_with_metrics](#get_variants_with_metrics) | Process variants with metrics | processId, filterOptions, metricToSortBy |
| [get_edges_with_metrics](#get_edges_with_metrics) | Process flow edges with metrics | processId, filterOptions |
| [get_cases_with_metrics](#get_cases_with_metrics) | Individual cases with metrics | processId, filterOptions, metricToSortBy |

#### get_process_overall_metrics

Returns aggregated process-level metrics for the specified process and filters.

**Parameters:**

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| processId | Guid | - | Yes | Unique identifier for the process |
| filterOptions | McpFilterOptions | null | No | Optional filters to apply |
| itemsPerPage | int | 20 | No | Number of items per page |
| itemsToSkip | int | 0 | No | Offset for pagination |

**Returns:**
- Dictionary of metric key-value pairs including:
  - Total cases
  - Average/median/min/max case duration
  - Throughput metrics
  - SLA compliance metrics

**Example usage:**
```
User: "What are the overall metrics for Order-to-Cash?"
Tool: get_process_overall_metrics with processId
Response: 1,245 cases, avg duration 4.2 days, median 3.8 days
```

**When to use:**
- High-level process summaries
- Comparing filtered vs overall performance
- Establishing baseline metrics

#### get_bottleneck_analysis

Analyzes activities and returns them sorted by duration (descending) to identify bottlenecks.

**Parameters:**

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| processId | Guid | - | Yes | Unique identifier for the process |
| itemsPerPage | int | 20 | No | Number of items per page |
| itemsToSkip | int | 0 | No | Offset for pagination |
| mcpFilterOptions | McpFilterOptions | null | No | Optional filters to apply |

**Returns:**
- McpAnalyticsListResult with activities sorted by Duration (descending)
- Each item contains:
  - **Value**: Activity name
  - **Duration**: Average duration for the activity
  - Additional metrics as requested

**Special behavior:**
- Pre-configured to analyze "Activity" attribute
- Automatically includes Duration and Value metrics
- Sorted by Duration in descending order

**Example usage:**
```
User: "What are the top 3 bottlenecks in Order-to-Cash?"
Tool: get_bottleneck_analysis with processId, itemsPerPage=3
Response:
1. Approve Order - Avg duration: 3.2 days
1. Credit Check - Avg duration: 2.8 days
1. Prepare Shipment - Avg duration: 2.1 days
```

**When to use:**
- Identifying process bottlenecks
- Prioritizing improvement efforts
- Analyzing department-specific or segment-specific bottlenecks (with filters)

> [!TIP]
>
> For bottleneck analysis focused on specific departments, combine with AttributeValueFilter to identify segment-specific bottlenecks.

#### get_variants_with_metrics

Retrieves process variants (unique activity sequences) with associated metrics.

**Parameters:**

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| processId | Guid | - | Yes | Unique identifier for the process |
| filterOptions | McpFilterOptions | null | No | Optional filters to apply |
| itemsPerPage | int | 20 | No | Number of items per page |
| itemsToSkip | int | 0 | No | Offset for pagination |
| metricToSortBy | VariantMetric | CaseDuration | No | Metric to sort results by |
| sortOrder | Sorting | Descending | No | Sort direction (Ascending/Descending) |

**Returns:**
- McpAnalyticsListResult with variants including:
  - Variant path (sequence of activities)
  - Frequency and case count
  - Duration metrics
  - Behavioral deviation indicators

**Example usage:**
```
User: "What are the most common process variants?"
Tool: get_variants_with_metrics with processId, metricToSortBy=CaseCount, sortOrder=Descending
Response: Top 3 variants with frequencies and durations
```

**When to use:**
- Identifying happy path vs problematic variants
- Analyzing process conformance
- Finding rework loops and deviations
- Comparing variant performance

#### get_edges_with_metrics

Retrieves transitions (edges) between activities with frequency and duration metrics.

**Parameters:**

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| processId | Guid | - | Yes | Unique identifier for the process |
| filterOptions | McpFilterOptions | null | No | Optional filters to apply |
| itemsPerPage | int | 20 | No | Number of items per page |
| itemsToSkip | int | 0 | No | Offset for pagination |

**Returns:**
- McpAnalyticsListResult with edges including:
  - From-activity and to-activity
  - Transition frequency
  - Transition duration
  - Deviation indicators

**Example usage:**
```
User: "Show me the process flow transitions"
Tool: get_edges_with_metrics with processId
Response: Activity transitions with frequencies (e.g., Create Order → Approve Order: 1,100 cases)
```

**When to use:**
- Understanding process flow structure
- Identifying routing complexity
- Finding bottleneck transitions
- Analyzing handover delays

#### get_cases_with_metrics

Retrieves individual cases with associated metrics and attributes.

**Parameters:**

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| processId | Guid | - | Yes | Unique identifier for the process |
| filterOptions | McpFilterOptions | null | No | Optional filters to apply |
| itemsPerPage | int | 20 | No | Number of items per page |
| itemsToSkip | int | 0 | No | Offset for pagination |
| metricToSortBy | CaseMetric | Duration | No | Metric to sort results by |
| sortOrder | Sorting | Descending | No | Sort direction (Ascending/Descending) |

**Returns:**
- McpAnalyticsListResult with cases including:
  - Case ID
  - Duration, active time, waiting time
  - Event count
  - Attribute values

**Example usage:**
```
User: "Show me cases that took longer than 5 days"
Tool: get_cases_with_metrics with processId, filterOptions (MetricConditionFilter for Duration>5 days)
Response: List of cases exceeding 5 days with details
```

**When to use:**
- Detailed case investigation
- Identifying outlier cases
- Root cause analysis for specific cases
- Exporting case data for further analysis


### Correlation analysis tools

Use this tool to identify how attributes influence process metrics.

| Tool name | Purpose | Key parameters |
|-----------|---------|----------------|
| [get_correlation](#get_correlation) | Attribute influence on process metrics | processId, attributeName, influenceFormula |

#### get_correlation

Calculates correlation between attribute values and process metrics to identify influences.

**Parameters:**

| Parameter | Type | Default | Required | Description |
|-----------|------|---------|----------|-------------|
| processId | Guid | - | Yes | Unique identifier for the process |
| attributeName | string | - | Yes | Name of attribute (must be case-level) |
| influenceFormula | InfluenceFormula | - | Yes | Metric to analyze influence on |
| sortOrder | Sorting | Descending | No | Sort direction for influence values |
| filterOptions | McpFilterOptions | null | No | Optional filters to apply |

**Returns:**
- McpAnalyticsListResult with influence values for each attribute value
- Higher values indicate stronger influence on the selected metric

**Available influence formulas:**
- ActiveTimeInfluence
- CaseUtilizationInfluence
- DurationInfluence
- EventCountInfluence
- LoopCountInfluence
- ReworkCountInfluence
- SelfloopCountInfluence
- WaitingTimeInfluence

**Example usage:**
```
User: "Does department influence process duration?"
Tool: get_correlation with processId, attributeName="Department", influenceFormula=DurationInfluence
Response: Sales: 0.75 (high), Finance: 0.42 (moderate), Warehouse: 0.18 (low)
```

**When to use:**
- Root cause analysis
- Identifying which segments contribute to poor performance
- Prioritizing improvement efforts by impact
- Understanding attribute effects on metrics

> [!IMPORTANT]
>
> The get_correlation tool only works with **case-level attributes**. Using event-level attributes (like Activity) will result in an error: "Correlation cannot be calculated for non case-level attributes."


## Request and response structures

### Common request parameters

Most tools accept these standard parameters for pagination and sorting.

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| processId | Guid | Required | Unique identifier for the process (except get_processes) |
| itemsPerPage | int | 50 | Number of items to return per page |
| itemsToSkip | int | 0 | Number of items to skip (offset for pagination) |
| metricToSortBy | string | Varies by tool | Metric name for sorting results |
| sortOrder | Sorting | Descending | Sort direction (Ascending or Descending) |
| filterOptions | McpFilterOptions | null | Complex filtering options (see Filter Options section) |

### Response structure

#### McpAnalyticsListResult

Standard response format for list-based queries.

```json
{
  "items": [
    {
      "metric1": "value1",
      "metric2": 123.45,
      "metric3": 456
    },
    {
      "metric1": "value2",
      "metric2": 98.76,
      "metric3": 321
    }
  ],
  "offset": 0,
  "limit": 50,
  "totalCount": 500
}
```

**Fields:**
- **items**: Array of dictionaries containing metric key-value pairs
  - Keys are metric names (e.g., "Duration", "Value", "CaseCount")
  - Values are metric values (strings, numbers, dates)
- **offset**: Current pagination offset (equals itemsToSkip parameter)
- **limit**: Page size (equals itemsPerPage parameter)
- **totalCount**: Total number of records available (use for pagination)

**Pagination example:**
```
Request 1: itemsPerPage=50, itemsToSkip=0 → Returns items 1-50
Request 2: itemsPerPage=50, itemsToSkip=50 → Returns items 51-100
Request 3: itemsPerPage=50, itemsToSkip=100 → Returns items 101-150
Continue while offset + limit < totalCount
```

### Long-running operations

Complex queries may require additional processing time. The MCP server handles these operations asynchronously with server-side polling, streaming progress updates to the client.

**Operation flow:**
1. **Initial request**: Client sends tool invocation request to the MCP server
1. **Server-side processing**: The API handles polling internally &mdash; the server waits for the analytics engine to complete the query. No client-side polling is required.
1. **Progress notifications**: The server streams progress updates to the client automatically via Server-Sent Events (SSE). Progress notifications are sent approximately every 5 seconds during processing.
1. **Completion**: The server returns the final result with status Succeeded, FailedClientError, or FailedAnalyticsError

**Final statuses:**
- **Succeeded**: Results available in response
- **FailedClientError**: Validation error (invalid parameters, filters)
- **FailedAnalyticsError**: Analytics engine processing error

**Typical scenarios for long-running operations:**
- Large dataset queries (>10,000 cases)
- Complex filters with multiple conditions
- Correlation analysis across many attribute values
- Variant analysis with deep process complexity

> [!NOTE]
>
> The server handles all polling internally. Clients receive progress notifications automatically through the SSE transport without needing to implement polling logic. This approach is compatible with MCP's Streamable HTTP transport.


## Filter options reference

The McpFilterOptions structure enables precise control over data retrieval through five filter types. Filters can be combined to create complex queries.

### Filter combination logic

- All filter types within McpFilterOptions are combined with **AND** logic
- Multiple filters of the same type are combined with **OR** logic
- Each filter has an `isInclusive` property (default: true)
  - `isInclusive=true`: Include matching records
  - `isInclusive=false`: Exclude matching records

**Example:**
```
AttributeValueFilters: [Department=Sales OR Department=Marketing]
AND
MetricConditionFilters: [Duration > 5 days]
= Cases from Sales OR Marketing with duration > 5 days
```

### AttributeValueFilter

Filters based on specific attribute values (e.g., department, user, activity name).

**Properties:**

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| attributeName | string | Yes | Name of attribute to filter on |
| attributeValues | string[] | Yes | List of values to include or exclude |
| isInclusive | bool | No (default: true) | Include (true) or exclude (false) matching values |

**Example JSON:**
```json
{
  "attributeValueFilters": [
    {
      "attributeName": "Department",
      "attributeValues": ["Sales", "Marketing"],
      "isInclusive": true
    }
  ]
}
```

**Use cases:**
- Filter to specific departments, users, or customer segments
- Exclude test data or specific activities
- Analyze subsets of the process

**Validation rules:**
- attributeName must not be empty
- attributeValues array must contain at least one value
- Attribute name must exist in process schema (call get_process_details to verify)

### TimeframeFilter

Filters based on date/time ranges for case or event timestamps.

**Properties:**

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| startDate | DateTime | Yes | Start of timeframe (inclusive) |
| endDate | DateTime | Yes | End of timeframe (inclusive) |
| isInclusive | bool | No (default: true) | Include (true) or exclude (false) timeframe |

**Example JSON:**
```json
{
  "timeframeFilters": [
    {
      "startDate": "2025-01-01T00:00:00Z",
      "endDate": "2025-12-31T23:59:59Z",
      "isInclusive": true
    }
  ]
}
```

**Use cases:**
- Analyze specific time periods (quarters, months, years)
- Exclude historical data
- Compare time period performance

**Validation rules:**
- startDate must be before endDate
- Date format must be valid ISO 8601

> [!IMPORTANT]
>
> Validation error occurs if startDate is after endDate. Always verify date range before submitting.

### MetricConditionFilter

Filters based on metric value thresholds (e.g., duration > 5 days, event count < 10).

**Properties:**

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| metric | McpFilterMetricType | Yes | Metric to filter on |
| customMetricId | Guid | Conditional | Required if metric is CustomMetric |
| comparisonOperator | ValueFilterExpressionOperator | Yes | Comparison operator |
| dataType | ValueFilterDataType | Yes | Data type of value |
| value | object | Yes | Value to compare against |
| isInclusive | bool | No (default: true) | Include (true) or exclude (false) matches |

**Available metrics (McpFilterMetricType):**

| Metric Type | Description |
|-------------|-------------|
| EventDuration | Duration of individual events |
| CaseDuration | Total case duration from start to end |
| CaseActiveTime | Time spent actively processing (excluding wait time) |
| CaseWaitingTime | Time spent waiting between activities |
| CaseUtilization | Case utilization percentage |
| CaseCumulativeUtilization | Cumulative utilization across case lifecycle |
| CaseEventCount | Number of events per case |
| CaseSelfLoopCount | Count of self-loops (same activity repeated immediately) |
| CaseLoopCount | Count of loops (activity sequences that repeat) |
| CaseReworkCount | Count of rework instances |
| CustomMetric | User-defined metric (requires customMetricId) |

**Comparison operators:**
- EqualTo
- NotEqualTo
- GreaterThan
- GreaterThanOrEqualTo
- LessThan
- LessThanOrEqualTo

**Data types:**
- String
- Number
- Time (duration)
- DateTime

**Example JSON:**
```json
{
  "metricConditionFilters": [
    {
      "metric": "CaseDuration",
      "comparisonOperator": "GreaterThan",
      "dataType": "Time",
      "value": "5.00:00:00",
      "isInclusive": true
    }
  ]
}
```

**Use cases:**
- Identify cases exceeding SLA thresholds
- Filter to high-value or low-value cases
- Analyze cases with specific characteristics (e.g., high rework count)

**Validation rules:**
- CustomMetricId required when metric is CustomMetric
- Value must match specified dataType
- Metric must be valid for the query context

### SubProcessFilter

Filters by subprocess patterns where reference activities are followed by relative activities.

**Properties:**

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| attributeName | string | Yes | Attribute name (typically "Activity") |
| referenceAttributeValues | string[] | Yes | Starting activities in subprocess |
| relativeAttributeValues | string[] | Yes | Ending activities in subprocess |
| isInclusive | bool | No (default: true) | Include (true) or exclude (false) subprocess |

**Example JSON:**
```json
{
  "subProcessFilters": [
    {
      "attributeName": "Activity",
      "referenceAttributeValues": ["Create Order"],
      "relativeAttributeValues": ["Ship Goods"],
      "isInclusive": true
    }
  ]
}
```

**Use cases:**
- Analyze specific subprocess flows
- Identify cases following particular paths
- Exclude specific subprocess patterns

**Validation rules:**
- attributeName must not be empty
- referenceAttributeValues and relativeAttributeValues must each contain at least one value

### AttributeSequenceFilter

Filters by activity sequences with specific relationship types (directly followed, eventually followed, etc.).

**Properties:**

| Property | Type | Required | Description |
|----------|------|----------|-------------|
| attributeName | string | Yes | Attribute name (typically "Activity") |
| relationType | SequenceFilterRelationType | Yes | Relationship type between activities |
| referenceAttributeValues | string[] | Yes | First activities in sequence |
| relativeAttributeValues | string[] | Yes | Second activities in sequence |
| isInclusive | bool | No (default: true) | Include (true) or exclude (false) sequence |

**Relation types:**
- **DirectlyFollowed**: Reference activity directly followed by relative activity (no activities in between)
- **EventuallyFollowed**: Reference activity eventually followed by relative activity (other activities may be in between)

**Example JSON:**
```json
{
  "attributeSequenceFilters": [
    {
      "attributeName": "Activity",
      "relationType": "DirectlyFollowed",
      "referenceAttributeValues": ["Approve Order"],
      "relativeAttributeValues": ["Credit Check"],
      "isInclusive": true
    }
  ]
}
```

**Use cases:**
- Enforce specific activity sequences
- Identify conformance violations
- Analyze cases with particular ordering

**Validation rules:**
- attributeName must not be empty
- referenceAttributeValues and relativeAttributeValues must each contain at least one value


## Error handling

### Error codes

The MCP server uses three primary error codes:

| Error Code | Description | Common Causes |
|------------|-------------|---------------|
| InvalidParams | Invalid parameter values | Empty GUID, null required field, invalid timeframe, empty arrays |
| InvalidRequest | Request structure or business rule violations | Non-existent attribute names, filter syntax errors, unsupported operations |
| InternalError | Server-side processing errors | Analytics engine failures, data inconsistencies, service unavailability |

### Common validation errors

#### Empty processId
**Error**: "processId (Guid) must be id of the process."
**Cause**: processId parameter is empty or invalid
**Resolution**: Use get_processes to obtain valid process IDs

#### Invalid timeframe
**Error**: "StartDate must be before EndDate."
**Cause**: TimeframeFilter has startDate after endDate
**Resolution**: Verify date range before submitting request

#### Missing attribute name
**Error**: "Attribute name must be provided."
**Cause**: attributeName is null or empty in filter
**Resolution**: Provide valid attribute name from process schema

#### Empty attribute values
**Error**: "Attribute values must contain at least one value."
**Cause**: attributeValues array is empty in AttributeValueFilter
**Resolution**: Add at least one value to the array

#### Missing custom metric ID
**Error**: "CustomMetricId is required when metric is CustomMetric."
**Cause**: metric is CustomMetric but customMetricId is not provided
**Resolution**: Provide the GUID of the custom metric

#### Non-case-level attribute in correlation
**Error**: "Correlation cannot be calculated for non case-level attributes."
**Cause**: Attempting get_correlation with event-level attribute (e.g., "Activity")
**Resolution**: Use case-level attributes only (e.g., "Department", "Customer"); call get_process_details to identify case-level attributes

### Error response format

```json
{
  "error": {
    "code": "InvalidParams",
    "message": "Attribute name must be provided."
  }
}
```


## Best practices

### 1. Always retrieve process details first

Use get_process_details to discover available attributes, metrics, and business rules before constructing queries.

**Why**: Ensures attribute names match process schema, prevents validation errors, identifies case-level vs event-level attributes.

```
Step 1: get_processes → Obtain processId
Step 2: get_process_details with processId → Discover attributes
Step 3: Use discovered attributes in filters and queries
```

### 2. Implement pagination for large datasets

Use itemsPerPage and itemsToSkip for all list operations. Monitor totalCount to determine if more pages exist.

**Recommended page sizes:**
- Default: 50 items per page
- Large datasets: 20 items per page (faster response times)
- Small datasets: 100 items per page (fewer round trips)

```javascript
let allItems = [];
let offset = 0;
const pageSize = 50;

do {
  const response = await getTool(processId, pageSize, offset);
  allItems.push(...response.items);
  offset += pageSize;
} while (offset < response.totalCount);
```

### 3. Use filtering to reduce data volume

Apply AttributeValueFilter and TimeframeFilter early in your query chain to reduce processing time and response payload size.

**Filter priority:**
1. TimeframeFilter (reduces dataset quickly)
1. AttributeValueFilter (narrows to specific segments)
1. MetricConditionFilter (further refines results)

### 4. Handle long-running operations

Long-running operations are handled automatically by the server. The API uses server-side polling internally and streams progress updates to the client via Server-Sent Events (SSE). No client-side polling implementation is required.

**What to expect:**
1. The server processes complex queries asynchronously on your behalf
1. Progress notifications are delivered automatically through the SSE transport
1. The final result is returned when processing completes
1. Display the final results to the user when received

### 5. Cache process metadata

Process details (attributes, metrics, business rules) change infrequently. Cache get_process_details response to reduce API calls.

**Cache invalidation triggers:**
- Process reprocessing
- Configuration changes
- User-initiated refresh

### 6. Validate filters client-side

Check date ranges, attribute names, and required fields before sending requests to reduce round-trip errors.

**Client-side validation checklist:**
- [ ] ProcessId is non-empty GUID
- [ ] TimeframeFilter: startDate < endDate
- [ ] AttributeValueFilter: attributeName not empty, attributeValues contains at least one item
- [ ] MetricConditionFilter: customMetricId provided if metric is CustomMetric
- [ ] Attribute names match process schema

### 7. Use correlation strategically

Correlation analysis is computationally intensive. Apply filters first to reduce dataset before running correlation.

**Best practices:**
- Verify attribute is case-level (call get_process_details)
- Apply TimeframeFilter and AttributeValueFilter first
- Use for hypothesis testing, not exploration
- Cache results for specific segments


## Related information

- [Process Mining connector reference](https://learn.microsoft.com/en-us/connectors/processmining/) - Connector details, authentication, and throttling limits
- [Create a Copilot Studio agent with Process Mining](process-mining-mcp-create-CPS-agent.md) - Step-by-step implementation guide
- [Add tools to custom agents](https://learn.microsoft.com/en-us/microsoft-copilot-studio/advanced-connectors) - How to add the connector tool in Copilot Studio
- [MCP server connectors catalog](https://learn.microsoft.com/en-us/connectors/connector-reference/connector-reference-mcpserver-connectors) - Full list of available MCP connectors
- [Process Mining overview](https://learn.microsoft.com/en-us/power-automate/process-mining-overview) - Overview of Process Mining capabilities
- [Model Context Protocol specification](https://modelcontextprotocol.io/specification) - MCP standard details

