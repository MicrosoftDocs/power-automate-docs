---
title: Submit for certification as an API Connector | Microsoft Docs
description: By certifying a connector, it becomes available to all users of Microsoft Flow, PowerApps and Logic Apps.
services: ''
suite: flow
documentationcenter: na
author: asavaritayal
manager: anneta
editor: ''
tags: ''

ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/19/2017
ms.author: astay

---
# Submit your connectors for Microsoft certification
To make custom connectors publicly available for all users 
in Microsoft Flow, Azure Logic Apps and Microsoft PowerApps, 
submit your connector to Microsoft for review, validation, 
and approval for publishing. 

## Certification criteria
| Capability | Details | Required or Recommended |
| --- | --- | --- |
| Software-as-a-Service (SaaS) app |Meets a user scenario that fits well with Logic Apps, Flow, and PowerApps. |Required |
| Authentication Type |Your API must support OAuth2, API Key, or Basic Authentication. |Required |
| Support |You must provide a support contact so that customers can get help. |Required |
| Availability and uptime |Your app has at least 99.9% uptime. |Recommended |
|  | | |

Also, if you're not a Microsoft partner or Independent Software Vendor (ISV), 
and you want to certify and publicly release a connector, 
you must either own the underlying service or present explicit 
rights to use the API.

To be certified, your connector is reviewed in two phases: 

1. Functionality Validation
   
    The custom connector is evaluated for:
   
   * Invalid swagger or JSON errors in the Definition section of the custom connector wizard
   * Runtime and schema validation errors in the Testing section of the wizard
     
     Consequently, each operation is thoroughly tested in Flow, Logic Apps and PowerApps for any client-side errors.
2. Content Validation
   
    A well written connector uses friendly names and descriptions for each entity. We evaluate your swagger to ensure that each operation, input parameter and response attribute contains:
   
   * [Summary](../logic-apps/custom-connector-openapi-extensions.md#summary)
   * [Description](../logic-apps/custom-connector-openapi-extensions.md#description)
   * [Visibility information](../logic-apps/custom-connector-openapi-extensions.md#visibility)

## Nominate and submit your connector to Microsoft for certification
To apply for certification, follow these steps:

1. **Nominate**
   
   1. [Submit your nomination](https://go.microsoft.com/fwlink/?linkid=848754).
   2. Sign the mutual Non-Disclosure Agreement and Partner Agreement that you receive. 
      Microsoft requires these signed contracts before proceeding. 
      We can then check whether your connector meets the certification criteria. 
   3. If your connector is approved, Microsoft notifies you 
      with instructions for onboarding.
2. **Review**
   
   1. Send this information to your nomination contact for review:
      
      * The OpenAPI file that describes your API
      * The icon file (.png or .jpg) that represents your connector. (Your icon should have a ~160 pixel logo inside a 230 pixel square. A white logo on a colored background is preferred.)
      * Your icon's brand color in hexadecimal format, 
        which should match the colored background in the icon file
      * A test account for validation
      * A support contact
   2. If we need more information, 
      we will contact you.
3. **Publish**
   
    After we validate your connector's functionality and content, we stage the connector for deployment across all products and regions. Typically, it takes up to 3 weeks for the certification and deployment process.
   
    By default, all connectors are published as "premium." 
    If you built your app with Azure, you can apply for 
    listing your connector as a "standard" connector that's 
    available to all users with Office 365 Enterprise plans. 
    For more details, ask your nomination contact.

