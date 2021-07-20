---
title: Share a process advisor process | Microsoft Docs
description: How to share a process in the process advisor feature in Power Automate.
author: nijemcevic 
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.date: 5/25/2021
ms.author: tatn
ms.reviewer: v-aangie
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Share processes

When you create a process in process advisor, only you can see it. But getting input from others is a key to understanding different ways to accomplish the process you've created. Share your processes with others in your organization so they can also manage or contribute to them. There are two primary ways to share a process in process advisor:

- Share a process with a co-owner.
- Share a process with a contributor.

If you're the co-owner or contributor of a process, you'll find it listed on the Processes screen in process advisor.

>[!IMPORTANT]
>You must be the co-owner to add or remove owners and contributors to a process.

## Share action

The share action is available on the Processes screen in process advisor for the following:

- Each process where you're a co-owner.
- The system administrator in the environment.
- Any security role that has Share permissions on process advisor system entities.

The share action is also available on the process detail screen with the same conditions. Sharing isn't needed at the recordings level. Once you share a process with a co-owner, they can manage the recordings associated to the process.

> [!div class="mx-imgBorder"]
> ![!Manage access.](media/manage-access.png "Manage access")

## Share panel

When you select the share action, a share panel is displayed. The share panel is where you select Microsoft Dataverse users and teams in your organization, and share your process with them.

When sharing a process with others, the option to automatically send an email invitation is selected. This email invitation states that you've shared a process with them. As co-owners or contributors, they're asked to help you manage the process or add new recordings, respectively. There's a link in the email invitation that leads them to the shared process.

## Share a process with a contributor

Adding a contributor to a process is the most common way to share a process. Any contributor of a process can perform these actions:

- View the process details.
- Add and label recordings.
- Manage your own recordings that have been added to the process (including labeling and deleting recordings).

## Share a process with a co-owner

Adding a co-owner to a process allows others to help you label and validate the contributors' recordings, manage the process, and visualize the process analytics and dashboard. Any co-owner of a process can perform these actions:

- [View  details](process-advisor-analyze.md).
- [Update properties, such as name and description](process-advisor-processes.md#manage-activity-names).
- [Invite co-owners and contributors](process-advisor-share.md#share-action).
- [Add and label recordings](process-advisor-processes.md).
- [Manage all recordings that have been added to the process (including labeling and deleting others’ recordings)](process-advisor-processes.md).
- [Analyze the process](process-advisor-analyze.md).
- [View the analytics of an analyzed process](process-advisor-analyze.md).
- [Delete the process](process-advisor-security.md).

>[!IMPORTANT]
>Only the owner of the process can analyze it.

[!INCLUDE[footer-include](includes/footer-banner.md)]
