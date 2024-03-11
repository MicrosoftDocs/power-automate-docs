---
title: Share process mining processes in the process mining capability
description: Learn how to share a process mining process with others so that they can glean insights to make decisions.
author: donums
contributors:
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/11/2024
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Share process mining processes

When you create a process in the process mining capability, only you can see it. But you might want to share the analytics and insights with others. Share your process mining processes with others in your organization so they can also glean insights to make decisions.

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

When you select the share action, a share panel displays. The share panel is where you select users in your Microsoft Entra (which may include external users) and share your process with them. You can search for any user to invite to your process in the **Dataverse** tenant.  

When you share a process with others, the option to send an email invitation is automatically selected for convenience. Viewers are invited to view the process's analytics. There's a link in the email invitation that leads them to the shared process's analytics.

:::image type="content" source="media/process-mining-share/manage-viewer-access.png" alt-text="Screenshot of the Share panel, 'Manage access' screen.":::

## Share action

The share action is available on the **Processes** screen for the following:

- Each process where you're an owner.

- The system administrator in the environment.

- Any security role that has share permissions on the process mining system entities.

The share action is also available on the process details page with the same conditions. For process mining, only the co-owner and viewer roles are available for sharing with others.

## Share a process with a co-owner

Adding a co-owner to the process allows the owner to include other people who can help manage the process. A co-owner can perform the following actions:

- View and edit process details.

- [View the process analytics](process-mining-visualize.md).

- Share the process with other co-owners and viewers.

## Share a process with a viewer

  Adding a viewer to a process shares analytics and insights with other people. A viewer can perform the following actions:

- View the process details.

- [View the process analytics](process-mining-visualize.md).

> [!IMPORTANT]
>
>- If a user is an admin in an environment, they already have access to all the processes. Therefore, if that user is added as a Co-owner or a Viewer, they won't show up in the list of co-owners or viewers even if they are successfully assigned either of those roles.
>
>- Removing all process roles from a user (such as viewer) doesn't remove that process from the user's process list view. They can't perform any actions on the process.
>- Process mining currently does not support sharing for AAD groups.
>- Co-owners don't have access to the power query editor and can't modify a dataflow.
