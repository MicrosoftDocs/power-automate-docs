---
title: Pass a datatable from a cloud flow to a desktop flow
description: Pass a datatable from a cloud flow to a desktop flow
author: mattp123

ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 12/22/2021
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

# Pass a datatable from a cloud flow to a desktop flow

Some automation scenarios require users to pass data in tabular form from a cloud flow to a desktop flow. To implement this functionality, replicate the following steps:

1. Create a new [input variable](../manage-variables.md#create-an-input-variable) of a [datatable datatype](../variable-data-types.md#datatable). In this example, the input variable is named **DataInput**.

    ![Screenshot of the Add a new input variable dialog.](media/passing-datatable/creating-new-input-variable.png)

1. Inside your cloud flow, initialize a new variable of type array with an array of objects (JSON) representing your datatable. Then, use it as an input value in the **Run a flow built with Power Automate for desktop** action.

    ![Screenshot of the created cloud flow that passes the datatable in a JSON format.](media/passing-datatable/cloud-flow-pass-datatable.png)


      In the following example, you can see the structure of a JSON block:

    ``` JSON
    [
     {
     "Name": "Tania",
     "Last Name": "Agius",
     "Email": "taniaagius@contoso.com"
     },
     {
     "Name": "Ditiro",
     "Last Name": "Kgosi",
     "Email": "ditirokgosi@contoso.com"
     },
     {
     "Name": "Zoltan",
     "Last Name": "Gal",
     "Email": "zoltangal@contoso.com"
     }
    ]
    ```
To find more information regarding passing data from cloud flows to desktop flows, refer to [Trigger desktop flows from cloud flows](../trigger-desktop-flows.md).
