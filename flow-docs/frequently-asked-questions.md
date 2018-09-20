---
title: Frequently asked questions | Microsoft Docs
description: Answers to several common questions about Microsoft Flow
services: ''
suite: flow
documentationcenter: na
author: stepsic-microsoft-com
manager: anneta
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 03/15/2017
ms.author: stepsic
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Frequently asked questions
## Audience and strategy
### What is Microsoft Flow?
Microsoft Flow is a cloud-based service that makes it practical and simple for line-of-business users to build workflows that automate time-consuming business tasks and processes across applications and services.

### Who is the intended audience for Microsoft Flow?
Microsoft Flow has two distinct audiences:

* Line-of-business “Citizen Integrators” in enterprise organizations who partner with IT to move responsibility for business solutions closer to the business itself.
* IT decision makers who want to empower line-of-business partners to create their own solutions so IT professionals and integration specialists can focus their expertise on more advanced integration tools, such as Azure Logic Apps.

### How do Microsoft Flow and Logic Apps relate to each other?
Microsoft Flow provides features that help line-of-business users create automated workflows. Logic Apps is an Azure service that provides the same great features of Microsoft Flow, plus features such as integration with Azure Resource Manager and the Azure Portal, PowerShell and xPlat CLI, Visual Studio, and additional connectors. [Learn more about Logic Apps](https://azure.microsoft.com/services/app-service/logic/).

### How does Microsoft Flow fit in Microsoft’s overall business application platform strategy?
Microsoft Flow is part of a powerful and adaptable business application platform that includes PowerApps, the Common Data Service, Dynamics 365, and Office 365. This platform allows our customers, our partners, and our ISV partners to create purpose-built solutions for their own companies, their industry, for functional roles or even for specific geographies. Line-of-business users, who understand their business needs best, can now easily analyze, compose, and streamline data and processes. Professional developers can easily extend the automation, analytics and apps line-of-business to leverage Azure services like Functions, App Service, and Logic Apps. API connectors, gateways and the Microsoft Common Data Service make it possible to get more value out of services or data already in use, either in the cloud or on-premises.

## Functionality
### What do I need to use Microsoft Flow?
To use Microsoft Flow, all you need is a web browser and an email address.

### What browsers and devices can I use with Microsoft Flow?

You can run Microsoft Flow on all modern devices, and browsers.

#### Supported devices

Microsoft Flow runs great on modern devices. If you need to manage Microsoft Flow from a mobile device, try the Microsoft Flow mobile app that's available on [iPhone](https://itunes.apple.com/app/microsoft-flow/id1094928825?ls=1&mt=8), [Android](https://play.google.com/store/apps/details?id=com.microsoft.flow), and [Windows Phone](https://www.microsoft.com/p/microsoft-flow/9nkn0p5l9n84?rtc=1#activetab=pivot:overviewtab).

#### Supported browsers

We recommend that you use the most up-to-date browser that's compatible with your operating system. We support the following browsers:

* Microsoft Edge
* Internet Explorer 11
* Safari
* Chrome
* Firefox

### Which email addresses are supported?
Microsoft Flow supports email addresses that end with anything except .gov and .mil.  

### Is Microsoft Flow available on-premises?
Microsoft Flow is a public cloud service only. However, you can securely connect to your own on-premises services through the on-premises data gateway.

### What services can Microsoft Flow connect to?
Microsoft Flow connects to more than 100 data sources out of the box, and we’re adding more all the time. Some examples of data sources and services include the following:

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

You can find a full list of available connectors [here](https://go.microsoft.com/fwlink/?LinkId=832211).

You can access data sources in your own IT infrastructure through the [on-premises data gateway](gateway-manage.md).

### What are templates?
Templates are pre-built flows for popular and common scenarios. Using a template only requires you to have access to the services in the template and to fill out any required settings.

### What data sources will I be able to connect to?
You can connect to more than 100 standard services from Microsoft and third parties, such Office 365, Twitter, SharePoint, OneDrive, Dropbox, SQL Server, and more. You can also connect to premium services such as Salesforce and the Common Data Service for PowerApps.

### How do I connect to a REST API in my flow?
You can connect to any REST API that uses JSON and supports at least one of more than 10 authentication methods by creating [a custom connector](developer/register-custom-api.md).

### How do I connect to SQL Server and other on-premises data sources?
You can connect to services on your local network using the [on-premises data gateway](gateway-manage.md).

### Can I share the flows I create?
You can share flows in either of these ways:

* You can add co-workers or groups in your organization as owners on your flows, so they can also edit and manage the flow.
* For flows that can be run manually, you can also grant other people or groups in your organization permission to just run the flow.

### How many flows can I have?
Microsoft Flow comes with up to 50 flows. If you need more, you can request them.

### Where do I get started with Microsoft Flow?
Get started with the following resources:

* [Blog](https://flow.microsoft.com)
* [YouTube channel](https://youtube.com/playlist?list=PL8nfc9haGeb55I9wL9QnWyHp3ctU2_ThF)
* [Topic](getting-started.md)
* [Community](https://powerusers.microsoft.com)

### What operating systems does the mobile app for Microsoft Flow support?
The Microsoft Flow mobile app is available on [Android](https://aka.ms/flowmobiledocsandroid), [iOS](https://aka.ms/flowmobiledocsios), or [Windows Phone](https://aka.ms/flowmobilewindows).

### Can flows be turned off or disabled?

Yes, each flow has an on/off switch that enables you to stop the flow from processing requests.

See the following table to understand how your flow responds when it's turned back on.

Trigger type|Description
-------|--------
Polling, such as the **Recurrence** trigger|When the flow is turned on again, all unprocessed/pending events are processed.
Webhook|When the flow is turned on again, it only processes new events that are generated after the flow is turned on.

### What regions and languages does Microsoft Flow support?
Microsoft Flow is available in 42 languages and [six regions](regions-overview.md).

### How does Microsoft Flow compare to SharePoint Designer 2013?
Microsoft Flow is the successor to SharePoint Designer for many common business scenarios such as approvals, document review, and onboarding/offboarding. It will be the default tool for building business automation in SharePoint moving forward.

### How does Microsoft Flow ensure that corporate data isn't accidentally released to social media services?
Administrators can create [data loss prevention policies](prevent-data-loss.md) to ensure that only sanctioned services are used in Microsoft Flow.

### Does Microsoft Flow support service accounts?

While you can create flows with a service account, we don't recommend doing so if the credentials for the service account are shared.

## Licensing
### Will Microsoft Flow still have a free or trial option?
Yes. You can use our free offering, which has limited user rights, or you can sign up for a free 90-day trial of Microsoft Flow. You can activate your subscription at any time during your trial.

### What pricing plans do you offer?
Microsoft Flow offers both free and paid service levels. [Learn more about pricing](billing-questions.md).

## Learn more

* Take a [guided learning tour](guided-learning/index.yml) of Microsoft Flow
* Learn the basics of Microsoft Flow in the [getting started guide](getting-started.md)
