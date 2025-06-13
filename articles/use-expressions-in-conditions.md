---
title: Use expressions in conditions in Power Automate
description: Use advanced expressions such as "and", "or", "empty", "less", and "greater" in Power Automate Conditions.
suite: flow
author: HeatherOrt
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 03/20/2025
ms.author: kisubedi
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot
search.audienceType: 
  - flowmaker
  - enduser
---
# Use expressions in conditions to check multiple values

In this tutorial, you learn to use expressions and *conditions* to compare multiple values in **Advanced mode**.

When you create a cloud flow, you can use the [**Condition**](add-condition.md#add-a-condition) card in basic mode to quickly compare a single value with another value. However, there are times when you need to compare multiple values. For example, you might want to check the value of a few columns in a spreadsheet or database table.

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

Here's what you need to complete this walkthrough.

* Access to Power Automate.
* Your own spreadsheet with the tables described later in this walkthrough. Be sure to save your spreadsheet in a location such as Dropbox or Microsoft OneDrive so that Power Automate can access it.
* Microsoft 365 Outlook (While we use Outlook here, you can use any supported email service in your flows.)

## Use the 'or' expression

Sometimes your workflow needs to take an action if the value of an item is valueA *or* valueB. For example, you might be tracking the status of tasks in a spreadsheet table. Assume that the table has a column named **Status** and the possible values in this column are:

* **completed**
* **blocked**
* **unnecessary**
* **not started**

Here's an example of what the spreadsheet might look like:

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table.png" alt-text="Screenshot of a sample spreadsheet with a Status column.":::

Given the preceding spreadsheet, you want to use Power Automate to remove all rows with a **Status** column that is set to **completed** or **unnecessary**.

Let's create the flow.

### Start with a blank flow

1. Sign into [Power Automate](https://make.powerautomate.com).

1. On the left pane, select **My flows**.

1. Select **New flow** > **Scheduled cloud flow**.

### Add a trigger to your flow

1. Give your flow a name.

1. Set the schedule to run the flow once daily.

1. Select the **Create** button to go to the next step.

[!INCLUDE[copilot-designer-note](./includes/copilot-designer-note.md)]

### Select the spreadsheet and get all rows

# [New designer](#tab/new-designer)

You can use Copilot to create the flow for you, or create it manually.

#### Create a flow with Copilot

1. Ask Copilot to create a flow for you. Type the following prompt in Copilot:

    **Every week, list rows in an Excel table, and if the Status column equals Succeeded or claim manager's email is jake@contoso.com, delete Excel row.**

1. Select **Submit** ![Screenshot of the Submit button.](./media/use-expressions-in-conditions/submit.png).

    After you submit the prompt, Copilot creates the flow for you. You need to fill in details for the flow to work, such as parameters for various actions added by Copilot.

#### Create a flow manually

Alternatively, you can perform the following procedure to create the same flow manually:

1. Add a new step by selecting the plus sign (**+**) > **Add an action**.
1. Search for **rows** > **Excel Online (Business)** > the **Get a row** action that corresponds to the spreadsheet that you're using.

    For example, if you're using *Google Sheets*, select **Google Sheets - Get rows**.

1. Select the **List rows present in a table** action.

    :::image type="content" source="./media/use-expressions-in-conditions/add-an-action-test.png" alt-text="Screenshot of listing rows in a table in Copilot.":::

1. Select the **Location**, **Document Library**, **File**, and **Table** that contain your data.

    :::image type="content" source="./media/use-expressions-in-conditions/table-parameters.png" alt-text="Screenshot of the parameters for list rows present in a table in Copilot.":::

# [Classic designer](#tab/classic-designer)

In the classic designer, you can create the flow manually. Copilot isn't an option.

1. Select **New step**.

1. Search for **rows**, and then select **Excel Online (Business)**.

    Select the *get a row* action that corresponds to the spreadsheet that you're using. For example, if you're using Google Sheets, select **Google Sheets - Get rows**.

1. Select the **List rows present in a table** action.

    :::image type="content" source="includes/media/new-step/get-excel-rows.png" alt-text="Screenshot of listing rows in a table.":::

1. Select the **Location**, **Document Library**, **File**, and **Table** that contain your data.

    :::image type="content" source="includes/media/new-step/select-table-to-search.png" alt-text="Screenshot of Location, Document Library, File, and Table fields in the List rows present in a table card.":::

---

## Check the status column of each row

# [New designer](#tab/new-designer)

1. Add a new step by selecting the plus sign (**+**) > **Add an action**.

1. On the **Add an action** screen, search for **apply to each**, and then select the **Apply to each** under **Control**.

1. Add the **value** token to the **Select an output from previous steps** box by selecting the lightning rod icon.

    :::image type="content" source="./media/use-expressions-in-conditions/lightning-rod.png" alt-text="Screenshot selecting the value from the previous step.":::

   This **value** token represents the spreadsheet table and all of its data.

1. On the **Apply to each** card, add a new step by selecting the plus sign (**+**) > **Add an action**.

1. Search for **condition**, and then select the **Condition** control.

1. Add the following **OR** expression. This **OR** expression checks the value of each row in the table.

    If the value of the **Status** column is *completed* **Or** *unnecessary*, the **OR** expression evaluates to **true**.

    Here's an example of a **Condition** card.

    :::image type="content" source="./media/use-expressions-in-conditions/condition-card.png" alt-text="Screenshot of selecting the value from the previous step.":::

# [Classic designer](#tab/classic-designer)

1. Select **New step**.

1. Search for **apply to each**, and then select the **Apply to each - Control**.

1. Add the **value** token to the **Select an output from previous steps** box.

   This **value** token represents the spreadsheet table and all of its data.

1. Select **Add an action** on the **Apply to each** card.

1. Search for **condition**, and then select the **Condition** control.

1. Add the following **Or** expression. This **Or** expression checks the value of each row in the table. If the value of the **Status** column is *completed* **Or** *unnecessary*, the **Or** expression evaluates to "true".

    Here's an example of a **Condition** card.

    :::image type="content" source="./media/use-expressions-in-conditions/or-expression.png" alt-text="Screenshot of an 'or' expression.":::

---

### Delete matching rows from the spreadsheet

# [New designer](#tab/new-designer)

1. Select the plus sign (**+**) to add an action on the **True** branch of the condition.

    The **True** branch runs if the **Or** condition evaluates to **true**.

1. Search for **Excel Online (Business)** and then select **Delete a row**.

    :::image type="content" source="./media/use-expressions-in-conditions/delete-a-row.png" alt-text="Screenshot of deleting a row.":::

1. On the **Delete a row** panel, set the **Location**, **Document Library**, **File**, and **Table** boxes exactly as you set these boxes on the **List rows present in a table** card earlier in this tutorial.

1. In the **Key Column** dropdown list, select **\_PowerAppsId_**.

1. In the **Key Value** field, insert the **\_PowerAppsId_** dynamic value.

1. Save your flow.

# [Classic designer](#tab/classic-designer)

1. Select **Add an action** on the **If yes** branch of the condition.

    The **If yes** branch runs if the **OR** condition evaluates to **true**.

1. Search for **Delete a row**, select **Excel Online (Business)**, and then select **Delete a row**.

    :::image type="content" source="./media/use-expressions-in-conditions/delete-a-row-test.png" alt-text="Screenshot of deleting a row.":::

1. On the **Delete a row** card, set the **Location**, **Document Library**, **File**, and **Table** boxes exactly as you set these boxes on the **List rows present in a table** card earlier in this tutorial.

1. In the **Key Column** dropdown list, select **\_PowerAppsId_**.

1. In the **Key Value** field, insert the **\_PowerAppsId_** dynamic value.

1. Save your flow.

---

## Run the flow with the 'or' expression

The flow runs after you save it. If you created the spreadsheet shown earlier in this tutorial, here's what it looks like after the run completes.

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table-after-or-expression-runs.png" alt-text="Screenshot of the spreadsheet when the 'OR'expression completes.":::

Notice all data from rows that had **completed** or **unnecessary** in the **Status** column were deleted.

## Use the 'and' expression

Assume you have a spreadsheet table with two columns. The column names are **Status** and **Assigned**. Assume also that you want to delete all rows if the **Status** column's value is **blocked** and the **Assigned** column's value is **John Wonder**. To accomplish this task, follow all steps earlier in this tutorial, but when you edit the **Condition** card in advanced mode, use the **and** expression shown here.

````@and(equals(item()?['Status'], 'blocked'), equals(item()?['Assigned'], 'John Wonder'))````

Here's an example of a **Condition** card.

:::image type="content" source="./media/use-expressions-in-conditions/and-expression.png" alt-text="Screenshot of the 'and' expression.":::

## Run the flow with the 'and' expression

If you followed the steps in this tutorial, your spreadsheet should look similar to the following screenshot.

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table-before-and-expression-runs.png" alt-text="Screenshot of the spreadsheet before your flow runs.":::

After your flow runs, your spreadsheet should look similar to the following screenshot.

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table-after-and-expression-runs.png" alt-text="Screenshot of the spreadsheet after your flow runs.":::

## Use the 'empty' expression

Notice that there are several empty rows in the spreadsheet now. To remove them, use the **empty** expression to identify all rows that don't have text in the **Assigned** and **Status** columns.

To accomplish this task, follow all steps listed in the [Use the 'and' expression](#use-the-and-expression) section earlier in this tutorial. When you edit the **Condition** card in advanced mode, use the following **empty** expression.

````@and(empty(item()?['Status']), empty(item()?['Assigned']))````

Your **Condition** card should look similar to the following screenshot.

:::image type="content" source="./media/use-expressions-in-conditions/empty-expression.png" alt-text="Screenshot of the 'empty' expression.":::

After your flow runs, the spreadsheet should look similar to the following screenshot.

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table-after-empty-expression-runs.png" alt-text="SScreenshot of the spreadsheet after 'empty' runs.":::

Notice extra lines are removed from the table.

## Use the 'greater' expression

Imagine you bought baseball tickets for your coworkers and you use a spreadsheet to ensure you get reimbursed by each person. You can quickly create a cloud flow that sends a daily email to each person who didn't paid the full amount.

Use the **greater** expression to identify the employees who didn't pay the full amount. You can then automatically send a reminder email to them.

Here's a view of the spreadsheet.

:::image type="content" source="./media/use-expressions-in-conditions/tickets-spreadsheet-table.png" alt-text="Screenshot of the spreadsheet of the employees who didn't pay in full.":::

Here's the implementation of the **greater** expression that identifies all persons who paid less than the amount due from them.

````@greater(item()?['Due'], item()?['Paid'])````

## Use the 'less' expression

Imagine you bought baseball tickets for your coworkers, and you use a spreadsheet to ensure you get reimbursed by each person by the date to which everyone agreed. You can create a cloud flow that sends a reminder email to each person who didn't pay the full amount if the current date is less than one day before the due date.

Use the **and** expression with the **less** expression since there are two conditions being validated.

|          Condition to validate          | Expression to use |                    Example                     |
|-----------------------------------------|-------------------|------------------------------------------------|
|   Has the full amount due been paid?    |      greater      |   `@greater(item()?['Due'], item()?['Paid'])`    |
| Is the due date less than one day away? |       less        | `@less(item()?['DueDate'], addDays(utcNow(),1))` |

## Combine the 'greater' and 'less' expressions in an 'and' expression

Use the **greater** expression to identify the employees who paid less than the full amount due and use the **less** expression to determine if the payment due date is less than one day away from the current date. You can then use the **Send an email** action to send reminder emails to those employees who didn't pay in full and the due date is less than one day away.

Here's a view of the spreadsheet table.

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table-due-date.png" alt-text="Screenshot of the spreadsheet table.":::

Here's the implementation of the **and** expression that identifies all employees who paid less than the amount due from them and the due date is less than one day away from the current date.

````@and(greater(item()?['Due'], item()?['Paid']), less(item()?['dueDate'], addDays(utcNow(),1)))````

## Use functions in expressions

Some expressions get their values from runtime actions that might not yet exist when a cloud flow starts to run. To reference or work with these values in expressions, you can use functions that the Workflow Definition Language provides. More information. To learn more, go to [Reference guide to workflow expression functions in Azure Logic Apps and Power Automate](/azure/logic-apps/workflow-definition-language-functions-reference).

## Related information

[Training: Introduction to expressions in Power Automate (module)](/training/modules/introduction-expressions/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
