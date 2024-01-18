---
title: Restore deleted flows in Power Automate
description: Learn how to restore deleted flows in Power Automate.
author: kisubedi
contributors:
 - kisubedi
 - mregateiro
 - v-aangie
ms.subservice: cloud-flow
ms.date: 04/24/2023
ms.topic: conceptual
ms.author: kisubedi
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Customize or format date and sime values in a flow

This article provides steps to customize or format date and time values in a Power Automate flow.

*Applies to:*   Power Automate  
*Original KB number:*   4534778

# Symptoms

When working with date and time values in a Power Automate flow, you might find that the date and time format isn't what you expected, or you might want to customize the format of the output. You can do this by passing format strings to the [<u>formatDateTime()</u>](https://learn.microsoft.com/en-us/azure/logic-apps/workflow-definition-language-functions-reference#formatDateTime) function.

# Format date and time

The formatDateTime() function in Power Automate enables you to manipulate and format date and time values in various display formats and offers an easy way to handle data and time across different time zones.

The formatDateTime() function takes two parameters:

1.  Timestamp: The timestamp is the date and time value that needs to be formatted.  
    It can be a manual string or dynamic content. When entered manually, the timestamp is expected to follow the ISO 8601 format ("yyyy-MM-ddTHH:mm:ssZ").

2.  Format string: The format string specifies the output format for the date and time.

The format string parameter of the formatDateTime() function can either be a standard format string or a custom format string.

### Standard format strings

A standard format string uses a single character (for example, d, g, G,) as the format specifier.

**Examples**

-   The format string g corresponds to the General date/time pattern (short time):

formatDateTime('2009-06-15T13:45:30', 'g') // Returns the format 6/15/2009 1:45 PM

-   The format string D corresponds to the Long date pattern:

formatDateTime('2009-06-15T13:45:30', 'D') // Returns the format Monday, June 15, 2009

For more information and examples of using standard date and time format strings, see Standard date and time format strings.

### Custom format strings

A custom format string is any string with more than one character (for example, M/dd/yyyy h:mm tt) that can control the visibility, positioning, and precision of the month, day, year, hour, second and so on of the date and time value.

**Examples**

-   The format string M/dd/yyyy h:mm tt represents the same pattern as the standard format string g as described above:

formatDateTime('2009-06-15T13:45:30', 'M/dd/yyyy h:mm tt') // Returns the format 6/15/2009 1:45 PM

-   The format string HH:mm:ss tt returns the 24 hour format:

formatDateTime('2009-06-15T13:45:30', 'M/dd/yyyy HH:mm:ss tt') // Returns the format 6/15/2009 13:45:30 PM

-   The format string hh:mm:ss tt returns the 12 hour format:

formatDateTime('2009-06-15T13:45:30', 'yyyy/MM/dd hh:mm:ss tt') // Returns the format 2009/06/15 1:45:30 PM

-   utcNow() function used as the timestamp to automatically fetch the current date and time in UTC, and the format string dd-MM-yyyy to display the date and time:  
      
    formatDateTime(utcNow(), 'MMMM dd, yyyy, HH:mm') //Returns the current date time in the format June 15, 2009, 16:50

-   utcNow() function used as the timestamp to automatically fetch the current date and time in UTC, and the format string dd-MM-yyyy to display the date but not time:  
      
    formatDateTime(utcNow(), 'dd-MM-yyyy') //Returns the current date in the format 15-06-2009

For more information and examples of using custom date and time format strings, see <u>Custom date and time format strings</u>.

-   Use in a flow

1.  In the flow, select the input field where you want to enter the formatted date and time value.

2.  Go to **Add dynamic content** and select the **Expression** tab to open the expression editor.

3.  Type *formatDateTime()* (or look for it under **Date and time** functions).

4.  Provide the value to be formatted (surrounded by single quotes). Dynamic content can be used but shouldn't be surrounded by single quotes.

5.  Provide the format string (surrounded by single quotes).

6.  The full expression should look like the following examples:

    -   formatDateTime('&lt;your-value&gt;', 'dd/MM/yyyy hh:mm tt')

    <!-- -->

    -   formatDateTime(&lt;dynamic-content&gt;, 'dd/MM/yyyy hh:mm tt')

7.  Select **OK**

### Example with dynamic content

Dynamic contents are variables produced by triggers and actions within a flow diagram.  It enables users to select field references from previous steps and write expressions. 

This example walks through a simple flow that demonstrates the use of formatDateTime() function with dynamic content. The trigger used in this example is a manually triggered flow that requires user input.

1.  Set up the trigger for the flow. This example uses Date as the input.

2.  Add an action and select **Send an email (v2)** action.

3.  Click into the **Body** field of the email and select fx (Insert Expression).

4.  Click on **Dynamic content** tab. The dynamic content presented here is related to the trigger, and links together the trigger and actions that need to be taken.

5.  Type formatDateTime

6.  Scroll down the Dynamic content and select **Trigger date**. This variable's dynamic content will come from the date field in the trigger.

7.  Provide the format string (surrounded by single quotes) based on the desired output format for the date. In this example, MM/dd/yyyy format is used.  
    The full expression looks like this:  
    formatDateTime(triggerBody()?\['date'\], 'MM/dd/yyyy')

8.  After running the flow, the email received will show the date in the specified MM/dd/yyyy format.

### Example with Convert time zone

Power Automate uses Coordinated Universal Time (UTC) by default. To handle date and time values in other time zones, you can use formatDate Time in conjunction with convertTimeZone function.

For example, to display the current time in Eastern Standard time, you can use:  
  
formatDateTime(convertTimeZone(utcNow(), 'UTC', 'Eastern Standard Time'), 'yyyy-MM-dd HH:mm:ss') // Returns the date time adjusted for Eastern Standard time

# References

-   

-   Converting time zone in Power Automate

-   formatDateTime function reference

-   <u>Format dates by examples</u>
