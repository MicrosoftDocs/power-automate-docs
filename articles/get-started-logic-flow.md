---
title: Automate tasks by creating a cloud flow | Microsoft Docs
description: Create a cloud flow that automatically performs one or more actions, such as sending email, when events like someone adding a row to a SharePoint list occur.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: KVivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/04/2019
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create a cloud flow in Power Automate

Create a cloud flow that performs one or more tasks automatically after it's triggered by an event. For example, create a cloud flow that notifies you by email when someone sends a tweet that contains a keyword you specify. In this example, sending a tweet is the event, and sending mail is the action.

## Prerequisites

* An account on [flow.microsoft.com](https://flow.microsoft.com)
* A Twitter account
* Office 365 credentials

## Specify an event to start the flow

First, you will need to select what event, or *trigger*, starts your flow.

1. In [Power Automate](https://flow.microsoft.com), select **My flows** from the navigation bar on the left.

1. Select **New flow**, and then click on **Automated cloud flow**. 

     ![build your automate cloud flow new button](./media/get-started-logic-flow/build-your-automated-cloud-flow.png)

1. Give your flow a name in the **Flow name** field.

1. Enter **Twitter** into the **Choose your flow's trigger** field.

1. Select **Twitter - When a new tweet is posted** and click on the "Create" button at the bottom of the screen.

   ![Name your flow and serch for the Twitter trigger](./media/get-started-logic-flow/name-search-trigger.png)
   
1. If you haven't already connected your Twitter account to Power Automate, select **Authentication Type** and click to **Sign in to Twitter**, and then provide your credentials. Note that you need atouthorize app access to Microsoft Power Platform.  

     ![Name your flow and serch for the Twitter trigger](./media/get-started-logic-flow/sign-in-to-twitter.png)  
       
   >[!TIP]
     >Connectors support multiple types of authentication. For example, SQL Server supports Azure AD, SQL Server authentication, Windows authentication, and SQL connection string. Users choose which type of authentication they want to use when configuring a connector.

1. Click on the "When a new tweet posted" and then in the **Search text** box, type the keyword that you want to find.This operation triggers a flow when a new tweet that matches a given search query is posted.

    ![Twitter keyword](./media/get-started-logic-flow/twitter-keyword.png)

## Specify an action

1. Click on the **New step** to Add your new step.

    <!-- ![Add action](./media/get-started-logic-flow/add-action-icon.png) -->

1. In the box that shows **Search connectors and actions**, enter **send email**, and then select **Send an email (V2)** from **Actions**.

    ![List of actions](./media/get-started-logic-flow/send-email.png)

1. If prompted, select the sign-in button, and then provide your credentials.

1. In the form that appears, enter your email address in the **To** box, and then select your name from the list of contacts that appears.

1. In the **Subject** text field, enter **New tweet from:**, and then type a space. Click on the "Add a dynamice value" option. 

    ![Subject line with placeholder](./media/get-started-logic-flow/message-token.png)
1. In the list of **Dynamic Values**, select the **Tweeted by** field to add in the subject line.

    ![Add parameter](./media/get-started-logic-flow/add-parameter.png)
1. In the **Body** text field, Click on the "Add a Dynamic value"and **Tweet text** filed to add in the body text field.

   Optionally, you can add more tokens, other text, or both to the body of the email.
1. Click on the **Save** button.

    <!-- ![Select the Create flow button](./media/get-started-logic-flow/create-button.png) -->
<!-- 1. Select **Done** to update the list of flows.

     ![Select the done button](./media/get-started-logic-flow/done-button.png) -->

## Test your flow

Send a tweet with the keyword that you indicated, or wait for someone else to post such a tweet.

Within a minute after the tweet is posted, an email message notifies you of the new tweet.

> [!TIP]
> Use the **Send email (V2)** action to format email in which you customize the font, use bold, italic or underline, customize the color and highlight, and create lists or links, and more.

![Rich edit email](media/get-started-logic-flow/email-rich-text.png)

## Manage a cloud flow

1. In [Power Automate](https://flow.microsoft.com), select **My flows** in the navigation bar on the left side.
1. In the list of flows, do any of the following:

   * To pause a cloud flow, set its toggle to **Off**.

       ![Pause flow](./media/get-started-logic-flow/pause-flow.png)
   * To resume a cloud flow, set its toggle to **On**.

       ![Resume flow](./media/get-started-logic-flow/resume-flow.png)
   * To edit a cloud flow, select the pencil icon that corresponds to the flow you want to edit.

       ![Select flow](./media/get-started-logic-flow/select-flow.png)
   * To delete a cloud flow, select the **...** icon, select **Delete**, and then select **Delete** on the message box that appears.

       ![Delete icon](./media/get-started-logic-flow/delete-icon.png)
   * To view the run history of a cloud flow, select the flow from the **My flows** page, and then view the history under the **28 day run history** section of the page that opens.

       ![run history](./media/get-started-logic-flow/run-history.png)

     Select a cloud flow run from the list of runs to see the inputs and outputs of each step.

> [!NOTE]
> You can have up to 600 flows in your account. If you already have 600 flows, delete one before you create another flow.
>
>

## Next steps

* [Add steps](multi-step-logic-flow.md), such as different ways to be notified, to your flow.
* [Run tasks on a schedule](run-scheduled-tasks.md), when you want an action to occur daily, on a certain date, or after a certain number of minutes.
* [Add a cloud flow to an app](https://powerapps.microsoft.com/tutorials/using-logic-flows/) to allow your app to kick off logic in the cloud.
* [Get started with team flows](create-team-flows.md) and invite others to collaborate with you to design flows.
