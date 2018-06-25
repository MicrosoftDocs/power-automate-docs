---
title: Learn how to add other owners to a flow and create team flows | Microsoft Docs
description: Microsoft Flow makes it easy automate repetitive tasks. You can add users or groups as owners and collaborate with them to design and manage flows.
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
ms.date: 04/21/2017
ms.author: deonhe

---
# Create team flows
Create a team flow by adding others in your organization as owners. All owners of a team flow can perform these actions:

* View the flow's history (that is, each run).
* Manage the properties of the flow (for example, start or stop the flow, add owners or update credentials for a connection).
* Edit the definition of the flow (for example, add or remove an action or condition).
* Add and remove other owners (but not the flow's creator).
* Delete the flow.

If you're the creator or an owner of a team flow, you'll find it listed on the **Team flows** tab on [Microsoft Flow](https://flow.microsoft.com).

![team flows tab](./media/create-team-flows/addowner5.png)

> [!NOTE]
> Shared connections can be used **only** in the flow in which they were created.
> 
> 

Owners can use services in a flow but can't modify the credentials for a connection that another owner created.

## Prerequisites
You must have a [paid Microsoft Flow plan](https://flow.microsoft.com/pricing/) to create a team flow. Additionally, you must be the creator or owner to add/remove owners from a team flow.

## Create a team flow
Follow these steps to create a team flow or to add more owners to a team flow.

1. Sign into the [Microsoft Flow](https://flow.microsoft.com), and then select **My flows**.
2. Select the people icon for the flow that you want to modify:
   
    ![team icon](./media/create-team-flows/addowner1.png)
3. Enter the name, email address, or group name for the person or group that you want to add as an owner:
   
    ![search for the user](./media/create-team-flows/addowner2.png)
4. In the list that appears, select the user whom you want to make an owner:
   
    ![select the user](./media/create-team-flows/addowner3.png)
   
     The user or group you've selected becomes an owner of the flow:
   
    ![new owner](./media/create-team-flows/addowner4.png)
   
     Congratulations &mdash; your team flow has been created!

##Add a list as a co-owner

Let’s suppose you have a flow that runs when an item is created or modified in a SharePoint list – say Turbine Energy Distribution, this flow also does a Get item from another list called Turbines. You can add both lists as co-owners to the flow so that everyone who has edit access to the list automatically gets edit access to the flow. Once the flow has been shared, you can simply distribute a link to it.

## Remove an owner
> [!IMPORTANT]
> When you remove an owner whose credentials are used to access Microsoft Flow services, you should update the credentials for those connections so that the flow continues to run properly.
> 
> 

1. Select the people icon for the flow that you want to modify:
   
    ![select people icon](./media/create-team-flows/removeowner1.png)
2. Select the **Delete** icon for the owner that you want to remove:
   
    ![select delete](./media/create-team-flows/removeowner2.png)
3. On the confirmation dialog box, select **Remove this owner**:
   
    ![confirm removal](./media/create-team-flows/removeowner3.png)
4. Congratulations &mdash; the user or group that you removed is no longer listed as an owner of the flow:
   
    ![user removed](./media/create-team-flows/removeowner4.png)

## Embedded and other connections
Connections used in a flow fall into two categories:

* **Embedded** &mdash; These connections are used in the flow.
* **Other** &mdash; These connections have been defined for a flow but aren't used in it.

If you stop using a connection in a flow, that connection appears in the **Other** connections list, where it remains until an owner includes it in the flow again.

The list of connections appears under the list of owners in a flow's properties:

![embedded connections](./media/create-team-flows/embeddedconnections.png)

