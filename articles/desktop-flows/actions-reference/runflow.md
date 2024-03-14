---
title: Run desktop flow actions reference
description: See how to use the Run desktop flow actions.
author: mattp123
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 01/30/2024
ms.author: pefelesk
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
search.audienceType: 
  - flowmaker
  - enduser
---

# Run desktop flow action

The **Run desktop flow** action enables you to call other desktop flows while running a specific desktop flow. To use the action, add it to the workspace and select the desktop flow you want to call. If the called flow contains input variables, the action will prompt you to enter their values.

To find more information about how to use the **Run desktop flow** action, go to [Run desktop flow from other desktop flows](../how-to/run-desktop-flow-action.md).

>[!NOTE]
>
> - A flow's dependencies can't be more than 150 other flows.
> - Two flows can't directly or indirectly call one-another as this causes a recursion.
> - In org tenants, the flows must be under the same environment.

:::image type="content" source="media/runflow/run-desktop-flow-action.png" alt-text="Screenshot of the Run desktop flow action.":::

## <a name="runflow"></a> Run desktop flow

Runs a desktop flow that can receive input variables and might produce output variables. The parent flow run will be paused until the called desktop flow completes.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Desktop flow|No|Desktop flow||Select the desktop flow to run from within this flow. The called flow always runs in the same Windows session as the parent flow.|

### Variables produced

This action produces the output variables of the selected flow.

### <a name="runflow_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Run desktop flow failed|Indicates a problem while running the desktop flow|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
