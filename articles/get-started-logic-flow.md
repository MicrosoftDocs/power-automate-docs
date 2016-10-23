<properties
    pageTitle="Automate tasks by creating a flow | Microsoft Flow"
    description="Create a flow to automatically perform one or more actions, such as sending mail, when events occur, such as someone adding a row to a SharePoint list."
    services=""
    suite="flow"
    documentationCenter="na"
    authors="aftowen"
    manager="anneta"
    editor=""
    tags=""
 />
<tags
    ms.service="flow"
    ms.devlang="na"
    ms.topic="get-started-article"
    ms.tgt_pltfrm="na"
    ms.workload="na"
   ms.date="4/24/2016"
    ms.author="anneta"/>

# Create a flow in Microsoft Flow #
<iframe width="560" height="315" src="https://www.youtube.com/embed/Gt3CMhLAQqE?list=PL8nfc9haGeb55I9wL9QnWyHp3ctU2_ThF" frameborder="0" allowfullscreen></iframe>

Create a flow to perform one or more tasks automatically when you want an event to kick off an action. For example, create a flow that notifies you by mail as soon as someone sends a tweet that contains a keyword you specify. In this example, sending a tweet is the event, and sending mail is the action.

**Prerequisites**

- An account on [flow.microsoft.com](https://flow.microsoft.com)
- An Twitter account
- Office 365 credentials

## Specify an event

First, you will need to select what starting action, or *trigger*, will start your flow.

1. In [flow.microsoft.com](https://flow.microsoft.com), select **My Flows** in the top navigation bar, and then select **Create from blank**.

	![Flows option in the left navigation bar](./media/get-started-logic-flow/create-logic-flow.png)

1. In the box that says **Search for more triggers**, type or paste **Twitter**, and then select **Twitter - When a new tweet is posted**.

	![Twitter event](./media/get-started-logic-flow/twitter-search.png)

5. If you haven't already connected your Twitter account to Microsoft Flow, select **Sign in to Twitter**, and then provide your credentials.

    ![Twitter sign in](./media/get-started-logic-flow/twitter-signin.png)

6. In the **Query text** box, type the keyword that you want to find.

	![Twitter keyword](./media/get-started-logic-flow/twitter-keyword.png)

## Specify an action ##
1. Under the event that you created in the previous procedure, select **New step**, and then select **Add an action**.

	![Add action](./media/get-started-logic-flow/add-action-icon.png)

3. In the box that shows **Search for more actions**, type or paste **send email**, and then select **Office 365 Outlook - Send an email**.

	![List of actions](./media/get-started-logic-flow/send-email.png)

4. If prompted, select the sign-in button, and then provide your credentials.

5. In the form that appears, type or paste your email address in the **To** box.

	![Blank email message](./media/get-started-logic-flow/blank-email.png)

1. In the **Subject** box, type or paste **New tweet from:**, type a space, and then select the **Tweeted by** parameter to add a placeholder for it.

	![Subject line with placeholder](./media/get-started-logic-flow/message-token.png)

1. In the **Body** box, select the **Tweet text** parameter to add a placeholder for it, and then type the end of your message, including any other parameters you want to include.

1.  Near the top of the screen, name your flow, and then select **Create flow**.

	![Select the Create flow button](./media/get-started-logic-flow/create-button.png)

1. Finally, you can select **Done**, and the list of your flows will reflect your changes.

	![Select the done button](./media/get-started-logic-flow/done-button.png)

1. Send a tweet with the keyword that you indicated.

	Within a minute, an email message notifies you of the new tweet.

## Manage a flow ##
1. In [flow.microsoft.com](https://flow.microsoft.com), select **My Flows** in the top navigation bar.

2. In the list of flows, do any of the following:

	- To pause a flow, set its toggle to **Off**.

	![Pause flow](./media/get-started-logic-flow/pause-flow.png)

	- To resume a flow, set its toggle to **On**.  

	![Resume flow](./media/get-started-logic-flow/resume-flow.png)  

	- To change a flow, select its pencil icon.  

	![Edit icon](./media/get-started-logic-flow/edit-icon.png)  

	- To delete a flow, select its trash-can icon, and then select **OK**.

	![Delete icon](./media/get-started-logic-flow/delete-icon.png)

	- To view flow history, select the **List runs** icon.

	![Info icon](./media/get-started-logic-flow/info-icon.png)

	Select a flow run from the list of flows to see the inputs and outputs of each step.

	![Flow run](./media/get-started-logic-flow/flow-run.png)

**Note**: You can have up to 25 flows in your account. If you already have 25, delete one before you can create another.

## Next steps ##

- [Add steps](multi-step-logic-flow.md), such as different ways to be notified, to your flow.
- [Run tasks on a schedule](run-tasks-on-a-schedule.md), when you want an action to occur every day, on a certain date, or after a certain number of minutes.
- [Add a flow to an app](https://powerapps.microsoft.com/tutorials/using-logic-flows/) to allow your app to kick off logic in the cloud.
