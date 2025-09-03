---
title: Run desktop flow actions reference
description: See how to use the Run desktop flow actions.
author: kewaiss
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 09/03/2025
ms.author: nimoutzo
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

You can disable the toggle property 'Wait for flow to complete', which is enabled by default. If disabled, the invoked desktop flow runs concurrently with the parent flow. This configuration is useful for scenarios where unexpected popups in the target application block the parent flow. By running a child flow in parallel, you can monitor and manage these popups, ensuring the parent flow continues smoothly. This improvement provides a workaround given the current concurrency policy, which allows only one flow to run per machine at a time.

>[!IMPORTANT]
>
> - Up to six parallel flows in total can run at this time concurrently with the root flow, shifting the previous limit of just one parallel flow.
> - Child flows can also run other child flows in parallel (no error is thrown in such cases anymore), consuming from the available pool of six parallel flows. Parallel flow runs are no longer limited to being invoked directly from the parent (root) flow, as was previously the case.
> - If a child flow runs in parallel, its output variables are ignored. The variables produced from the 'Run desktop flow' action aren't shown in the action modal.
> - When a parent flow completes its run, it also stops (cancels) its invoked parallel child flows that may still run.

To find more information about how to use the **Run desktop flow** action, go to [Run desktop flow from other desktop flows](../how-to/run-desktop-flow-action.md).

>[!NOTE]
>
> - A flow's dependencies can't be more than 150 other flows.
> - Two flows can't directly or indirectly call one-another as this causes a recursion.
> - In organization tenants, the flows must be under the same environment.

:::image type="content" source="media/runflow/run-desktop-flow-action-with-parallel-run-toggle.png" alt-text="Screenshot of the Run desktop flow action.":::

## Known limitations

The output variables of a 'Run desktop flow' action don't keep their type during authoring and appear as 'General values' in the variables pane. Their proper variable type is resolved during runtime. As a result, output variables of instance type aren't automatically loaded in the lists of the corresponding actions' instance parameters, so you need to type or paste them into the parameters.

## <a name="runflow"></a> Run desktop flow

Runs a desktop flow that can receive input variables and might produce output variables. The parent flow run will be paused until the called desktop flow completes.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Desktop flow|No|Desktop flow||Select the desktop flow to run from within this flow. The called flow always runs in the same Windows session as the parent flow.|
|Wait for flow to complete|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|If enabled, this desktop flow waits for the invoked desktop flow to complete before resuming. The invoked desktop flow's output variables are available to the current flow. If disabled, the invoked desktop flow runs concurrently, and its output variables are ignored.|

### Variables produced

This action produces the output variables of the selected flow.

### <a name="runflow_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Run desktop flow failed|Indicates a problem while running the desktop flow|
|Desktop flow timed out|Indicates that the desktop flow timed out before completing its run|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
