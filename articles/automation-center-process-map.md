---
title: Improve automation monitoring with process map
description: Enhance your automation's observability and troubleshooting efficiency story with the Automation Center's new process map
ms.topic: how-to
ms.date: 08/24/2025
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

## Runs view

The **Runs view** displays the process map for a specific flow run. It highlights the exact path taken during that run and shows the status of each step, helping you analyze what happened in detail.

## Overview view

The **Overview view** presents the overall process map, aggregating all possible paths, and steps for the flow. This view is useful for understanding the full scope of the process, regardless of individual run status.

## Insights (preview) view

Insights (preview) gives you a process‑level view of reliability and performance key metrics, visualizing error clusters, trends, and enabling a one‑click integration with Process Mining to deep dive into advanced insights such as variant (route), bottleneck, and deeper route analysis, all integrated within the process map experience. It helps you spot trends and issues faster, prioritize fixes, and share a consistent view across makers, operators and CoE teams.

[!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

The following sections list the prerequisites for viewing and using process-centric insights in the process map. If you only need basic insights, review the first prerequisites section. For using advanced insights, make sure you also meet the requirements in the advanced insights section.

### Prerequisites

- Power Automate Premium license with access to an environment.
- A process map has been created for the top‑level cloud flow.
- The environment stores run history in Dataverse (Automation Center).
- You have permission to view runs for the flows included in the process (for shared/admin scenarios some flow names may appear masked).

#### Advanced insights prerequisites (using process mining)

- Process Mining capacity of at least 50MB is available in the environment.
- You have the required permissions to manually create new Process Mining processes in the environment.

> [!NOTE]
> Advanced insights use Power Automate’s [Process Mining](/power-automate/process-mining) capabilities and consume from your available Process Mining capacity in the tenant. Make sure sufficient capacity is available before enabling advanced insights across the organization.

### View Insights (preview)

Open insights by selecting the Insights (preview) toggle on the process map. Insights are organized into two tiers:

1. **Basic insights**(enabled by default) – built‑in reliability and performance views computed from run history.
2. **Advanced process insights** (opt-in) – one‑click integration with [Process Mining](/power-automate/process-mining) for deeper route/variant, bottleneck, and correlation analysis.

#### Basic insights

Basic insights have a single Overview tab scoped to the selected time range.

| Metric | Description |
|--------|-------------|
| Runs | Total number of process runs in range |
| Failed runs | Number of runs that ended in failure |
| Failure rate | Percentage of runs that failed |
| Average run duration | Mean end‑to‑end duration per run |
| Mean time between failures (MTBF) | Average time between failed runs within the selected time range. |

##### Panels

| Panel | What it shows |
|-------|--------------|
| Flow runs error trend | Error rate overlaid with run volume across time to reveal spikes and patterns |
| Top flow error codes | Most frequent error codes with counts to accelerate root‑cause analysis |

### Advanced process insights (Process Mining)

Enable advanced insights to unlock enterprise‑grade analytics powered by Process Mining without the need for manual exports or lengthy data preparations. To enable advanced insights, select the Insights (preview) button on top and in the side-panel select Enable advanced insights. What you get with advanced insights:

| Metric | Description |
|--------|-------------|
| Runs | Total number of process runs in range |
| Routes | Distinct process routes (variants) observed in range |
| Avg run time | Average end‑to‑end duration per run |
| Errors | Number of runs that ended in error |
| Error rate | Percentage of runs that ended in error |

#### Advanced panels

| Panel | What it shows |
|-------|----------------|
| Process runs error trend | Error rate overlaid with run volume across time to reveal spikes and patterns |
| Top flows by error volume | Flows ranked by number of error outcomes; use View all to expand the list |
| Top error details | Clusters failures by error code/reason with percent of impacted runs and counts. Expand an error to see details such as most impacted route that will show on the process map and also see error first/last seen timestamps |

> [!NOTE]
>
> - In high‑volume environments, preparing insights for large run sets can take longer. Also make sure you have enough Process mining capacity assigned in the environment.
> - To disable Insights (preview) for an environment, turn off **Enable production-ready preview features** for Power Automate Automation center in the [Power Platform admin center](https://aka.ms/ppac). Please note that this setting disables all other Automation Center preview features as well.

### Troubleshooting

| Issue | Resolution |
|-------|------------|
| I just clicked on insights view or enabled advanced insights but don't see and metrics data | Make sure you've set the right date filter for your scenario. Also, if your flow runs are less than 48 hours old, they aren’t considered for the analysis yet. Metrics and data will appear only after the runs are older than 48 hours. |
| Can’t enable advanced insights | You likely lack Process Mining permissions or capacity. Ask your admin to grant access and ensure capacity is available in the environment |
| Problems with advanced analytics panel | If you **accidentally** changed the process mining process within the Process Mining suite that now causes issues in the process map’s advanced analytics panel, you could delete the project in Process Mining and re-enable advanced insights. Do this **only if the changes weren’t intentional**, as deleting the project **removes all modifications you've done**. |

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
- Runs for coowned or shared flows aren't supported yet, which means users don't see runs for flows shared with them.  
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
