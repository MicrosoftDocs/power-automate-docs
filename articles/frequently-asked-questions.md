---
title: Frequently asked questions | Microsoft Docs
description: Answers to several common questions about Power Automate
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/18/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Frequently asked questions

## Audience and strategy
### What is Power Automate?
Power Automate is a cloud-based service that makes it practical and simple for line-of-business users to build workflows that automate time-consuming business tasks and processes across applications and services.

### Who is the intended audience for Power Automate?
Power Automate has two distinct audiences:

* Line-of-business “Citizen Integrators” in enterprise organizations who partner with IT to move responsibility for business solutions closer to the business itself.
* IT decision makers who want to empower line-of-business partners to create their own solutions so IT professionals and integration specialists can focus their expertise on more advanced integration tools, such as Azure Logic Apps.

### How do Power Automate and Logic Apps relate to each other?
Power Automate provides features that help line-of-business users create automated workflows. Logic Apps is an Azure service that provides the same great features of Power Automate, plus features such as integration with Azure Resource Manager and the Azure Portal, PowerShell and xPlat CLI, Visual Studio, and additional connectors. [Learn more about Logic Apps](https://azure.microsoft.com/services/app-service/logic/).

### How does Power Automate fit in Microsoft’s overall business application platform strategy?
Power Automate is part of a powerful and adaptable business application platform that includes Power Apps, Common Data Service, Dynamics 365, and Office 365. This platform allows our customers, our partners, and our ISV partners to create purpose-built solutions for their own companies, their industry, for functional roles or even for specific geographies. Line-of-business users, who understand their business needs best, can now easily analyze, compose, and streamline data and processes. Professional developers can easily extend the automation, analytics and apps line-of-business to leverage Azure services like Functions, App Service, and Logic Apps. API connectors, gateways, and Common Data Service make it possible to get more value out of services or data already in use, either in the cloud or on-premises.

## Functionality

### What do I need to use Power Automate?
To use Power Automate, all you need is a web browser and an email address.

### What browsers and devices can I use with Power Automate?

You can run Power Automate on all modern devices, and browsers.

#### Supported devices

Power Automate runs great on modern devices. If you need to manage Power Automate from a mobile device, try the Power Automate mobile app that's available on [iPhone](https://itunes.apple.com/app/microsoft-flow/id1094928825?ls=1&mt=8), [Android](https://play.google.com/store/apps/details?id=com.microsoft.flow), and [Windows Phone](https://www.microsoft.com/p/microsoft-flow/9nkn0p5l9n84?rtc=1#activetab=pivot:overviewtab).

#### Supported browsers

We recommend that you use the most up-to-date browser that's compatible with your operating system. We support the following browsers:

* Microsoft Edge
* Internet Explorer 11
* Safari
* Chrome
* Firefox

### Which email addresses are supported?
Power Automate supports email addresses that end with anything except .gov and .mil.  

### Is Power Automate available on-premises?
Power Automate is a public cloud service only. However, you can securely connect to your own on-premises services through the on-premises data gateway.

### What services can Power Automate connect to?
Power Automate connects to more than 100 data sources out of the box, and we’re adding more all the time. Some examples of data sources and services include the following:

* SharePoint
* Dynamics 365
* OneDrive
* OneDrive for Business
* Google Drive
* Google Sheets
* Trello
* Twitter
* Box
* Facebook
* SalesForce.com
* Mailchimp
* Customer APIs

You can find a full list of available connectors [here](/connectors/).

You can access data sources in your own IT infrastructure through the [on-premises data gateway](gateway-manage.md).

### What are templates?

Templates are pre-built flows for popular and common scenarios. Using a template only requires you to have access to the services in the template and to fill out any required settings.

### What data sources will I be able to connect to?

You can connect to more than 100 standard services from Microsoft and third parties, such Office 365, Twitter, SharePoint, OneDrive, Dropbox, SQL Server, and more. You can also connect to premium services such as Salesforce and Common Data Service.

### How do I connect to a REST API in my flow?

You can connect to any REST API that uses JSON and supports at least one of more than 10 authentication methods by creating [a custom connector](developer/register-custom-api.md).

### How do I connect to SQL Server and other on-premises data sources?

You can connect to services on your local network using the [on-premises data gateway](gateway-manage.md).

### Can I share the flows I create?

You can share flows in either of these ways:

* You can add co-workers or groups in your organization as owners on your flows, so they can also edit and manage the flow.
* For flows that can be run manually, you can also grant other people or groups in your organization permission to just run the flow.

### How many flows can I have?

You can create an unlimited number of flows, depending on the [type of license](https://flow.microsoft.com/pricing) you hold.

### Where do I get started with Power Automate?

Get started with the following resources:

* [Blog](https://flow.microsoft.com)
* [YouTube channel](https://youtube.com/playlist?list=PL8nfc9haGeb55I9wL9QnWyHp3ctU2_ThF)
* [Topic](getting-started.md)
* [Community](https://powerusers.microsoft.com)

### What operating systems does the mobile app for Power Automate support?

The Power Automate mobile app is available on [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows).

### Can flows be turned off or disabled?

Yes, each flow has an on/off switch that enables you to stop the flow from processing requests.

See the following table to understand how your flow responds when it's turned back on.

Trigger type|Description
-------|--------
Polling, such as the **Recurrence** trigger|When the flow is turned on again, all unprocessed/pending events are processed. Delete your flow if you don't want to process pending items.
Webhook|When the flow is turned on again, it only processes new events that are generated after the flow is turned on.

### What regions and languages does Power Automate support?

Power Automate is available in 42 languages and [six regions](regions-overview.md). To see the languages that are available:

1. Sign into the [Power Platform admin center > Environments](https://admin.powerplatform.microsoft.com/environments)
1. Select your environment
1. Select **Settings** on the top menu bar.
1. Select **Product > Languages**

### How does Power Automate compare to SharePoint Designer 2013?

Power Automate is the successor to SharePoint Designer for many common business scenarios such as approvals, document review, and onboarding/offboarding. It will be the default tool for building business automation in SharePoint moving forward.

### How does Power Automate ensure that corporate data isn't accidentally released to social media services?

Administrators can create [data loss prevention policies](/power-platform/admin/prevent-data-loss) to ensure that only sanctioned services are used in Power Automate.

### Does Power Automate support service accounts?

While you can create flows with a service account, we don't recommend doing so if the credentials for the service account are shared.

## Licensing
### Will Power Automate still have a free or trial option?
Yes. You can use our free offering, which has limited user rights, or you can sign up for a free 90-day trial of Power Automate. You can activate your subscription at any time during your trial.

### What pricing plans do you offer?
Power Automate offers both free and paid service levels. [Learn more about pricing](billing-questions.md).

## Learn more

* Take a [guided learning tour](/learn/paths/automate-process-using-flow) of Power Automate
* Learn the basics of Power Automate in the [getting started guide](getting-started.md)


[!INCLUDE[footer-include](includes/footer-banner.md)]