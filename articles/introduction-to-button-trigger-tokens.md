<properties
    pageTitle="Button trigger tokens for Microsoft button flows | Microsoft Flow"
    description="Introduction to button trigger tokens for Microsoft button flows."
    services=""
    suite="flow"
    documentationCenter="na"
    authors="msftman"
    manager="anneta"
    editor=""
    tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="12/12/2016"
   ms.author="deonhe"/>

# Get started with trigger button tokens


## What are trigger button tokens?
Trigger button tokens are data points that are known and available to the device on which a [button flow](./introduction-to-button-flows.md) is running. These tokens change based on factors such as the current time or the geographic location of the device at a given moment.  

For example, if you are running a button flow on a smart phone, it is likely that the **phone knows the time** at your current location as well as the date and your current address. In this context, the time, date and address where the phone is located are all determined at the time the button flow runs. They are automatically available for use in any button flows that are executed on the device. You can use these trigger tokens to build useful apps that will minimize repetitive tasks such as providing your location to someone or tracking how much time you spent on a particular job/service call.

### List of button trigger tokens
Here's the list of the button trigger tokens that are available for you to use when creating your button flows.

Parameter| Description
---------|------------
City| The city in which the device that's running the flow is located.
Country/Region|The country/region in which the device that's running the flow is located.
Full address|The full address where the device that's running the flow is located.
Latitude|The latitude in which the device that's running the flow is located.
Longitude|The longitude in which the device that's running the flow is located.
PostalCode|The postal code in which the device that's running the flow is located.
State|The state in which the device that's running the flow is located.
Street|The street on which the device that's running the flow is located.
Timestamp|The time in the area where the device that's running the flow is located.
Date|The date in the area where the device that's running the flow is located.
User name|The user name of the person signed into the device that's running the flow.
User email|The email address of the person signed into the device that's running the flow.


## Create a button flow that uses trigger tokens
When you create a button, you can use trigger tokens to add rich functionality to your button. 

In this walk-through, we will create a button flow on an Android device. The button flow will use trigger tokens to send the date and your full address in a "**Working from home**" email to your boss.  

In this walk-through, you will see screen-shots from an Android device, however, the experience is similar on iOS devices as well.

### Prerequisites 

- A work or school account with access to Microsoft Flow  
- An Android or iOS device with the Microsoft Flow app installed

1. Launch Flow and select **Browse**   
![button trigger token](./media/introduction-to-button-trigger-tokens/1.png)  
1. Select the **Send a 'Working from home today' email to your manager** service under the **Button** section   
![button trigger token](./media/introduction-to-button-trigger-tokens/2.png)  
1. Select **USE THIS TEMPLATE**  
![button trigger token](./media/introduction-to-button-trigger-tokens/3.png)  
4. Select **Edit** on the **Send an email** card  
![button trigger token](./media/introduction-to-button-trigger-tokens/3-5.png)  
5. Tap the **Subject** text box and enter: " **today -** " into the text box after the "WFH" text. Notice that when you tapped on the text box, a list of parameters/tokens also opened up. We'll use one of these tokens in the next step to add the date to the subject of the email.  
![button trigger token](./media/introduction-to-button-trigger-tokens/4.png)  
6. With the cursor still in the subject text box, scroll to the **manual** list of parameters and tap **Date**. Notice the date parameter is now in the **Subject** text box:  
![button trigger token](./media/introduction-to-button-trigger-tokens/6.png)  
7. Scroll to the **Body** text box and tap after the default message so that additional tokens can be included there.
![button trigger token](./media/introduction-to-button-trigger-tokens/7.png)  
8. Tap the **Full address** parameter, then tap **Create**  
![button trigger token](./media/introduction-to-button-trigger-tokens/8.png)  
1. Tap **Done**. Your button flow is now created.  
![button trigger token](./media/introduction-to-button-trigger-tokens/9.png)  

## Run the button flow

**NOTE**: This button flow will send your current location via email.  

1. Tap the **Buttons** category at the bottom of the screen. You will see a list of the buttons that you have permissions to use. Tap the button that represents the button flow you just created:  
![button trigger token](./media/introduction-to-button-trigger-tokens/10.png)  
1. Tap **ALLOW** to indicate that it's OK for the button flow to access your device's location information:  
![button trigger token](./media/introduction-to-button-trigger-tokens/11.png)  
1. Within a few moments, notice that the email was sent to your boss:  
![button trigger token](./media/introduction-to-button-trigger-tokens/12.png)  

Congratulations, you've just created a button flow that uses both the date and full address trigger tokens. 

## Next steps

- [Learn about button flows](./introduction-to-button-flows.md)  
- [Learn about flows](./guided-learning/learning-introducing-flow.md)
