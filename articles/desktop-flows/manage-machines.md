---
title: Manage machines
description: Manage machines
author: mattp123
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 01/14/2025
ms.author: kenseongtan
ms.reviewer: matp
contributors:
- rpapostolis
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage machines

Machines are the physical or virtual devices you use to automate desktop processes. When you connect your machine to Power Automate, you can instantly start your desktop automation using any of the [available triggers](../triggers-introduction.md), such as predefined schedules.

Connecting your machine directly to Power Automate and the cloud allows you to harness the full power of robotic process automation (RPA).

Our direct connectivity is the easiest way to connect your machine to the cloud. Sign in to the latest version of Power Automate for desktop, and your machine will be registered automatically. Once registered, you can immediately [create a connection in your cloud flows](desktop-flow-connections.md).

> [!IMPORTANT]
>
> - Direct connectivity is only available for Power Automate 2.8.73.21119 or later. If you currently use an earlier version, [update to the latest](https://go.microsoft.com/fwlink/?linkid=2102613).
> - Direct connectivity isn't available for machines running Windows 10 Home or Windows 11 Home.
> - To register your machine and use the machine management features, your Power Platform environment must have a version of the **MicrosoftFlowExtensionsCore** solution that is greater than or equal to 1.2.4.1.
> - Before registering a machine to [run desktop flows from cloud flows](trigger-desktop-flows.md), ensure the machine is secured and the machine's admins are trusted.

## Register a new machine

Your machine is automatically registered on the currently selected environment in Power Automate for desktop. If you don't have permission to register machines in that environment or want to use another environment, update the environment manually.

1. [Install the latest version](install.md) of Power Automate on your device. If you already have the latest version, skip this step. During installation, make sure you've checked the **Install the machine-runtime app to connect to the Power Automate cloud portal** option.

    :::image type="content" source="./media/manage-machines/acceptterms.png" alt-text="Screenshot of the option to install the machine-runtime app.":::

1. Launch Power Automate machine runtime.

    :::image type="content" source="./media/manage-machines/runapp.png" alt-text="Screenshot of the machine-runtime app in the Windows search menu.":::

1. Sign in to Power Automate machine runtime. Your machine should be automatically registered in the currently selected environment.

1. If the machine hasn't been registered yet, a message will prompt you to select a machine-running environment. Power Automate will use this environment to run all the triggered desktop flows.

    :::image type="content" source="./media/manage-machines/machine-not-registered.png" alt-text="Screenshot of the Machine isn't registered message.":::

1. When the connection is established successfully, the machine settings will display the following fields regarding the machine:

    - **Machine name**: A unique name to identify the machine.
    - **Machine description**: An optional description of the machine.
    - **Machine environment**: The running environment of the machine.

:::image type="content" source="./media/manage-machines/registered-machine.png" alt-text="Screenshot of the Machine settings.":::

> [!NOTE]
>
> - To successfully register a machine, ensure the services specified in [Desktop flow services required for runtime](../ip-address-configuration.md#services-required-for-desktop-flows-runtime) are accessible.
> - You need an **Environment Maker** or **Desktop Flow Machine Owner** role to register machines. Before registering a machine, ensure you have the required permissions and an available environment to register the new machine.
> - In the case of a virtual machine, don't clone the virtual machine after installing Power Automate machine runtime.
> - Machines aren't affected by changes in the Power Automate for desktop organization.
> - Although you can create and debug desktop flows in Teams environments, you can't register machines in them.
> - If you reset your PC, your machine registration will be lost.

## Update running environment for your machine

Each machine can only run desktop flows from the cloud in one environment at a time. To update the running environment in which a machine can run desktop flows:

1. Launch Power Automate machine runtime and select **Machine settings**.

1. Under **Machine environment**, select an environment in the dropdown list.

> [!NOTE]
> Changing the running environment of a machine removes all its current connections.

## Trigger a desktop flow to run on your machine

Power Automate enables you to trigger desktop flows from cloud flows using events, schedules, and buttons.

1. Edit an existing cloud flow or [create a new cloud flow](../overview-cloud.md).

1. Create a desktop flow connection using the instructions in [Create desktop flow connections](desktop-flow-connections.md).

1. Follow the instructions in [Trigger desktop flows from cloud flows](trigger-desktop-flows.md) to trigger a desktop flow from your cloud flow.

> [!IMPORTANT]
>
> - To apply this functionality, you need a [premium per-user plan with attended RPA](https://make.powerautomate.com/pricing/).
> - When you create a desktop flow connection, you allow Power Automate to create a Windows session on your machine to run your desktop flows. Make sure you trust co-owners of your flows before using your connection in a flow.
> - If you consistently encounter issues when creating a connection on a new machine, first try to remove it, and then [register it](/power-automate/desktop-flows/manage-machines#register-a-new-machine) again.

## Enable your machine for unattended mode

To trigger desktop flows in unattended mode on your machine, you need some unattended bots on the machine. Each unattended bot on a machine can carry one unattended desktop flow run at a time. So if a machine needs to execute multiple unattended runs simultaneously, it needs as many unattended bots as it has simultaneous unattended runs to perform.

To create unattended bots, allocate process capacity or unattended RPA capacity to your machine. Learn how to [allocate process capacity as an unattended bot](capacity-process.md) on a machine.

## Maintenance mode for machines

The maintenance mode enables you to stop all the desktop flow runs on machines or machine groups. This feature is useful when you need to do installations or deployments on machines and avoid run failures.

To use the maintenance mode:

1. Sign in to the [Power Automate portal](https://powerautomate.microsoft.com/).

1. Go to **Monitor** > **Machines**.

1. Select a machine, go to its details page, and select **Settings**.

1. Turn on the toggle for **Enable maintenance mode**.

1. Select **Activate** in the dialog.

All the machines that are in maintenance mode are indicated with a red pictogram in the list of machines.

:::image type="content" source="./media/manage-machines/maintenance-mode.png" alt-text="Screenshot of the red pictogram for the maintenance mode.":::

> [!NOTE]
>
> - If a machine group is in maintenance mode, all the machines of the group are in maintenance mode and you can't change them individually.
> - When machines require some specific actions (such as key rotation), maintenance mode is disabled.
> - If a desktop flow is currently running on your machine when the maintenance mode is enabled, the run doesn't get canceled.
> - When a machine is in maintenance mode, no new run is assigned to it. If the machine is standalone, the desktop flow run is put in the run queue. If the machine is part of a machine group, the desktop flow is assigned to an active machine. Timeout remains the same by default.

## View list of machines

Once you've registered a machine to an environment, you can view its details at any time in the Power Automate portal. You can also view all other machines that you have access to.

1. Sign in to the [Power Automate portal](https://powerautomate.microsoft.com/).

1. Go to **Monitor** > **Machines**.

1. Select the desired machine. For each machine you can view:

    - Machine name.
    - Machine description.
    - Machine version.
    - Group that the machine is a part of, if applicable.
    - Machine status.
    - Number of flows running on the machine.
    - Number of flows queued on the machine, if applicable.
    - Type of access you have to the machine.
    - Machine owner.

> [!NOTE]
> The version of the machine gets updated with the first registration and after each desktop flow run.

## Share a machine

You can share a machine with other users in your organization and give those users specific permissions to access it.

1. Sign in to the [Power Automate portal](https://powerautomate.microsoft.com/).

1. Go to **Monitor** > **Machines**.

1. Select your machine from the list, and then select **Manage access**.

1. Select **Add people**, and enter the name of the person in your organization with whom you’d like to share the machine.

1. Select the name of the person to choose which permissions they can access the machine with.

    There are two levels of permissions that you can assign when managing access to your machine:

    - **Co-owner**. This access level gives full permissions to that machine. Co-owners can run desktop flows on the machine, share it with others, edit its details, and delete it.

    - **User**. This access level only gives permission to run desktop flows on the machine. No edit, share, or delete permissions are possible with this access.

    |Actions|Co-owner|User|
    |---|---|---|
    |Run a desktop flow on the machine|X|X|
    |Share the machine|X||
    |Add machine to group|X||
    |Edit details|X||
    |Delete machine|X||

1. Select **Save**.

  :::image type="content" source="./media/manage-machines/share-machine.png" alt-text="Screenshot of the Manage access dialog.":::

> [!NOTE]
> When a user isn't part of an environment anymore, you'll continue seeing the user as deactivated. You'll be notified in the **Manage access** section of the machine if it's shared with deactivated users. In this situation, remove access to them.

## Receive user session related recommendations (preview)

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

The **Receive user session related recommendations (preview)** setting sends orchestration-based notifications when an **unattended** desktop flow run is queued but can't start due to a locked or disconnected user session of the same user on the machine. When turned on, users receive an [Automation Center recommendation](../automation-center-recommendations.md) titled "Desktop flows not running" that details all affected desktop flow runs, allowing you to take corrective actions within a 10-minute timeout window.

:::image type="content" source="media/manage-machines/user-orchestration-recommendation.png" alt-text="Screenshot of an orchestration-related recommendation in Automation center showing a user session disconnect request." lightbox="media/manage-machines/user-orchestration-recommendation.png":::

### Supported actions

|Action|Details|
|-------|---|
| Disconnect users | Disconnect the users of the selected active runs. |
| Flow details | Opens the flow details page of the desktop flow listed on the the selected run. |
| Run details | Opens the desktop flow run details page of the desktop flow listed on the selected run. |
| Refresh | Refreshes the active run list. |

### Who receives user-session based recommendations

To receive user orchestration recommendations in the Automation Center, you must own the desktop flow connection that created and assigned the desktop flow connection within a cloud flow.

## Delete a machine

Although you can't delete a machine from the Power Automate machine runtime, you can do it from the Power Automate portal:

1. Sign in to the [Power Automate portal](https://powerautomate.microsoft.com/).

1. Go to **Monitor** > **Machines**.

1. From the list, select the machine you want to delete.

1. Select **Delete machine** in the command bar.

## Switch from gateways to direct connectivity

> [!IMPORTANT]
> Gateways for desktop flows are no longer supported. Switch to our machine-management capabilities.

> [!NOTE]
> To determine which desktop flow connections that are still using a gateway:
> 1. Sign in to [Power Automate](https://powerautomate.microsoft.com/).
> 1. Go to **Data** > **Gateways**.
> 1. Select a gateway, go to its details page, and then select the **Connections** tab. Any desktop flow connections listed should be switched to direct connectivity.
> 1. Repeat step 3 for each gateway in the list.

You can easily switch to direct connectivity by changing the desktop flow connection and using one with the **directly to machine** option.

You can edit the connection or create a new one for each desktop flow action in your cloud flow:

1. If you haven't done it yet, [update Power Automate for desktop](install.md) to version 2.8.73.21119 or later.

1. If you’ve already created a desktop flow connection, select the three dots on the top right of the action, and select **+Add new connection** under **My connections**.

1. In the **Connect** field, select **Directly to machine**.

1. Select the name of your machine.

1. Enter the credentials you would use to sign in to your machine.

1. Select **Create**.

You can also change the connections used by a cloud flow in its details page when you select **Run**.

## Update permissions based on security role

By default, all users with an **Environment Maker** role can register their machines in an environment. You can restrict actions on machines and machine groups by modifying the **Flow Machine** and **Flow Machine Group** permissions for a particular security role.

:::image type="content" source="./media/manage-machines/permissions-roles.png" alt-text="Screenshot of the permissions based on security role.":::

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
|Maximum amount of time a desktop flow can be queued |Six hours|
