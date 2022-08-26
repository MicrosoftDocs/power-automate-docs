---
title: Prepare and set up SAP integration with Power Platform
description: Learn about the requirements to configure SAP integration, and prepare your on-premises SAP infrastructure to connect with Power Platform.
services: ''
suite: flow
documentationcenter: na
author: EllenWehrle
manager: jongilman
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/19/2022
ms.author: ellenwehrle
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

## Requirements 

The following requirements need to be established before testing can begin. Please let your Power Automate contact know if you need any assistance.

-   [Azure Active Directory tenant](https://docs.microsoft.com/azure/active-directory/develop/quickstart-create-new-tenant) <u>-</u> Register and manage your apps, configure their access to data in

    -   Microsoft applications and other web APIs enable features like Conditional Access in the Azure Active Directory (AD) tenant.

-   [Power Apps license](https://docs.microsoft.com/power-platform/admin/about-powerapps-perapp) - If you don't have a license, you can also sign up for [a Power Apps Developer Plan,](https://docs.microsoft.com/power-apps/maker/developer-plan) or a [Power Apps trial.](https://docs.microsoft.com/power-apps/maker/signup-for-powerapps)

-   [On-premises data gateway](https://docs.microsoft.com/en-us/data-integration/gateway/service-gateway-install) - The gateway will enable you to connect to [Azure Logic Apps,](https://docs.microsoft.com/azure/logic-apps/logic-apps-gateway-install) [Power Apps,](https://docs.microsoft.com/power-apps/maker/canvas-apps/gateway-reference) and [Power Automate.](https://docs.microsoft.com/power-automate/gateway-reference)

-   [Azure AD Single sign-on (SSO) for Gateway](https://docs.microsoft.com/en-us/power-bi/admin/service-admin-portal-integration#azure-ad-single-sign-on-sso-for-gateway) - Your Azure AD tenant must be configured with an on-premises data gateway with constrained delegation to support SSO.

-   [SAP](http://www.sap.com/) – You'll need a current SAP subscription.

# Set up and test 

Work with your Power Automate contact through the following steps: 

## Install the private preview OPDG 

Your Power Automate contact will share a private preview version of the OPDG to be installed. There can only be one OPDG installed on a Windows machine and nothing else should be on the machine. You can choose to do one of the following: 

-   Uninstall your current OPDG version and re-install the private preview version of the OPDG on an existing Windows machine. 

-   Provision a new Windows VM that meets the [recommended requirements](https://docs.microsoft.com/en-us/data-integration/gateway/service-gateway-install#recommended) for the private preview OPDG.  

-   Note: If you're planning to use Windows authentication, make sure you install the gateway on a computer that's a member of the same active directory environment as the data sources.

-   Change the OPDG service account using the OPDG application. More information is available here: [Change the on-premises data gateway service account](https://docs.microsoft.com/en-us/data-integration/gateway/service-gateway-service-account)

## Configure Azure AD and SAP SSO

Your Azure AD tenant must be configured with an on-premises data gateway with constrained delegation to support single sign-on (SSO). The following links provide helpful information: 

-   [Create and configure an Azure Active Directory Domain Services domain](https://docs.microsoft.com/en-us/azure/active-directory-domain-services/tutorial-create-instance)  

-   [SAP ERP Windows Authentication](https://docs.microsoft.com/en-us/connectors/saperp/#authentication) 

-   [Overview of Kerberos](https://docs.microsoft.com/en-us/data-integration/gateway/service-gateway-service-account) 

-   [Configure Kerberos-based SSO to on-premises data sources (SAP)](https://docs.microsoft.com/en-us/power-bi/connect-data/service-gateway-sso-kerberos) 

## Import prebuilt Power Apps templates into your Power Platform environment 

Choose one of the following newly designed Power Apps templates to work with SAP.

-   Purchase orders

-   Sales orders

Because the templates are not publicly available yet, your Power Automate contact will provide you with a zip file of your chosen template.

Once you have the zip file, you can sign in to [Power Apps](https://make.preview.powerapps.com/environments/839eace6-59ab-4243-97ec-a5b8fcc104e4/home) to [import the solution.](https://docs.microsoft.com/en-us/power-apps/maker/data-platform/import-update-export-solutions)

## Create an environment variable with SAP connection parameters 

SAP has several different connection parameters, and it is cumbersome for makers to enter these for each Power Automate SAP action. Makers are now able to reuse environment variables within solution-aware flows that contain all the SAP system information. Once the environment variable is defined, makers can use the environment variable in their SAP actions without having to re-enter all the system information again.

1.  Sign in to [Power Apps.](http://make.powerapps.com/)

2.  Create an environment variable in a solution that contains the connection parameters of the SAP system. More information: [Create an environment variable in a solution](https://docs.microsoft.com/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution)

![](media/set-up-prepare/image1.png)

3.  Use the environment variable in a Power Automate flow. More information: [Use environment variables](https://docs.microsoft.com/power-apps/maker/data-platform/environmentvariables#use-environment-variables-in-power-automate-solution-cloud-flows)

![](media/set-up-prepare/image2.png)

## Test the Power Platform's enhanced SAP Connector 

The newest version of Power Platform's SAP connector has enhanced functionalities. It enables Message Server support and allows for easier entering of parameters needed when connecting to SAP.

There is a minimum of two required fields for this action to begin:

-   SAP System: This is a JSON string containing all the necessary SAP connection parameters. For a complete list of all the available properties, refer to the "SAP property guidance" table. The JSON string can be manually entered or chosen from an existing environment variable within a solution.

-   RFC name: The name of the remote call function (RFC) you would like to call.
