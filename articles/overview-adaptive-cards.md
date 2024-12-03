---
title: Overview of adaptive cards for Teams
description: Learn to use adaptive cards with Microsoft Teams.
suite: flow
author: v-aangie
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 09/08/2023
ms.author: hamenon
search.audienceType: 
  - flowmaker
  - enduser
ms.reviewer: angieandrews
ms.custom: bap-template
---

# Overview of adaptive cards for Microsoft Teams

Adaptive cards are a platform-agnostic method of sharing and displaying blocks of information without the complexity of customizing CSS or HTML to render them. You author adaptive cards in JSON format, with integrations that cloud apps and services can openly exchange. When delivered to a specific host, such as Microsoft Teams, the JSON file is transformed into native UI that automatically adapts to its host. Therefore, process designers can now offer consistent UI patterns whenever they need to show information as part of a business process/automation.

Since adaptive cards adapt to their host, they're perfect vehicles for sharing information between Microsoft Teams and other services.

:::image type="content" source="media/adaptive-cards/multi-adaptive-cards.png" alt-text="Screenshot of adaptive cards.":::

## Currently available actions for flows

The following actions enable makers to create adaptive cards for Microsoft Teams. As integration scenarios evolve, other hosts will also be supported by Power Automate, which will extend your opportunities to leverage adaptive cards throughout Microsoft cloud subscriptions.

> [!NOTE]
> Adaptive cards aren't available within the DoD (Department of Defense) environment.

## Directing content to Teams members or Microsoft Entra users

### Post your own adaptive card as the Flow bot to a user

This action posts an adaptive card as a flow bot to a specific user. In this case, you need to provide a recipient email address. Then, the card shows up in that recipient's chat and/or activity feeds during the flow run. There's no requirement for the user to be part of a Teams instance to receive these types of adaptive cards. In this case, only the URL buttons function by redirecting to the URL that's configured within the flow.

### Post an adaptive card as the Flow bot to a Teams user, and wait for a response

This action posts an adaptive card as a Flow bot to a specific user, like the case presented earlier in this article. However, in this case the flow run will not continue after the post until the recipient responds to inputs that are required within the card. The flow continues after the recipient responds. The flow returns dynamic content for one (1) response per recipient and per card.

## Directing content to Teams channels

- **Post your own adaptive card as the flow bot to a channel**  
  This action posts an adaptive card as a flow bot to a specific Teams channel. In this case, you're prompted for Teams instance, and a channel where the card is posted. The flow maker has to have access to the Teams instance in order to post an adaptive card there. In this case, only URL buttons function by redirecting to the URL configured within the flow.

- **Post an adaptive card as the flow bot to a Teams channel, and wait for a response**  
  This action posts an adaptive card as a flow bot to a specific Teams channel as in the case above. In this case, the flow doesn't continue until someone on the channel responds to inputs required within the card. The flow continues once anyone in the Teams channel responds but only returns dynamic content for one (1) response per responder and per card. When you use this card, the flow waits for a response from any Teams member.

## Known issues

- It isn't possible to collect data from adaptive cards unless they're created using one of the *wait for a response* actions. Adaptive cards that don't wait return an error for all button actions except **OpenURL**. [Learn more about OpenURL buttons](https://adaptivecards.io/explorer/Action.OpenUrl.html).

- Selecting **Action.Submit** buttons on a card that doesn't include the *wait for a response* suffix show an error.

- Adaptive cards created using the *wait for response* actions can only be submitted once per card. The flow run  continues after the first response, and any further submissions are ignored.

- Only the information within the **Update message** input box show on the replacement card after consumers submit the card.

  Additional details, such as the user id of the person submitting the card, are available within the dynamic content in actions following the *wait for a response* action. However, it might be necessary to include the Office 365 Users connector in order to complete desired profile information for the user who submitted the card.

- Once the *wait for a response* adaptive cards are submitted, the card resets and then appears exactly the same, unless the replacement/update message area is configured. Update messages are a best practice. They're recommended in order to update others and prevent consumers from attempting to submit the card more than once.

    :::image type="content" source="media/adaptive-cards/update-message.png" alt-text="Screenshot of an update message.":::

The **Update Message** and the **Should update card** inputs must be configured if a replacement card is desired.

- Power Automate uses Microsoft adaptive cards' unique features and services to handle the cards within any host. This article is intended to clarify any specifics related to flow actions. You can also use the full documentation for [building adaptive cards](/adaptive-cards/).

## Related information

- [Create your first adaptive card](./create-adaptive-cards.md)
- [Microsoft Teams connector](/connectors/teams/)
- [Adaptive cards IO](/adaptive-cards)

[!INCLUDE[footer-include](includes/footer-banner.md)]