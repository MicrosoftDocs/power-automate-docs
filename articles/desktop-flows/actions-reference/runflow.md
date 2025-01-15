---
title: Run desktop flow actions reference
description: See how to use the Run desktop flow actions.
author: mattp123
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 01/20/2025
ms.author: pefelesk
ms.reviewer: matp
contributors:
- jpapadimitriou
- Yiannismavridis
- NikosMoutzourakis
search.audienceType: 
  - flowmaker
  - enduser
---

# Run desktop flow action

The **Run desktop flow** action enables you to call other desktop flows while running a specific desktop flow. To use the action, add it to the workspace and select the desktop flow you want to call. If the called flow contains input variables, the action will prompt you to enter their values.

You can also disable the toggle property 'Wait for flow to complete', which is enabled by default. If disabled, the invoked desktop flow runs concurrently with the parent flow. This is useful primarily for certain scenarios, where unexpected popups in the target application could block the parent flow. By running a child flow in parallel, you can monitor and manage these popups, ensuring the parent flow continues smoothly. This improvement provides a workaround given the current concurrency policy, which only allows one flow per machine at a time.

>[!IMPORTANT]
>
> - Only one parallel flow is allowed to run at this time. If a second child flow is set to run in parallel, an error will occur during runtime.
> - If a child flow is set to run in parallel, its output variables are ignored. In this case, the 'Run desktop flow' action's produced variables are not shown in the action modal.
> - Child flows are not allowed to run another child flow in parallel. A parallel flow run is only allowed, if invoked directly from the parent (root) flow. 

To find more information about how to use the **Run desktop flow** action, go to [Run desktop flow from other desktop flows](../how-to/run-desktop-flow-action.md).

>[!NOTE]
>
> - A flow's dependencies can't be more than 150 other flows.
> - Two flows can't directly or indirectly call one-another as this causes a recursion.
> - In org tenants, the flows must be under the same environment.

:::image type="content" source="media/runflow/run-desktop-flow-action-with-parallel-run-toggle.png" alt-text="Screenshot of the Run desktop flow action.":::

## <a name="runflow"></a> Run desktop flow

Runs a desktop flow that can receive input variables and might produce output variables. The parent flow run will be paused until the called desktop flow completes.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Desktop flow|No|Desktop flow||Select the desktop flow to run from within this flow. The called flow always runs in the same Windows session as the parent flow.|
|Wait for flow to complete|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|If enabled, this desktop flow waits for the invoked desktop flow to complete, before resuming its run. The invoked desktop flow's output variables become normally available to the current flow. If disabled, the invoked desktop flow runs concurrently. Its output variables are ignored in this case.|

### Variables produced

This action produces the output variables of the selected flow.

### <a name="runflow_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Run desktop flow failed|Indicates a problem while running the desktop flow|
|Desktop flow timed out|Indicates that the desktop flow timed out before it completed its run|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
