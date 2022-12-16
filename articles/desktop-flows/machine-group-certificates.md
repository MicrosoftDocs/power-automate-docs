---
title: Machine group certificate renewal
description: Learn how machine group certificate renewal works in Power Automate.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 12/06/2022
ms.author: gachasta
ms.reviewer: gtrantzas
contributors:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Machine group certificate renewal

 > [!NOTE]
 >  This feature is currently under rollout until March 31st 2023.

Machine group certificates secure credentials in desktop flow connections and identify machines with Power Automate. Security best practices require certificates to be renewed regularly. Power Automate automatically performs this renewal which doesn’t affect your runs.

While using Power Automate, you may notice a key icon next to your machine in the Power Automate portal, and the following message: **Machine group security has been updated. Re-generate a machine group password before adding a new machine.**.

These messages indicate that, if you need to [add another machine to the group](manage-machine-groups.md#add-your-machine-to-a-group), you must sign in to one of its existing machines and [regenerate the password](manage-machine-groups.md#change-machine-groups-password). These messages appear after a certificate renewal has started on that machine group.

## Prerequisites

- Machines with Power Automate for desktop version 2.23 or above
- Machines need to be online at least once in the last six months before the certificate expires (once every five years). The mentioned values are the default, but can be changed.

## Recommendation
- During the renewal period of a machine group, use Desktop flow connections targeting this group once. This will prevents the need to fix your Desktop flow connections once the renewal period has ended. To find more information about desktop flow connections, go to [Create desktop flow connections
](desktop-flow-connections.md).

> [!IMPORTANT]
> The certificate renewal duration is long enough for machines and Desktop flow connections to be updated without needing specific user action.

## Information for admins

The first Power Automate [machine](manage-machines.md) that joins a [machine group](manage-machine-groups.md) issues a self-signed certificate used to:

- Encrypt Windows credentials in desktop flow connections.
- Identify machines with Power Automate.

This certificate is protected with a password only known to the customer.

### What happens during the machine group certificate renewal?

:::image type="content" source="media/machine-group-certificates/current-certificate-expiry.png" alt-text=" A timeline diagram for current certificate expiry":::

Machine group certificate renewal starts by default six months before the current certificate is set to expire and finishes when the current certificate has expired.
Machine group certificate renewal won't affect your machine group's ability to run flows as it is quick, happens between runs, and supports machines on both the current and the new certificate during the renewal.
During that time:

- The first machine from the group that connects with Power Automate will issue a new password-protected certificate.

- The next machines from the group that connect with Power Automate will update their certificate with the new one. This step can happen even if other machines (even the first one) are offline.

- Machines with the new certificate can still be successfully targeted by desktop flow connections that encrypt credentials with the current certificate.

- Desktop flow connections that target the machine or machine group will be updated automatically after being used in a cloud flow for a desktop flow run.

### How often does certificate renewal happen?

By default, machine group certificates expire once every five years. The renewal happens during the last six months before the expiry. To see information about how to customize this behavior, go to [How to customize certification expiration and renewal durations?](#how-to-customize-certification-expiration-and-renewal-durations).

### What if machines missed the machine group certificate renewal (offline, outdated Power Automated for desktop, etc.)?

If at least one machine of the group got updated to the latest certificate, other machines that missed the renewal period will be able to rejoin the group. First, regenerate the machine group password on the machine that got updated. Then, on other machines, open the Power Automate machine runtime app, select **re-join**, and enter the new machine group password.

If all the machines of a machine group missed the certificate renewal, you can't use this machine group. You need to delete it, re-create a new machine group, and join the machines. To find information about identifying machines that missed the group certificate renewal, go to [How το know if a machine has been updated with a new certificate or not?](#how-το-know-if-a-machine-has-been-updated-with-a-new-certificate-or-not).

### What if desktop flow connections are unused during the machine group certificate renewal?

If a desktop flow connection is unused during the machine group certificate renewal, you need to fix this connection:

- Go to the Power Automate portal.
- Navigate to **Data** > **Connection**.
- Look for desktop flow connections with the status **Fix connection**, and open them to reenter the necessary information.

### What if some machines are expected to remain offline or unused for multiple months?

You will need to put those machines online and run flows on them during the certificate renewal period.

1. Find machines that need to have Power Automate for desktop updated.

    Your machines must be equipped with Power Automate version 2.23 or above. You can verify the version of your machine using the **Agent Version** column in the **Flow Machine** table in Dataverse.

1. Find the renewal period for each machine.

    You can determine the renewal period for the machines of a given group by querying the **Key Creation Date** and **Group Key Expiry Grace Period** columns ιn the **Flow Machine Group** table in Dataverse. The time frame between the **Creation Data** and the **Creation Date** + **Grace Period** is when each machine of the group has to go online and retrieve the latest group security.

1. Get reminded to put the machines online during the renewal period.

    You can be notified of machine security updates with a cloud flow and the following Dataverse trigger:

    This trigger will be invoked each time the machine security is updated. To find information about which values to use in the trigger, go to [How το know if a machine has been updated with a new certificate or not?](#how-το-know-if-a-machine-has-been-updated-with-a-new-certificate-or-not).

    :::image type="content" source="media/machine-group-certificates/trigger-action.png" alt-text="Screenshot of the When a row is added, modified or deleted trigger.":::

    Use:

    - **PendingNewKey** for machines requiring a security update.
    - **Default** for machines that successfully processed a security update.
    - **KeyExpired** for machines that failed getting a new certificate during the renewal period.

    > [!NOTE]
    > You can use the additional advanced options to fine-tune the behavior of this trigger.

1. Validate that machines have the new certificates.

     You can verify your machines have retrieved the latest version of the machine group certificate using the **Machine Key Delivery Status** column in the **Flow Machine** table in Dataverse. If the value is empty or set to default, then your machine is up-to-date.

1. Run desktop flows with each connection targeting those machines to avoid fixing them later.

    In the Power Automate portal:

    1. Go to **Monitor** > **Machines**.
    1. Select the machine from the list.
    1. On the machine’s detail page, locate the connections card and select **See all connections**.
    1. Run a desktop flow with each of these desktop flow connections.

    :::image type="content" source="media/machine-group-certificates/machine-connections.png" alt-text="Screenshot of the connection of a machine.":::

### How to know when the next certificate renewal is happening?

There are three parameters governing certificate renewal timelines, each available in a column on the **Flow Machine Group** record in Dataverse:

- The **Key Creation Date** column records the date on which the certificate was created.
- The **Key Validity Period** column documents the certificate’s lifetime.
- The **Key Grace Period** column represents the time window where a new certificate is created and machines and connections are migrated to a new key.

You can find out the precise date of the next certificate renewal using the following calculation:
**Key Creation Date + (Key Validity Period – Key Grace Period)**

:::image type="content" source="media/machine-group-certificates/current-certificate-expiry.png" alt-text=" A timeline diagram for current certificate expiry":::

### How το know if a machine has been updated with a new certificate or not?

You can verify your machines have retrieved the latest version of the machine group certificate using the **Machine Key Delivery Status** column in the **Flow Machine** table in Dataverse:

- If the value is empty or set to **Default**, your machine is up-to-date.
- If the value is **Pending New Key**, the machine is within the renewal period and hasn't been updated yet. It will update when getting online or within 24 h if already online.
- If the value is **Key Expired**, the machine has missed the renewal period, and you must manually rejoin the machine to the group.

### How to customize certification expiration and renewal durations?

Power Automate enables you to customize the certificate lifetime and how early the renewal is triggered for any machine group. Upcoming renewals will use those Dataverse columns (updates may take 24 h to be picked up):

|Table |Column | Usage |Boundaries|
|------|-------|-------|----------|
|Flow Machine Group |Group Key Validity Period |Duration in minutes after which the next certificate issued will be expired. |Minimum: Three months (129,600 minutes) </br> Maximum: Five years (2,628,000 minutes). |
|Flow Machine Group |Group Key Expiry Grace Period |Duration in minutes before the machine group certificate’s expiration date where machines will renew their certificates. |Minimum: 45 days (64,800 minutes) </br> Maximum: half of the Group Key Validity Period. |

The current certificate remains valid until its expiry date is reached. Changes to the validity period will only apply to the next certificate.

Some special considerations must be kept in mind when changing the validity period and the grace period:

- If the new **Group Key Validity Period** value is shorter than the current certificate’s lifetime or falls under the defined grace period, a certificate renewal will immediately be scheduled. It will start in the following 24 h, assuming some machines of the group are online. The certificate renewal period will last for the defined grace period.

- If the new **Group Key Validity Period** value is longer than the current one, nothing will happen immediately. The current certificate will be kept active until its rotation. The new certificate will take the new validity period into account.

### How to trigger a certificate renewal?

If you want to accelerate certificate renewal, you can edit the **Group Key Validity Period** to change the length of the renewal period. This value can't be higher than half the group key's **Validity Period** and can't be lower than 45 days.

If you need to invalidate certificates immediately, delete your machine groups in Power Automate and recreate them. You can do so by deleting the corresponding rows in the **Flow Machine group** table.

> [!WARNING]
> Deleting machine groups will require fixing your desktop flow connections targeting these machine groups.

## Corner cases

- **Case:** I can't add my machine to an empty machine group, as the Power Automate machine runtime app says that the password is incorrect.

    **Description:** Machine groups need at least one machine connected to have their certificates renewed. If a machine group is empty during the renewal, its certificate will expire. You can't use these machine groups and you should delete them.

- **Case**: Following a certificate renewal, my machines on Power Automate for desktop version 2.21 or below can't be connected anymore.

    **Description:** These versions are outdated and can't renew their certificate. You must update Power Automate for desktop and rejoin them to their group.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
