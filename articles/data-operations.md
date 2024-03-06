---
title: Use data operations in Power Automate (contains video)
description: Learn to perform operations such as create HTML tables, create CSV tables, compose, join, select, and filter arrays with Power Automate.
suite: flow
documentationcenter: na
author: v-aangie
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 07/14/2022
ms.author: kisubedi
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Use data operations

In this article, you'll learn about some common data operations in Power Automate, such as compose, join, select, filter arrays, create tables, and parse JSON. These are available to manipulate data when you create flows.

>[!NOTE]
>The different sections in this article aren't related and are not dependent upon each other. The different sections use different examples.

Here's a quick video about data operations.

>[!VIDEO https://www.microsoft.com/videoplayer/embed/RWKXdo]

## Prerequisites

* Access to Power Automate.
* A tool such as [PostMan](https://www.getpostman.com/postman) to send HTTP POST requests with a JSON array to your flow.

## Use the compose action

Use the **Data Operation - Compose** action to save yourself from having to enter the same data multiple times as you're designing a cloud flow. In this example, you need to enter an array of digits&mdash;`[0,1,2,3,4,5,6,7,8,9]`&mdash;several times while you design your flow. You can use the compose action to save the array, as described in the following procedure.

1. Search for **compose**, and then select the **Compose - Data Operation** action.

> [!div class="mx-imgBorder"]
> ![Screenshot of searching for and selecting the Compose action.](./media/data-operations/search-select-compose-2.png "Compose - Data Operation action")

1. In the **Inputs** box, enter the array that you want to reference later.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of configuring the compose action.](./media/data-operations/add-array-compose-2.png "Configure the Compose action")

> [!TIP]
> To make the **Compose** card easier to find later, rename it by selecting the text **Compose** on the title bar of the card and entering a name that's easy to remember.

When you need to access the contents of the compose action, do so by following these steps.

1. Add an action, such as **Join - Data Operation**.

1. Select the control to which you'd like to add the contents you saved in the compose action.

   The **Add dynamic content from the apps and connectors used in this flow** screen opens.

1. On the **Dynamic content** tab, in the **Compose** section, select **Outputs**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of using Outputs from the Compose action.](./media/data-operations/use-compose-output-2.png "Use Outputs from the Compose action")

## Use the join action

Use the **Data Operation - Join** action to delimit an array with the separator of your choice. For example, your flow receives a web request that includes the following array of email addresses: `["d@example.com", "k@example.com", "dal@example.com"]`. However, your email program requires addresses to be formatted in a single string, separated with semicolons. You'll use the **Data Operation - Join** action to change the comma delimiter (,) to a semicolon (;) by following these steps:

1. Add a new action, search for **Join**, and then select **Data Operation - Join**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of searching for and selecting the join action.](./media/data-operations/search-select-join-2.png "Join action")

2. In the **From** box, enter the array, and in the **Join with** box, enter a semicolon (**;**).

    >[!div class="mx-imgBorder"]
    >![Screenshot of configuring the join action.](./media/data-operations/add-array-join-2.png "Configure the Join action")

3. Save your flow, and then run it.

4. After your flow runs, the output of the **Data Operation – Join** action will be a string with the addresses joined by semicolons, as shown in the following screenshot.

    >[!div class="mx-imgBorder"]
    >![Screenshot of input of addresses separated by commas, a Join with value of semicolon, and output of those addresses separated by semicolons.](./media/data-operations/join-output-2.png "Output of the Data Operation – Join action")

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

1. Add the **When an HTTP request is received** trigger to your flow.

2. Select **Use sample payload to generate schema**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of selecting the sample payload.](./media/data-operations/request-trigger.png "Use sample payload to generate schema")

3. In the box that appears, paste a sample of your source data array, and then select **Done**.

4. Add the **Data Operation – Select** action, and then configure it as shown in the following screenshot.

   :::image type="complex" source="./media/data-operations/select-card-2.png" alt-text="Configure the select action.":::
   Screenshot showing the select action. From is set to Body. In the Map section, FirstName is set to first, FamilyName is set to last, and FullName is set to first and last, separated by a space.:::image-end:::

   > [!TIP]
   > The output from the select action is an array that contains the newly shaped objects. You can then use this array in any other action, such as the compose action discussed earlier.

## Use the filter array action

Use the **Filter array - Data Operation** action to reduce the number of objects in an array to a subset that matches the criteria you provide.

> [!NOTE]
>
> * You can't use the filter array action to change the shape of objects in the array.
> * The text on which you filter is case-sensitive.

In this example, you use the filter array action on this array:

``` JSON
[ { "first": "Eugenia", "last": "Lopez" }, { "first": "Elizabeth", "last": "Moore" } ]
```

to create a new array that contains only objects in which `first` is set to `Eugenia`.

1. Find, and then add, the **Filter array** action to your flow.
2. Configure the filter array action as shown in the following screenshot.

    >[!div class="mx-imgBorder"]
    >![Screenshot of in the From section, the first line is set to Body. In the second line, first is set equal to Eugenia.](./media/data-operations/add-configure-filter-array-2.png "Configure the Filter array")
3. Save, and then run your flow.

    You can use [PostMan](https://www.getpostman.com/postman) to generate a web request that sends a JSON array to your flow.
4. When your flow runs, the output looks like the following array. Notice that only objects in which `first` is set to `Eugenia` are included in the output of the action.

    ``` JSON
    [ { "first": "Eugenia", "last": "Lopez" }]
    ```

## Use the create CSV table action

Use the **Create CSV table - Data Operation** action to change a JSON array input into a comma-separated value (CSV) table. You can keep the headers visible in the CSV output. In this example, you convert the following array into a CSV table:

``` JSON
[ { "first": "Eugenia", "last": "Lopez" }, { "first": "Elizabeth", "last": "Moore" } ]
```

1. Find, add, and then configure the **Create CSV table - Data Operation** action to resemble the following image.

    >[!div class="mx-imgBorder"]
    >![Screenshot of Configuring the Create CSV table action. From is set to Body, and Columns is set to Automatic.](./media/data-operations/create-csv-table-2.png "Configure the CSV table action")

    The **Body** token in this image comes from a **When a HTTP request is received** action; however, you can get the input for the **Create CSV table** action from the output of any previous action in your flow, or you can enter it directly in the **From** box.
2. Save, and then run, your flow.

    When your flow runs, the **Create CSV table** action displays the output shown in the following screenshot.

    >[!div class="mx-imgBorder"]
    >![Screenshot of the output from the create CSV table action, showing "first,last" in the first row followed by "Eugenia,Lopez" and "Elizabeth,Moore."](./media/data-operations/create-csv-table-output-2.png "CSV table output in the Body section")

## Use the create HTML table action

Use the **Create HTML table - Data Operation** action to change a JSON array input into an HTML table. You can keep the headers visible in the HTML output.

To do this, follow the steps in the previous **Use the create CSV table action** section for creating a CSV table. Use the **Create HTML table - Data Operation** action instead of **Create CSV table**.

> [!TIP]
> If you plan to send the HTML table via email, remember to select **IsHtml** in the email action.


[!INCLUDE[footer-include](includes/footer-banner.md)]
