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

1. Go to [Power Automate](https://make.powerautomate.com) and select **Solutions**.

1. Select the solution you want to modify.

1. Select the ellipses next to the flow display name, and then **Advanced** > **Add required objects**.

    :::image type="content" source="media/alm-schema/add-required-objects-option.png" alt-text="Screenshot of the option to add the required objects into the solution.":::

1. In the **Add Required Objects** dialog, select **OK**.

1. Some new **Desktop Flow Binary** items should appear in the solution.

1. Go back to the solution summary and export the solution as a managed solution.

1. Import the solution into the required environment. This environment must have the v2 schema enabled.
