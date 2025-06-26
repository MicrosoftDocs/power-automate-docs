---
title: Use expressions in conditions in Power Automate
description: Use expressions such as 'and', 'or', 'empty', 'less', and 'greater' in Power Automate Conditions.
suite: flow
author: kewaiss
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 06/27/2025
ms.author: kisubedi
ms.reviewer: angieandrews
ms.collection: bap-ai-copilot
ms.custom: copilot-scenario-highlight
search.audienceType: 
  - flowmaker
  - enduser
---
# Use expressions in conditions to check multiple values

When you create a cloud flow, you can use the [Condition](add-condition.md#add-a-condition) action to quickly compare a single value with another value. However, there are times when you need to compare multiple values. For example, you might want to check the value of a few columns in a spreadsheet or database table.

In this tutorial, you create a cloud flow and use the `or` condition. In the [Scenarios for other common expressions](#scenarios-for-other-common-expressions) section, you learn how to use other expressions such as `and`, `empty`, `greater`, and `less` in conditions.

## Prerequisites

Here's what you need to complete this tutorial.

* Access to Power Automate.
* Your own spreadsheet with the tables described later in this tutorial. Be sure to save your spreadsheet in a location such as Dropbox or Microsoft OneDrive so that Power Automate can access it.
* Microsoft 365 Outlook (While we use Outlook in this tutorial, you can use any supported email service in your flows.)

## Create a cloud flow

You can create a cloud flow using natural language in Copilot, or create it from scratch. If you have access to Copilot, select the **Using copilot** tab to create your flow. If you don't have access to Copilot, select the **Without copilot** tab.

# [Using copilot](#tab/using-copilot)

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Ask Copilot to create a flow for you. Copy the following prompt and paste it the in Copilot field:

    ```copilot-prompt
    Every week, list rows in an Excel table, and if the Status column equals Succeeded or claim manager's email is jake@contoso.com, delete Excel row.
    ```

1. Select **Generate**.
1. Select **Keep it and continue**.
1. Review the connections. If your data sources are connected properly, a green checkmark appears next to the app or service. If a green checkmark doesn't appear, select the app or service and follow the instructions.
1. After your connections are set, select **Create flow**. The *designer* screen opens. This is where you can configure your cloud flow, if necessary.
1. Go to [Select the spreadsheet and get all rows](#select-the-spreadsheet-and-get-all-rows).

# [Without copilot](#tab/without-copilot)

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the left pane, select **My flows**.
1. Select **New flow** > **Scheduled cloud flow**.
1. Give your flow a name.
1. In the **Repeats every** field dropdown menu, select **Day** to set the schedule to run the cloud flow once daily.
1. Select the **Create** button to open the *designer*.

    You can configure your cloud flow in either the [new designer](flows-designer.md) or the classic designer. The steps are similar in both designers. Learn more (with examples) in [Identify differences between the new designer and the classic designer](flows-designer.md#identify-differences-between-the-new-designer-and-the-classic-designer).

1. Go to [Select the spreadsheet and get all rows](#select-the-spreadsheet-and-get-all-rows).

---

## Select the spreadsheet and get all rows

After you [create a cloud flow](#create-a-cloud-flow), get a spreadsheet table that has a **Status** column. The possible values in the **Status** column are:

Sometimes your workflow needs to take an action if the value of an item is `valueA` *or* `valueB`. For example, you might be tracking the status of tasks in a spreadsheet table. Assume that the table has a column named **Status** and the possible values in this column are:

* `completed`
* `blocked`
* `unnecessary`
* `not started`

Here's an example of what the spreadsheet might look like:

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table.png" alt-text="Screenshot of a sample spreadsheet with a Status column.":::

To work with your spreadsheet, begin in the designer. Do this in either the [new designer](flows-designer.md) or the classic designer. The steps are similar in both designers. Learn more (with examples) in [Identify differences between the new designer and the classic designer](flows-designer.md#identify-differences-between-the-new-designer-and-the-classic-designer).

# [New designer](#tab/new-designer)

1. [Create a cloud flow](#create-a-cloud-flow) or select one from the list of your existing cloud flows by selecting **My flows** on the left navigation pane > **Edit**.
1. In the designer, select the **List rows present in a table** action card.
1. In the **Parameters** tab, select the **Location**, **Document Library**, **File**, and **Table**.

    :::image type="content" source="./media/use-expressions-in-conditions/table-parameters.png" alt-text="Screenshot of the parameters for list rows present in a table in Copilot.":::

1. Collapse the configuration pane by selecting (**<<**) in the upper-right corner of the configuration pane.
1. Go to [Add a condition](#add-a-condition).

# [Classic designer](#tab/classic-designer)

1. [Create a cloud flow](#create-a-cloud-flow) or select one from the list of your existing cloud flows by selecting **My flows** on the left navigation pane > **Edit**.
1. In the designer, select **New step**.
1. In the **Search connectors and actions** field, type **rows**.
1. In the list of icons, select **Excel Online (Business)**.

    In the **Actions** tab, select the action that corresponds to the spreadsheet that you're using. For example, if you're using Google Sheets, select **Google Sheets - Get rows**.

1. In the **Actions** tab, select **List rows present in a table (Excel Online Business)**.

    :::image type="content" source="includes/media/new-step/get-excel-rows.png" alt-text="Screenshot of listing rows in a table.":::

1. In the **List rows present in a table**, select the **Location**, **Document Library**, **File**, and **Table** that contain your data.

    :::image type="content" source="includes/media/new-step/select-table-to-search.png" alt-text="Screenshot of Location, Document Library, File, and Table fields in the List rows present in a table card.":::

1. Go to [Add a condition](#add-a-condition).

---

## Add a condition

Before you can add a condition to check the value of the **Status** column in each row of the spreadsheet table, make sure you performed the following procedures in this article:

- [Create a cloud flow](#create-a-cloud-flow).
    - Alternatively, select one from the list of your existing cloud flows by selecting **My flows** on the left navigation pane > **Edit**.
- [Select the spreadsheet and get all rows](#select-the-spreadsheet-and-get-all-rows)

# [New designer](#tab/new-designer)

1. In the designer, add a new step by selecting the plus sign (**+**) > **Add an action**.
1. On the **Add an action** screen, search for **apply to each**, and then select the **Apply to each** under **Control**.
1. Add the **value** token to the **Select an output from previous steps** box by selecting inside the field and then selecting the lightning bolt icon.

    :::image type="content" source="./media/use-expressions-in-conditions/lightning-rod.png" alt-text="Screenshot selecting the value from the previous step.":::

   This **value** token represents the spreadsheet table and all of its data.

1. On the **Apply to each** card, add a new step by selecting the plus sign (**+**) > **Add an action**.
1. Search for **condition**, and then select the **Condition** control.
1. Add the following **OR** expression. This **OR** expression checks the value of each row in the table.

    If the value of the **Status** column is *completed* **Or** *unnecessary*, the **OR** expression evaluates to **true**.

    Here's an example of a **Condition** card.

    :::image type="content" source="./media/use-expressions-in-conditions/condition-card.png" alt-text="Screenshot of selecting the value from the previous step.":::

1. Go to [Delete matching rows from the spreadsheet](#delete-matching-rows-from-the-spreadsheet).

# [Classic designer](#tab/classic-designer)

1. In the designer, search for **apply to each**, and then select the **Apply to each - Control**.
1. Add the **value** token to the **Select an output from previous steps** box.

   This **value** token represents the spreadsheet table and all of its data.

1. Select **Add an action** on the **Apply to each** card.
1. Search for **condition**, and then select the **Condition** control.
1. Add the following **Or** expression. This **Or** expression checks the value of each row in the table. If the value of the **Status** column is *completed* **Or** *unnecessary*, the **Or** expression evaluates to "true".

    Here's an example of a **Condition** card.

    :::image type="content" source="./media/use-expressions-in-conditions/or-expression.png" alt-text="Screenshot of an 'or' expression.":::

Go to [Delete matching rows from the spreadsheet](#delete-matching-rows-from-the-spreadsheet).

---

## Delete matching rows from the spreadsheet

In this tutorial, you use the **Or** condition to delete rows with a value of `completed` or `unnecessary` from the spreadsheet.

Before you can add the **Delete a row** action, make sure you performed the following procedures in this article:

- [Create a cloud flow](#create-a-cloud-flow).
    - Alternatively, select one from the list of your existing cloud flows by selecting **My flows** on the left navigation pane > **Edit**.
- [Select the spreadsheet and get all rows](#select-the-spreadsheet-and-get-all-rows)
- [Add a condition](#add-a-condition)

# [New designer](#tab/new-designer)

1. In the designer, select the plus sign (**+**) to add an action on the **True** branch of the condition.

    The **True** branch runs if the **Or** condition evaluates to **true**.

1. Search for **Excel Online (Business)** and then select **Delete a row**.

    :::image type="content" source="./media/use-expressions-in-conditions/delete-a-row.png" alt-text="Screenshot of deleting a row.":::

1. On the **Delete a row** panel, set the **Location**, **Document Library**, **File**, and **Table** boxes exactly as you set these boxes on the **List rows present in a table** card earlier in this tutorial.
1. In the **Key Column** dropdown list, select **\_PowerAppsId_**.
1. In the **Key Value** field, insert the **\_PowerAppsId_** dynamic value.
1. Go to [Save and test your cloud flow](#save-and-test-your-cloud-flow).

# [Classic designer](#tab/classic-designer)

1. In the designer, select **Add an action** on the **If yes** branch of the condition.

    The **If yes** branch runs if the **OR** condition evaluates to **true**.

1. Search for **Delete a row**, select **Excel Online (Business)**, and then select **Delete a row**.

    :::image type="content" source="./media/use-expressions-in-conditions/delete-a-row-test.png" alt-text="Screenshot of deleting a row.":::

1. On the **Delete a row** card, set the **Location**, **Document Library**, **File**, and **Table** boxes exactly as you set these boxes on the **List rows present in a table** card earlier in this tutorial.
1. In the **Key Column** dropdown list, select **\_PowerAppsId_**.
1. In the **Key Value** field, insert the **\_PowerAppsId_** dynamic value.
1. Go to [Save and test your cloud flow](#save-and-test-your-cloud-flow).

---

## Save and test your cloud flow

1. In the designer, select **Save**. A green message appears that says **Your flow is ready to go. We recommend you test it**.
1. Select **Test** to run the flow.
1. In the **Test flow** panel, select **Manually** > **Test**.
1. In the **Run flow** panel, select **Run flow**. If your flow is set up correctly, a message appears that says **Your flow run successfully started. To monitor it, go to the Flow Runs Page**.
1. To close the **Run flow** panel, select **Done**.

Congratulations! You created a cloud flow that deletes rows from a spreadsheet table if the **Status** column's value is either `completed` or `unnecessary`. Here's what your spreadsheet should look like after the run completes.

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table-after-or-expression-runs.png" alt-text="Screenshot of the spreadsheet when the 'OR'expression completes.":::

Notice all data from rows that had **completed** or **unnecessary** in the **Status** column were deleted.

## Scenarios for other common expressions

In this section, you learn how to use other expressions in conditions. In each scenario, make sure you performed the following procedures in this article:

- [Create a cloud flow](#create-a-cloud-flow).
    - Alternatively, select one from the list of your existing cloud flows by selecting **My flows** on the left navitation pane > **Edit**.
- [Select the spreadsheet and get all rows](#select-the-spreadsheet-and-get-all-rows)
- [Add a condition](#add-a-condition): In this procedure, apply the expression from this section that you want to use in the **Condition** card.

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

### Use the 'and' expression

Assume you have a spreadsheet table with two columns. The column names are **Status** and **Assigned**. Assume also that you want to delete all rows if the **Status** column's value is **blocked** and the **Assigned** column's value is **John Wonder**. To accomplish this task, when you edit the **Condition** card in [Add a condition](#add-a-condition), use the **and** expression shown here.

````@and(equals(item()?['Status'], 'blocked'), equals(item()?['Assigned'], 'John Wonder'))````

Here's an example of a **Condition** card.

:::image type="content" source="./media/use-expressions-in-conditions/and-expression.png" alt-text="Screenshot of the 'and' expression.":::

#### Run the flow with the 'and' expression

If you followed the steps in this section, your spreadsheet should look similar to the following screenshot.

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table-before-and-expression-runs.png" alt-text="Screenshot of the spreadsheet before your flow runs.":::

After your flow runs, your spreadsheet should look similar to the following screenshot.

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table-after-and-expression-runs.png" alt-text="Screenshot of the spreadsheet after your flow runs.":::

### Use the 'empty' expression

Notice that there are several empty rows in the spreadsheet now. To remove them, use the **empty** expression to identify all rows that don't have text in the **Assigned** and **Status** columns.

To accomplish this task, follow all steps listed in the [Use the 'and' expression](#use-the-and-expression) section in this tutorial. When you edit the **Condition** card in advanced mode, use the following **empty** expression.

````@and(empty(item()?['Status']), empty(item()?['Assigned']))````

Your **Condition** card should look similar to the following screenshot.

:::image type="content" source="./media/use-expressions-in-conditions/empty-expression.png" alt-text="Screenshot of the 'empty' expression.":::

After your flow runs, the spreadsheet should look similar to the following screenshot.

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table-after-empty-expression-runs.png" alt-text="Screenshot of the spreadsheet after 'empty' runs.":::

Notice extra lines are removed from the table.

### Use the 'greater' expression

Imagine you bought baseball tickets for your coworkers and you use a spreadsheet to ensure you get reimbursed by each person. You can quickly create a cloud flow that sends a daily email to each person who didn't pay the full amount.

Use the **greater** expression to identify the employees who didn't pay the full amount. You can then automatically send a reminder email to them.

Here's a view of the spreadsheet.

:::image type="content" source="./media/use-expressions-in-conditions/tickets-spreadsheet-table.png" alt-text="Screenshot of the spreadsheet of the employees who didn't pay in full.":::

Here's the implementation of the **greater** expression that identifies all persons who paid less than the amount due from them.

````@greater(item()?['Due'], item()?['Paid'])````

### Use the 'less' expression

Imagine you bought baseball tickets for your coworkers, and you use a spreadsheet to ensure you get reimbursed by each person by the date to which everyone agreed. You can create a cloud flow that sends a reminder email to each person who didn't pay the full amount if the current date is less than one day before the due date.

Use the **and** expression with the **less** expression since there are two conditions being validated.

|          Condition to validate          | Expression to use |                    Example                     |
|-----------------------------------------|-------------------|------------------------------------------------|
|   Has the full amount due been paid?    |      greater      |   `@greater(item()?['Due'], item()?['Paid'])`    |
| Is the due date less than one day away? |       less        | `@less(item()?['DueDate'], addDays(utcNow(),1))` |

### Combine the 'greater' and 'less' expressions in an 'and' expression

Use the **greater** expression to identify the employees who paid less than the full amount due and use the **less** expression to determine if the payment due date is less than one day away from the current date. You can then use the **Send an email** action to send reminder emails to those employees who didn't pay in full and the due date is less than one day away.

Here's a view of the spreadsheet table.

:::image type="content" source="./media/use-expressions-in-conditions/spreadsheet-table-due-date.png" alt-text="Screenshot of the spreadsheet table.":::

Here's the implementation of the **and** expression that identifies all employees who paid less than the amount due from them and the due date is less than one day away from the current date.

````@and(greater(item()?['Due'], item()?['Paid']), less(item()?['dueDate'], addDays(utcNow(),1)))````

## Use functions in expressions

Some expressions get their values from runtime actions that might not yet exist when a cloud flow starts to run. To reference or work with these values in expressions, you can use functions that the *Workflow Definition Language* provides.

Learn more in [Reference guide to workflow expression functions in Azure Logic Apps and Power Automate](/azure/logic-apps/workflow-definition-language-functions-reference).

## Related information

[Training: Introduction to expressions in Power Automate (module)](/training/modules/introduction-expressions/)

[!INCLUDE[footer-include](includes/footer-banner.md)]
