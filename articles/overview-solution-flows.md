---
title: Overview of solution-aware flows
description: Learn solution concepts and how to implement a healthy ALM practice for flows.
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 01/31/2023
ms.author: cgarty
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Overview of solution-aware flows

When you host your flows in a [solution](/power-platform/alm/solution-concepts-alm), they become portable, making it effortless to move them and all their components from one environment to another. A typical use case is for an independent software vendor (ISV) to develop flows in a sandbox environment, and then move those flows to a test environment. After testing, the ISV would then move the flows to a production environment for clients who purchase these flows. This process is much easier when you create your flows in solutions, and then move the solutions and their contents.

Flows that you create in a solution are known as *solution-aware* flows. You can add multiple flows to a single solution.

> [!TIP]
> The [Application lifecycle management (ALM) with Microsoft Power Platform](/power-platform/alm/) guide provides detailed information about solution concepts and how to implement a healthy ALM practice in your organization.

## Prerequisites

You must have the following components to create solutions, and solution-aware flows.

- [Dataverse](/powerapps/maker/data-platform/data-platform-intro).
- An environment with version 9.1.0.267 or later.

  To check your version, go to [Power Platform admin center](https://admin.powerplatform.microsoft.com/), select **Environments**, and then select the environment in which you are interested. The **Details** tab displays all configuration information for the environment that you selected.

## Create a solution

Follow these steps to create a solution.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. On the menu to the left, select **Solutions**.

   ![Screen shot of the left nav with solutions highlighted](./media/overview-solution-flows/left-nav-solution.png)

1. Select **New solution**.

   ![Select a new solution.](./media/overview-solution-flows/select-new-solution.png "Screen showing select new solution")

1. Provide all required information for your new solution, including the **Display Name**,  **Name**, **Publisher**, and **Version**.

1. Select the **Create** button.

   ![Screenshot displays the new solution screen.](./media/overview-solution-flows/new-solution.png "new solution properties screen")

   Your new solution might appear like this image.

   ![Displays the new solution.](./media/overview-solution-flows/new-solution-created.png "New solution showing on the *Solutions* screen")

Now that you've created your solution, it's time to [add your flows](./create-flow-solution.md) to it.

## Known limitations

There are certain limitations when using flows with solutions. For information about these limitations, see [Known limitations](/powerapps/maker/data-platform/solutions-overview#known-limitations) in the Power Apps docs.
  
## Related information

- [Create a cloud flow in a solution](./create-flow-solution.md)
- [Export a solution](./export-flow-solution.md)
- [Import a solution](./import-flow-solution.md)
- [Edit a solution-aware flow](./edit-solution-aware-flow.md)
- [Remove a solution-aware flow](./remove-solution-aware-flow.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]
