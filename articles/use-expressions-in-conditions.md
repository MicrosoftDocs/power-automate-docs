---
title: Use expressions in conditions in Power Automate | Microsoft Docs
description: Use advanced expressions such as "and", "or", "empty", "less", and "greater" in Power Automate Conditions.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 05/13/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Use expressions in conditions to check multiple values

In this tutorial, you'll learn to use expressions and *conditions* to compare multiple values in **Advanced mode**.

When you create a cloud flow, you can use the [**Condition**](add-condition.md#add-a-condition) card in basic mode to quickly compare a single value with another value. However, there're times when you need to compare multiple values. For example, you might want to check the value of a few columns in a spreadsheet or database table.

You can use any combination of the following logical expressions in your conditions.

Expression|Description|Example
--------|-----------|-------
|[and](#use-the-and-expression)|Takes two arguments and returns true if both values are true.<br><b>Note</b>: Both arguments must be Booleans.|This expression returns false: <br>`and(greater(1,10),equals(0,0))`
|[or](#use-the-or-expression)|Takes two arguments and returns true if either argument is true. <br><b>Note</b>: Both arguments must be Booleans.|This expression returns true:<br>`or(greater(1,10),equals(0,0))`
|equals|Returns true if two values are equal.|For example, if parameter1 is someValue, this expression returns true:<br>`equals(parameters('parameter1'), 'someValue')`
|[less](#use-the-less-expression)|Takes two arguments and returns true if the first argument is less than the second argument. <br><b>Note</b>: The supported types are integer, float, and string.|This expression returns true:<br>`less(10,100)`
|lessOrEquals|Takes two arguments and returns true if the first argument is less than or equal to the second argument. <br><b>Note</b>: The supported types are integer, float, and string.|This expression returns true:<br>`lessOrEquals(10,10)`
|[greater](#use-the-greater-expression)|Takes two arguments and returns true if the first argument is greater than the second argument. <br><b>Note</b>: The supported types are integer, float, and string.|This expression returns false:<br>`greater(10,10)`
|greaterOrEquals|Takes two arguments and returns true if the first argument is greater than or equal to the second argument. <br><b>Note</b>: The supported types are integer, float, and string.|This expression returns false:<br>`greaterOrEquals(10,100)`
|[empty](#use-the-empty-expression)|Returns true if the object, array, or string is empty.|This expression returns true:<br>`empty('')`
|not|Returns the opposite of a boolean value. |This expression returns true:<br>`not(contains('200 Success','Fail'))`
|if|Returns a specific value if the expression results in true or false.|This expression returns "yes":<br>`if(equals(1, 1), 'yes', 'no')`

## Prerequisites

Here's what you'll need to complete this walkthrough.

* Access to Power Automate.
* Your own spreadsheet with the tables described later in this walkthrough. Be sure to save your spreadsheet in a location such as Dropbox or Microsoft OneDrive so that Power Automate can access it.
* Microsoft 365 Outlook (While we use Outlook here, you can use any supported email service in your flows.)

## Use the 'or' expression

Sometimes your workflow needs to take an action if the value of an item is valueA *or* valueB. For example, you may be tracking the status of tasks in a spreadsheet table. Assume that the table has a column named **Status** and the possible values in this column are:

* **completed**
* **blocked**
* **unnecessary**
* **not started**

Here's an example of what the spreadsheet might look like:

>[!div class="mx-imgBorder"]
>![Screenshot of a sample spreadsheet with a Status column.](./media/use-expressions-in-conditions/spreadsheet-table.png "Sample spreadsheet")

Given the preceding spreadsheet, you want to use Power Automate to remove all rows with a **Status** column that's set to **completed** or **unnecessary**.

Let's create the flow.

### Start with a blank flow

1. Sign into [Power Automate](https://flow.microsoft.com).

1. On the left pane, select **My flows**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the menu with the My flows option.](includes/media/modern-approvals/select-my-flows.png "My flows option")

1. Select **New flow** > **Scheduled cloud flow**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of creating a scheduled cloud flow.](includes/media/modern-approvals/blank-template.png "Create a scheduled cloud flow")

### Add a trigger to your flow

1. Give your flow a name.

1. Set the schedule to run the flow once daily.

1. Select the **Create** button to go to the next step.

    >[!div class="mx-imgBorder"]
    >![Screenshot of setting a schedule.](includes/media/modern-approvals/once-daily-schedule.png "Set schedule")

### Select the spreadsheet and get all rows

1. Select **New step**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the New step button.](includes/media/new-step/action.png "New step")

1. Search for **rows**, and then select **Excel Online (Business)**.

    >[!NOTE]
    >Select the "get a row" action that corresponds to the spreadsheet that you're using. For example, if you're using Google Sheets, select **Google Sheets - Get rows**.

1. Select the **List rows present in a table** action.

    >[!div class="mx-imgBorder"]
    >![Screenshot of getting a rows in a spreadsheet.](includes/media/new-step/get-excel-rows.png "List rows present in a table")

1. Select the **Location**, **Document Library**, **File**, and **Table** that contain your data.

    >[!div class="mx-imgBorder"]
    >![Screenshot of Location, Document Library, File, and Table fields in the List rows present in a table card.](includes/media/new-step/select-table-to-search.png "List rows present in a table card")

### Check the status column of each row

1. Select **New step**.

1. Search for **apply to each**, and then select the **Apply to each - Control**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of adding the Apply to each - Control.](includes/media/new-step/apply-to-each.png "Apply to each - Control")

1. Add the **value** token to the **Select an output from previous steps** box.

   This **value** token represents the spreadsheet table and all of its data.

    >[!div class="mx-imgBorder"]
    >![Screenshot of adding a value to the Apply to each card.](includes/media/apply-to-each/add-value-token.png "Add a value to the Apply to each card")

1. Select **Add an action** on the **Apply to each** card.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the Add an action button.](includes/media/apply-to-each/add-action.png "Add an action")

1. Search for **condition**, and then select the **Condition** control.

1. Add the following **Or** expression. This **Or** expression checks the value of each row in the table. If the value of the **Status** column is *completed* **Or** *unnecessary*, the **Or** expression evaluates to "true".

    Here's an example of a **Condition** card.

    >[!div class="mx-imgBorder"]
    >![Screenshot of an 'or' expression.](./media/use-expressions-in-conditions/or-expression.png "'Or' expression")

### Delete matching rows from the spreadsheet

1. Select **Add an action** on the **If yes** branch of the condition.

    The **If yes** branch runs if the **Or** condition evaluates to **true**.

1. Search for **Delete a row**, select **Excel Online (Business)**, and then select **Delete a row**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of deleting a row.](includes/media/new-step/select-delete-excel-row.png "Delete a row")

1. On the **Delete a row** card, set the **Location**, **Document Library**, **File**, and **Table** boxes exactly as you set these boxes on the **List rows present in a table** card earlier in this tutorial.

1. In the **Key Column** dropdown list, select **\_PowerAppsId_**.

1. In the **Key Value** field, insert the **\_PowerAppsId_** dynamic value.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the Key Column and Key Value fields in the Delete a row card.](includes/media/new-step/delete-excel-row.png "Delete a row card fields")

1. Save your flow.

### Run the flow with the 'or' expression

The flow runs after you save it. If you created the spreadsheet shown earlier in this tutorial, here's what it looks like after the run completes.

>[!div class="mx-imgBorder"]
>![Screenshot of the spreadsheet when the 'Or'expression completes.](./media/use-expressions-in-conditions/spreadsheet-table-after-or-expression-runs.png "Spreadsheet after the 'or' expression completes")

Notice all data from rows that had **completed** or **unnecessary** in the **Status** column were deleted.

## Use the 'and' expression

Assume you have a spreadsheet table with two columns. The column names are **Status** and **Assigned**. Assume also that you want to delete all rows if the **Status** column's value is **blocked** and the **Assigned** column's value is **John Wonder**.  To accomplish this task, follow all steps earlier in this tutorial, but when you edit the **Condition** card in advanced mode, use the **and** expression shown here.

````@and(equals(item()?['Status'], 'blocked'), equals(item()?['Assigned'], 'John Wonder'))````

Here's an example of a **Condition** card.

>[!div class="mx-imgBorder"]
>![Screenshot of the 'and' expression.](./media/use-expressions-in-conditions/and-expression.png "'and' expression")

### Run the flow with the 'and' expression

If you've followed the steps in this tutorial, your spreadsheet should look similar to the following screenshot.

>[!div class="mx-imgBorder"]
>![Screenshot of the spreadsheet before your flow runs.](./media/use-expressions-in-conditions/spreadsheet-table-before-and-expression-runs.png "Spreadsheet before the flow runs")

After your flow runs, your spreadsheet should look similar to the following screenshot.

>[!div class="mx-imgBorder"]
>![Screenshot of the spreadsheet after your flow runs.](./media/use-expressions-in-conditions/spreadsheet-table-after-and-expression-runs.png "Spreadsheet after the flow runs")

## Use the 'empty' expression

Notice that there are several empty rows in the spreadsheet now. To remove them, use the **empty** expression to identify all rows that don't have text in the **Assigned** and **Status** columns.

To accomplish this task, follow all steps listed in the [Use the 'and' expression](#use-the-and-expression) section earlier in this tutorial. When you edit the **Condition** card in advanced mode, use the following **empty** expression.

````@and(empty(item()?['Status']), empty(item()?['Assigned']))````

Your **Condition** card should look similar to the following screenshot.

>[!div class="mx-imgBorder"]
>![Screenshot of the 'empty' expression.](./media/use-expressions-in-conditions/empty-expression.png "'empty' expression")

After your flow runs, the spreadsheet should look similar to the following screenshot.

>[!div class="mx-imgBorder"]
>![Screenshot of the spreadsheet after 'empty' runs.](./media/use-expressions-in-conditions/spreadsheet-table-after-empty-expression-runs.png "Spreadsheet after 'empty' runs")

Notice extra lines are removed from the table.

## Use the 'greater' expression

Imagine you've bought baseball tickets for your coworkers and you're using a spreadsheet to ensure you're reimbursed by each person. You can quickly create a cloud flow that sends a daily email to each person who hasn't paid the full amount.

Use the **greater** expression to identify the employees who haven't paid the full amount. You can then automatically send a reminder email to those who haven't paid in full.

Here's a view of the spreadsheet.

>[!div class="mx-imgBorder"]
>![Screenshot of the spreadsheet of those who haven't paid in full.](./media/use-expressions-in-conditions/tickets-spreadsheet-table.png "Spreadsheet of those who haven't paid in full")

Here's the implementation of the **greater** expression that identifies all persons who have paid less than the amount due from them.

````@greater(item()?['Due'], item()?['Paid'])````

## Use the 'less' expression

Imagine you've bought baseball tickets for your coworkers, and you're using a spreadsheet to ensure you're reimbursed by each person by the date to which everyone agreed. You can create a cloud flow that sends a reminder email to each person who hasn't paid the full amount if the current date is less than one day before the due date.

Use the **and** expression with the **less** expression since there are two conditions being validated.


|          Condition to validate          | Expression to use |                    Example                     |
|-----------------------------------------|-------------------|------------------------------------------------|
|   Has the full amount due been paid?    |      greater      |   `@greater(item()?['Due'], item()?['Paid'])`    |
| Is the due date less than one day away? |       less        | `@less(item()?['DueDate'], addDays(utcNow(),1))` |

## Combine the 'greater' and 'less' expressions in an 'and' expression

Use the **greater** expression to identify the employees who have paid less than the full amount due and use the **less** expression to determine if the payment due date is less than one day away from the current date. You can then use the **Send an email** action to send reminder emails to those employees who haven't paid in full and the due date is less than one day away.

Here's a view of the spreadsheet table.

>[!div class="mx-imgBorder"]
>![Screenshot of the spreadsheet table.](./media/use-expressions-in-conditions/spreadsheet-table-due-date.png "Spreadsheet table")

Here's the implementation of the **and** expression that identifies all employees who have paid less than the amount due from them and the due date is less than one day away from the current date.

````@and(greater(item()?['Due'], item()?['Paid']), less(item()?['dueDate'], addDays(utcNow(),1)))````

## Use functions in expressions

Some expressions get their values from runtime actions that might not yet exist when a cloud flow starts to run. To reference or work with these values in expressions, you can use functions that the Workflow Definition Language provides. More information. To learn more, go to [Reference guide to workflow expression functions in Azure Logic Apps and Power Automate](/azure/logic-apps/workflow-definition-language-functions-reference).

[!INCLUDE[footer-include](includes/footer-banner.md)]