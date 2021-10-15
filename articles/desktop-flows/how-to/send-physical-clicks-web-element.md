---
title: Send physical clicks on a web element | Microsoft Docs
description: Send physical clicks on a web element
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 06/23/2021
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Send physical clicks on a web element

You may meet automation cases that require right-clicks, double-clicks, or other kinds of physical clicks on web elements.

To send physical clicks on a web element, you need to know its exact coordinates on the screen. The first step to calculate the screen coordinates of the element is to retrieve its coordinates relative to the web page.

To get this information, follow the instructions in [Get the coordinates and size of a web element](get-coordinates-size-web-element.md). The instructions present the **waelementrectangle** property, but you can replace it with the **waelementcentercoords** property that specifies the center of a web element.

After completing this step, the flow must be similar to the following one:

> [!NOTE]
> The **Windows state** of the browser must be set to **Maximized**. The flow requires additional steps to work with any browser window size.

![The current state of the flow that gets the coordinates of a web element.](media\send-physical-clicks-web-element\get-coordinates-web-element-flow.png)

Now, you can use the **Send mouse click** action to send the wanted type of physical click on the web element.

In the action's properties, enable the **Move mouse** option, and set the **X** and **Y** values to **%List[0] + Browser.DisplayRectangleX%** and **%List[1] + Browser.DisplayRectangleY%**, respectively.

The **List[0]** and **List[1]** variables contain the previously retrieved coordinates in a number format. The **DisplayRectangleX** and **DisplayRectangleY** properties specify the top-left coordinates of the loaded HTML page.

The addition of these two values calculates the exact screen position of the element in a maximized browser window.

![The Send mouse click action with populated fields.](media\send-physical-clicks-web-element\send-mouse-click-action.png)


To make the flow work with any browser window size, you have to retrieve the top-left coordinates of the browser window and add them to the **X** and **Y** coordinates. You can find more information about retrieving the position of a window in [Get the position and size of a window](get-position-size-window.md).

Alternatively, you can use the **Focus windows** action to focus on the browser window, and then select **Active window** in the **Relative to** option of the **Send mouse click** action.

![The Relative to option in the Send mouse click action.](media\send-physical-clicks-web-element\send-mouse-click-action-relative-to-option.png)