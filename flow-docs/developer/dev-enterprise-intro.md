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

As a Microsoft partner or Independent Software Vendor (ISV), accelerate customer adoption by extending your products to integrate with your customers' data and business processes, and add and customize workflows to automate business processes as part of your application. After you have completed the below seven steps, your application will have the ability to leverage a robust cloud-scale workflow engine that can connect to 200+ different services.

| Phase | Step | When needed? |
| --- | --- | --- |
| Development | 1. Build a custom connector to your data | If you want to expose your own ISV data to PowerApps or Microsoft Flow |
| Development | 2. Add support for your application to authenticate users with Azure Active Directory (Azure AD) | If you want to embed the Microsoft Flow UI or list in Microsoft AppSource | 
| Development | 3. Embed the Microsoft Flow UI into your application using our web-based iframe | If you want to include flow creation or management in your application | 
| Development | 4. Create and publish flow templates | If you want to pre-build flows for your customers | 
| Development | 5. Add application logic to programmatically deploy flows | If you want to automatically deploy your pre-built flows for your customers | 
| Distribution | 6. Grant your customers licenses to Microsoft  Flow through the Microsoft Cloud Solution Provider program | If your customers don’t have Office 365 or Dynamics 365 licenses |
| Distribution | 7. List your solution on Microsoft AppSource | Recommended to increase the visibility of your ISV solution |

### 1. Connecting to your APIs OR Enabling customers to connect to your APIs

As an ISV, you often have proprietary data that you would like customers to access through your flows. You can expose access to any of your data through a custom connector. [Learn more](https://docs.microsoft.com/connectors/custom-connectors/)

Once created, there are two ways to make the connector available to your customers:
- The connector can be deployed into the customer’s tenant via REST APIs or PowerShell.
- To make the custom connector publicly available for all users, you can submit your connector for certification. [Learn more](https://docs.microsoft.com/connectors/custom-connectors/submit-certification)

### 2. Authentication 

To call REST APIs and embed authenticated UI, your application needs to use Azure AD federated single sign-on to authenticate end users and customers. [Go here](https://identity.microsoft.com/) for information on how to enable AAD federated SSO. We do not have support for unauthenticated access, or access with identity providers other than Azure AD. 

### 3. Embedding UI components

Embed Microsoft Flow within your app to enable deep, in-context integration between your app and all the other services that Microsoft Flow supports. [Learn more](embed-flow-dev.md)

### 4. Create and publish flow templates

Once you have a connector, you should publish templates that demonstrate how to use your service. These templates will serve as examples that users can use to learn and then extend to their own unique workflows. [Learn more](../publish-a-template.md)

### 5. Deployment

To give end users access to flows that they can use automatically, deploy the flows into the Azure AD tenant of the user. Use a deployment package that you deploy using our REST APIs or PowerShell. [Learn more](https://docs.microsoft.com/powerapps/export-import-packages)

### 6. Licensing

If your customers already have either Office 365 or Dynamics 365, and these licenses are associated with the identities that users log in with Azure AD, there are no additional licensing requirements for you. However, if your customers do not use Office 365 or Dynamics 365, then you must acquire use rights on their behalf for Microsoft Flow, so that they are licensed to leverage those embedded components in your application.

We offer the [Microsoft Cloud Solution Provider](https://partner.microsoft.com/cloud-solution-provider) program to acquire licenses on behalf of your customers. There are two different [pricing plans](https://flow.microsoft.com/pricing/) available for Microsoft Flow, which you should check for plan and feature details.

### 7. List on AppSource

Once you have integrated Microsoft Flow into your application, you can list it on AppSource. With AppSource you can generate new leads for your business by building an app and publishing it to AppSource for new customers to test-drive. [Learn more](dev-appsource-test-drive.md)
