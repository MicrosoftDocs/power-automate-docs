---
title: Create custom connectors and embed flows| Microsoft Docs
description: Create a custom connector, share it, embed a cloud flow, and do much more.
services: ''
suite: flow
documentationcenter: na
author: MSFTMAN
manager: KVIVEK
ms.author: Deonhe
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/22/2017
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Start to build with Power Automate


Here are some of the ways you can extend your application with Power Automate:

* Create and connect to a custom connector.
* Share your custom connector with all Power Automate users.
* Embed the flow experience within an app.
* Highlight all custom connectors so that users can interact with Power Automate in the best way for them.

## Prerequisites

* A [Power Automate](https://flow.microsoft.com) account.

## Create a custom connector

If you have a web service to which you want to connect from Power Automate, you'll first need to create a custom connector. When you register a custom connector, you teach Power Automate about the characteristics of your web service, including the authentication it requires, the triggers and actions that it supports, and the parameters and outputs for each of those actions.

Follow this tutorial to learn how to [Register and use custom connectors](https://powerapps.microsoft.com/tutorials/register-custom-api/). After you register your custom connector, you can share it within your organization for testing.

## Share a custom connector with all Power Automate users

After you fully test your custom connector, start the [review process](https://flow.microsoft.com/blog/calling-all-saas-apps-now-you-can-build-your-own-connector-for-flow-and-logic-apps/) to have it approved by Microsoft for sharing with all other Power Automate users.

Here's what you'll need for the review process:

* An OpenAPI file that represents your API and any authentication information.
* An icon for your connector.
* A description of your connector.
* Approximately 10 ideas for how your connector could benefit other users through templates.

After you submit this information, Microsoft starts assessing your API's functionality in Power Automate and Microsoft Power Apps.

## Embed the flow experience into your website or app

You can [embed](developer/embed-flow-dev.md) Power Automate into your app to enable deep, in-context integration between your app and all other services that Power Automate supports. For example, you can:

* Browse all templates that relate to your service and let users select a template.
* Manage the flows that users have related to your app.

## Next steps

Learn how to [embed](developer/embed-flow-dev.md) Power Automate into your app.


[!INCLUDE[footer-include](includes/footer-banner.md)]