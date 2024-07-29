---
title: Share/export a desktop flow
description: Share/export a desktop flow
author: mattp123
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 07/29/2024
ms.author: quseleba
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Share/export a desktop flow

To replicate a desktop flow regardless of your account, edit it through the flow designer, and copy the actions within a subflow.

The copied text can be sent directly to others users or saved to a text file for easier sharing. The receiver can paste the text to a flow designer and run it.

> [!NOTE]
> When copying actions, all their parameters, images, and UI elements are copied as well. Only one subflow can be copied at a time. If there are more than one subflows, repeat the procedure for each one individually or save the actions into separate text files.

If you signed in with an organization premium account, you can also choose one of the following methods:

1. Share the desktop flow directly through the Power Automate portal.

    To share a desktop flow with other users in your organization, give them specific permissions to access the flow. Learn more about sharing flows through the Power Automate portal at [Share desktop flows](../manage.md#share-desktop-flows) and [Share desktop flows that contain connector actions](../how-to/share-desktop-flows-that-contain-connector-actions.md).

1. Export a solution that contains the desktop flow.

    To move a desktop flow from one environment to another, host it in a solution. For more information about importing flows into solutions and building solution-aware flows, see [Overview of solution-aware flows](../../overview-solution-flows.md).

    > [!NOTE]
    > If the solution fails to export because of its size, learn how to [Reduce the size of desktop flows in a solution](../how-to/reduce-flow-size.md).
