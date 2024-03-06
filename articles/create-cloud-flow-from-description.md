---
title: Create a cloud flow from a description (preview)
description: Learn to create a cloud flow from a written description of the scenario.
services: ''
suite: flow
author: natalie-pienkowska
contributors:
  - kartikraop
  - JoeFernandezMS
  - v-aangie
ms.author: kapolepa
ms.reviewer: angieandrews
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 03/10/2023
search.audienceType: 
  - flowmaker
  - enduser
  - ms.collection: 
    - bap-ai-copilot
---

# Create a cloud flow from a description (preview)

[This article is pre-release documentation and is subject to change.]

When you build automation with Power Automate, it might take valuable time to learn which actions and triggers you need, especially if you’re new to the Power Automate. If you want to jump right in and get started, you can now just write a description of what you want to automate in everyday language. Supporting most of the connectors, Power Automate then uses OpenAI Codex to translate your description into code, and then provides a corresponding flow that you can create instantly.

> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Prerequisites

- A work or school account with access to a Power Automate [environment](/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center) that's based in Europe or the United States.
  
  > [!NOTE]
  > - You can't create cloud flows from a description if you're logged in with a Microsoft account.
  > - If you don’t have access to an environment that's based Europe or the United States, you can [create a new environment and select Europe or United States](/power-platform/admin/create-environment#create-an-environment-in-the-power-platform-admin-center) as the region.

- Check current [limitations](#limitations) for more information.

## Create a flow from a description

In the following example, we'll build an automated cloud flow that sends a notification through Teams and an email each time someone responds to a Microsoft Forms survey.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the left pane, select **Create** > **Describe it to design it (preview)**.

    :::image type="content" source="media/easy-flow/describe-it-main.png" alt-text="Screenshot of the Describe it to design it (preview) tile.":::

   A screen opens where you can enter a description of what you want to automate. You'll also get an example you can use for inspiration and try it out right away. As an alternate, you can also go to **Home** and start describing your requirement. More information: [Create a flow using Copilot](get-started-with-copilot.md)

1. For this example, enter **Every time someone responds to a Microsoft Forms survey, post a message to Teams and send an email**.

1. Select **Confirm** (the right arrow).

    :::image type="content" source="media/easy-flow/confirm-button.png" alt-text="Screenshot of the Confirm button.":::

    Power Automate returns a suggested flow that corresponds to what you've entered.

    > [!NOTE]
    > If the suggestion doesn't correspond to what you’re looking to automate, select **This isn't what I'm looking for**. You'll get guidance on what you can do next. This helps Microsoft to improve the AI behind this feature.

      :::image type="content" source="media/easy-flow/describe-flow.png" alt-text="Screenshot that displays a suggested flow after providing a description of what to automate.":::

1. Select **Next**.

1. Set up all the connections needed to run the flow.

    :::image type="content" source="media/easy-flow/set-up-connections.png" alt-text="Screenshot of the connections that you might need to set up.":::

1. Select **Next**.

1. Enter the information needed to run the flow. For example, which form to use and to whom to send the Teams message and email. You can decide to fill in the information on this step or do it later in the designer.

1. Select **Create flow**.

   And there you have it! Your flow has been built. Congratulations! You can decide to make any modification and edit the flow, or save and test it.

    :::image type="content" source="media/easy-flow/generated-flow.png" alt-text="Screenshot of a cloud flow that's been built from a description.":::

## Limitations

- Power Automate supports descriptions written in the English language only. Descriptions you write in other languages might work, but they are not supported.

- Cloud flows are the only type of flow that you can create from a description.

- In the current version, the AI might not fill in some parameters automatically, even if you provide them in the description.
  
### See also

[Learn more about cloud flows](./overview-cloud.md)  
