---
title: Manage machine groups
description: Group multiple machines together to help distribute your automation workload and optimize productivity.
author: Mattp123
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 10/02/2025
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: sfi-image-nochange
---

# Manage machine groups

Machine groups allow you to group multiple machines together to help distribute your automation workload and optimize productivity.

You can assign desktop flows to a machine group, and they'll be automatically queued to it when triggered to run. Then, when a machine in the group is available, Power Automate will assign the next available desktop flow to it. To find more information about queues, go to [Monitor desktop flow queues](monitor-desktop-flow-queues.md).

## Create a machine group

You can create machine groups through the Power Automate machine runtime application or the Power Automate portal.

> [!NOTE]
> To launch Power Automate machine runtime, launch Power Automate for desktop and go to **Settings** > **Open machine settings**.

From the Power Automate machine runtime application:

1. Sign in to the **Power Automate machine runtime** application.

1. Select **Machine group** and then select **New machine group**.

1. Enter a name for your machine group, and optionally add a description.

1. Select **Create**.

    :::image type="content" source="./media/manage-machine-groups/new-machine-groups.png" alt-text="Screenshot of the dialog to create a new machine group.":::

From the Power Automate portal:

1. Sign in to the [Power Automate portal](https://powerautomate.microsoft.com/).

1. Go to **Monitor** > **Machines**.

1. Select **New machine** and then select **Group**.

1. Enter a name for your machine group, and optionally add a description.

1. Select **Create**.

## Add your machine to a group

You need at least one machine in a group to run desktop flows. To add a machine to a machine group:

1. Launch Power Automate machine runtime and select **Machine group**.

1. In the displayed list, you can find all the available machine groups. Select the desired group and fill in the required credentials.

    :::image type="content" source="./media/manage-machine-groups/add-machine-group.png" alt-text="Screenshot of the dialog to add a machine to a machine group.":::

1. If it's the first time adding a machine to this group, you need to create a password for your group. This password limits access for users who can add machines to the group. Make sure you keep the password, as you'll be unable to recover it. If you've added a machine before, enter the password for the group.

1. Select **Add machine**.

When you add your machine to a machine group, any connections currently targeting your machine will break. Update these connections to target the machine group.

> [!NOTE]
>
> - To register a machine, you need to have an Organization premium account.
> - In the case of a virtual machine, don't clone the virtual machine after installing the Power Automate machine runtime application.
> - Machines aren't affected by changes in the Power Automate for desktop organization.

## Trigger a desktop flow to run on your machine group

Power Automate enables you to trigger desktop flows from cloud flows using events, schedules, and buttons.

1. Edit an existing cloud flow or [create a new cloud flow](../overview-cloud.md).

1. Create a desktop flow connection using the instructions in [Create desktop flow connections](desktop-flow-connections.md).

1. Follow the instructions in [Trigger desktop flows from cloud flows](trigger-desktop-flows.md) to trigger a desktop flow from your cloud flow.

> [!IMPORTANT]
>
>- If you use local Windows accounts, all machines in the group must have the same local account with the same password. Use these credentials when you create the desktop flows connection.
>- If you use Active Directory or Microsoft Entra joined machines, confirm that the user account in the desktop flow connection can access all the machines in the cluster.

## Maintenance mode for machine groups

The maintenance mode allows you to stop all the desktop flow runs on machines or machine groups. This feature can be useful when you need to do installations or deployments on machines and avoid run failures.

To use the maintenance mode:

1. Sign in to the [Power Automate portal](https://powerautomate.microsoft.com/).

1. Go to **Monitor** > **Machines**.

1. Select a machine group, go to its details page, and select **Settings**.

1. Turn on the toggle for **Enable maintenance mode**.

1. Select **Activate** in the dialog box.

> [!NOTE]
>
> - If a machine group is in maintenance mode, all the machines of the group are in maintenance mode and you can't change them individually.
> - If a desktop flow is currently running on your machine when the maintenance mode is enabled, the run doesn't get canceled.
> - When a machine group is in maintenance mode, the desktop flow run is put in the run queue. Timeout remains the same by default.
> - When a machine group is back to active mode, all the machines of the group are activated again (except if there is an action required on the machine).

## View list of machine groups

Once you've created a machine group in an environment, you can view its details at any time in the Power Automate portal. You can also view all other machines groups that you have access to.

1. Sign in to the [Power Automate portal](https://powerautomate.microsoft.com/).

1. Go to **Monitor** > **Machines**.

1. Select **Machine groups**.

1. Select the desired machine group. For each machine group you can view:

   - The name of the machine group.
   - The description of the machine group.
   - The number of the machines in the group.
   - The number of flows running in the machine group.
   - The number of flows queued in the machine group.
   - The type of access you have to the machine group.
   - The owner of the machine group.

## Share a machine group

You can share a machine group with other users in your organization and give those users specific permissions to access it.

1. Sign in to the [Power Automate portal](https://powerautomate.microsoft.com/).

1. Go to **Monitor** > **Machines**.

1. Select **Machine groups** and then select the desired machine group from the list.

1. Select **Manage access**.

1. Select **Add people** and enter the name of the person in your organization with whom you’d like to share the machine group.

1. Select the name of the person to choose which permissions they can access the machine group with.

    There are two levels of permissions that you can use when managing access to your machine groups:

    - **Co-owner**. This access level gives full permissions to the machine group. Co-owners can run desktop flows on the machine group, share it with others, edit its details, and add or delete machines.

    - **User**. This access level only gives permission to run desktop flows on the machine group. No edit, share, or delete permissions are possible with this access.

    |Actions|Co-owner|User|
    |---|---|---|
    |Run a desktop flow on the group|X|X|
    |Share the machine group|X||
    |Add machines to group|X||
    |Remove machines from group|X||
    |Edit details|X||
    |Delete machine group|X||

1. Select **Save**.

:::image type="content" source="./media/manage-machine-groups/share-machine-group.png" alt-text="Screenshot of the Manage access pane.":::

> [!NOTE]
> When a user isn't part of an environment anymore, you can continue to see the user as deactivated. You'll be notified in the **Manage access** section of the machine group if it's shared with deactivated users. In this situation, remove access to them.

Access for machine groups is managed at the group level. All machines in the group will use the same permissions and connections.

If the permissions of a machine and its group fall out of sync, certain actions for that machine might no longer be available, and your machine and machine group might not behave as expected. For example, this issue might appear if you modify the permissions of the group directly in Microsoft Dataverse. Ensure the permissions between the machine and machine group are consistent to avoid any such issues.

## Change the machine group of a machine

To change the machine group that contains your machine, select another group in the list of the available machine groups and fill in the required credentials. If you want to remove the machine from a group without adding it to a new one, select **Remove from group**.

:::image type="content" source="./media/manage-machine-groups/change-machines.png" alt-text="Screenshot of the Leave group option.":::

## Change machine group's password

To change the password of the currently used machine group:

1. Select the dots on the machine group card and then select **Edit group password**.

1. Select **Re-generate password**, copy the automatically generated password, and save the changes.

:::image type="content" source="./media/manage-machine-groups/machine-group-new-password.png" alt-text="Screenshot of the fields for the new machine group password.":::

### Machine group password compatibility limitations with Windows Server 2016

When you generate a machine group password, the group's keys are encrypted into a PFX file using the AES256 algorithm.

Windows Server 2016 doesn't support exporting or importing PFX files protected with AES256. Instead, it uses 3DES, a deprecated encryption algorithm. Windows Server 2016 machines can't join a group if a more recent version of Windows generates the group password.

To let Windows Server 2016 join a group of machines with at least one machine running a later version of Windows, export the group keys in a format that Windows Server 2016 understands by generating the password in legacy mode.

> [!IMPORTANT]
> 3DES is a deprecated encryption algorithm. Using the machine group feature with Windows Server 2016 weakens your group's security and isn't recommended.

1. Connect to a machine that is already a member of the group.
1. Go to the `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Global` registry key.
1. Create a DWORD value named `UseLegacyPasswordProtectionForGroupKey` and set it to 1.
1. Regenerate the group password using the Power Automate machine runtime application.
1. Join the Windows Server 2016 machine to the group using the newly generated password.
1. Recommended: Delete the registry value created earlier and regenerate the group password from a non-Windows Server 2016 machine to ensure the keys are protected with AES256 after joining Windows Server 2016 machines to the group.

## Update permissions based on security role

By default, all users with an **Environment Maker** role can register their machines in an environment. You can restrict actions on machines and machine groups by modifying the **Flow Machine** and **Flow Machine Group** permissions for a particular security role.

:::image type="content" source="./media/manage-machine-groups/permissions-roles.png" alt-text="Screenshot of the permissions based on security role.":::

Environment admins can also restrict machine registration to a specific set of users using the three security roles that come with machine management.

|Actions|Desktop Flows Machine Owner|Desktop Flows Machine User|Desktop Flows Machine User Can Share|
|---|---|---|---|
|Register a machine|X|||
|Run a desktop flow|X|X|X|
|Share a machine|X||X|
|Share a machine group|X||X|
|Add machine to group|X|||
|Edit machine details|X|||
|Edit machine group details|X|||
|Delete machine|X|||
|Delete machine group|X|||

## Machine and machine group limitations

|Name|Limit|
|---|---|
|Maximum number of machines in a group |50|
|Maximum amount of time a desktop flow can run |24 hours|
|Maximum amount of time a desktop flow can be queued |12 hours|
|Maximum number of desktop flows in the queue |500|

## Other known limitations

- Machine groups aren't available in the Government Community Cloud (GCC), Government Community Cloud - High (GCC High), Department of Defense (DoD), or China regions. You can still run desktop flows using machine-management capabilities. Learn more about [switching from gateways to direct connectivity](manage-machines.md#switch-from-gateways-to-direct-connectivity).
- When you trigger multiple desktop flows in parallel on a machine group, machine selection might take up to 50 seconds before assigning the desktop flow to an available machine. In these rare cases, desktop flow runs might seem to be running sequentially, if they have short run durations.
