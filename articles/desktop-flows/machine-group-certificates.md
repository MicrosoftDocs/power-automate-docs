---
title: Machine group certificate renewal
description: Learn how machine group certificate renewal works in Power Automate.
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 12/16/2022
ms.author: gachasta
ms.reviewer: matp
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Machine group certificate renewal

 > [!NOTE]
 > This feature is currently under rollout until March 31, 2023.

Machine group certificates secure credentials in desktop flow connections and identify machines with Power Automate. Security best practices require certificates to be renewed regularly. Power Automate automatically performs this renewal that doesn’t affect your runs.

While using Power Automate, you may notice a key icon next to your machine in the Power Automate portal, and the following message: **Machine group security has been updated. Re-generate a machine group password before adding a new machine.**

These messages indicate that if you need to [add another machine to the group](manage-machine-groups.md#add-your-machine-to-a-group), you must sign in to one of its existing machines and [regenerate the password](manage-machine-groups.md#change-machine-groups-password). These messages appear after a certificate renewal has started on that machine group.

## Prerequisites

- Machines with Power Automate for desktop version 2.23 or above.
- Machines need to be online at least once in the last six months before the certificate expires (once every five years). The mentioned values are the default, but can be changed.

## Recommendation

- During the renewal period of a machine group, use Desktop flow connections targeting this group once. This step will prevent the need to fix your Desktop flow connections when the renewal period has ended. For more information about desktop flow connections, go to [Create desktop flow connections
](desktop-flow-connections.md).

> [!IMPORTANT]
> The certificate renewal duration is long enough for machines and Desktop flow connections to be updated without needing specific user action.

## Information for admins

To find information for admins about machine group certificate renewal, go to [Machine group certificate renewal for admins](machine-group-certificates-admins.md).

## Corner cases

- **Case**: I can't add my machine to an empty machine group. The Power Automate machine runtime app says the password is incorrect.

    **Description**: Machine groups need at least one machine connected to have their certificates renewed. If a machine group is empty or inactive during the renewal, its certificate will expire. You can't use these machine groups and you should delete them.

- **Case**: Following a certificate renewal, my machines on Power Automate for desktop version 2.21 or earlier can't be connected anymore.

    **Description**: These versions are outdated and can't renew their certificate. You must update Power Automate for desktop and rejoin them to their group.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
