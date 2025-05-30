---
title: Improve automation monitoring with process map
description: Enhance your automation's observability and troubleshooting efficiency story with the Automation Center's new process map
ms.topic: how-to
ms.date: 05/12/2025
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
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-title
  - ai-seo-date:03/15/2025
---

# Improve automation monitoring with process map

Building on the robust monitoring and observability features of the Automation Center, we're excited to introduce the process map. This feature enhances transparency by showing process-centric flow dependencies and offers an intuitive, streamlined experience for monitoring and troubleshooting end-to-end automations.

:::image type="content" source="media/automation-center/process-map.png" alt-text="Screenshot of the process map tab in the automation center." lightbox="media/automation-center/process-map.png":::

## Navigate the process map

The process map makes troubleshooting and monitoring in Power Automate more efficient and transparent. It shows the main orchestrating flow and all its child flows invoked during a process run. When a process map is created, it considers structural details like conditions, so it can show flows that are part of the process but didn't run because of certain conditional logic or errors. This helps you understand how a problem in one part of the process can affect other parts and take the right countermeasures to fix issues.

When you select a flow box on the map, its side panel opens, providing detailed contextual information on run, connection, and design-time properties. This panel lets you efficiently scan through the run history and better understand the root cause and impact of errors without navigating to each run from the flow details page or the Automation Center. This efficiency is especially helpful when troubleshooting flows called in a loop by their parent, potentially producing tens or even hundreds of runs per process run.

> [!IMPORTANT]
> Process map is considered a premium capability. Any flows that are part of a process map are considered premium flows and require an appropriate license. Learn more in [Power Automate licensing](/power-platform/admin/power-automate-licensing/types?tabs=power-automate-premium%2Cpower-automate-process%2Cconnector-types).

### Runs vs overview

The **Runs** view provides a comprehensive look at the entire process by displaying both the main flow run and its child runs. This feature helps you track and understand how each part of the process is executed, identify issues or bottlenecks, and ensure that all steps are completed successfully. It enhances visibility into complex workflows, making them easier to manage and optimize.

The **Overview** view presents the design-time process structure, including all connected children. This view is ideal for quickly understanding the various subprocesses within the process, even if there are no runs yet.

## Create or view a process map

To create or view a process map in Power Automate, you have two options:

### Option 1: Use the runs tab

1. Go to the Automation center and select the **Runs** tab.
2. Hover over a top-level flow run and select the process map icon next to the name to generate the map.
3. If this is your first time using the process map icon, you're prompted to provide a process name and then select **Create**.

### Option 2: Use the process map tab

1. Go to the Automation center and select the **Process map** tab.
2. On the map, you see a drop-down box in the upper left corner that lists the processes you have access to.
3. Select the three dots (ellipsis) in the drop-down menu and select **Create a new process map**.

Once the process map is generated in the backend, the process name appears next to the flow name in the run list. If the process column isn't visible, you can add it by using the **Show/hide columns** link located at the top-right corner of the runs list.

> [!NOTE]
> Depending on the volume and complexity of child flow dependencies of your flow, this process could take up to 10 minutes to complete. You can also close the dialog that says 'Analyzing flow dependencies' and return later to view your runs in a process-centric view.

### Rename or delete a process map

To rename or delete a process in Power Automate, follow these steps:

1. Go to the Automation center and select the **Process map** tab.
1. Once on the map, you see a drop-down box in the upper left corner that lists the processes you have access to.
1. To view the list of processes, select the three dots (ellipsis) next to the process name in the drop-down menu.
1. From here, you can rename or delete your process.

> [!NOTE]
> Deleting or renaming a process doesn't delete any of the flows or runs associated with the process.

### Process map visualizations

| Icon | Description |
|------|-------------|
|  :::image type="icon" source="media/automation-center/legend-start-end.png":::  | Represents the start and different end states of a process |
| :::image type="icon" source="media/automation-center/legend-cf.png":::  | Represents a cloud flow  |
| :::image type="icon" source="media/automation-center/legend-df.png":::   | Represents a desktop flow |
| :::image type="icon" source="media/automation-center/legend-loop.png":::  | Represents a loop scenario where a parent flow calls a child flow n-times |
|  :::image type="icon" source="media/automation-center/legend-stack.png":::  | Represents the total number of times various parent flows ran this flow. Each flow instance is triggered by a different parent flow run, instead of being repeatedly called within a single parent run loop |
| :::image type="icon" source="media/automation-center/legend-conditional.png":::  | Represents a conditional or optional flow. This means that the flow connected by the dotted line isn't always executed but depends on certain conditions being met |
|  :::image type="icon" source="media/automation-center/legend-missed.png":::  | Represents a missed or skipped flow based on conditional logic or an upstream error|

## Known issues and limitations

- Creating and viewing process maps requires users to have the Environment Maker or similar roles with sufficient privileges on the business process table.  
- Runs for co-owned or shared flows aren't supported yet, which means users don't see runs for flows shared with them.  
- Users with broader access (like admins or CoE teams) might see 'Unknown flow' as the flow name. This happens if the flow isn't explicitly shared with them or it's deleted.  
- Process maps for top-level desktop-flows aren't supported yet.
- Parallelization features (for example, cloud flow 'Apply each' with concurrency or 'RunAfter' customizations) aren't visually represented. Such child runs appear in the order they were defined.  
- Dynamic flow selection using a formula (instead of the standard picker) isn't supported. Such child flows are ignored.  
- For any given run, only the first 100 child flows are loaded. For example, if flow A triggers 150 instances of flow B, only the first 100 are processed.  
- Process map definitions might not remain fully current if more than 50 levels of child flows exist.  
- Runs that were created with a previous structure of the process map don't show flow runs of flows that aren't part of the current map anymore.  
- Generating a process map with moderate to large dependencies can take up to 10 minutes. During this time, an 'Analyzing flow dependencies' dialog is shown.  
- Updates to a process map after its dependent flow structures are modified might take several minutes, and there’s currently no visual indicator to show the map is updating.  
- Although process maps are solution-aware and can be exported or imported to downstream environments, they can't currently be created directly from within the solution explorer.
