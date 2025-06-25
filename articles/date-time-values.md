---
title: Customize or format date and time values in a flow
description: Learn how to customize or format date and time values in a Power Automate flow.
author: kisubedi
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 06/25/2025
ms.author: kisubedi
ms.reviewer: v-aangie
search.audienceType: 
  - flowmaker
  - enduser
contributors:
 - kisubedi
 - v-aangie
 - aartig13
ms.contributors:
 - anaggar
---

# Customize or format date and time values in a flow

This article provides steps to customize or format date and time values in a Power Automate flow.

When working with date and time values in a Power Automate flow, you might find that the date and time format isn't what you expected, or you might want to customize the format of the output. You can do this by passing format strings to the [formatDateTime](/azure/logic-apps/workflow-definition-language-functions-reference#formatDateTime) function.

## Format date and time

The `formatDateTime()` function in Power Automate enables you to manipulate and format date and time values in various display formats. It also offers an easy way to handle data and time across different time zones.

The `formatDateTime()` function takes two parameters:

- **Timestamp**: The timestamp is the date and time value that needs to be formatted.  

    It can be a manual string or dynamic content. When entered manually, the timestamp is expected to follow the ISO 8601 format ("yyyy-MM-ddTHH:mm:ssZ").
- **Format string**: The format string specifies the output format for the date and time.

    The format string parameter of the formatDateTime() function can either be a standard format string or a custom format string.

### Standard format strings

A standard format string uses a single character (for example, d, g, or G) as the format specifier.

**Examples**

- The format string `g` corresponds to the General date/time pattern (short time):

    `formatDateTime('2009-06-15T13:45:30', 'g')` // Returns the format 6/15/2009 1:45 PM

- The format string `D` corresponds to the Long date pattern:

    `formatDateTime('2009-06-15T13:45:30', 'D')` // Returns the format Monday, June 15, 2009

For more information and examples of using standard date and time format strings, go to [Standard date and time format strings](/dotnet/standard/base-types/standard-date-and-time-format-strings).

### Custom format strings

A custom format string is any string with more than one character (for example, `M/dd/yyyy h:mm tt`) that can control the visibility, positioning, and precision of the month, day, year, hour, second, and so on, of the date and time value.

**Examples**

- The format string `M/dd/yyyy h:mm tt` represents the same pattern as the standard format string `g` as described in [Standard format strings](#custom-format-strings):

    `formatDateTime('2009-06-15T13:45:30', 'M/dd/yyyy h:mm tt')` // Returns the format 6/15/2009 1:45 PM

- The format string `HH:mm:ss tt` returns the 24 hour format:

    `formatDateTime('2009-06-15T13:45:30', 'M/dd/yyyy HH:mm:ss tt')` // Returns the format 6/15/2009 13:45:30 PM

- The format string hh:mm:ss tt returns the 12 hour format:

    `formatDateTime('2009-06-15T13:45:30', 'yyyy/MM/dd hh:mm:ss tt')` // Returns the format 2009/06/15 1:45:30 PM

- `utcNow()` function used as the timestamp to automatically fetch the current date and time in UTC, and the format string `dd-MM-yyyy` to display the date and time:  

    `formatDateTime(utcNow(), 'MMMM dd, yyyy, HH:mm')` //Returns the current date time in the format June 15, 2009, 16:50

- `utcNow()` function used as the timestamp to automatically fetch the current date and time in UTC, and the format string `dd-MM-yyyy` to display the date but not time:  

    `formatDateTime(utcNow(), 'dd-MM-yyyy')` //Returns the current date in the format 15-06-2009

For more information and examples of using custom date and time format strings, go to [Custom date and time format strings](/dotnet/standard/base-types/custom-date-and-time-format-strings).

## Use in a flow

To use a date and time value in a flow, follow these steps.

1. In the flow, select the input field where you want to enter the formatted date and time value.
1. Go to **Add dynamic content** and select the **Expression** tab to open the expression editor.
1. Type **formatDateTime()**.

    Alternatively, look for it under **Date and time** functions.

1. Provide the value to be formatted, surrounded by single quotes.

    Dynamic content can be used but shouldn't be surrounded by single quotes.

1. Provide the format string, surrounded by single quotes.
1. The full expression should look like the following examples:
 
    - `formatDateTime('<your-value>', 'dd/MM/yyyy hh:mm tt')`
    - `formatDateTime('<dynamic-value>', 'dd/MM/yyyy hh:mm tt')`

    :::image type="content" source="./media/date-time-values/expression.svg" alt-text="Screenshot of the Add dynamic content link and the Expression tab.":::

1. Select **OK**.

## Example with dynamic content

Dynamic contents are variables produced by triggers and actions within a flow diagram. They enable users to select field references from previous steps and write expressions.

This example walks through a simple flow that demonstrates the use of the `formatDateTime()` function with dynamic content. The trigger used in this example is a manually triggered flow that requires user input.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Set up the trigger for the flow. This example uses **Date** as the input.
    1. On the left navigation pane, select **Create** > **Instant cloud flow**.
    1. In the **Flow name** field, enter a name for your flow.
    1. In the **Choose how to trigger this flow** list, select **Manually trigger a flow**.
    1. Select **Create**.
    1. Select the **Manually trigger a flow** card.
    1. On the **Paramaters** tab, select **+ Add an input** > **Date**.
    1. In the field to the right, enter **2023-10-22**.

        :::image type="content" source="./media/date-time-values/date.svg" alt-text="Screenshot of the date format in the Parameters tab.":::

1. Add the **Send an email (v2)** action.
    1. Below the **Manually trigger a flow** card, select the plus sign (**+**) > **Add an action**.
    1. In the **Search** field, start typing **Send an email (v2)** and select it from the list when you see it.
    1. Select the **Body** field in the email, and then select ***fx*** (Insert Expression).
    1. Select **Dynamic content**.

        The dynamic content shown here is related to the trigger. It links together the trigger and actions that need to be taken.

    1. In the field above **Dynamic content**, start typing **formatDateTime** and select it from the dropdown menu when it appears.
    1. Scroll down the **Dynamic content** list and select **Trigger date**. If it doesn't appear, select **See More**.

       This variable's dynamic content comes from the date field in the trigger.

    1. Provide the format string (surrounded by single quotes) based on the desired output format for the date. In this example, MM/dd/yyyy format is used.  

        The full expression looks like this:

        `formatDateTime(triggerBody()?['date'], 'MM/dd/yyyy')`

        :::image type="content" source="./media/date-time-values/format.png" alt-text="Screenshot of the formatDatTime function using dynamic content.":::

    1. Select **Add**.
1. In the **Parameters** tab, insert an email in the **To** field, and a subject in the **Subject** field.
1. Select **Save**.

1. After running the flow, the email received shows the date in the specified MM/dd/yyyy format.

## Example with Convert time zone

Power Automate uses Coordinated Universal Time (UTC) by default. To handle date and time values in other time zones, you can use `formatDateTime` in conjunction with the `convertTimeZone` function.

For example, to display the current time in Eastern Standard time, you can use the following syntax:  
  
`formatDateTime(convertTimeZone(utcNow(), 'UTC', 'Eastern Standard Time'), 'yyyy-MM-dd HH:mm:ss')` // Returns the date time adjusted for Eastern Standard time

## Related information

For more information on the date and time function, select the following articles.

- [Convert a time zone](convert-time-zone.md)
- [formatDateTime function reference](/azure/logic-apps/workflow-definition-language-functions-reference#formatdatetime)
- [Format dates by examples](format-data-by-examples.md#format-dates-by-examples)
- [Training: Introduction to expressions in Power Automate (module)](/training/modules/introduction-expressions/)

