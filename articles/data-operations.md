---
title: Use data operations in Power Automate
description: Learn to perform operations such as create HTML tables, create CSV tables, compose, join, select, and filter arrays with Power Automate.
suite: flow
author: kisubedi
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 06/27/2025
ms.author: matow
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Use data operations

Data operations allow you to manipulate data as you build your cloud flows. You can use them to create, sort, and rearrange data using shortcuts to help you achieve your results easier and faster, which can save you time and effort. When you use data operations, you can increase the efficiency of your flows, reduce the number of errors, and make it easier to analyze data.

This article explains how you can use data operations such as compose to create a single output from multiple inputs, including expressions. You can also use data operations to join or select data, filter arrays, create tables, and parse JSON. In this article, each section provides a brief description of the data operation, followed by a step-by-step procedure to help you use it in your cloud flow.

<!--Here's a quick video about data operations.

>[!VIDEO https://learn-video.azurefd.net/vod/player?id=4eb588b9-6468-4e0f-b07b-8af41f31f6ea]-->

## Prerequisites

- Access to [Power Automate](https://make.powerautomate.com).
- A tool to send HTTP POST requests with a JSON array to your flow.
- A new or existing cloud flow to which you can add data operations.

## Display a cloud flow in the designer

To use the data operations described in this article, you need to have the designer open with your new or existing cloud flow.

Power Automate allows you to use either the [new designer](flows-designer.md) or the classic designer to configure your cloud flow. The screenshots in this article use the new designer, but the steps are similar in both designers. Learn more (with examples) in [Identify differences between the new designer and the classic designer](flows-designer.md#identify-differences-between-the-new-designer-and-the-classic-designer).

### Create a new cloud flow

To create a new cloud flow, follow these steps.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation pane to the left, select **Create**.
1. Select one of the [types of cloud flows](overview-cloud.md#types-of-cloud-flows) in **Start from Blank**: **Automated cloud flow**, **Instant cloud flow**, **Scheduled cloud flow**, or **Describe it to design it**.

    :::image type="content" source="./media/data-operations/start-from-blank.png" alt-text="Screenshot of the 'Start from blank' tiles.":::

1. For **Automated cloud flow**, **Instant cloud flow**, and **Scheduled cloud flow**, follow the instructions and select **Create**.

1. For **Describe it to design it**:
    1. Enter a description of the flow you want to create and select **Submit**, or select from the AI-generated suggested flow descriptions.
    1. If you're satisfied with the suggested flow, select **Keep it and continue**.
    1. Review your connected apps and services, and then select **Create flow**.

        The flow opens in the designer.

### Select an existing cloud flow

To select an existing cloud flow, follow these steps.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the navigation pane to the left, select **My flows**.
1. In the **Cloud flows** tab, select the flow you want to open. 
1. On the command bar at the top, select **Edit**.

    The flow opens in the designer.

## Use the compose action

Use the **Data Operation - Compose** action to save yourself from having to enter the same data multiple times as you're designing a cloud flow. In this example, you need to enter an array of digits&mdash;`[0,1,2,3,4,5,6,7,8,9]`&mdash;several times while you design your flow. You can use the compose action to save the array, as described in the following procedure.

### Add the compose action

1. [Display a cloud flow in the designer](#display-a-cloud-flow-in-the-designer).
1. In your flow, add an action be selecting the plus sign (**+**).
1. In the **Add an action** search field, typ **compose**.
1. Under **Data Operation**, select **Compose**.

    :::image type="content" source="./media/data-operations/search-select-compose-2-new-designer.png" alt-text="Screenshot of the Compose - Data Operation action.":::

1. In the **Inputs** field, enter the array that you want to reference later.

    :::image type="content" source="./media/data-operations/add-array-compose-2-new-designer.png" alt-text="Configure the Compose action.":::

1. Close the configuration pane by selecting the left arrows (**<<**) at the top right corner.

    > [!TIP]
    > To make the **Compose** card easier to find later, rename it by selecting the text **Compose** on the title bar of the card and entering a name that's easy to remember.

### Use the outputs from the compose action

Use the contents of the compose action you created in this section in a new action. In this example, you use the outputs from the compose action in a **Data Operation - Join** action. The join action takes an array and joins it into a single string with a separator of your choice.

1. [Display a cloud flow in the designer](#display-a-cloud-flow-in-the-designer).
1. In your flow, add an action be selecting the plus sign (**+**).
1. In the **Add an action** search field, type **join**.
1. Under **Data Operation**, select **Join**.
1. In the **From** field, select the lightning bolt, and then select the **Outputs** dynamic value. `Outputs` appears in the **From** field.

    :::image type="content" source="./media/data-operations/use-compose-output-2-new-designer.png" alt-text="Use Outputs from the Compose action.":::

1. in the **Join with** field, enter a comma (`,`) or the desired separator.
1. Close the configuration pane by selecting the left arrows (**<<**) at the top right corner.

## Use the join action

Use the **Data Operation - Join** action to delimit an array with the separator of your choice. For example, your flow receives a web request that includes the following array of email addresses: `["d@example.com", "k@example.com", "dal@example.com"]`. However, your email program requires addresses to be formatted in a single string, separated with semicolons. You use the **Data Operation - Join** action to change the comma delimiter (,) to a semicolon (;) by following these steps:

1. [Display a cloud flow in the designer](#display-a-cloud-flow-in-the-designer).
1. Add a new action, search for **Join**, and then select **Data Operation - Join**.

    :::image type="content" source="./media/data-operations/use-compose-output-2-join-new-designer.png" alt-text="Join action.":::

1. In the **From** field, enter the array, and in the **Join with** box, enter a semicolon (**;**).

    :::image type="content" source="./media/data-operations/add-array-join-2-new-designer.png" alt-text="Configure the Join action.":::

1. Save your flow, and then run it.

1. After your flow runs, the output of the **Data Operation – Join** action is a string with the addresses joined by semicolons, as shown in the following screenshot.

    :::image type="content" source="./media/data-operations/join-output-2-new-designer.png" alt-text="Screenshot of input of addresses separated by commas, a Join with value of semicolon, and output of those addresses separated by semicolons.":::

## Use the select action

Use the **Data Operation – Select** action to transform the shape of objects in an array. For example, you can add, remove, or rename elements in each object in an array.

> [!NOTE]
> Although you can add or remove elements by using the select action, you can't change the number of objects in the array.

In this example, data enters your flow via a web request in this format:

``` JSON
[ { "first": "Eugenia", "last": "Lopez" }, { "first": "Elizabeth", "last": "Moore" } ]
```

You want to reshape the incoming data by renaming `first` to `FirstName` and `last` to `FamilyName`, and adding a new member named `FullName` that combines `first` and `last` (separated with a space).

``` JSON
[ { "FirstName": "Eugenia", "FamilyName": "Lopez", "FullName": "Eugenia Lopez" }, { "FirstName": "Elizabeth", "FamilyName": "Moore", "FullName": "Elizabeth Moore" } ]
```

To do this:

1. [Display a cloud flow in the designer](#display-a-cloud-flow-in-the-designer).
1. Delete the existing trigger by either right-clicking the trigger and selecting **Delete**, or by selecting the vertical ellipsis (**&vellip;**) in the configuration pane, and then selecting **Delete**.
1. 1. Add the **When an HTTP request is received** trigger to your flow.
1. Select **Use sample payload to generate schema**.

    :::image type="content" source="./media/data-operations/request-trigger-new-designer.png" alt-text="Screenshot of selecting the sample payload.":::

1. In the box that appears, paste a sample of your source data array, and then select **Done**.
1. Add the **Data Operation – Select** action, and then configure it as shown in the following screenshot.

   :::image type="complex" source="./media/data-operations/select-card-2-new-designer.png" alt-text="Configure the select action.":::
   Screenshot showing the select action. The From field is set to Body. In the Map section, FirstName is set to first, FamilyName is set to last, and FullName is set to first and last, separated by a space.:::image-end:::

   > [!TIP]
   > The output from the select action is an array that contains the newly shaped objects. You can then use this array in any other action, such as the compose action discussed previously.

## Use the filter array action

Use the **Data Operation - Filter array** action to reduce the number of objects in an array to a subset that matches the criteria you provide.

> [!NOTE]
>
> * You can't use the filter array action to change the shape of objects in the array.
> * The text on which you filter is case-sensitive.

In this example, you use the filter array action on this array:

``` JSON
[ { "first": "Eugenia", "last": "Lopez" }, { "first": "Elizabeth", "last": "Moore" } ]
```

This example creates a new array containing only objects where `first` is set to **Eugenia**.

1. [Display a cloud flow in the designer](#display-a-cloud-flow-in-the-designer).
1. Find, and then add, the **Filter array** action to your flow.
1. In the **Filter Query** section, configure the filter array action. Following the example in this section, select `first` > **is equal to** > **Eugenia**.

    :::image type="content" source="./media/data-operations/add-configure-filter-array-2-new-designer.png" alt-text="Screenshot of in the From section, the first line is set to Body. In the second line, first is set equal to Eugenia.":::

1. Save, and then run your flow.

`Body` will now just contain the following array item as a result:
``` JSON
[ { "first": "Eugenia", "last": "Lopez" } ]
```

## Use the create CSV table action

Use the **Data Operation - Create CSV table** action to change a JSON array input into a comma-separated value (CSV) table. You can keep the headers visible in the CSV output. In this example, you convert the following array into a CSV table:

``` JSON
[ { "first": "Eugenia", "last": "Lopez" }, { "first": "Elizabeth", "last": "Moore" } ]
```

1. [Display a cloud flow in the designer](#display-a-cloud-flow-in-the-designer).
1. Find, add, and then configure the **Data Operation - Create CSV table** action to resemble the following image.

    :::image type="content" source="./media/data-operations/create-csv-table-2-new-designer.png" alt-text="Screenshot of Configuring the Create CSV table action. 'From' is set to 'Body', and 'Columns' is set to 'Automatic'.":::

    The **Body** token in this image comes from a **When an HTTP request is received** action; however, you can get the input for the **Create CSV table** action from the output of any previous action in your flow, or you can enter it directly in the **From** box.
1. Save, and then run your flow.

    When your flow runs, the **Create CSV table** action displays the output shown in the following screenshot.

    :::image type="content" source="./media/data-operations/create-csv-table-output-2-new-designer.png" alt-text="Screenshot of the output from the create CSV table action, showing firstname,familyname in the first row followed by Eugenia,Lopez and Elizabeth,Moore.":::

## Use the create HTML table action

Use the **Data Operation - Create HTML table** action to change a JSON array input into an HTML table. You can keep the headers visible in the HTML output.

To do this, follow the steps in the previous [Use the create CSV table action](#use-the-create-csv-table-action) section, but use the **Data Operation - Create HTML table** action instead of **Create CSV table**.

> [!TIP]
> If you plan to send the HTML table via email, remember to select **IsHtml** in the email action.

## Related information

- [Training: Use Dataverse triggers and actions in Power Automate (module)](/training/modules/use-dataverse-triggers-actions/)
- [Training: Integrate Power Automate flows and Dataverse (learning path)](/training/paths/integrate-dataverse-power-automate/)


[!INCLUDE[footer-include](includes/footer-banner.md)]
