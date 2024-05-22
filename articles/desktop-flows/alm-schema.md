---
title: Application lifecycle management for Power Automate v2 schema
description: Learn how to update a v2 desktop flow and export the solution.
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 02/20/2023
ms.author: dbekirop
ms.reviewer: matp
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Application lifecycle management for Power Automate v2 schema

In the Dataverse data model, desktop flows stored in the v2 schema consist of multiple binaries. This article explains how to update a desktop flow within a solution that resides in an environment with the v2 schema enabled.

## Update a v2 desktop flow and export the solution

> [!NOTE]
> Importing a managed solution into the same environment as the originating unmanaged solution isn't possible.

> [!NOTE]
> New binaries are automatically added to the solution in which the desktop flow is located, we still recommend to use the following procedure before exporting to ensure all binaries are added to the solution.

> [!NOTE]
> You can use the Solution checker to validate that your solution is not missing any dependencies.

1. Go to [Power Automate](https://make.powerautomate.com) and select **Solutions**.

1. Select the solution you want to modify.

1. Select the ellipses next to the flow display name, and then **Advanced** > **Add required objects**.

    :::image type="content" source="media/alm-schema/add-required-objects-option.png" alt-text="Screenshot of the option to add the required objects into the solution.":::

1. In the **Add Required Objects** dialog, select **OK**.

1. Some new **Desktop Flow Binary** items should appear in the solution.

1. Go back to the solution summary and export the solution as a managed solution.

1. Import the solution into the required environment. This environment must have the v2 schema enabled.

## Deal with v1 and v2 schema migration with solutions
When using solution to manage the lifecycle of your desktop flows, please be aware when using solutions import a v2 desktop flows in an environment with v1 and v2 desktop flows.

### Managed solution
> [!NOTE]
> As a best practice, you shouldn't be updating a managed desktop flow directly and instead import a new version of the solution. Updating a managed desktop flow in v2 schema is now blocked.

When you are using managed solution to export desktop flows from your test environment to production environment, if you have a desktop flow that has been updated from v1 to v2 in your target environment and you want to import a new version in v2 from another environment, you will first need to remove the managed solution from the target environment before importing it again.

If you cannot remove the solution because you have other dependencies on this solution, you will need to remove any unmanaged layer on the desktop flow, including related data. To see the related data, in the desktop flow in the solution, click on "Dependencies" and select the "Used by" tab. You will see the list of unmanaged binary associated with this desktop flow and you can delete those.

If the desktop flows on the target environment is still in v1, you can safely import the solution containing the v2 desktop flow.

### Unmanaged solution
> [!NOTE]
> Unmanaged solution should only be used for sharing desktop flow with other makers and shouldn't be use to import into production where managed solution is recommended to have a proper ALM.

If you are using unmanaged solution to share desktop flows, if you have a desktop flow that was updated from v1 to v2 in your target environment and you want to import a new version in v2 from another environment, you will need to first delete the desktop flows from the target environment.

If the desktop flows on the target environment is still in v1, you can safely import the solution containing the v2 desktop flow.
