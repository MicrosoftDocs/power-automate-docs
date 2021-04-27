---
title: Overview of Adaptive Cards for Teams | Microsoft Docs
description: Learn to use Adaptive Cards with Microsoft Teams.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kVivek
editor: ''
tags: ''
ms.service: power-automate
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
# Overview of Adaptive Cards for Microsoft Teams

<br>
<iframe width="1129" height="635" src="https://www.youtube.com/embed/FqQ3jM2qPRM" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>


Adaptive Cards are a platform-agnostic method of sharing and displaying blocks of information without the complexity of customizing CSS or HTML to render them. You author Adaptive Cards in JSON format, with integrations that cloud apps and services can openly exchange. When delivered to a specific host, such as Microsoft Teams, the JSON is transformed into native UI that automatically adapts to its host. Therefore, process designers can now offer consistent UI patterns whenever they need to display information as part of a business process/automation.
 
Since Adaptive Cards adapt to their host, they are perfect vehicles for sharing information between Microsoft Teams and other services.

  ![A screenshot of Adaptive Cards](media/adaptive-cards/multi-adaptive-cards.png)
 
## Currently available actions for flows
 
The following actions enable makers to create Adaptive Cards for Microsoft Teams. As integration scenarios evolve, other hosts will also be supported by Power Automate, which will extend your opportunities to leverage Adaptive Cards throughout Microsoft cloud subscriptions.
 
## Directing content to **Teams members or AAD users**
 
- **Post your own adaptive card as the Flow bot to a user**  
  This action posts an adaptive card as a Flow bot to a specific user. In this case, you will need to provide a recipient email address, and the card will show up in the recipient's chat and/or activity feeds during the flow run. There is no requirement for the user to be part of a Teams instance to receive these types of Adaptive Cards. In this case, only the URL buttons function by redirecting to the URL that's configured within the flow.

    ![Samples of adaptive cards](media/adaptive-cards/top.png)
 
- **Post an adaptive card as the Flow bot to a Teams user, and wait for a response**  
  This action posts an adaptive card as a Flow bot to a specific user, like the case presented earlier in this article. However, in this case the flow run will not continue after the post until the recipient responds to inputs that are required within the card. The flow continues after the recipient responds. The flow returns dynamic content for one (1) response per recipient and per card.
 
## Directing content to **Teams channels**
 
- **Post your own adaptive card as the Flow bot to a channel**  
  This action posts an adaptive card as a Flow bot to a specific Teams channel. In this case, you will be prompted for Teams instance, and a channel where the card will be posted. The flow-maker will have to have access to the Teams instance in order to post an adaptive card there. In this case, only URL buttons function by redirecting to the URL configured within the flow.
 
- **Post an adaptive card as the Flow bot to a Teams channel, and wait for a response**  
  This action posts an adaptive card as a Flow bot to a specific Teams channel as in the case above. However, in this case the flow will not continue until someone on the channel has responded to any inputs required within the card. The flow will continue once the anyone in the Teams channel responds but will only return dynamic content for one (1) response per responder and per card.
 
     ![Post an adaptive card as the Flow bot to a Teams channel, and wait for a response](media/adaptive-cards/bottom.png)

     >[!TIP]
     >When you use this card, the flow waits for a response from any Teams member.
 
 
## Known issues
 
- It is not possible to collect data from Adaptive Cards unless they are created using one of the "wait for a response" actions. Adaptive Cards that don't wait return an error for all button actions except OpenURL. Learn more on [OpenURL buttons](https://adaptivecards.io/explorer/Action.OpenUrl.html). 

- Selecting Action.Submit buttons on a card which doesn't include the "wait for a response" suffix, will throw an error.
 
- Adaptive Cards created using the "wait for response" actions can only be submitted once per card. The flow run will continue after the first response, and any further submissions are ignored.
 
- Only the information within the ‘Update message’ input box (see image 3) will be shown on the replacement card after consumers submit the card.

  Additional details, such as the user id of the person submitting the card, will be available within the dynamic content in actions following the ‘wait for a response’ action. However, it may be necessary to include the Office 365 Users connector in order to complete desired profile information for the user who submitted the card.
 
- Once the "wait for a response" Adaptive Cards are submitted, the card resets and then appears exactly the same, unless the replacement/update message area is configured. Update messages are a best practice, and are recommended in order to update others, but also to prevent consumers from attempting to submit the card more than once.
 
   ![Update message](media/adaptive-cards/update-message.png) 
 
>[!TIP]
>The **Update Message** and the **Should update card** inputs must be configured if a replacement card is desired.
 
- Power Automate uses Microsoft Adaptive Cards' unique features and services to handle the cards within any host. This article is intended to clarify any specifics related to flow actions. You can also use the full documentation for [building Adaptive Cards](/adaptive-cards/).
 
## Learn more 
 
- Create your [first adaptive card](./create-adaptive-cards.md)
- Full documentation for the [Microsoft Teams connector](/connectors/teams/)
- Full documentation on [Adaptive Cards IO](/adaptive-cards) 



[!INCLUDE[footer-include](includes/footer-banner.md)]