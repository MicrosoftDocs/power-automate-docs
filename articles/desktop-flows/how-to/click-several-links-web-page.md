---
title: Click several links on a web page | Microsoft Docs
description: Click several links on a web page
author: georgiostrantzas
ms.service: power-automate
ms.topic: article
ms.date: 06/04/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Click several links on a web page

When automating web applications, you may meet scenarios that require you to click all the links in a list of links.

To automate these scenarios, use the **Extract data from web page" action and extract a random value from two consecutive links. Power Automate Desktop will automatically extract the respective value from all the links in the list.

![The Live web helper with the selected values.](media/click-several-links-web-page/extract-data-web-page-action.png)

> [!NOTE]
> You can find more information regarding web data extraction in [Automate web flows
](../automation-web.md).

After the extraction, you can use the **DataFromWebPage.RowsCount** property to get the number of the elements in the list.

To make the flow iterate through all the links on the page, use a **Loop** action. The loop should start from 0 and end at **%DataFromWebPage.Count-1%**.

![The Loop actions.](media/click-several-links-web-page/loop-action.png)

Inside the loop, use a **Click link on web page** action and select a UI element of the first link as an input.

![The Click link on web page action.](media/click-several-links-web-page/click-link-web-page.png)

To make the action click all the links, modify the selector to click a different link in each loop iteration. 

To achieve this functionality, edit the selector with the **Custom selector builder**. In this step, the right part of the selector should look something like the following example:
**ul[properties] > li[properties]:eq(0) > a[properties]**

![The original selector in the Custom selector builder.](media/click-several-links-web-page/custom-selector-builder.png)

To make it select a different link in each iteration, change the **tr:eq(0)** part to **tr:eq(%LoopIndex%**.

![The modified selector n the Custom selector builder.](media/click-several-links-web-page/modified-selector.png)

> [!NOTE]
> You can find more information regarding custom selectors in [Build a custom selector](build-custom-selectors.md).

Lastly, use the **Go to web page** action to go back to the original page after each click. You can perform additional operations on each loaded page between the **Click link on web page** and **Go to web page** actions.

![The Go to web page action.](media/click-several-links-web-page/go-web-page-action.png)