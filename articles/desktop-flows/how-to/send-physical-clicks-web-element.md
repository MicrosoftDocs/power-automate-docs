---
title: Send physical clicks on a web element
description: Send physical clicks on a web element
author: mattp123

ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 06/23/2021
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

# Send physical clicks on a web element

There are cases where emulated clicks don't function as expected and don't select links successfully. Sending physical clicks can help you automate web pages that don't support emulated clicks. 

To send a physical click:

1. Deploy the **Click link on web page** action and populate a browser instance and the UI element that specifies the link you want to click. You can find more information regarding UI elements in [Automate using UI elements](../ui-elements.md).

    ![Screenshot of the Click link on web page action.](media\send-physical-clicks-web-element\click-link-web-page-action.png)

1. Choose the type of click you want to perform in the **Click type** field. 

    ![Screenshot of the Click type field in the Click link on web page action.](media\send-physical-clicks-web-element\click-link-web-page-action-click-type.png)

1. Extend the **Advanced** settings of the action and enable the **Send physical click** toggle button. This option automatically focuses on the parent window of the link, moves the mouse cursor to the appropriate location, and sends a physical click to the selected link.

   ![Screenshot of the Send physical click option in the Click link on web page action.](media\send-physical-clicks-web-element\click-link-web-page-action-advanced.png)
