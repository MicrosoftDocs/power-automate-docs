---
title: Handle iframes on a web page | Microsoft Docs
description: Handle iframes on a web page
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 06/24/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Handle iframes on a web page

Iframes are HTML documents embedded inside other HTML documents. These elements are often used to insert content from external sources into web pages.

When an iframe belongs to the same domain as the original page, you can use the web automation actions to automate it. You can find more information about web automation in [Automate web flows](..\automation-web.md).

If the web automation actions don't work correctly with a particular iframe, you can use the UI automation actions to handle it. You can find more information about UI automation in [Automate desktop flows](..\desktop-automation.md).

If an iframe is cross-domain, deploy the **Get details of element on web page** to retrieve the **Source Link** attribute of the element.

![The Get details of element on web page action.](media/handle-iframes/get-details-element-web=page-action.png)

Next, use the **Go to web page** action or the **Create new tab** action to navigate to the retrieved source. Now, you can use the web automation actions to interact with the iframe.

![The Go to web page action.](media/handle-iframes/go-web-page-action.png)