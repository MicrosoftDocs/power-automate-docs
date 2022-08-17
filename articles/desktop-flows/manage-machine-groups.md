---
title: Manage machine groups | Microsoft Docs
description: Manage machine groups
author: georgiostrantzas

ms.subservice: desktop-flow
ms.topic: article
ms.date: 10/18/2021
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage machine groups

Machine groups allow you to organize multiple machines together to help distribute your automation workload and optimize productivity. Desktop flows can be assigned to a given machine group and then will be queued to it when triggered to run. When a machine in the group is available, it will be assigned the next desktop flow to be executed in the queue. Learn more about [the desktop flow queues](monitor-desktop-flow-queues.md).

## Create a machine group 

Machine groups can either be created from the Power Automate machine runtime application or the Power Automate portal. 

From the Power Automate machine runtime application: 

> [!NOTE]
> To install the Power Automate machine runtime application, launch Power Automate for desktop and naviagte to **Settings** > **Open machine settings**.

1. Sign in to the **Power Automate machine runtime** application.

1. Select **Machine group**.

1. Select **New machine group** 

1. Enter a name for your machine group, and optionally add a description.

1. Select **Create** 

 ![Screenshot of the dialog to create a new machine group.](./media/manage-machine-groups/new-machine-groups.png)

From the Power Automate portal:

1. Sign in to the Power Automate portal.

1. Select **Monitor**, then **Machines**.

1. Select **New machine**, then **Group**.

1. Enter a name for your machine group, and optionally add a description.

1. Select **Create**.

## Add your machine to a group 

You need at least one machine in a group to run desktop flows. 

1. In the Power Automate machine runtime application, select **Machine group**
1. In the displayed list, you can find all the available machine groups. To add your machine to a machine group, select the desired group and fill in the required credentials.

    ![Screenshot of the dialog to add a machine to a machine group.](./media/manage-machine-groups/add-machine-group.png)

1. If it's the first time adding a machine to your group, you need to create a password for your group. This password is used to limit access for users who can add machines to the group. Make sure you don't lose the password, as you'll be unable to recover it. If you've already added a machine before, enter the password for the group.

1. Select **Add machine**.

When you add your machine to a group, any connections currently targeting your machine will break. You need to update those connections to target the machine group.

>[!NOTE]
> - In the case of a virtual machine, make sure not to clone the virtual machine after installing the Power Automate machine runtime application.
> - Machines aren't affected by changes in the Power Automate for desktop organization.

>[!IMPORTANT]
>In order to register your machine, you need to have an Organization premium account.

## Trigger a desktop flow to run on your machine group 

1. Edit your cloud flow or [create a new cloud flow](../overview-cloud.md). 

1. Select **+New step**. 

1. Deploy the **Run a flow built with Power Automate for desktop** action. 

1. If you’ve already created a connection with desktop flows, select the three dots on the top right of the action, and under **My connections** select **+Add new connection**. 

1. Select **Directly to machine** in the **Connect** field.

1. Select the name of your machine group. 

1. Enter the username and password you would use to sign into your machines. 

1. Select **Create**. 
    
   ![Screenshot of the Desktp flows connector.](./media/manage-machine-groups/connect-directly-to-machine.png)

1. Select the desktop flow you want to run and the desired run mode. 

1. Save your cloud flow. 

1. You can now trigger your desktop flow to run on your machine group from the cloud. 

 >[!IMPORTANT]
>If you use local Windows accounts, all machines in the group must have the same local account with the same password. Use these credentials when you create the desktop flows connection.
>If you use Active Directory or Azure AD joined machines, confirm that the user account you use in the desktop flows connection can access all machines in the cluster.

## View list of machine groups 

Once a machine group is created in an environment, you can view its details at any time in the Power Automate portal. You can also view all the other machine groups that you have access to. 

1. Sign in to the Power Automate portal. 

1. Select **Monitor > Machines**. 

1. Select **Machine groups**. 

Within the list, for each machine you can view: 

- The name of the machine group. 
- The description of the machine group. 
- The number of the machines in the group. 
- The number of flows running in the machine group. 
- The number of flows queued in the machine group. 
- The type of access you have to the machine group. 
- The owner of the machine group. 

## Share a machine group 

You can share a machine group with other users in your organization, giving those users specific permissions to access your machine group. 

1. Sign in to the Power Automate portal. 

1. Select **Monitor**, then **Machines**. 

1. Select **Machine groups**. 

1. Select your machine group from the list. 

1. Select **Manage access**. 

1. Select the **Add people** field, then enter the name of the person in your organization with whom you’d like to share the machine group. 

1. Select the name of the person to choose with which permissions they can access the machine group. 

1. Select **Save**. 

   ![Screenshot of the Manage access pane.](./media/manage-machine-groups/share-machine-group.png)

There are two levels of permissions that you can use when managing access to your machine group: 

1. **Co-owner**. This access level gives full permissions to that machine. Co-owners can run desktop flows on the machine group, share it with others, edit its details, and add or delete machines. 

1. **User**. This access level only gives permission to run desktop flows on the machine group. No edit, share, or delete permissions are possible with this access. 

|Actions|Co-owner|User|
|---|---|---|
|Run a desktop flow on the group|X|X|
|Share the machine group|X||
|Add machines to group|X||
|Remove machines from group|X||
|Edit details|X||
|Delete machine group|X||

>[!NOTE]
> When a user isn't part of the environment anymore, you can continue to see it as a deactivated user. You'll be notified in the **Manage access** section of the machine group if it's shared with deactivated users. In this situation, remove access to them.

You can only delete a machine group if you have sufficient permissions and there are no machines in the machine group. Remove any machines from the group before deleting the machine group. 

Access for machine groups is managed at the group level. All machines in the group will use the same permissions and connections. 

If the permissions of a machine and its group fall out of sync, for example if you modify the permissions of the group directly in Microsoft Dataverse, certain actions for that machine may no longer be available and your machine and machine group may not behave as expected. Ensure the permissions between the machine and machine group are consistent to avoid any such issues. 

Power Automate allows you to create groups of machines that can be accessed all together by a name reference. This feature is essential for organizations that want to trigger desktop flows to multiple machines simultaneously.

## Change the machine group of a machine

If you want to change the machine group that contains your machine, select another group in the list of the available machine groups and fill in the required credentials.

If you want to remove the machine from a group without adding it to a new one, select **Remove from group**.

![Screenshot of the Leave group option.](./media/manage-machine-groups/change-machines.png)

## Change machine group's password

To change the password of the currently used machine group, select the dots on machine group card and then **Edit group password**.

Next, select **Re-generate password**, copy the automatically generated password, and save the changes.

![Screenshot of the fields for the new mahcine group password.](./media/manage-machine-groups/machine-group-new-password.png)

## Update permissions based on security role 

By default, all users with an Environment Maker role can register their machines in an environment. You can restrict actions on machines and machine groups by modifying the **Flow Machine** and **Flow Machine Group** permissions for a particular security role. 

  ![Screenshot of the permissions based on security role.](./media/manage-machine-groups/permissions-roles.png)

Environment admins can also restrict machine registration to a specific set of users by using the three security roles that come with machine management. 

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
|Maximum amount of time a desktop flow can be queued |3 hours| 

## Other known limitations 

- Machines and machine groups aren't available in the Government Community Cloud (GCC), Government Community Cloud - High (GCC High), Department of Defense (DoD), or China regions. You can still run desktop flows from the cloud using on-premises data gateways.
- When you trigger multiple desktop flows in parallel on a machine group, machine selection may take up to 50 seconds before assigning the desktop flow to an available machine. In these rare cases, desktop flow runs might seem to be running sequentially if they have short run durations.
