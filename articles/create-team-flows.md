---
title: Learn how to share a flow with other users | Microsoft Docs
description: Power Automate makes it easy automate repetitive tasks. You can add users or groups as owners and collaborate with them to design and manage flows.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: anneta
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 07/05/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Share a flow 

Share a flow with others in your organization so they can also benefit from automations you've created.There are three primary ways in which a flow can be shared in Power Automate:

1. Adding an owner to a flow
2. Sharing a flow with run only privelages
3. Sharing a copy of a flow

## Prerequisites
You must have a [paid Power Automate plan](https://flow.microsoft.com/pricing/) to share a flow. Additionally, you must be the creator or owner to add/remove owners from a flow.

## Adding an owner to a flow
Adding an owner to a flow is the most common way in which to share a flow. All owners of a flow can perform these actions:

* View the flow's history (each run).
* Manage the properties of the flow (for example, start or stop the flow, add owners or update credentials for a connection).
* Edit the definition of the flow (for example, add or remove an action or condition).
* Add and remove other owners (but not the flow's creator).
* Delete the flow.

If you're the creator or an owner of a co-owned flow, you'll find it listed on the **Team flows** tab on [Power Automate](https://flow.microsoft.com).

![team flows tab](./media/create-team-flows/addowner5.png)

> [!NOTE]
> Shared connections can be used **only** in the flow in which they were created.
> 
> 

Owners can use services in a flow but can't modify the credentials for a connection that another owner created.


### Steps to add an owner to a flow
Follow these steps to add more owners to a flow.

1. Sign into the [Power Automate](https://flow.microsoft.com), and then select **My flows**.
2. Select **...** (more commands) and then select **Share** for the flow that you want to share:
   
    ![team icon](./media/create-team-flows/addowner1.png)
> [!NOTE]
> You can also share a flow using the Share option on the flow details page. 

3. Enter the name, email address, or group name for the person or group that you want to add as an owner:
   
    ![search for the user](./media/create-team-flows/addowner2.png)
4. The user or group you've selected becomes an owner of the flow:
     
    ![new owner](./media/create-team-flows/addowner4.png)
   
     Congratulations &mdash; your team flow has been created!

## Remove an owner

> [!IMPORTANT]
> When you remove an owner whose credentials are used to access Power Automate services, you should update the credentials for those connections so that the flow continues to run properly.
> 
> 

1. In the flow details page choose the edit link in the owner section
![Edit Owners](./media/create-team-flows/editowners.png)
> [!NOTE]
> You can also edit the owners of flow using the Share button in the Flow details page mentioned earlier

2. Select the **Delete** icon for the owner that you want to remove:
   
    ![select delete](./media/create-team-flows/removeowner2.png)
3. On the confirmation dialog box, select **Remove this owner**:
   
    ![confirm removal](./media/create-team-flows/removeowner3.png)
4. Congratulations &mdash; the user or group that you removed is no longer listed as an owner of the flow.


### Update connection owner

You might need to change the owner of a connection in a flow if you remove the existing owner. Follow these steps to switch the owner of a flow:

1. Select **Data** from the left side panel.
1. Select **Connections**.
1. Search for the connection you want to update, and then select it.
1. Select **...** (more commands) on the connection you selected and then select **Switch account**.
1. Follow the steps to use a different account for the connection.

### Embedded and other connections

Connections used in a flow fall into two categories:

* **Embedded** &mdash; These connections are used in the flow.
* **Other** &mdash; These connections have been defined for a flow but aren't used in it.

If you stop using a connection in a flow, that connection appears in the **Other** connections list, where it remains until an owner includes it in the flow again.

Follow the steps to [update a connection owner](./create-team-flows.md#update-connection-owner) to make changes to embedded connections.

The list of connections appears under the list of owners in a flow's properties:

![embedded connections](./media/create-team-flows/embeddedconnections.png)

## Add a list as a co-owner

You can add SharePoint lists as co-owners to a flow so that everyone who has edit access to the list automatically gets edit access to the flow. Once the flow is shared, you can simply distribute a link to it.

> [!TIP]
> Use a list when the flow is connected to SharePoint, and use a group in other cases.
>

## Share a flow with run-only permissions
Instant flows (i.e. flows that use a manual trigger such as Button, For a selected item etc) can be shared using just run only permissions. Any user who's added as a run only user will not have access to edit or modify the flow in any way. They will only have permissions to trigger the flow. 

### Adding a run only user
1. In the flow details page select the "Edit" link next to the Run only users section. 
![run only share](./media/create-team-flows/run-only-share.png)
2. In the Manage run-only permissions flyout specify the users, groups you want to provide run only access to
![Add run only users](./media/create-team-flows/run-only-share2.png)
3. As an owner you can choose if the run-only users will need to provide their own connections when sharing the flow or use a connection thats already defined in the flow
![Manage connections](./media/create-team-flows/manage-run-only-connections.png)
4. Congratulations &mdash; the user or group will now have access to run the flow.

### Removing a run only user
1. In the flow details page select the "Edit" link next to the Run only users section. 
![run only share](./media/create-team-flows/run-only-share.png)
2. In the Manage run-only permissions flyout hit the delete icon next to the user you want to remove run only access to and hit save at the bottom of the page
![remove run only user](./media/create-team-flows/remove-run-only-user.png)
3. Congratulations &mdash; the user or group will no longer have access to run this flow.

## Share a copy of a flow
Share a copy allows you to share the definition of a flow with another user as a tempalte. It provides a good way for you to share the general structure of a flow without sharing any connections while also allowing the recipient to modify their flow independant of your flow so they can make it fit their needs.

> [!NOTE]
> Share a copy creates an independant instance of the flow for the recipient. There is no way to revoke access to the flow once shared.

### Sending a copy of a flow
1. In the flow details page select the "Send a copy" option in the top command bar
![Send a copy](./media/create-team-flows/send-a-copy.png)
> [!NOTE]
> You can also select send a copy from the flow overflow menu
![Send a copy2](./media/create-team-flows/send-a-copy2.png)
2. In the flyout menu you can edit the name and description of the flow you want to share and specify the users you want to share the flow with.
![Send copy details](./media/create-team-flows/send-a-copy3.png)
3. The recipient will receive an email stating that you have shared a Flow template with you and allows them to create their own instance of that flow
![Receive a copy](./media/create-team-flows/send-a-copy5.png)
> [!NOTE]
> As a recipient you can also access the flow from the Shared with me section under templates
![Shared with me](./media/create-team-flows/send-a-copy6.png)