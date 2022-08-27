---
title: Change the owner of a cloud flow in Power Automate | Microsoft Docs
description: Learn how to change the owner of a solution-aware cloud flow in Power Automate.
services: ''
suite: flow
author: msftman
manager: tapanm
editor: ''
tags: ''
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 08/27/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Change the owner of a cloud flow

An owner, co-owner, or an admin can change the owner of a solution-aware flow to another user to ensure business continuity. After the change of ownership completes, the original owner and the new owner both become co-owners of the flow.

You can change the owner to an individual (not a distribution list) or a user account used as a service account. If the flow uses a service account, ensure it's licensed correctly to avoid [multiplexing](/power-platform/admin/power-automate-licensing/faqs#multiplexing).

Follow these steps to change the owner of a flow.

>[!IMPORTANT]
>To perform this action, the flow must be referenced in a solution.


1. Sign in to [Power Automate](https://flow.microsoft.com).

1. On the left pane, select **Solutions**.

1. Select the solution that contains the flow you want to change.

1. Select the flow for which you're changing the owner.

1. In the **Details** section, select **Edit** 

    >[!div class="mx-imgBorder"]
    >![Screenshot showing where the edit button is located in the details section.](media/change-cloud-flow-owner/04084e3f1600f61f723714a54329c54f.png "Edit button on the Details section")

1. In the **Owner** section, remove the current owner.

    >[!div class="mx-imgBorder"]
    >![Screenshot showing the owner section.](media/change-cloud-flow-owner/d8a0028209878ca39c8ab6932a138a3d.png "Owner section")

1. Enter the email address of the new owner.

    >[!div class="mx-imgBorder"]
    >![Screenshot showing where to enter the owner email address.](media/change-cloud-flow-owner/eab1c2f164b2df4c5904e02d77f19814.png "Owner's email address")

   >[!WARNING]
   >If the flow uses premium features but the new owner doesn’t have a premium license, a warning is shown with the next steps.

    >[!div class="mx-imgBorder"]
    >![Screenshot that shows a warning about incorrect license.](media/change-cloud-flow-owner/667f46314ac1b6d6255c0a502589b723.png "Incorrect license warning")

The flow can still be assigned to the new owner. The flow continues to run for 30 days, allowing time for the new owner to purchase a license. If the new owner doesn't have a premium license after the grace period, Power Automate turns off the flow. They can turn it on anytime after purchasing the license. 

Once assigned, the new owner gets access to the run history and connection references. The new owner can update the flow or reassign it to other users too.

>[!div class="mx-imgBorder"]
>![Screenshot that shows confirmation for the owner change.](media/change-cloud-flow-owner/e5cc876b0834b6d166215a8e8941f169.png "Change owner confirmation message")

If the flow is a **scheduled** or **automated** flow, after the owner changes, the flow runs under the license of the new owner and uses their Power Platform request limits. This change can take up to seven (7) days to become effective. If you need the new owner to take effect immediately, edit the flow, and then save it to force the flow to use the new owner’s license.

If the flow is a **manual** flow, the flow runs under the license of the user who runs the flow. The plan section shows whose license plan the flow uses.

>[!div class="mx-imgBorder"]
>![A screenshot that shows the license plan being used.](media/change-cloud-flow-owner/bc757289d2a3f7e6da27acf3d527cc90.png "Plan section showing the license plan being used")

>[!NOTE]
>This change is limited to solution-aware flows. To change the owner of a non-solution-aware flow, the new owner must export and then import the flow.

### More information

To learn how to export and import non-solution-aware flows, go to this [video](https://www.youtube.com/watch?v=K7_xWJvEPUc).

The owner of a flow left the company. How can we ensure it works without interruptions?[Learn more.](https://docs.microsoft.com/power-platform/admin/power-automate-licensing/faqs#the-owner-of-a-flow-left-the-company-how-can-we-ensure-it-works-without-interruptions)
