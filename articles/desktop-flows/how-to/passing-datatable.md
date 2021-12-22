---
title: Pass a datatable from a cloud flow to a desktop flow | Microsoft Docs
description: Pass a datatable from a cloud flow to a desktop flow
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/22/2021
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Pass a datatable from a cloud flow to a desktop flow

Some automation scenarios require users to pass data in tabular form from a cloud flow to a desktop flow. To implement this functionality, replicate the following flow:

1. Before deploying any actions, create a new input variable. In this example, the input variable is named **DataInput**.

    This variable will be used in your cloud flow to pass the data to Power Automate for desktop. The data must be in JSON format for this flow to run successfully. 

1. Use the **Convert JSON to custom object** action to convert the imported JSON data into a custom object. You can find more information regarding custom objects in [Advanced data types](../variable-data-types.md#advanced-data-types). 

1. Deploy a **Set variable** action and create a new variable named **TableContent**. In this step, the variable must contain the headers of the table you want to pass separated by commas.

1. Use a **For each** loop to iterate through each item of the previously created custom object.

1. Use a **Set variable** action and append the appropriate values of the current item to the **TableContent** variable. The values must be separated by commas. 

1. Outside the loop, deploy the **Get special folder** action to retrieve the path for your desktop folder. 

1. Write the content of the **TableContent** variable to a file named **table.txt** located in your desktop folder. If the file doesn't exist, the action will create it automatically.

1. Use the **Rename file(s)** action to change the file extension of the previously mentioned file to **.csv**.

1. Lastly, read the content of the converted CSV file using the **Read from CSV file**. The read data will have the form of a table.

1. Optionally, use the **Delete file(s)** action to delete the **table.csv** file from your desktop. 