---
title: Understand data operations | Microsoft Docs
description: Learn to perform operations, such as create HTML table, create CSV table, compose, join, select, and filter array with Power Automate.
services: ''
suite: flow
documentationcenter: na
author: MSFTMan
manager: KVivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/18/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Use data operations with Power Automate

In this walkthrough, you learn about some of the Power Automate’s popular data operations, such as compose, join, select, filter array, create table, and parse JSON that are available to manipulate data when you create flows.

## Prerequisites
* Access to Power Automate.
* A tool such as [PostMan](https://www.getpostman.com/postman) to send HTTP POST requests with a JSON array to your flow.

## Use the compose action
Use the **Data Operation - Compose** (compose) action to save yourself from entering identical data multiple times when you’re designing a flow. For example, if you need to enter an array of digits: ````[0,1,2,3,4,5,6,7,8,9]```` several times while you design your flow, you could use the compose action to save the array like this:

1. Search for **Compose**, and then select the **Data Operation - Compose** (compose) action.
   
    ![search for and select the compose action](./media/data-operations/search-select-compose-2.png)
2. Enter the array into the **Inputs** box you want to reference later:
   
    ![configure the compose action](./media/data-operations/add-array-compose-2.png)

> [!TIP]
> For easier reference later, rename the **Compose** card by clicking on the text "Compose" on the title bar of the **Compose** card.
> 
> 

When you need to access the contents of the compose action, do so via the **Output** token on the **Add dynamic content from the apps and connectors used in this flow** list by following these steps:

1. Add an action such as **Data Operation – Join**.
2. Select the control to which you’d like to add the contents you saved in the compose action.
   
    The **Add dynamic content from the apps and connectors used in this flow** opens.
3. On the **Add dynamic content from the apps and connectors used in this flow**, select the **Outputs** token that’s under the **Compose** category of the **Dynamic content** tab.
   
    ![use output from compose action](./media/data-operations/use-compose-output-2.png)

## Use the join action
Use the **Data Operation - Join** action (Join) to delimit an array with a separator of your choice. For example, assume your flow receives a web request that includes the following array of email addresses: ````["d@example.com", "k@example.com", "dal@example.com"]````. However, your email program requires addresses to be a single string that's separated with semicolons. To do this, use the **Data Operation - Join** (join) action to change the comma delimiter to a semicolon “;“ by following these steps:

1. Add a new action, search for **Join**, and then select **Data Operation - Join** (join).
   
    ![search for and select the join action](./media/data-operations/search-select-join-2.png)
2. Enter the array into the **From** box, and then enter the new delimiter that you want to use into the **Join with** box.
   
    Here, I’ve used the semicolon (;) as the new delimiter.
   
    ![configure the join action](./media/data-operations/add-array-join-2.png)
3. Save your flow, and then run it.
4. After your flow runs, the output of the **Data Operation – Join** action will be:
   
    ![join output](./media/data-operations/join-output-2.png)

## Use the select action
Use the **Data Operation – Select** (select) to transform the shape of the objects in an array. For example, you may add, remove, or rename elements in each object in an array.

> [!NOTE]
> While you can add or remove elements using the select action, you cannot change the number of objects in the array.
> 
> 

For example, you can use the select action if data enters your flow via a web request in this format:

````[ { "first": "Eugenia", "last": "Lopez" }, { "first": "Elizabeth", "last": "Moore" } ]````

and you’d like to reshape the incoming data by renaming "first" to "FirstName", "last" to "FamilyName" and adding a new member named "FullName" that combines "first" and "last" (separated with a space):

````[ { "FirstName": "Eugenia", "FamilyName": "Lopez", "FullName": "Eugenia Lopez" }, { "FirstName": "Elizabeth", "FamilyName": "Moore", "FullName": "Elizabeth Moore" } ]````.

To do this:

1. Add the **When a HTTP request is received** (request) trigger to your flow.
2. Select the **Use sample payload to generate schema** from the **Request** card.
![select sample payload](./media/data-operations/request-trigger.png)
3. In the box that displays, paste a sample of your source data array, and then select the **Done** button.

4. Add the **Data Operation – Select** (select) action, and then configure it like the following image.
   
    ![configure the select action](./media/data-operations/select-card-2.png)
   
   > [!TIP]
   > The output from the select action is an array that contains the newly shaped objects. You can then use this array in any other action, such as **Compose**, discussed earlier.
   > 
   > 

## Use the filter array action
Use **Data Operation - Filter array** (filter array) to reduce the number of objects in an array to a subset that matches the criteria you provide.

> [!NOTE]
> Filter array cannot be used to change the shape of the objects in an array. Also, the text on which you filter is case sensitive.
> 
> 

For example, you can use filter array on this array:

`````[ { "first": "Eugenia", "last": "Lopez" }, { "first": "Elizabeth", "last": "Moore" } ]````

to create a new array that contains only objects in which *first* is set to “Eugenia”.

Let's do this.

1. Find, and then add the **Filter array** (filter array) action to your flow.
2. Configure the filter array action like the following image.
   
    ![configure filter array action](./media/data-operations/add-configure-filter-array-2.png)
3. Save, and then run your flow.
   
    You can use [PostMan](https://www.getpostman.com/postman) to generate a web request that sends a JSON array to your flow.
4. When your flow runs, assuming the JSON input looks like this array:
   
    ````[ { "first": "Eugenia", "last": "Lopez" }, { "first": "Elizabeth", "last": "Moore" } ]````,
   
    the output looks like this array (notice that only objects in which *first* is set to “Eugenia” are included in the output of the action):
   
    ````[ { "first": "Eugenia", "last": "Lopez" }]````

## Use the create csv table action
Use the **Data Operation - Create CSV table** (create csv table) to change a JSON array input into a comma separated value (CSV) table. Optionally, you can keep the headers visible in the CSV output. For example, you can convert the following array into a CSV table by using the **Create CSV table** action:

````[ { "first": "Eugenia", "last": "Lopez" }, { "first": "Elizabeth", "last": "Moore" } ]````

1. Find, add, and then configure the **Data Operation - Create CSV table** action to resemble the following image.
   
    ![configure create csv table action](./media/data-operations/create-csv-table-2.png)
   
    Note: The **Body** token in this image comes from a **When a HTTP request is received** action, however, you could get the input for the **Create CSV table** action from the output of any previous action in your flow, or you can enter it directly into the **From** box.
2. Save, and then run your flow.
   
    When your flow runs, the **Create CSV table** output looks like this image:
   
    ![create csv table output](./media/data-operations/create-csv-table-output-2.png)

## Use the create html table action
Use **Data Operation - Create HTML table** to change a JSON array input into an HTML table. Optionally, you can keep the headers visible in the HTML output.

To do this, follow the steps in the [create csv table section](#use-the-create-csv-table-action) for a detailed example. Be sure to use the **Data Operation - Create HTML table** action, instead of the **Data Operation - Create CSV table** action.

> [!TIP]
> If you plan to send the HTML table via email, remember to select "IsHtml" in the email action.
> 
> 

