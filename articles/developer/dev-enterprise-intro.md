---
title: Power Automate for enterprise developers, ISVs, and partners
description: An introduction to developing solutions for Power Automate.
author: v-aangie
ms.service: power-automate
ms.subservice: developer
ms.topic: article
ms.date: 08/28/2026
ms.author: angieandrews
ms.reviewer: cyanderson
search.audienceType: 
  - developer
---

# Power Automate for enterprise developers, ISVs, and partners

As a developer, you can extend Power Automate, enabling even more powerful solutions for organizations and customers.

## Power Automate for enterprise developers

As an enterprise developer, empower your organization to build robust tailored solutions on Power Automate:

- **Build custom connectors**: Develop custom connectors to connect to your organization's data and web services through Power Automate. [Learn more](/connectors/custom-connectors/)

- **Build Azure Functions**: Craft Azure Functions to extend apps with custom server-side logic. [Learn more](/azure/azure-functions/app-service-export-api-to-powerapps-and-flow)

- **Embed Power Automate**: Embed Power Automate directly into your website experiences to create integrated solutions, surfacing workflows or processes where people in your organization already do their work. [Learn more](embed-flow-dev.md)

- **Run desktop flows**: Integrate desktop flows directly into your product to enable robotic process automation in your solutions. [Learn more](desktop-flow-public-apis.md)

## Power Automate for ISVs and Microsoft partners

As a Microsoft partner or Independent Software Vendor (ISV), accelerate customer adoption by extending your products to integrate with your customers' data and business processes. Add and customize workflows to automate business processes as part of your application. After you complete the following eight steps, your application can use a robust cloud-scale workflow engine that connects to more than 200 different services.

| Phase | Step | When needed? |
| --- | --- | --- |
| Development | 1. Build a custom connector to your data | If you want to expose your own ISV data to Power Apps or Power Automate |
| Development | 2. Add support for your application to authenticate users with Microsoft Entra ID | If you want to embed the Power Automate UI, integrate with desktop flows, or list in Microsoft Marketplace |
| Development | 3. Embed the Power Automate UI into your application using our web-based IFrame | If you want to include flow creation or management in your application |
| Development | 4. Integrate with desktop flow APIs | If you want to include desktop flow (RPA) capabilities programmatically within your applications |
| Development | 5. Create and publish flow templates | If you want to prebuild flows for your customers |
| Development | 6. Add application logic to programmatically deploy flows | If you want to automatically deploy your prebuilt flows for your customers |
| Distribution | 7. Grant your customers licenses to Microsoft Flow through the Microsoft Cloud Solution Provider program | If your customers don't have Office 365 or Dynamics 365 licenses |
| Distribution | 8. List your solution on Microsoft Marketplace | It's recommended to increase the visibility of your ISV solution |

### 1. Connecting to your APIs or enabling customers to connect to your APIs

As an ISV, you often have proprietary data that you want customers to access through your flows. You can expose access to any of your data through a custom connector. Learn more in [custom connectors](/connectors/custom-connectors/).

After you create the connector, you can make it available to your customers in two ways:

- Deploy the connector into the customer's tenant via REST APIs or PowerShell.
- Submit your connector for certification to make the custom connector publicly available for all users. Learn more in [custom connector certification](/connectors/custom-connectors/submit-certification)

### 2. Authentication

To call REST APIs and embed authenticated UI, your application needs to use Microsoft Entra federated single sign-on to authenticate end users and customers. Go to [Microsoft identity platform](https://identity.microsoft.com/) for information on how to enable Microsoft Entra federated SSO. There's no support for unauthenticated access, or access with identity providers other than Microsoft Entra.

### 3. Embedding UI components

Embed Power Automate within your app to enable deep, in-context integration between your app and all the other services that Power Automate supports. Learn more in [embedding flows in your app](embed-flow-dev.md).

### 4. Running desktop flows

Integrate desktop flow capabilities to enable robotic process automation through your applications, listing, running, and canceling desktop flows created by you or your customers. Learn more in [desktop flow public APIs](desktop-flow-public-apis.md).

### 5. Create and publish flow templates

Once you have a connector, publish templates that demonstrate how to use your service. These templates serve as examples that users can use to learn and then extend to their own unique workflows. Learn more in [publishing a template](../publish-a-template.md)

### 6. Deployment

To give end users access to flows that they can use automatically, deploy them into the Microsoft Entra tenant of the user. Use a deployment package that you deploy by using REST APIs or PowerShell. Learn more in [exporting and importing packages](/powerapps/administrator/export-import-packages)

### 7. Licensing

If your customers already have either Office 365 or Dynamics 365, and these licenses are associated with the identities that users sign in with Microsoft Entra ID, there are no other licensing requirements for them to use standard connectors. Your users need one of the [Power Automate licenses](https://make.powerautomate.com/pricing/) to use premium and custom connectors. If your customers don't use Office 365 or Dynamics 365, then you must acquire use rights on their behalf for Power Automate, so that they're licensed to use those embedded components in your application.

We offer the [Microsoft Cloud Solution Provider](https://partner.microsoft.com/cloud-solution-provider) program to acquire licenses on behalf of your customers. There are different [pricing plans](https://make.powerautomate.com/pricing/) available for Power Automate, which you should check for plan and feature details.

See also: [Overview of Power Automate licensing](/power-platform/admin/power-automate-licensing/overview)

### 8. List on Marketplace

When you integrate Power Automate into your application, you can list it on Marketplace. By using Marketplace, you can generate new leads for your business by building an app and publishing it to Marketplace for new customers to test-drive. Learn more in [test-driving your app on AppSource](dev-appsource-test-drive.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
