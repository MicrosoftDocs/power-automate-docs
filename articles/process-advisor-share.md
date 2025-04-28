---
title: Share task mining processes
description: Share a task mining process with others so that they can offer input and additional insights. You can share a process with a co-owner or a contributor.
author: donums
contributors:
  - donums
  - v-aangie 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Share task mining processes

When you create a process in the process mining capability, only you can see it. But getting input from others is a key to understanding different ways to accomplish the process you've created. Share your processes with others in your organization so they can also manage or contribute to them.

Here's a short video on how to share a process.<br>
</br>
> [!VIDEO https://learn-video.azurefd.net/vod/player?id=0998b545-3c11-417b-b46b-f4c67139b230]

There are two primary ways to share a process:

- Share a process with a co-owner.

- Share a process with a contributor.

If you're the co-owner or contributor of a process, you'll find it listed on the **Processes** screen.
</br>
> [!IMPORTANT]
> You must be the owner or co-owner to add or remove owners and contributors to a process.

## Share action

The share action can be done by selecting **Share** on the **Processes** screen. Alternatively, select **Manage** on the **Details** screen for the following:

- Each process where you're an owner or co-owner.

- The system administrator in the environment.

- Any security role that has share permissions on system entities of the process mining capability.

## Share panel

After selecting the share action, a share panel appear. This is where you can select Microsoft Dataverse users within your organization to share your process with. You can search for any user within the Dataverse tenant and invite them to your process.

When sharing a process with others, an option to automatically send an email invitation is available. Co-owners or contributors will be asked to help manage the process or add new recordings, respectively. The email invitation will contain a link to the shared process.

:::image type="content" source="media/manage-access.png" alt-text="Screenshot of the 'Manage access' screen.":::

## Share a process with a contributor

The most common way to share a process is by adding a contributor. A contributor of a process has the following abilities:

- View the details of the process.
- Add and label recordings.
- Manage their own recordings that have been added to the process, including labeling and deleting recordings.

## Share a process with a co-owner

When you add a co-owner to a process, you enable them to assist you in labeling and validating contributors' recordings, managing the process, and visualizing the process analytics and dashboard. Here are the actions that any co-owner of a process can perform:

- [View your process map and related analytics](process-advisor-analyze.md#view-your-process-map-and-related-analytics)

- [Update properties, such as name and description](process-advisor-processes.md#create-recommended-activity-names)

- [Invite co-owners and contributors](process-advisor-share.md#share-action)

- [Add and label recordings](process-advisor-processes.md)

- [Manage all recordings that have been added to the process (including labeling and deleting others' recordings)](process-advisor-processes.md)

- [View the analytics of an analyzed process](process-advisor-analyze.md)

- [Delete the process](process-advisor-security.md)

> [!IMPORTANT]
>
>- Only the owners of a process can analyze it.
>- Removing all process roles from a user (such as co-owner and contributor) doesn't remove that process from the user's process list view. They can't perform any actions on the process.
>- The admin experience for processes they don't own isn't supported.

[!INCLUDE[footer-include](includes/footer-banner.md)]
