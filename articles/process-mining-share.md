---
title: Share process mining processes in the process mining capability
description: Learn how to share a process mining process with others so that they can glean insights to make decisions.
author: donums
contributors:
  - donums
  - v-aangie  
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 06/09/2025
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Share process mining processes

When you create a process in the process mining capability, only you can see it; however, there might be instances when you want to share the analytics and insights with others. Share your process mining processes with others in your organization so they can also glean insights to make decisions.

There are a few ways you can share your process.

## Share from process lists page

1. On the process mining homepage, beneath the cards for the processes, select **All processes**.
1. Highlight a process, select the vertical ellipsis (&vellip;), and then select **Share**.

    :::image type="content" source="media/process-mining-share/more-share.png" alt-text="Screenshot of the More commands dropdown menu.":::

## Share from process details page

On the process details page, you can share the process by selecting **Manage** from the **Shared with** card.

## Share from analytics report page

On the analytics report page, you can share the process by selecting **Share** in the command bar.

## Share panel

When you select the share action, a share panel displays. The share panel is where you select users in your Microsoft Entra (which might include external users) and share your process with them. You can search for any user to invite to your process in the **Dataverse** tenant.  

When you share a process with others, the option to send an email invitation is automatically selected for convenience. Viewers are invited to view the process's analytics. There's a link in the email invitation that leads them to the shared process's analytics.

:::image type="content" source="media/process-mining-share/manage-viewer-access.png" alt-text="Screenshot of the Share panel, 'Manage access' screen.":::

## Share action

The share action is available on the **Processes** screen for the following:

- Each process where you're an owner.
- The system administrator in the environment.
- Any security role that has share permissions on the process mining system entities.

The share action is also available on the process details page with the same conditions. For process mining, only the co-owner and viewer roles are available for sharing with others.

## Share a process with a co-owner

Adding a co-owner to the process allows the owner to include other people who can help manage the process. A co-owner can perform the following actions.

- View and edit process details.
- [View the process analytics](process-mining-visualize.md).
- Share the process with other co-owners and viewers.

## Share a process with a viewer

  Adding a viewer to a process shares analytics and insights with other people. A viewer can perform the following actions:

- View the process details.
- [View the process analytics](process-mining-visualize.md).

### Reassign a process to a different owner

When a process owner's account is disabled, the co-owner of the process doesn't automatically become a new process owner.

For example, when an employee is leaving the company, the administrator should assign a new owner for the leaving employee Dataverse records.

The administrator should perform the following steps.

1. Sign in to [Power Platform admin center](https://admin.powerplatform.microsoft.com/environments).
1. Select the environment where the process is located.
1. Go to the **Settings/Users** of the environment.
1. Select the leaving user.
1. On the command bar, select **Reassign records**.
1. Assign all the records to either the administrator or another user.

    Re-assignment requirement: The target user should have the appropriate privileges on the different entities associated with the transferred records. For process mining process, giving the **Environment Maker** role is sufficient.

## Limitations

The following is a list of important sharing limitations.

- If a user is an admin in an environment, they already have access to all the processes. Therefore, if that user is added as a **Co-owner** or a **Viewer**, they won't show up in the list of co-owners or viewers even if they're successfully assigned either of those roles.
- Removing all process roles from a user, such as viewer, doesn't remove that process from the user's process list view. They can't perform any actions on the process.
- Process mining currently doesn't support sharing for Azure Active Directory (AAD) groups.
- Co-owners don't have access to the power query editor and can't modify a dataflow.

