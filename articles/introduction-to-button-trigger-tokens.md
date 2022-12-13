---
title: Create instant flows with trigger tokens
description: Learn how to create instant flow trigger tokens for instant flows.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: anneta
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/31/2022
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: intro-internal
---
# Create instant flows with trigger tokens

Instant flow trigger tokens are data points that are known and available to the device on which a [button flow](introduction-to-button-flows.md) is running. These tokens change based on factors such as the current time or the geographic location of the device at a given moment.

For example, if you're running an instant flow on a smartphone, it's likely that the phone knows the time at your current location, the date, and your current address. In this context, the time, date and address where the phone is located are determined at the time the instant flow runs. They are automatically available for use in any instant flows that are executed on the device. You can use these trigger tokens to build useful flows that will minimize repetitive tasks such as providing your location to someone or tracking how much time you spent on a particular job/service call.

### List of button trigger tokens

Here's the list of the instant flow trigger tokens that you can use when creating your instant flows.

| Parameter | Description |
| --- | --- |
| City |The city in which the device that's running the flow is located. |
| Country/Region |The country/region in which the device that's running the flow is located. |
| Full address |The full address where the device that's running the flow is located. |
| Latitude |The latitude in which the device that's running the flow is located. |
| Longitude |The longitude in which the device that's running the flow is located. |
| PostalCode |The postal code in which the device that's running the flow is located. |
| State |The state in which the device that's running the flow is located. |
| Street |The street on which the device that's running the flow is located. |
| Timestamp |The time in the area where the device that's running the flow is located. |
| Date |The date in the area where the device that's running the flow is located. |
| User name |The user name of the person signed into the device that's running the flow. |
| User email |The email address of the person signed into the device that's running the flow. |

## Create a button flow that uses trigger tokens
When you create a button, you can use trigger tokens to add rich functionality to your button.

In this tutorial, we'll create a button flow that uses trigger tokens to send the date and your full address in a **Working from home** email to your boss.

The experience in this tutorial is similar on all smartphone devices.

### Prerequisites
* A work or school email address or a [Microsoft Account](https://account.microsoft.com/about?refd=www.microsoft.com) with access to Power Automate.
* The generally available version of Power Automate mobile app for [iOS](https://aka.ms/flowmobiledocsios) or [Windows Phone](https://aka.ms/flowmobilewindows).

Let's get started:

1. Launch Power Automate and select **Browse**.
 
   ![Screenshot of browse screen.](./media/introduction-to-button-trigger-tokens/1.png)  

1. Select the **Send a 'Working from home today' email to your manager** service under the **Button** category.
 
   ![Screenshot of the button Heading.](./media/introduction-to-button-trigger-tokens/2.png)  
1. Select **USE THIS TEMPLATE**.

   ![Screenshot of the template.](./media/introduction-to-button-trigger-tokens/3.png)  

1. Select **Edit** on the **Send an email** card.  

   ![Screenshot of the Edit button.](./media/introduction-to-button-trigger-tokens/3-5.png)  

1. Tap the **Subject** text box and enter **today -** into the text box after the **WFH** text. Notice that when you tapped on the text box, a list of parameters/tokens also opened. We'll use one of these tokens in the next step to add the date to the subject of the email.  

   ![Screenshot of the Subject field.](./media/introduction-to-button-trigger-tokens/4.png)  

1. With the cursor still in the subject text box, scroll to the **manual** list of parameters and tap **Date**. Notice the date parameter is now in the **Subject** text box.  

   ![Screenshot of the Date parameter.](./media/introduction-to-button-trigger-tokens/6.png)  

1. Scroll to the **Body** text box and tap after the default message so that additional tokens can be included there.  

   ![Screenshot of the Body field.](./media/introduction-to-button-trigger-tokens/7.png)  

1. Tap the **Full address** parameter, then tap **Create**.

   ![Screenshot of the Full address parameter.](./media/introduction-to-button-trigger-tokens/8.png)  

1. Tap **Done**. Your button flow is now created.  
   ![Screenshot confirming your button flow is created.](./media/introduction-to-button-trigger-tokens/9.png)  

## Run the button flow

**NOTE**: This button flow will send your current location via email.  

1. Tap the **Buttons** category at the bottom of the screen. You will see a list of the buttons that you have permissions to use. Tap the button that represents the button flow you just created.

   ![Screenshot of the list of buttons.](./media/introduction-to-button-trigger-tokens/10.png)  

2. Tap **ALLOW** to indicate that it's OK for the button flow to access your device's location information.

   ![Screenshot of Allow flow question.](./media/introduction-to-button-trigger-tokens/11.png)  

3. Within a few moments, notice that the email was sent to your boss.  

   ![Screenshot that your email was sent.](./media/introduction-to-button-trigger-tokens/12.png)  

Congratulations, you've just created a button flow that uses both the date and full address trigger tokens. 

## Next steps

- [Share button flows](share-buttons.md)
- [Learn about button flows](introduction-to-button-flows.md)

[!INCLUDE[footer-include](includes/footer-banner.md)]