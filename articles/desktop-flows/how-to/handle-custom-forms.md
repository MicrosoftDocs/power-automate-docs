---
title: Handle custom forms
description: Handle custom forms	
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 02/14/2022
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Handle custom forms

After [creating a custom form](../custom-forms.md), it's typical to check which button is pressed and handle the gathered data accordingly.

To become familiar with this functionality, create a new custom form  containing the following elements:

- A text input with ID **Name** that stores the name of a customer 
- A text input with ID **LastName** that stores the last name of a customer 
- A submit action with ID **Save**
- A submit action with ID **Cancel** and the option **Ignore provided inputs** enabled. 

![Screenshot of the added elements in the custom form designer.](media/handle-custom-forms/example-custom-form.png)

The purpose of the flow is to check which form action is pressed. When the **Save** action is pressed, the flow stores the gathered data into an Excel spreadsheet. When the **Cancel** action is pressed, the flow stops and returns an error. 

To implement this behaviour:

1. Deploy an **If** action and check whether the **ButtonPressed** variable contains the value **Save**.

    ![Screenshot of the If action that checks whether the save button is pressed.](media/handle-custom-forms/example-if-action.png)

1. Inside the if block, launch an Excel spreadsheet. For this example, the spreadsheet must contain two columns for the name and last name of the customer.

    ![Screenshot of the Launch Excel action.](media/handle-custom-forms/example-launch-excel.png)

1. Use a **Get first free column/row from Excel worksheet** action to find the first available row in the spreadsheet.

    ![Screenshot of the Get first free column row from Excel worksheet action.](media/handle-custom-forms/example-get-first-free-row.png)

1. Deploy a **Write to Excel worksheet** action and write the customer's name in the first column of the first available spreadsheet row. 

    All the form inputs are stored in the **CustomFormData** custom object variable. To access the value of a specific element of the custom object, use the following notation: **%CustomFormData['ElementID']%**.

    > [!NOTE]
    > You can find more information regarding custom objects in [Advanced data types](../variable-data-types.md#advanced-data-types)

    ![Screenshot of Write to Excel worksheet action that writes the customer's name.](media/handle-custom-forms/example-write-excel-customer-name.png)

1. Use a second **Write to Excel worksheet** action to write the customer's last name in the second column of the first available spreadsheet row.

    ![Screenshot of Write to Excel worksheet action that writes the customer's last name.](media/handle-custom-forms/example-write-excel-customer-last-name.png)

1. Save and close the Excel file using the **Close Excel** action.

    ![Screenshot of Close Excel action.](media/handle-custom-forms/example-close-excel.png)

1. Add an **Else** action inside the if block and use a **Stop flow** action to stop the flow when the if statement is false. 

    ![Screenshot of the else block that stopes the flow.](media/handle-custom-forms/example-stop-flow.png)

1. When running the desktop flow, the displayed form will be similar to the one presented in the following screenshot:

    ![Screenshot of the displayed custom form.](media/handle-custom-forms/example-custom-form-window.png)
