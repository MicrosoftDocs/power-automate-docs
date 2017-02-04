<properties
    pageTitle="Learn how to add other owners to a flow and create team flows | Microsoft Flow"
    description="Microsoft Flow makes it easy automate repetitive tasks. You can add users or groups as owners and collaborate with them to design and manage your flows."
    services=""
    suite="flow"
    documentationCenter="na"
    authors="aftowen"
    manager="anneta"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="02/03/2017"
   ms.author="anneta"/>

# Create team flows #
Create a team flow by specifying one or more other people in your organization as co-owners, who can perform these actions:

- View the flow's history (that is, each run).
- Edit the flow to change how it works (for example, adding or removing [services](https://flow.microsoft.com/services/)).
- Add and remove other co-owners (but not the flow's creator).
- Delete the flow.

If you create a team flow or are added as a co-owner of a flow, the [Microsoft Flow portal](https://flow.microsoft.com) shows it on the **Team flows** tab and adds a designation to it on the **My Flows** tab:

![](./media/create-team-flows/addowner5.png)

>[AZURE.NOTE] Shared connections can be used **only** in the flow in which they were created.

Co-owners can use services in a flow, but co-owners can't modify the credentials for a connection that another co-owner created.

## Prerequisites ##
To create a team flow or add/remove a co-owner from a team flow, you must have a [paid Microsoft Flow plan](https://flow.microsoft.com/pricing/) and be the creator or a co-owner of a flow.

## Create a team flow ##
Follow these steps to create a team flow or to add more one or more co-owners to a team flow.

1. Sign in to the [Microsoft Flow portal](https://flow.microsoft.com), and then select **My Flows**.

1. Select the people icon for the flow that you want to modify:

     ![](./media/create-team-flows/addowner1.png)

1. Enter the name, the email address, or the phone number of the person or group that you want to add as a co-owner:

     ![](./media/create-team-flows/addowner2.png)

1. In the list that appears, select the user whom you want to make a co-owner:

     ![](./media/create-team-flows/addowner3.png)

	 The user or group that you specified becomes a co-owner of the flow:

     ![](./media/create-team-flows/addowner4.png)

	 Congratulations &mdash; your team flow has been created!

## Remove a co-owner ##

>[AZURE.IMPORTANT] If you remove a co-owner whose credentials are being used to access one or more services in the flow, you may need to update the credentials for those services so that the flow continues to run properly.

1. Select the people icon for the flow that you want to modify:

     ![](./media/create-team-flows/removeowner1.png)

2. Select the **Delete** icon for the co-owner that you want to remove:

     ![](./media/create-team-flows/removeowner2.png)

3. In the confirmation dialog box, select **Remove this owner**:

     ![](./media/create-team-flows/removeowner3.png)

4. Congratulations &mdash; the user or group that you just removed is no longer listed as a co-owner of the flow:

     ![](./media/create-team-flows/removeowner4.png)

## Embedded and other connections
Connections used in a flow fall into two categories:

- **Embedded** &mdash; These connections are used in the flow.
- **Other** &mdash; These connections have been defined for a specific flow but aren't used in it.

If a connection is no longer being used in a flow, that connection will appear in the list of **Other** connections, where it remains until a co-owner includes it in the flow again.

The list of connections appears under the list of owners in a flow's properties:

![](./media/create-team-flows/embeddedconnections.png)

## Next steps

- [Get started with Microsoft Flow](./getting-started.md)
