---
title: Application lifecycle management for Power Automate v2 schema
description: Learn about the Power Automate v2 schema.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 02/20/2023
ms.author: dbekirop
ms.reviewer: gtrantzas
contributors:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Application lifecycle management for Power Automate v2 schema

In the Dataverse data model, desktop flows stored in the v2 schema consist of multiple binaries. To update a desktop flow within a solution that resides in an environment with the v2 schema enabled:

## Manage v2 desktop flows in solutions

Importing a managed solution into the same environment as the originating unmanaged solution isn't possible.

### Update a v2 desktop flow and export the solution

1. Go to [Power Automate](make.powerautomate.com) and select **Solutions**.

1. Select the solution you want to modify.

1. Select the ellipses next to the flow display name, and then **Advanced** > **Add required objects**.

    :::image type="content" source="media/alm-schema/add-required-objects-option.png" alt-text="Screenshot of the option to add the required objects into the solution.":::

1. In the **Add Required Objects** dialog, select **OK**.

1. Some new **Desktop Flow Binary** items should appear in the solution.

1. Go back to the solution summary and export the solution as a managed solution.

1. Import the solution into the required environment that must have the v2 schema enabled.
