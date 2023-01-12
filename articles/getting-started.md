---
title: Get started with Power Automate | Microsoft Docs
description: Quick ways to start automating your work and life with Power Automate.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/01/2021
ms.author: deonhe
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: intro-internal
---

# Get started with Power Automate

Welcome! What can you expect from Power Automate? Here are a few examples of what you can do with Power Automate.

* Automate business processes
* Send automatic reminders for past due tasks
* Move business data between systems on a schedule
* Connect to more than 500 data sources or any publicly available API
* You can even automate tasks on your local computer like computing data in Excel. 

Just think about time saved once you automate repetitive manual tasks simply by recording mouse clicks, keystrokes and copy paste steps from your desktop! Power Automate is all about automation.

## Who is Power Automate for?

*What skills do you need to have?*
Anyone from a basic business user to an IT professional can create automated processes using Power Automate's no-code/low-code platform.

*What industries can benefit from Power Automate?*
Check out how some companies implemented Microsoft Power Platform solutions using Power Automate in: 

  * [Banking](https://customers.microsoft.com/story/821782-illimity-bank-banking-power-automate)
  * [Retail](https://customers.microsoft.com/story/drivetime-retail-consumer-goods-azure)
  * [Manufacturing](https://customers.microsoft.com/story/810656-hexion-manufacturing-power-platform)
  * [Insurance](https://customers.microsoft.com/story/811345-aioi-nissay-dowa-insurance-microsoft-power-platform)
  * [Healthcare](https://customers.microsoft.com/story/vnshs-health-provider-microsoft-flow) 

Find [examples from your industry](https://customers.microsoft.com/en-us/search?sq=%22Power%20Automate%22&ff=story_product_categories%26%3EPower%20Automate&p=0&so=story_publish_date%20desc)

The first step in creating an automation is to [sign up](sign-up-sign-in.md), or, if you already have an account with Power Automate, [sign in](https://flow.microsoft.com/signin).

## Create a flow

Power Automate interface allows you to quickly and easily create cloud flows and use templates to solve your business needs, such as:

- Start creating a flow directly on the Power Automate **Home** page and **Create** page.
- Receive guided instruction for building your flow.
- Find a template that addresses your needs by filtering through selections.
- Automate your flows with new options in the **New flow** dropdown menu.

> [!NOTE]
> The following steps describe the new experience to create flows using Power Automate. The rest of the Power Automate documentation will be updated soon to reflect this new experience.

You can start creating a flow as soon as you sign in to Power Automate by selecting **Create** at the top of the **Home** page.

:::image type="content" source="media/create-experience-preview/create-button.png" alt-text="Screenshot of the Create button on the top banner of the home page.":::

You can then choose your path for creating a flow. Your two choices are to start with a template to find prebuilt flows, or build your own custom automation.

:::image type="content" source="media/create-experience-preview/choose-path.png" alt-text="Screenshot of the two paths, which are to start with a template or build your own.":::

If you want even more ways to automate, select **Create** on the menu to the left. You'll see the same two options at the top of the screen and some additional options at the bottom. The following selections allow you to automate repetitive desktop processes, add intelligence to automation, analyze and optimize business processes, and describe and build using your own words.

- **Power Automate for desktop**: Drag-and-drop or record the steps of a task to automate your process.
- **AI Builder**: Accelerate digital transformation for complex scenarios with artificial intelligence.
- **Process advisor**: Record and analyze processes to discover inefficiencies and make improvements.
- **You describe it, AI builds it**: Transform your everyday words into a cloud flow (preview).

## Start with a template

Power Automate makes intelligent choices to find the prebuilt templates that align best with your needs. It does this by filtering out the templates that won't work for you, leaving you with only the templates that might meet your business goals.

When you select **Start with a template**, the **Find a template** screen displays. This screen allows you to set filters to show as many templates as you want, and search for templates using keywords.

:::image type="content" source="media/create-experience-preview/filter-by.png" alt-text="Screenshot of choosing filters and using keywords.":::

For example, if you select **Microsoft Dataverse** in the **Filter by** group, you'll get a list of many templates to choose from. If you're looking for Dataverse templates that include email, you can type **email** in the **Search by keywords** list.

You can also filter by connector name, template category, and publisher name. To customize your filter with these options, select **More filters** on the **Find a template** screen.

To learn more, go to [Create a cloud flow from a template](get-started-logic-template.md).

## Build your own

If you select **Build your own**, Power Automate will guide you in selecting your triggers, actions, and connectors.

:::image type="content" source="media/create-experience-preview/connectors.png" alt-text="Screenshot of building your flow with triggers, actions, and connectors.":::

To learn how to build your own flow, go to [Create a cloud flow from scratch](get-started-logic-flow.md). To learn about triggers, go to [Get started with triggers](triggers-introduction.md). For an overview of connectors, go to [Connectors overview](/connectors/connectors).

## Flow menu options

If you're already working in the **My flows** screen, you can stay where you are and create a new template from the **New flows** menu. You can start with a template, or build your own automation with the same interface used on the home screen. The menu also gives you the option to create a desktop flow, or a flow that uses a description of what you want to automate in everyday language.

:::image type="content" source="media/create-experience-preview/my-flows.png" alt-text="Screenshot of the options in the New flow menu in the My flows screen.":::

To learn about desktop flows, go to [Introduction to desktop flows](desktop-flows/introduction.md). To learn how to use AI to build your flow, go to [Create a cloud flow from a description (preview)](create-cloud-flow-from-description.md).

## What are the different types of flows?

Visit the [flow types](flow-types.md) article to learn more about the different types of flows that you can create to automate your tasks.

## Find your flows easily

When your creative juices start *flowing*, you might create many flows. Don't worry, finding your flows is easy - just use the search box on the **My flows**, **Team flows**, **Connections**, or **Solutions** screen to display only flows that match the search terms you enter.

![Filter or search flows.](media/getting-started/filter-search-box.png)
 
> [!NOTE]
> The search filter only finds flows that have been loaded into the page. If you don't find your flow, try selecting **Load more** at the bottom of the page.

## Peek at the code

You don't need to be a developer to create flows; however, Power Automate does provide a **Peek code** feature that allows anyone to take a closer look at the code that's generated for all actions and triggers in a cloud flow. Peeking at the code could give you a clearer understanding of the data that's being used by triggers and actions. Follow these steps to peek at the code that's generated for your flows from within the Power Automate designer:

1. Select the **...** menu item at the top right corner of any **action** or **trigger**.
1. Select **Peek code**.

    ![Peek code.](media/getting-started/peek-code.png)

1. Notice the full JSON representation of the actions and triggers. This includes all inputs, such as the text you enter directly, and expressions used. You can select expressions here and then paste them into the **Dynamic Content** expression editor. This can also give you a way to verify the data you expect is present in the flow.

    ![Peek code details.](media/getting-started/peek-code-details.png)

## Get notifications when something's wrong

Visit the cloud flow activity page to see the list of cloud flows that recently ran, sent notifications, or have failed.

1. Sign into [Power Automate](https://powerautomate.com).
1. Select **Monitor** on the left side of the screen.
1. Select **Cloud flow activity**.

   ![Notification center.](media/getting-started/cloud-flow-activity.png)

## Use the mobile app

Download the Power Automate mobile app for [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows). With this app, you can [monitor flow activity](mobile-monitor-activity.md), [manage your flows](mobile-manage-flows.md) and [create flows from templates](mobile-create-flow.md).

## Get help planning your Power Automate projects

If you're ready to start your Power Automate project, visit the [guidance and planning article](./guidance/planning/introduction.md) to get up and running quickly.

## We're here to help

We're excited to see what you do with Power Automate, and we want to ensure you have a great experience. Be sure to check out our [guided learning](https://flow.microsoft.com/guided-learning/) tutorials and [join our community](https://go.microsoft.com/fwlink/?LinkID=787467) to ask questions and share your ideas. [Contact support](https://go.microsoft.com/fwlink/?LinkID=787479) if you run into any issues.

[!INCLUDE[footer-include](includes/footer-banner.md)]
