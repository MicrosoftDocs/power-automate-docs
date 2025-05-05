---
title: Handle links that open new tabs
description: Handle links that open new tabs
author: mattp123

ms.service: power-automate
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

# Handle links that open new tabs

Desktop flows use browser instances to pinpoint specific web pages located in specific tabs on browser windows. 

If a flow clicks a link that opens a new tab, you have to apply additional configuration to continue automating inside this new tab.

The most straightforward approach is the use of the embedded automation browser that doesn't support tabs. It opens all the links in the same instance.

![Screenshot of the launch automation browser option in the Launch new Internet Explorer action.](media/links-open-new-tabs/launch-automation-browser.png)

> [!NOTE]
> You can find more information about the features and limitations of the automation browser in [Use browsers and manage extensions](../using-browsers.md).

To navigate back to the previous page, you can use the **Go to web page** action.

If your flow uses Edge, Internet Explorer, Chrome, or Firefox, there are also methods to handle links that open new tabs.

You can retrieve the URL behind the link using the **HRef** option in the **Attribute name** field of the **Get details of element on web page** action. Then, you can navigate to the retrieved link in the same tab using the **Go to web page** action.

![Screenshot of the Attribute name filed in the Get details of element on web page action.](media/links-open-new-tabs/get-details-element-web-page-action.png)

If the link is in JavaScript, you can retrieve the JavaScript function and run it as a URL in the **Go to web page** action. In this case, you should enter **JavaScript:** and the function to run.

Another approach is to click the link and then use the **Attach to running instance** option of the previously mentioned browsers to attach your flow to the newly created tab.

![Screenshot of the Attach to running instance option in the Launch new Microsoft Edge action.](media/links-open-new-tabs/edge-attach-running-instance.png)
