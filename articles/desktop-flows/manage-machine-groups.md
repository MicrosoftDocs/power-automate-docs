---
title: Manage machine groups | Microsoft Docs
description: Manage machine groups
author: georgiostrantzas
ms.service: power-automate
ms.topic: article
ms.date: 03/29/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage machine groups (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Power Automate allows you to create groups of machines that can be accessed all together by a name reference. This feature is essential for organizations that want to trigger desktop flows to multiple machines simultaneously.

## Add machines to a machine group

While creating or updating a machine, Power Automate Desktop provides an option to add the machine to a machine group.

To add the current machine to a machine group:

1. Select the **Add to machine group** button on the **Machine** settings tab.

    ![The Add to machine group button](./media/manage-machine-groups/add-to-machine-group.png)

1. In the displayed list, you can find all the available machine groups. To add the machine to a machine group, select the desired group and fill in the required credentials.

    > [!NOTE]
    > If the machine is deployed in a different environment than the machine group, you have to change its environment.

    ![The displayed list with the available machines](./media/manage-machine-groups/machine-groups-list.png)

1. To create a new machine group, select the **New machine group** option and follow the instructions presented in [Create new machine group]().

    ![The New machine group option](./media/manage-machine-groups/new-machine-group.png)

## Change the machine group of a machine

If you want to change the machine group that contains your machine, select the **dots icon** next to the machine group and pick **Change machine group**.

If you want to remove the machine from a group without adding it to a new one, select **Remove from group**.


![The Change machine group and Remove from group options](./media/manage-machine-groups/change-remove-machine-group.png)


## Change machine group's password

To change the password of the currently used machine group, select the **dots icon** next to the machine group and pick **Edit group password**.

![The Edit group password option](./media/manage-machine-groups/edit-machine-group-password.png)

Next, populate the **New password** and **Confirm password** fields, and select the **Save** button to save the changes.

![The fields for the new mahcine group password](./media/manage-machine-groups/machine-group-new-password.png)