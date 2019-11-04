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
ms.date: 11/04/2019
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Use inputs and outputs in Web UI flows

[This topic is pre-release documentation and is subject to change.]

[!INCLUDE [view-pending-approvals](../includes/cc-rebrand.md)]

## Define inputs for a Web UI flow

Inputs of a UI flow let you pass information from an external source such as a database or another UI flow to the target legacy software that you will automate.

Any variable that is used (read) before initialization (usually done via **store** commands) will be automatically treated as an input variable and it will be displayed on the **Run a UI Flow for web** action card.

You can use variables via string interpolation, for example, change the click command's target field to "id=\${elementId}". Or change the type command's value field to "\${inputText}".

The command, **set window size** and the command **type** in the following screenshots use uninitialized variables \${Width}, \${Height}, and \${search}. These variables will become input values.

![Set window size and type](../media/inputs-outputs-web/f05cb445dad212aaf395b66ba969622c.png "Set window size and type")

You can use variables directly in some commands, for example, forEach command's target/value fields are both variables, you don't need to surround it with "\${}".

Please consult [Selenium commands](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/) reference to determine which commands take variable name directly.

## Define outputs for a Web UI flow

Any variable defined in the selenium script automatically becomes an output value. Use the following commands to declare variables:

[Store](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/#store)

[Store attribute](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/#store-attribute)

[Store json](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/#store-json)

[Store title](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/#store-title)

[store value](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/#store-value)

[Store window handle](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/#store-window-handle)

[Store xpath count](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/#store-xpath-count)

[Execute script](https://www.seleniumhq.org/selenium-ide/docs/en/api/commands/#execute-script)(add 'return' syntax to return the object you want to store at the end of the
script)

## Next steps

- Learn how to [create Web UI flows](create-web.md).
- Learn how to [trigger UI flows](run-ui-flow.md).

