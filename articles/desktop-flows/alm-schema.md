---
title: Application lifecycle management for Power Automate v2 schema
description: Learn how to update a v2 desktop flow and export the solution.
author: mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 05/24/2024
ms.author: dbekirop
ms.reviewer: matp
contributors:
  - DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Application lifecycle management (ALM) for Power Automate v2 schema

In the Dataverse data model, desktop flows stored in the [v2 schema](schema.md) consist of multiple binaries. This article explains how to update a desktop flow within a solution that resides in an environment with the v2 schema enabled.

## Update a v2 desktop flow and export the solution

To update a desktop flow with v2 schema and export the solution, follow these steps:

> [!NOTE]
> - Importing a managed solution into the same environment as the originating unmanaged solution isn't possible.
> - New binaries are automatically added to the solution in which the desktop flow is located, we still recommend to use the following procedure before exporting to ensure all binaries are added to the solution.
> - You can use [solution checker](/power-apps/maker/data-platform/use-powerapps-checker) to validate that your solution is not missing any dependencies.

1. Go to [Power Automate](https://make.powerautomate.com) and select **Solutions**.

1. Select the solution you want to modify.

1. Select the ellipses next to the flow display name, and then **Advanced** > **Add required objects**.

    :::image type="content" source="media/alm-schema/add-required-objects-option.png" alt-text="Screenshot of the option to add the required objects into the solution.":::

1. In the **Add Required Objects** dialog, select **OK**.

1. Some new **Desktop Flow Binary** items should appear in the solution.

1. Go back to the solution summary and export the solution as a managed solution.

1. Import the solution into the required environment. This environment must have the v2 schema enabled.

## Manage v1 and v2 schema migrations with solutions

When using solution to manage the lifecycle of your desktop flows, it's important to note the following considerations for importing v2 desktop flows into an environment that contains both v1 and v2 desktop flows.

### Managed solutions

> [!NOTE]
> As a best practice, you shouldn't update a managed desktop flow directly. Instead, import a new version of the solution. Updating a managed desktop flow in v2 schema is now blocked.

If you meet all of the following criteria, you first need to remove the managed solution from the target environment before importing it again:

- You use a managed solution to export desktop flows from your test environment to production environment.
- You have a desktop flow that was updated from v1 to v2 in your target environment.
- You want to import a new version in v2 from another environment.

If you can't remove the solution because you have other dependencies on this solution, you need to remove any unmanaged layer on the desktop flow, including related data. To see the related data, in the desktop flow in the solution, select **Dependencies** and then select the **Used by** tab. The list of unmanaged binaries associated with this desktop flow are shown and you can delete them.

If the desktop flows on the target environment are still v1, you can safely import the solution containing the v2 desktop flow.

### Unmanaged solutions

> [!NOTE]
> An unmanaged solution should only be used for sharing a desktop flow with other makers and shouldn't be use to import into production. Instead, a managed solution is recommended to have a proper ALM.

If you meet all of the following criteria, you need to first delete the desktop flows from the target environment using an unmanaged solution:

- You use an unmanaged solution to share desktop flows.
- You have a desktop flow that was updated from v1 to v2 in your target environment.
- You want to import a new version in v2 from another environment.

If the desktop flows in the target environment are still v1, you can safely import the solution containing the v2 desktop flow.
