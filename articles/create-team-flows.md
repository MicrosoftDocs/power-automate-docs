---
title: Learn how to share a flow with other users | Microsoft Docs
description: Power Automate makes it easy automate repetitive tasks. You can add users or groups as owners, and collaborate with them to design and manage flows.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/25/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Share a flow

Share a flow with others in your organization so they can also benefit from automations you've created. There are three primary ways to share a flow in Power Automate:

- Add an owner to a flow.
- Share a flow with run-only privileges.
- Share a copy of a flow.

## Prerequisites

- You must have a [paid Power Automate license](https://flow.microsoft.com/pricing/) to share a flow.
- You must be the creator or owner to add or remove owners from a flow.

### About embedded and other connections

Connections used in a flow fall into two categories:

- **Embedded**: These connections are used in the flow.
- **Other**: These connections have been defined for a flow, but aren't used in it.

If you stop using a connection in a flow, that connection appears in the **Other connections** list, where it remains until an owner includes it in the flow again. To make changes to embedded connections, follow the steps in [Modify a connection](#modify-a-connection), later in this article.<!--What is the significance of this? Embedded versus other?  DH: Its described in this section-->

The list of connections appears under the list of owners in a flow's properties, as shown in the following image.

![Embedded connections](./media/create-team-flows/embeddedconnections.png "Embedded connections")

## Add an owner to a flow

Adding an owner to a flow is the most common way to share a flow. Any owner of a flow can perform these actions:

- View the run history.
- Manage the properties of the flow (for example, start or stop the flow, add owners, or update credentials for a connection).
- Edit the definition of the flow (for example, add or remove an action or condition).
- Add or remove other owners (but not the flow's creator).
- Delete the flow.

If you're the creator or an owner of a flow, you'll find it listed on the **Team flows** tab in Power Automate<!--This doesn't need to be a live link.-->.

![Team flows tab](./media/create-team-flows/addowner5.png "Team flows tab")

>[!NOTE]
>Shared connections can be used *only* in the flow in which they were created.

Owners can use services in a flow but can't modify the credentials for a connection that another owner created.<!--I'm confused by this. In line 42, you say that "any owner of a flow can...update credentials for a connection." It seems that there's a difference between being added as an owner of a flow and owning a connection within a flow - will this be obvious to the reader? -->

<!--markdownlint-disable MD036-->
**To add more owners to a flow**

1. Sign in to [Power Automate](https://flow.microsoft.com), and then select **My flows**.
1. Select the flow that you want to share, select **More commands** ![More commands](./media/create-team-flows/more-commands.png), and then select **Share**.
  
    ![Select Share from More commands](./media/create-team-flows/addowner1.png "Select Share from More commands")

1. Enter the name, email address, or group name for the person or group that you want to add as an owner.<!--I don't find the names in these screenshots on our list of our group's approved fictitious names. Can you verify that they're included in sample data?-->

    ![Search for a user or group](./media/create-team-flows/addowner2.png "Search for a user or group")

    The user or group you've selected becomes an owner of the flow.

    ![New owner](./media/create-team-flows/addowner4.png "New owner")

Congratulations&mdash;you've created your team flow!

## Add a list as a co-owner

You can add SharePoint lists as co-owners of a flow so that everyone who has edit access to the list automatically gets edit access to the flow. After<!--Writing Style Guide--> the flow is shared, you can simply distribute a link to it. More information: [Training: Create and set up a SharePoint list](https://support.microsoft.com/office/training-create-and-set-up-a-list-1ddc1f5a-a908-478b-bb6d-608f34b71f94)

> [!TIP]
> Use a list when the flow is connected to SharePoint, and use a group in all other cases.

## Remove an owner

> [!IMPORTANT]
> When you remove an owner whose credentials are used to access Power Automate services, you should update the credentials for those connections so that the flow will continue to run properly. More information: [Manage a connection](#Manage-a-connection)

1. On the flow details page, in the **Owners** section, select **Edit**.

   ![Edit owners](./media/create-team-flows/editowners.png "Edit owners")

1. Select **Delete** ![Delete](./media/create-team-flows/delete.png) for the owner you want to remove.

    ![Delete an owner](./media/create-team-flows/removeowner2.png "Delete an owner")

1. In the confirmation dialog box, select **Remove**.

Congratulations&mdash;the user or group that you removed is no longer listed as an owner of the flow.

## Modify a connection

You might need to change the owner of a connection in a flow if you remove the existing owner or if you just want to use a different account to sign in to an action or trigger.

1. Go to the flow that you want to modify.

1. Select **Edit**.

   ![Edit a flow](./media/create-team-flows/Edit-flow-details.png "Edit a flow")

1. Select **More commands** (...) in the step where you want to edit the connection for the trigger or in the action you want to edit.<!--I don't know what this means.-->

1. If you have a connection already, select it; if not, select **Add new connection** to create a new connection, and then select **Sign in** to create your new connection.

   ![Add a new connection](./media/create-team-flows/edit-connection.png "Add a new connection")

## Share a flow with run-only permissions

Instant flows (that is, flows that use a manual trigger such as a button or an item being selected) can be shared by using run-only permissions. Any user who's added as a run-only user won't have access to edit or modify the flow in any way; they'll only have permissions to trigger the flow.

**To add a run-only user**

1. On the flow details page, in the **Run only users** section, select **Edit**. 

   ![Edit the Run only users section](./media/create-team-flows/run-only-share.png "Edit the Run only users section")

1. In the **Manage run-only permissions** panel, specify the users and groups you want to provide run-only access to.

   ![Add run-only users](./media/create-team-flows/run-only-share2.png "Add run-only users")

1. As an owner, you can specify whether run-only users will need to provide their own connections or you can choose use a connection that's already defined in the flow.

   ![Manage connections](./media/create-team-flows/manage-run-only-connections.png "Manage connections")

Congratulations&mdash;the user or group now has access to run the flow.

**To remove a run-only user**

1. On the flow details page, in the **Run only users** section, select **Edit**. 
1. In the **Manage run-only permissions** panel, select **Delete** ![Delete](./media/create-team-flows/delete.png) next to the user whose access you want to remove, and then select **Save**.

    ![Remove a run-only user](./media/create-team-flows/remove-run-only-user.png "Remove a run-only user")

Congratulations&mdash;the user or group no longer has access to run this flow.

## Share a copy of a flow

You can share a copy of a flow with another user, who can then use the definition of the flow as a template. It provides a good way for you to share the general structure of a flow without sharing any connections, while also allowing the recipient to modify their flow independently of yours, so they can make it fit their needs.

> [!NOTE]
> Sharing a copy creates an independent instance of the flow for the recipient. You can't revoke access to the flow after you share it.

**To send a copy of a flow**

1. On the flow details page command bar, select **Send a copy**.

   ![Send a copy from the command bar](./media/create-team-flows/send-a-copy.png "Send a copy from the command bar")

1. In the **Send a copy** panel, you can edit the name and description of the flow you want to share, and specify the users with whom you want to share it.

   ![Send a copy details](./media/create-team-flows/send-a-copy3.png "Send a copy details")

1. The recipient will receive an email stating that you have shared a flow template with them, and they can then create their own instance of that flow.

   ![Receive a copy](./media/create-team-flows/send-a-copy5.png "Receive a copy")

   >[!NOTE]
   >As a recipient, you can also access the flow by selecting **Templates** on the left pane and then selecting the **Shared with me** tab.

   ![Shared with me](./media/create-team-flows/send-a-copy6.png "Shared with me")

## FAQ

### What happens if the user who created a shared flow leaves the organization?

If the shared flow still has an active owner, the flow will continue to run. 

>[!NOTE]
>If the flow uses any active or embedded connections that belong to the user who has left the organization, those specific actions might fail. To fix this, follow the steps in [Manage a connection](#manage-a-connection), earlier in this article to update the credentials.
<!--markdownlint-enable MD036-->
