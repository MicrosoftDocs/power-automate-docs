---
title: Microsoft Flow for enterprise developers, ISVs, and partners | Microsoft Docs
description: An introduction to developing solutions for Microsoft Flow.
services: ''
suite: flow
documentationcenter: na
author: mgblythe
manager: anneta
editor: ''
tags: ''

ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/31/2018
ms.author: mblythe

---
# Microsoft Flow for enterprise developers, ISVs, and partners

As a developer, you can extend Microsoft Flow, enabling even more powerful solutions for organizations and customers.

## Microsoft Flow for enterprise developers

As an enterprise developer, empower your organization to build robust tailored solutions on Microsoft Flow:

- **Build custom connectors**: Develop custom connectors to connect to your organization's data and web services through Microsoft Flow. [Learn more](https://docs.microsoft.com/connectors/custom-connectors/)

- **Build Azure Functions**: Craft Azure Functions to extend apps with custom server-side logic. [Learn more](https://docs.microsoft.com/azure/azure-functions/functions-flow-scenario)

- **Embed Microsoft Flow**: Embed Microsoft Flow directly into your website experiences to create integrated solutions, surfacing workflows or processes where people in your organization already do their work. [Learn more](embed-flow-dev.md)

## Microsoft Flow for ISVs and Microsoft partners

As a Microsoft partner or ISV, accelerate customer adoption by extending your products to integrate with your customers' data and business processes, and add and customize workflows to automate business processes as part of your application. After you have completed the below seven steps, your application will have the ability to leverage flows that can connect to 200+ different services.

| Phase | Step | When needed? |
| --- | --- | --- |
| Development | 1. Build a Custom Connector to your ISV’s data | If you want to expose your own ISV data to the PowerApps or flows |
| Development | 2. Add support for your application to authenticate users with Azure AD | If you want to embed Microsoft Flow UI or list in App Source | 
| Development | 3. Embed the Microsoft Flow UI into your application using our web-based iframe | If you want to include flow creation or management into your application | 
| Development | 4. Create and publish flow templates | If you want to pre-build flows for your customers | 
| Development | 5. Add application logic to programmatically deploy flows | If you want to automatically deploy your pre-built flows for your customers | 
| Distribution | 6. Grant your customers licenses to Microsoft  Flow through the Microsoft Cloud Solution Provider program | If your customers don’t have Office 365 or Dynamics 365 licenses |
| Distribution | 7. List your solution on Microsoft AppSource | Recommended to increase the visibility of your ISV solution |

### 1. Connecting to your ISV's APIs

ISVs often have proprietary data that you want to be able to access from inside of the flows that you want your customers to use. You can expose access to any of your data through a Custom Connector. [Learn more](https://docs.microsoft.com/connectors/custom-connectors/submit-certification)

Once created, the custom connectors will have to be deployed into the customer’s tenant via REST APIs or PowerShell, or you can go through the certification process to list a Connector in the public list.

### 2. Authentication 

The ISV Cloud Embed program works for any ISV that allows Azure Active Directory federated single sign-on its end users or customers. The user interface embedding, as well as programmatic access to deployment, both require the use of Azure AD authentication on behalf of the end users.

We do not have support unauthenticated access, or access with identity providers other than Azure AD.  

### 3. Embedding UI Components

Embed Microsoft Flow within your app to enable deep, in-context integration between your app and all the other services that Microsoft Flow supports. [Learn more](embed-flow-dev.md)

### 4. Create and publish flow templates

Once you have a connector, you should publish templates that demonstrate how to use your service. These templates will serve as examples that users can use to learn and then extend to their own unique workflows. [Learn more](publish-a-template.md)

### 5. Deployment

For your end users to have flows that they can use automatically, you can deploy them into the Azure AD tenant of the user. To create a Package for deployment [see this article](https://docs.microsoft.com/powerapps/export-import-packages).

Then, you can deploy it using either the REST APIs, or PowerShell.

### 6. Licensing

If your customers already have either Office 365 or Dynamics 365, and these licenses are associated with the identities that users log in with Azure AD, there are no additional licensing requirements for you. However, if your customers do not use Office 365 or Dynamics 365, then you must acquire use rights on their behalf for Microsoft Flow, so that they are licensed to leverage those embedded components in your application.

We offer the Microsoft Cloud Solution Provider program to acquire licenses on behalf of your customers. [Read more about becoming a CSP here](https://partner.microsoft.com/en-US/cloud-solution-provider).

There are two different plans available for Microsoft Flow, you can [read more about the different plans here](https://flow.microsoft.com/pricing/).  

### 7. List on AppSource

Once you have integrated Microsoft Flow into your application, you can list it on Microsoft App Source. With AppSource you can generate new leads for your business by building an app and publishing it to AppSource for new customers to test-drive. [Learn more](dev-appsource-test-drive.md).

