---
title: Share and manage desktop flows | Microsoft Docs
description: Share and manage desktop flows
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/09/2020
ms.author: DeonHe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage desktop flows

After you've created desktop flows, you might need to view, edit, or just check on their status. To do this, go to the **Desktop flows** tab.

## List of desktop flows

1. Sign into Power Automate.
1. Select **My flows** > **Desktop flows**.

   ![View all desktop flows](../media/manage-desktop-flows/view-all.png "View all desktop flows")

From this section, you can create a new desktop flow and then edit or delete your existing desktop flows.

## Details page

For each of your desktop flows, you can see its details by selecting its name from the list of desktop flows. You then see details including:

-   The run history with details of each run.
-   The applications or Websites used in the desktop flow.

Follow these steps to see the details for a desktop flow:

1. Sign into Power Automate.
1. Select **My flows** > **Desktop flows**.
1. Select any of your desktop flows.

   ![View details](../media/manage-desktop-flows/view-details.png "View details")

## Share desktop flows

You can share a desktop flow with other users in your organization, giving those users specific permissions to access your flows.

Follow these steps to share a desktop flow.

1. Sign into [Power Automate](https://powerautomate.com).
1. Select **My flows** from the left side of the screen.
1. Select **Desktop flows**.
1. Select any flow that you own.

   ![Select a flow to share](../media/manage-desktop-flows/select-one.png)

1. Select **Share**.
1. Select the **Add people** field, and then enter the name of the person in your organization with whom you'd like to share the flow.
1. Select **Give access**, and then select either **User** or **Co-owner** as the permission for the person with whom you share the flow.
1. Select the **Share** button.

   ![Graphical user interface, application Description automatically generated](../media/manage-desktop-flows/sharing-ux.png)

These are the two permission levels you can use when you share desktop flows: 

1. **Co-owner**: This access level gives the co-owner full permissions to that desktop flow. They can edit, share, and delete the flow.

1. **User**: Has permission to only use that desktop flow in a cloud flow. No edit, delete or share permissions are possible with this access. Alternatively, those users can create a copy of that desktop flow by using ‘Save as’, and work independently.

Once a desktop flow has been shared, owners and co-owners can change the access of each user by selecting the **Manage access** link on the desktop flow details page.

**Known issues and limitations:**

- Currently, you can only view your own flow runs. In the future, we will have the capability for co-owners to view the runs of all users.

- Currently, you can view the list of co-owned and user flows only on Power Automate portal. Soon, you will be able to view them from Power Automate Desktop.

- The Desktop flow sharing functionality is currently available on recently created environments only.


## More information

- Create [desktop flows](create-flow.md).
- Run [desktop flows](run-desktop-flow.md).
- Create [Windows recorder (V1) flows](create-desktop.md).
- Create [Selenium IDE flows](create-web.md).



[!INCLUDE[footer-include](../includes/footer-banner.md)]