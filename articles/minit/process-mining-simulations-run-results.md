---
title: Run a simulation and generate results
description: Learn how to generate results and modify a process simulation in the Process Mining desktop app.
author: janPidych
contributors:
  - janPidych
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/19/2025
ms.author: janpidych
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Run a simulation and generate results

After you [create a simulation scenario](process-mining-simulations-scenario.md), you can run it and generate results. This article shows you how to run a simulation scenario and get detailed results, including global Key Performance Indicators (KPIs).

## Start the simulation

Run the simulation scenario and generate results.

1. In the **Process simulation** screen, select **Simulate**. If you already ran a simulation for this simulation scenario, the button name is **Re-simulate**.

    The status of the simulation scenario appears at bottom of the scenario’s tile. Examples of status are **Queued for start** and **Completed**. There are other descriptions depending on the simulation scenario.

    When simulation is finished, the simulation tile shows two (2) global KPI results:

    - **Average case cost difference**: Can be zero, when no financial attributes are selected.
    - **Average case duration difference**: This KPI is always calculated.

1. View the simulation results.

## Understand simulation results

In your simulation scenario, select the **Result Details** tab.

The top section shows three global KPIs:

- **Case count difference**: Difference between the number of simulated cases and cases in the original process view.
- **Average case cost difference**: Difference between simulated case cost and original case cost in the original process view.
- **Average case duration difference**: Difference between simulated case duration and the original one in the process view.

The bottom section shows a table in each of the three tabs:

- **Activities**: Comparison between the simulation and the original process view KPIs per activity.
- **Resources**: Comparison between the simulation and the original process view KPIs per resource.
- **KPIs**: Lists the global (process) KPIs.

    :::image type="content" source="media/process-mining-simulations-run-results/result-details.png" alt-text="Screenshot of the 'Result Details' tab with global KPIs and other results.":::

## Modify a simulation scenario

To modify a simulation scenario, select a scenario tile in the **Process simulation** hub. You can modify all simulation settings.

Until you start a new simulation, the **Result Details** tab shows results for the original simulation scenario. A new simulation overrides the results of the previous run. Only the most recent simulation results are always available in one simulation scenario.

 
