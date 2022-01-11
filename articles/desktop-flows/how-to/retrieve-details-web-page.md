---
title: Retrieve details from a web page | Microsoft Docs
description: Retrieve details from a web page 
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 01/11/2022
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Retrieve details from a web page 

Extracting information regarding web pages is an essential function in most web flows. Power Automate for desktop enables you to retrieve various details from web pages through the **Get details of web page** action.

To use the actions, you need an already created browser instance that specifies the web page you want to extract details from. A browser instance can be created with any browser-launching action. 

After selecting the appropriate browser instance, choose the information you want to extract from the web page. The **Get details of web page** action offers six different options:

The retrieved information is stored for later use in a text variable named **WebPageProperty**. 

## Prevent errors while retrieving details

Although most properties exist virtually on every web page, there are scenarios in which the action fails to retrieve the selected detail. For example, web pages without meta keywords are a common occurrence.

If you're unsure if an attribute exists on a web page, configure the **On error** options of the **Get details of web page** action to continue running the flow after failure.

To determine whether the data extraction is successful, use an **If** conditional to check if the **WebPageProperty** variable is empty or not. 

The conditional allows you to implement different functionality for successful and unsuccessful data extraction. You can find more information regarding conditionals in [Use conditionals](../use-conditionals.md). 

The following example subflow retrieves the available meta keywords from a web page and displays them in a message box. If the extraction is unsuccessful, the flow stops and returns an error message. 