---
title: Export a solution
description: Learn how to export solution-aware flows.
services: ''
suite: flow
documentationcenter: na
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
ms.date: 06/05/2023
ms.author: cgarty
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Export a solution

Follow these steps to move your solution and its dependencies to a new environment.

> [!IMPORTANT]
> Before you export a solution, consider removing environment variable values in the solution.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select **Solutions** from the navigation bar on the left side of Power Automate.

1. Select the unmanaged solution that you want to export.

1. Select **Export** from the menu at the top of the screen.

1. The **Before you export** right pane appears. Choose from the following options.
    - **Publish all changes** - Notice that, when you export an unmanaged solution, only published components are exported. We recommend that you select **Publish** to confirm that all components are in the exported solution.
    - **Check for issues** - Run the solution checker against the solution to detect performance and stability issues.

1. Select **Next**.

1. The **Export this solution** page appears on the right. Enter or select from the following options, and then select **Export**.  
    - **Version number** - Power Automate automatically increments your solution version. You can accept the default version or enter your own.
    - **Export as** - Select the package type, either **Managed** or **Unmanaged**. More information: [Managed and unmanaged solutions](/power-platform/alm/solution-concepts-alm#managed-and-unmanaged-solutions)

    > [!NOTE]
    > The export can take several minutes to complete.

1. After the solution file export succeeds, you'll see a success notification on top of the screen. Select **Download** from the top-right side of this notification to download the solution zip file.

    The downloaded solution zip file is available in the downloads folder for your web browser.

1. Find the flows in the **Workflows** folder in the solution zip file.

    Each exported workflow is represented as a JSON file. Flow definitions were traditionally a compact block of JSON in a single line. In February 2022 the export format was changed to multi-line formatted JSON to make them easier to read and make them friendlier to revision tracking in source control.

## Export a specific solution cloud flow

[Solution cloud flows](/power-automate/overview-solution-flows) are exported and moved between environments in a [solution](/power-apps/maker/data-platform/solutions-overview). The solution should contain all the solution components that the flow uses, such as [connection references](/power-apps/maker/data-platform/create-connection-reference), [environment variables](/en-us/power-apps/maker/data-platform/environmentvariables), and [tables](/power-apps/maker/data-platform/entity-overview). Depending on the desired scenario, the solution could also contain solution components that reference the flow, such as [apps](/power-apps/maker/canvas-apps/add-app-solution) and [bots](/microsoft-copilot-studio/advanced-flow). 

The flow details page contains a *Solutions* card that lists all the solutions that reference a flow. If the flow is only in the default solution (the "all solution components" view), then either [add the flow into an existing solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution), or [create a new solution](/power-automate/overview-solution-flows#create-a-solution).

## Tips

- You can also find your solutions via the **Solutions** card in the flow details page of solution-aware cloud flows. Alternatively, select the solution in which you're interested from the **Solutions** card, select the **Overview** tab, and then use the **Export** button there.

- You can't export managed solutions. More information: [Managed and unmanaged solutions](/power-platform/alm/solution-concepts-alm#managed-and-unmanaged-solutions)

- Once a flow is solution-aware and in Dataverse, you must use the steps in this article to export it. You cannot export a solution-aware cloud flow from the flow details page.

- To implement healthy application lifecycle management (ALM) in your organization, use a source control system to store and collaborate on your solutions, and automate the solution export process. More information: [ALM basics](/power-platform/alm/basics-alm) in the Power Platform ALM guide.

## Related information

- [Create a solution](./overview-solution-flows.md)
- [Create a cloud flow in a solution](./create-flow-solution.md)
- [Import a solution](./import-flow-solution.md)
- [Edit a solution-aware flow](./edit-solution-aware-flow.md)
- [Environment variables overview](/powerapps/maker/data-platform/environmentvariables)

[!INCLUDE[footer-include](includes/footer-banner.md)]
