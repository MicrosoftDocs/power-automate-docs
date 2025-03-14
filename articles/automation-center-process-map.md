---
title: Boost process-centric observability with process map
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

Building on the robust monitoring and observability features of the Automation Center, we're excited to introduce the **process map (preview)**. This new feature enhances transparency by displaying flow dependencies and offers an intuitive, streamlined, and process-centric experience for monitoring and troubleshooting end-to-end automations. It's optimized to quickly identify root causes, assess the impact of failed or skipped automations, and enable faster recovery, all while providing a comprehensive view of the entire process without the need to navigate through multiple user interfaces.

:::image type="content" source="media/automation-center/process-map.png" alt-text="Screenshot of the process map tab in the automation center." lightbox="media/automation-center/process-map.png":::

## Create or view a process map

To create a process map in Power Automate, follow these steps:

1. Navigate to the Automation center and select the Runs tab.
2. Hover over a top-level flow run in that list that has child runs (although not required as long as this is a run that has no parent run).
3. Select the process map icon next to the name to generate the map.

If this is your first time you select the process map icon, you're prompted to provide a process name and then select 'Create'. Once the process map is generated in the backend, you see the process name next to the flow name you in the run list. Should the process column not be visible, you can add it through the 'show/hide column' link on the top-right corner of the runs list.

> [!NOTE]
> Depending on the volume and complexity of child flow dependencies of your flow, this process could take up to 10 minutes to complete. You can also close the dialog that says 'Analyzing flow dependencies' and return later to view your runs in a process-centric view.

## Rename or delete a process map

## Interact with the process map

> [!NOTE]
> Preview features in the Automation Center, such as the process map (preview), can be turned off via the Power Platform admin center. The toggle to control this can be found under the **Power Automate Automation center** section.

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
