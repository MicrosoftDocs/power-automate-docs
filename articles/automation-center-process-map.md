---
title: Enhanced process-centric observability with process map
description: Enhance your automation's observability  and troubleshooting efficiency story with the Automation Center's new process map
ms.topic: conceptual
ms.date: 03/14/2025
ms.author: appapaio
ms.reviewer: dmartens
contributors:
  - DanaMartens
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
  - maker
---

# Process map (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Building on the robust monitoring and observability features of the Automation Center, we're excited to introduce the **process map (preview)**. This new feature enhances transparency by displaying process-centric flow dependencies and offers an intuitive, streamlined, and process-centric experience for monitoring and troubleshooting end-to-end automations.

:::image type="content" source="media/automation-center/process-map.png" alt-text="Screenshot of the process map tab in the automation center." lightbox="media/automation-center/process-map.png":::

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

> [!NOTE]
> This feature is currently rolling out and may not yet be available in your area. If you'd like to try it out today, you can either use an existing **preview** environment or create a new one as described [here](/power-platform/admin/early-release).

## Working with the process map

The process map is designed to make troubleshooting and monitoring in Power Automate more efficient and transparent. It provides a clear view of the main orchestrating flow and all its child flows that run during a process run. It also understands important structural details about the flows, like conditions, so it can show flows that are part of the process but didn't run because of certain conditional logic or errors. This is particularly helpful for understanding how a problem in one part of the process can affect other parts, and it helps you take the right countermeasures to fix issues.

When you select a flow box on the map, its side panel opens, providing detailed contextual information on run, connection, and design-time aspects. This allows you to efficiently scan through the multi-run history and better understand the root cause and impact of errors without having to navigate through different individual runs on flow details or other pages. The efficiency is especially helpful when troubleshooting flows that are called in a loop by their parent, potentially producing tens or even hundreds of runs per process run.

### Runs vs. Overview view

The **Runs** view offers a comprehensive look at the entire process by displaying both the main flow run and its child runs. This feature allows users to easily track and understand how each part of the process is executed, identify any issues or bottlenecks, and ensure that all steps are completed successfully. It enhances visibility into complex workflows, making them easier to manage and optimize.

The **Overview** view presents the design-time process structure, including all connected children. This view is ideal for quickly understanding the various subprocesses within the process, even if there are no runs yet. In future releases, this view mode will also serve as the home for aggregated process information and other flow-level configurations.

> [!NOTE]
> Preview features in the Automation Center, such as the process map (preview), can be turned off via the Power Platform admin center. The toggle to control this can be found under the **Power Automate Automation center** section.

## Create or view a process map

To create or view a process map in Power Automate, you have two options:

### Option 1: Using the Runs tab

1. Navigate to the Automation center and select the **Runs** tab.
2. Hover over a top-level flow run and select the process map icon next to the name to generate the map.
3. If this is your first time using the process map icon, you're prompted to provide a process name and then select 'Create'.

### Option 2: Using the Process map (preview) tab

1. Navigate to the Automation center and select the **Process map (preview)** tab.
2. On the map, you see a drop-down box in the upper left corner that lists the processes you have access to.
3. Select the three dots (ellipsis) in the drop-down menu and select 'Create a new process map'.

Once the process map is generated in the backend, the process name appears next to the flow name in the run list. If the process column isn't visible, you can add it by using the 'Show/hide columns' link located at the top-right corner of the runs list.

> [!NOTE]
> Depending on the volume and complexity of child flow dependencies of your flow, this process could take up to 10 minutes to complete. You can also close the dialog that says 'Analyzing flow dependencies' and return later to view your runs in a process-centric view.

## Rename or delete a process map

To rename or delete a process in Power Automate, follow these steps:

1. Navigate to the Automation center and select the Process map (preview) tab.
2. Once on the map, you see a drop-down box in the upper left corner that lists the processes you have access to.
3. Select the three dots (ellipsis) next to the process name in the drop-down menu to view the list of processes.
4. From here you can rename or delete your process now.

> [!NOTE]
> Deleting or renaming a process **does not** delete any of the flows or runs associated with the process.

### Process map visualizations

| Icon | Description |
|------|-------------|
|  :::image type="icon" source="media/automation-center/legend-start-end.png":::  | Represents the start end different end states of a process. |
| :::image type="icon" source="media/automation-center/legend-cf.png":::  | Represents a cloud flow.  |
| :::image type="icon" source="media/automation-center/legend-df.png":::   | Represents a desktop flow. |
| :::image type="icon" source="media/automation-center/legend-loop.png":::  | Represents a loop scenario where a parent flow calls a child flow n-times. |
|  :::image type="icon" source="media/automation-center/legend-stack.png":::  | Represents the total number of times this flow was run by various parent flow runs. Each instance of the flow was triggered by a different parent flow run, rather than being repeatedly called within a single parent run loop |
| :::image type="icon" source="media/automation-center/legend-conditional.png":::  | Represents a conditional or optional flow. This means that the flow connected by the dotted line isn't always executed but depends on certain conditions being met. |
|  :::image type="icon" source="media/automation-center/legend-missed.png":::  | Represents a missed or skipped flow based on conditional logic or an upstream error.|
|  :::image type="icon" source="media/automation-center/legend-unattended.png":::  | Represents an unattended desktop flow run.|
|  :::image type="icon" source="media/automation-center/legend-attended.png":::  | Represents an attended desktop flow run. |
|  :::image type="icon" source="media/automation-center/legend-runs.png":::  | Represents the runtime view mode of the process. |
|  :::image type="icon" source="media/automation-center/legend-overview.png":::  | Represents the design-time view of the process. |

## Known issues and limitations

- Child desktop flow runs are currently not shown in the map.
- You must be an Environment maker or have similar permissions for the business process table in your environment to see and create process maps.
- Parallelization, such a **Apply each** with concurrency setting or **RunAfter** customization in cloud flow aren't represented in the process map. Child runs will be presented in the order they were defined in the flow.
- Dynamic Flow selection using a formula instead of the standard picker isn't supported, such children are ignored.
- We won't load more than 100 child runs for a given run (if flow A runs 150 instances of flow B, we load the first 100 and continue the recursion).
- Generating a process map for flows with moderate to large dependencies may take up to 10 minutes to be complete. An 'Analyzing flow dependencies' dialog is shown when you try to view the map until it finished.
- It may take several minutes for a process map to be updated after flows shown in that process map are modified. There's currently no visual indicator that a process map is being updated.
- Process maps may not be kept fully up-to-date when there are more than 50 levels of child flows.
- Runs of co-owned or shared flows aren't supported yet (users won't see runs of flows that are shared with them).
- Users with broader access to run data (such as admins or members of the CoE team) might see Unknown flow as flow names. This name might appear if the corresponding cloud flow isn't explicitly shared with the user or the flow was deleted in the meantime.
- Even though the process map (stored in the business process table in Dataverse) is solution-aware and can be exported and imported into downstream environment, you can't yet create them directly from the solution explorer yet.
