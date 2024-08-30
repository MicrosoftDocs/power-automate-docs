---
title: Run a simulation and get results
description: Learn how to get results and modify a process simulation in the Process Mining desktop app.
author: janPidych
contributors:
  - janPidych
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 08/28/2024
ms.author: janpidych
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Run a simulation and get results

After you [create a simulation scenario](process-mining-simulations-scenario.md), you can run a simulation and get results. This article shows you how to run a simulation and get results in the Process Mining desktop app.

## Start simulation

Now that you have a simulation scenario, you can run a simulation. To run a simulation, follow these steps:

1. In the **Process simulation** screen, select **Simulate**.

    When the simulation completes, an estimated duration time for the simulation appears to the left of the **Simulate** button.

1. Select the ellipsis (**…**) in scenario’s tile and select **Start Simulation**.

    The status of the simulation scenario appears below the scenario’s tile. Examples of status are **Queued for start** and **Completed**. There are other descriptions depending on the simulation scenario.

## Get simulation results

In your simulation scenario, select the **Result Details** tab.

The top section shows three global KPIs:

- **Case count difference**: Difference between the number of simulated cases and cases in the original process view.
- **Average case cost difference**: Difference between simulated case cost and original case cost in the original process view. If financial attributes aren't defined, these KPIs are zero.
- **Average case duration difference**: Difference between simulated case duration and the original one in the process view.

The bottom section shows a table in each of the three tabs:

- **Activities**: Comparison between the simulation and the original process view KPIs per activity.
- **Resources**: Comparison between the simulation and the original process view KPIs per resource.
- **KPIs**: Lists the global (process) KPIs.

:::image type="content" source="media/process-mining-simulations-run-results/result-details.png" alt-text="Screenshot of the 'Result Details' tab with global KPIs and other results.":::

## Modify a simulation scenario

To modify a simulation scenario, select a scenario tile in the **Process simulation** hub. You can modify all simulation settings.

Until you start a new simulation, the **Result Details** tab shows results for the original simulation scenario. A new simulation overrides the results of the previous run. Only the most recent simulation results are always available in one simulation scenario.

 