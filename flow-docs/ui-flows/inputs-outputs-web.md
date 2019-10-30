---
title: Use inputs and outputs in Web UI flows | Microsoft Docs
description: Use inputs and outputs in Web UI flows.
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
# Use inputs and outputs in Web UI flows
[!INCLUDE [view-pending-approvals](../includes/cc-rebrand.md)]

[This topic is pre-release documentation and is subject to change.]

## Define inputs for a Web UI flow­

Inputs of a UI flow let you pass information from an external source such as a database or another UI flow to the target legacy software that you will automate.

Any variable that is used (read) before initialization (usually done via **store** commands) will be automatically treated as input variable and it will be displayed on the "Run a UI Flow for web" action card.

You can use variable via string interpolation, e.g. change click command's target field to "id=\${elementId}". Or change type command's value field to "\${inputText}".

For example, the command “set window size” and command “type” in the screenshot below uses uninitialized variables \${Width}, \${Height} and \${search}. These variables will become input values.

![](../media/inputs-outputs-web/f05cb445dad212aaf395b66ba969622c.png)

![](../media/inputs-outputs-web/0cf0cf2146763ebb56fe5864938fea65.png)

You can use variable directly in some commands, e.g. forEach command's target/value fields are both variables, you don't need \${} around it.

Please consult [Selenium Commands](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/) reference to determine which commands takes variable name directly.

## Define outputs for a Web UI flow

Any variable defined in the selenium script automatically becomes an output value. Variable declaration is usually done via the following commands:

[Store](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.seleniumhq.org%2Fselenium-ide%2Fdocs%2Fen%2Fapi%2Fcommands%2F%23store&data=02%7C01%7CLiviu.Olaru%40microsoft.com%7C7531faca5313433a158e08d751b74f52%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637067720179930465&sdata=1UDLxouUxMSuJubBDGQyUfBfu1lin%2BNxPGsqrUp%2FhgY%3D&reserved=0)

[Store attribute](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.seleniumhq.org%2Fselenium-ide%2Fdocs%2Fen%2Fapi%2Fcommands%2F%23store-attribute&data=02%7C01%7CLiviu.Olaru%40microsoft.com%7C7531faca5313433a158e08d751b74f52%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637067720179940418&sdata=KMbB5gU2Ozyog%2FGjLgKSygObLjXFnM4hb6c0vspPxqM%3D&reserved=0)

[Store json](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.seleniumhq.org%2Fselenium-ide%2Fdocs%2Fen%2Fapi%2Fcommands%2F%23store-json&data=02%7C01%7CLiviu.Olaru%40microsoft.com%7C7531faca5313433a158e08d751b74f52%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637067720179940418&sdata=fSK93T9AeLaUjQsk4mvB%2FDJSFL%2FIkxaX72Iqq152xwM%3D&reserved=0)

[Store title](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.seleniumhq.org%2Fselenium-ide%2Fdocs%2Fen%2Fapi%2Fcommands%2F%23store-title&data=02%7C01%7CLiviu.Olaru%40microsoft.com%7C7531faca5313433a158e08d751b74f52%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637067720179950377&sdata=Awhvf8aesOZq8H0iovZ5noag7nEOiqL3s%2BabwBqSv8Y%3D&reserved=0)

[store value](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.seleniumhq.org%2Fselenium-ide%2Fdocs%2Fen%2Fapi%2Fcommands%2F%23store-value&data=02%7C01%7CLiviu.Olaru%40microsoft.com%7C7531faca5313433a158e08d751b74f52%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637067720179950377&sdata=xMGapaOzM7%2F5RP2z3HwYieX0hoydA5jelkEnpZBIQM0%3D&reserved=0)

[Store window handle](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.seleniumhq.org%2Fselenium-ide%2Fdocs%2Fen%2Fapi%2Fcommands%2F%23store-window-handle&data=02%7C01%7CLiviu.Olaru%40microsoft.com%7C7531faca5313433a158e08d751b74f52%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637067720179950377&sdata=6lu9%2FbynOyNmuZrUnY7hCg4a5f62xqcI42JimRjHm%2Fg%3D&reserved=0)

[Store xpath count](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.seleniumhq.org%2Fselenium-ide%2Fdocs%2Fen%2Fapi%2Fcommands%2F%23store-xpath-count&data=02%7C01%7CLiviu.Olaru%40microsoft.com%7C7531faca5313433a158e08d751b74f52%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637067720179960333&sdata=VD4vAYJ%2B8VOD8RR%2FA1ZN99FtHmkALsKsmc6GUH8BlLI%3D&reserved=0)

[Execute script](https://nam06.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.seleniumhq.org%2Fselenium-ide%2Fdocs%2Fen%2Fapi%2Fcommands%2F%23execute-script&data=02%7C01%7CLiviu.Olaru%40microsoft.com%7C7531faca5313433a158e08d751b74f52%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C637067720179930465&sdata=BayClu1kxhwNTiKUieCYljXD2dqO7FE9uR56WnmYCVo%3D&reserved=0)
(add 'return' syntax to return the object you want to store at the end of the
script)

## Next steps

- Learn how to [trigger the UI flow](run-ui-flow.md) you just created.

