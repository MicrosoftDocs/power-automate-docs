---
title: Overview of adaptive cards for Teams | Microsoft Docs
description: Blah.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kVivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/01/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Overview of adaptive cards for Teams

Adaptive cards are a platform-agnostic method of sharing and displaying blocks of information without the complexity of customizing CSS or HTML to render them. Adaptive cards are authored in JSON format, with integrations that cloud apps and services can openly exchange. When delivered to a specific host, such as Microsoft Teams, the JSON is transformed into native UI that automatically adapts to its surroundings. Therefore, process designers can now offer consistent UI patterns whenever they need to display information as part of a business process/automation.
 
[insert Adaptive Card video from the top of this page:
<https://docs.microsoft.com/adaptive-cards/> ]
 
Since adaptive cards adapt to their host, they are perfect vehicles for sharing information between Microsoft Teams and other services.
 
  <!-- ![A screenshot of adaptive cards ](media/4b1fb53861e3854d04c6a6e41480e8ea.png) -->

  ![A screenshot of adaptive cards](media/adaptive-cards/multi-adaptive-cards.png)
 
## Currently available actions for flows
 
The following actions enable makers to create adaptive cards for Microsoft Teams. As integration scenarios evolve, other hosts will also be supported by Power Automate, which will extend your opportunities to leverage adaptive cards throughout Microsoft cloud subscriptions in the future.
 
## Directing content to **Teams members or AAD users**
 
-   **Post your own adaptive card as the Flow bot to a user**  
    This action posts an adaptive card as a Flow bot to a specific user. In this case, you will need to provide a recipient email address, and the card will show up in the recipient chat and/or activity feeds during the flow run. There is no requirement for the user to be part of a Teams instance to receive these types of adaptive cards. In this case, only URL buttons function by redirecting to the URL configured within the flow.

      ![](media/adaptive-cards/top.png)
 
-   **Post an adaptive card as the Flow bot to a Teams user, and wait for a response**  
    This action posts an adaptive card as a Flow bot to a specific user as in the case above. However, in this case the flow run will not continue after the post until the recipient has responded to inputs required within the card. The flow will continue once the recipient responds, but will only return dynamic content for one (1) response per recipient and per card.
    
    <!--Note: I don't see the image for this card ![](media/03d0a0634db92fbd5446c921061ed84d.png) -->
 
<!-- Image 1: Screenshot of posting for a user. In this case, the flow will continue without waiting for a response. -->
 
## Directing content to **Teams channels**
 
-   **Post your own adaptive card as the Flow bot to a channel**  
    This action posts an adaptive card as a Flow bot to a specific Teams channel. In this case, you will be prompted for Teams instance, and a
    channel where the card will be posted. The flow-maker will have to have access to the Teams instance in order to post an adaptive card there. In
    this case, only URL buttons function by redirecting to the URL configured within the flow.
 
-   **Post an adaptive card as the Flow bot to a Teams channel, and wait for a response**  
    This action posts an adaptive card as a Flow bot to a specific Teams channel as in the case above. However, in this case the flow will not continue until
    someone on the channel has responded to any inputs required within the card. The flow will continue once the anyone in the Teams channel responds, but
    will only return dynamic content for one (1) response per responder and per card.
 
    <!-- ![](media/8115e8fb0ca102f0a42802b5326ffbe5.png) -->
     ![](media/adaptive-cards/bottom.png)

     >[!TIP]
     >When you use this card, the flow waits for a response from any Teams member.
 
 
## Known issues
 
-   It is not possible to collect data from adaptive cards unless they are created using one of the ‘wait for a response’ actions. Cards not created with wait actions will return an error for all button actions except OpenURL. Learn more on OpenURL buttons [here](https://adaptivecards.io/explorer/Action.OpenUrl.html).
    Pressing/clicking Action.Submit buttons on a card which did not include the ‘wait for a response’ suffix, will throw an error.
 
-   Adaptive cards created using the ‘wait for response’ actions can only be submit once per card. The flow run will continue after the first response, and any further submissions are ignored.
 
-   Only the information within the ‘Update message’ input box (see image 3) will be shown on the replacement card after consumers submit the card. 
    Additional details, such as the user id of the person submitting the card, will be available within the dynamic content in actions following the ‘wait for a response’ action. However, it may be necessary to include the Office 365 Users connector in order to complete desired profile information for the user who submitted the card.
 
-   Once the ‘wait for a response’ adaptive cards are submit, the card will reset, then appear exactly the same, unless the replacement/update message area is configured. Update messages are a best practice, and are recommended in order to update others, but also to prevent consumers from attempting to submit the card more than once.
 
     ![](media/1c38ff7a9fd3dd64a3712f78e7ad427b.png)
 
Image 3: Screenshot of the ‘Update message’ area at the bottom of each ‘wait for a response’ action. Please remember that  
both the ‘Update Message’ and the ‘Should update card’ inputs must be configured if a replacement card is desired.
 
-   Power Automate is dependent upon Microsoft Adaptive Cards unique features and services in order to handle the cards within any host. This documentation is intended to clarify any specifics related to flow actions, however please continue to leverage the full documentation for building adaptive cards from [this location](https://docs.microsoft.com/adaptive-cards/).
 
-   Experimental feature: The Adaptive Card embedded designer is available only if you enable experimental features. Please note that experimental features are not fully supported, and therefore will not have a production support SLA. We therefore encourage you to discuss any ideas or challenges within the Power Automate ([link](https://powerusers.microsoft.com/t5/Microsoft-Power-Automate/ct-p/MPACommunity)) and adaptive cards ([link](https://github.com/login?return_to=https%3A%2F%2Fgithub.com%2FMicrosoft%2FAdaptiveCards%2Fissues%2Fnew%3Ftitle%3D%255BWebsite%255D%2520%255BYour%2520feedback%2520title%2520here%255D%26body%3D%250D%250A%250D%250A%255BYour%2520detailed%2520feedback%2520here%255D%250D%250A%250D%250A---%250D%250A%2A%2520URL%253A%2520https%253A%252F%252Fadaptivecards.io%252Fexplorer%252FAction.OpenUrl.html)) forums.
 
## Learn more 
 
- Create your [first adaptive card](https://docs.microsoft.com/power-automate/create-adaptive-cards)

- Review [adaptive card samples](https://docs.microsoft.com/power-automate/adaptive-cards-samples)
 
- Full documentation for the [Microsoft Teams connector](https://docs.microsoft.com/connectors/teams/)
 
- Full documentation on [adaptive cards IO](https://docs.microsoft.com/adaptive-cards) 

