---
title: Learn to how to edit Web UI flows | Microsoft Docs
description: Learn to how to edit Web UI flows.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/23/2019
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Edit Web UI flows

[This topic is pre-release documentation and is subject to change.]

[!INCLUDE [view-pending-approvals](../includes/cc-rebrand.md)]


Web UI flows automate websites running in the [next version of Microsoft
Edge](https://www.microsoftedgeinsider.com/) or Google Chrome

## Record your actions on the Web

Recording is documented in the [quick start for creating Web UI flows](create-web.md).

## Edit in Selenium IDE

Edition is done in Selenium IDE. Edition in Selenium IDE is aimed at advanced users and developers.

You can refer to the [Selenium Commands](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/) to edit the script.

Selenium IDE will suggest different selectors and a default one when targeting a User Interface element. You can also define a new selector if none of the proposed selectors are appropriate. This usually happens when the website’s HTML structure is highly dynamic.

Below is an example of possible selectors that Selenium IDE identified:

![](../media/edit-web/33cb0d934dcf386163edcb1ef2fe8310.png)

## Accessing a property of an object variable or item of an array variable**

This advanced capability lets you use syntax like \${foo.bar} to access the bar property of the foo object. You can also write to the bar property of foo by using foo.bar as the value property in a store commands. You can also use syntax such as \${foo[0]} to access the item in specific index of foo array.

## Next steps

