---
title: Click all the elements in a list of links
description: Click all the elements in a list of links
author: mattp123

ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 06/04/2021
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

# Click all the elements in a list of links

In browser automation, it's common to meet scenarios that require you to click all the elements in a list of links.

To automate these scenarios, use the **Extract data from web page** action and extract a random value from two consecutive links. Power Automate will automatically extract the respective value from all the links in the list.

![Screenshot of the Live web helper with the selected values.](media/click-elements-list-links/extract-data-web-page-action.png)

> [!NOTE]
> You can find more information regarding web data extraction in [Automate web flows
](../automation-web.md).

After the extraction, you can use the **DataFromWebPage.RowsCount** property to get the number of the elements in the list.

To make the flow iterate through all the links on the page, use a **Loop** action. The loop should start from 0 and end at **%DataFromWebPage.RowsCount-1%**.

![Screenshot of the Loop action.](media/click-elements-list-links/loop-action.png)

Inside the loop, use the **Click link on web page** action and select a UI element of the first link as an input.

![Screenshot of the Click link on web page action.](media/click-elements-list-links/click-link-web-page.png)

To make the action click all the links, modify the selector to click a different link in each loop iteration. 

To achieve this functionality, edit the selector with the **Text editor**. In this step, the right part of the selector should look something like the following example:
**ul[properties] > li[properties]:eq(0) > a[properties]**

![Screenshot of the original selector in the Text editor.](media/click-elements-list-links/custom-selector-builder.png)

To make it select a different link in each iteration, change the **tr:eq(0)** part to **tr:eq(%LoopIndex%)**.

![Screenshot of the modified selector n the selector's Text editor.](media/click-elements-list-links/modified-selector.png)

> [!NOTE]
> You can find more information regarding custom selectors in [Build a custom selector](../build-custom-selectors.md).

Lastly, use the **Go to web page** action to go back to the original page after each click. You can perform additional operations on each loaded page between the **Click link on web page** and **Go to web page** actions.

![Screenshot of the Go to web page action.](media/click-elements-list-links/go-web-page-action.png)
