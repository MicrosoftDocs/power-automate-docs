---
title: Run desktop flow | Microsoft Docs
description: Run desktop flow Actions Reference
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 10/13/2021
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Run desktop flow

Set your automation to trigger other flows

|<!-- --> |
|-----|
|[Run desktop flow](#runflow)|

## Getting started with the Run desktop flow action

The **Run desktop flow** action enables you to call other desktop flows while running a specific desktop flow. To use the action, add it to the workspace and select the desktop flow you want to call. If the called flow contains input variables, the action will prompt you to enter their values.

> [!NOTE]
> You can find more information regarding the **Run desktop flow** action in [Run desktop flow from other desktop flows](../how-to/run-desktop-flow-action.md).

![Screenshot of the Run desktop flow action.](\media\runflow\run-desktop-flow-action.png)

## Run desktop flow action


### <a name="runflow"></a> Run desktop flow
Runs a desktop flow which can receive input variables and may produce output variables. The parent flow run will be paused until the called desktop flow completes.

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Destop flow|No|Desktop flow||Select the desktop flow to run from within this flow|


##### Variables Produced
- This action produces the output variables of the selected flow

##### <a name="runflow_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Run desktop flow failed|Indicates a problem while running the desktop flow|

>[!NOTE]
> * A flow's dependencies can't be more than 30 other flows.
> * Two flows can't directly or indirectly call one-another as this causes a recursion.
> * In org tenants, the flows must be under the same environment.

