---
title: Learn to how to edit Selenium IDE flows | Microsoft Docs
description: Learn to how to edit Selenium IDE flows.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: desktop-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/04/2019
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Edit Selenium IDE flows

>[!IMPORTANT]
>This section covers topics to develop automations using legacy systems:
> - Selenium IDE: If you are just starting your RPA automation project, we recommend that you use Power Automate for desktop instead.
> - Windows recorder (V1): From November 30th, desktop flows will no longer be supported. Migrate your flows to Power Automate for desktop or delete them.

Selenium IDE flows automate websites running in the [Microsoft Edge (version 80 or later)](https://www.microsoft.com/edge/) or Google Chrome. After you've [created a Web UI flow](create-web.md), you might need to edit it. Follow the steps in this document to learn how to edit your Selenium IDE flows.

## Edit in Selenium IDE

Use the Selenium IDE to edit your Selenium IDE flows.

>[!NOTE]
>Editing in the Selenium IDE is aimed at advanced users and developers.

You can refer to the [Selenium Commands](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/) to learn how to edit the script.

The Selenium IDE suggests different selectors and a default one when targeting a user interface element. You can also define a new selector if none of the proposed selectors are appropriate. This usually happens when the website’s HTML structure is highly dynamic.

Here is an example of possible selectors that the Selenium IDE identified:

![Screenshot of possible selectors.](../media/edit-web/possible-selectors.png "Possible selectors")

## Accessing a property of an object variable or item of an array variable**

This advanced capability lets you use syntax like \${foo.bar} to access the bar property of the foo object. You can also write to the bar property of foo by using foo.bar as the value property in a store command. You can also use syntax such as \${foo[0]} to access the item at index 0 in the foo array.

## Next steps

- [Create Selenium IDE flows](create-web.md)
- [Run Windows recorder (v1) flows](run-desktop-flow.md)


[!INCLUDE[footer-include](../includes/footer-banner.md)]