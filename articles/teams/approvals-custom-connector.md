---
title: Create a custom connector for an approval flow | Microsoft Docs
description: Learn how to create a custom connector to use in an approval flow.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/13/2021
ms.author: corod
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Microsoft Teams approvals with custom connectors

You can use the approvals hub in Microsoft Teams to quickly integrate approvals workflows into existing line of business apps that do not have their own approvals system. You achieve this by using a custom connector to 'connect' to the existing line of business apps. 

>[!TIP]
>When you use the approvals hub, you get to manage all your approvals in a central location. 

This article shows you how to:

- Create a custom connector.
- Add a trigger and actions to a custom connector.
- Create an approval flow.
- Use the approvals hub in Teams to manage approvals that you created with the flow.

## Prerequisites

-  One of the following subscriptions:

    -  [Power Automate](/flow/sign-up-sign-in)

    -  [Power Apps](/powerapps/signup-for-powerapps)

-  Basic experience building [flows](/flow/get-started-logic-flow) and [custom connectors](/connectors/custom-connectors/define-openapi-definition).

## Create a custom connector

1. Sign into [Power Automate](https://flow.microsoft.com/).

1. Expand **Data**, and then select **Custom connectors**.

   ![Custom connectors link under data](../media/approvals-custom-connector/4f21df6fb27089bd74a0a4d38f4ceea9.png)

1. Select **New custom connector**.

   ![A screenshot that shows the link to start creating a custom connector.](../media/approvals-custom-connector/1f5061daa2286c3637c52d3bffd7a5a5.png)

1. Select **Create from blank** from the dropdown list.

   ![A sreenshot of the option to create a custom connector from scratch.](../media/approvals-custom-connector/42d235a1e9b4f9db0fdac83f11ad0bd2.png)

1. In the **Connector name** field, enter a name for the custom connector.

   ![A screenshot that shows where to enter the name for the custom connector](../media/approvals-custom-connector/d62c6c7ceb1507908a3ee1cc74bcc01c.png)

1. In **General Information**, enter a **Description** and a **Host**.

   ![A screenshot that shows the descrition and host fields for the new connector.](../media/approvals-custom-connector/ace9cfede593d6cb0c6a47f954eeddf5.png)

1. Select the **Security** tab, and then select the authentication type that your API uses.

   ![A screenshot that shows the list of authentication options for your API.](../media/approvals-custom-connector/332ec910c7448749163f12193c27801f.png)

## Add a trigger

You need a trigger to serve as the first step in the approval flow that you'll create. 

Some common approval triggers are:

- When a new record is created.
- Wen a record is updated. 

>[!TIP]
>Both Webhook and polling triggers work with approval flows.

1. Continuing from the earlier steps, select the **Definition** tab.

1. Select **New Trigger** in the Triggers list.

   ![A screenshot that shows the expanded triggers list and the option to create a new trigger.](../media/approvals-custom-connector/624e25e74778774e314b5c93fa077f01.png)

1. Enter a **Summary**, **Description**, **Operation ID**, and select a **Trigger type**.

   ![A screenshot that shows the general screen with the fields for the summary, description, opertion id, visibility, and trigger type.](../media/approvals-custom-connector/74cdc80cc503880eb54df135e85096fe.png)

   >[!NOTE]
   >Select either **important** or **advanced** for the **visibility** the trigger to make the trigger available when you create the approval flow.

1. Select **Import from sample.**

   ![Screenshot that shows the link to import from a sample.](../media/approvals-custom-connector/7a551e82377139fc4fbfcc3525653b1d.png)

1. Define the **Verb**, **URL**, **Headers**, and **Body** for your trigger.

   ![Screenshot that shows the sample options that you can select.](../media/approvals-custom-connector/4dcc9c0ce9b25f2504ee82e5e27d76bb.png)

1. Add a Response.

   The response configuration depends on your trigger type (Webhook or polling). Webhook triggers require a callback URL parameter and a location header that contains a value that's used to delete the Webhook registration.

1. Configure the **Webhook Response** and Trigger configuration

   ![A screenshot that shows the Webhook Response settings.](../media/approvals-custom-connector/5accba382238aa79f27c68c8de62b15a.png)

   ![A screenshot that shows the trigger configuration settings.](../media/approvals-custom-connector/1d3713995d14b4a632f2271360e12ae4.png)

1. Configure the **polling response** to meet your needs. 

   ![A screenshot of the polling response settings](../media/approvals-custom-connector/fcf703b2ed75f37fceebd1a39199b117.png)

1. Configure the trigger to meet your needs.

   ![A screenshot of the trigger configuration settings](../media/approvals-custom-connector/d19ae4d9214f2127c041676cb2dc0bbf.png)


## Create an approval flow

Now that you've created your custom connector, it's time to create your approval flow that uses the custom connector.

1. Sign into [Power Automate](https://flow.microsoft.com).

1. Select **My flows**.

1. Select **New flow**, and then select **Automated cloud flow**.

1. Select **Skip** on the **Build an automated cloud flow** screen.

1. Select the **Custom** tab, and then select your new custom connector.

   ![A screenshot that displays the custom connector on the custom tab.](../media/approvals-custom-connector/45eadef5abc7140bbf21df9a58b1ef68.png)

1. Select a trigger from your custom connector.

1. Select **New step**.

1. Search for "approvals", and then select **Start and wait for an approval**.

   ![Start and wait for an approval](../media/approvals-custom-connector/f1bebc8b0e464b57c981ac34ff7cfe39.png)

1. Select the **Approval type**, and then populate the required fields on the **Start and wait for an approval** card.

   ![Approval type](../media/approvals-custom-connector/0e9935b6377151b2659b80af6482345e.png)

1. Select **New step** > **Control** > **Condition**.

   ![New action](../media/approvals-custom-connector/759db0baedc33e79a1e0b84446f3b5c0.png)


1. Select the **Choose a value** text box, and then search the dynamic content for "Responses Approver response".

   ![Approver response in the dynamic content](../media/approvals-custom-connector/5f61423171340f56929403da0dc73a8e.png)

1. Update the condition with the desired result.

   >[!IMPORTANT]
   >The "Approve" or "Reject" approval responses are case sensitive.

   ![Completed condition card](../media/approvals-custom-connector/a5cb9748124b88f42e5234616028ea3b.png)

1. Add an action in both condition result sections.

   ![Condition branches populated with actions](../media/approvals-custom-connector/159934da4bc317044f5bca8ff9f67c0d.png)

## Manage approvals generated by the approval flow

1. Sign into [Microsoft Teams](https://teams.microsoft.com).

1. Search for the **approvals** app, and then select it.

   ![Search for the approvals app](../media/approvals-custom-connector/fb2dffecb0979baa6381cbacaef4fa3a.png)

1. View your received and sent approvals.

    ![See your approvals](../media/approvals-custom-connector/576e9aeeb31b99823b5abf7e070b2ab8.png)

1. Take an action that activates your custom connector’s trigger.

1. View the new approval request in flow run history.

   ![Run history of an approval flow](../media/approvals-custom-connector/720a21845afb4a7449b3a1ca5bf7c91b.png)

1. View the new approval request in the approvals app.

   ![Screenshot that displays an approval request in the approvals app](../media/approvals-custom-connector/fa90078737b599f3b25389e9afb10007.png)

1. Select the approval request, review the details, and then select **Reject** or **Approve**.

   ![Reject or approve the request](../media/approvals-custom-connector/b43b7c906abef980758448a959274309.png)

1. View the completed approval request in flow run history.

   ![Completed request in the flow run history](../media/approvals-custom-connector/27b59ee65ed6a09234f5b10347785e45.png)

1. View the completed approval request in approvals app.

   ![Completed request in the approvals app](../media/approvals-custom-connector/79a81cbf186c2d53e08cf776f0f78255.png)

1. Confirm in the target system the approval completion update steps were executed successfully.

## More info

- [Create a custom connector from scratch](/connectors/custom-connectors/define-blank)

- Webhook triggers: [Use a Webhook as a trigger for Azure Logic Apps and Power Automate](/connectors/custom-connectors/create-webhook-trigger)

- Polling triggers: [Use a polling trigger for Microsoft Power Automate](/connectors/custom-connectors/create-polling-trigger)


[!INCLUDE[footer-include](../includes/footer-banner.md)]