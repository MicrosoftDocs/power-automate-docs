---
title: Change the owner of cloud flow | Microsoft Docs
description: Learn how to change the owner of a solution-aware cloud flow.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/15/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Change the owner of cloud flow

Owners, co-owners, and admins can change the owner of a solution-aware flow to enable business continuity when the original owner isn't available.

You can change the owner to an individual (not a distribution list) or a service account. Make sure to evaluate if the new owner is properly [licensed](/power-platform/admin/power-automate-licensing/overview).

>[!NOTE]
>You cannot change the owner to a service principal.

Follow these steps to change the owner of a flow.

1. Select **Solutions** in the left navigation bar, and then select the solution that contains the flow you want to change.
1. Select the flow for which you're changing the owner.
1. Select **Edit** on the **Details** section.

   ![Screenshot showing where the edit link is located in the details section](media/change-cloud-flow-owner/04084e3f1600f61f723714a54329c54f.png)

1. In the **Owner** section, remove the current owner.

   ![Screenshot showing the owner section](media/change-cloud-flow-owner/d8a0028209878ca39c8ab6932a138a3d.png)

1. Enter the email address for the new owner.

   ![Screenshot showing where to enter the owner email address](media/change-cloud-flow-owner/eab1c2f164b2df4c5904e02d77f19814.png)

   <!-- ![Graphical user interface, application Description automatically generated](media/change-cloud-flow-owner/cfa6c2d25c708656696867be5841d67d.png) -->

   >[!WARNING]
   >If the flow uses premium features but the new owner doesn’t have a premium license, a warning is shown with the next steps.

   ![Screenshot that shows a warning about incorrect license](media/change-cloud-flow-owner/667f46314ac1b6d6255c0a502589b723.png)

The flow can still be assigned to the new owner. Once assigned, the new owner will have access to the run history, connection references and they can update the flow or reassign to other users.

![Screenshot that shows confirmation for the owner change](media/change-cloud-flow-owner/e5cc876b0834b6d166215a8e8941f169.png)

If the flow is a **scheduled** or **automated** flow, once the owner is changed, the flow runs under the license of the new owner and uses their power platform request limits. This change can take up to 7 days to come into effect. If you need the new owner to take effect immediately, edit the flow and then save it to force the flow use the new owner’s license.

If the flow is a **manual** flow, the flow runs under the license of the user who runs the flow. The plan section shows whose license plan is used by the flow.

![A screenshot that shows the license plan being used](media/change-cloud-flow-owner/bc757289d2a3f7e6da27acf3d527cc90.png)

>[!NOTE]
>This change is limited to solution-aware flows. To change the owner of a non-solution-aware flow, the new owner must export, and then import the flow.

Check out this [video](https://www.youtube.com/watch?v=K7_xWJvEPUc) to learn how to export and import flows.

<!-- ![Graphical user interface, application Description automatically generated](media/change-cloud-flow-owner/b8d02d26e97291e65373eb118158c77e.png) -->
