---
title: Get location and size of a window | Microsoft Docs
description: Get location and size of a window
author: georgiostrantzas
ms.service: power-automate
ms.topic: article
ms.date: 06/03/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Get location and size of a window


When you automate windows and desktop applications, you may need to know the exact location and size of a window. 

To retrieve this information, use the **Get details of window** action and set the **Windows property** option to **Get window location and size**. The action stores the retrieved values in a text variable named **WindowProperty**.

> [!NOTE]
> The **Get details of window** action requires a UI element that specifies the window from which it will retrieve the selected attrubite. You can find more information regarding UI elements in [Automate using UI elements](../ui-elements.md).

![The Get details of window action.](media/get-location-size-window/get-details-window-action.png)

After retrieving the **WindowProperty** text value, you have to split it into separate values and convert them to numbers.

To split the text value, deploy the **Split text** action and separate the values using the comma character (**,**) as a delimiter. The separated values are stored in a list variable named **TextList**.

![The Split text action.](media/get-location-size-window/split-text-action.png)

Before converting the texts to numbers, use the **Create new list** action to create a list that will store the converted numbers in the following steps.

![The Create new list action.](media/get-location-size-window/create-new-list-action.png)

To access each item of the **TextList** independently,  deploy a **For each** loop.

![A For each loop.](media/get-location-size-window/for-each-loop.png)

Inside the loop, use a **Convert text to number** action to convert the current text item of the loop to number.

![The Convert text to number action.](media/get-location-size-window/convert-text-number-action.png)

Next, use the **Add item to list** action to store the produced number to the previously created list.

![The Add item to list action.](media/get-location-size-window/add-item-list-action.png)

To access the final location and size values later in your flow, use the following notations:

- **List[0]** - The left point of the window
- **List[1]** - The top point of the window
- **List[2]** - The width of the window
- **List[3]** - the height of the window

To calculate the right and bottom points of the window, you can use the following expressions:

- **%List[0] + List[2]%** - The right point of the window
- **%List[1] + List[3]%** - The bottom point of the window

> [!NOTE]
> You can find more information about lists and the VariableName[ItemNumber] notaion in [Variable datatypes](../variable-data-types.md).