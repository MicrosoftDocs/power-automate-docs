---
title: Authentication and security for planning a Power Automate project | Microsoft Docs
description: Different automation scenarios require Power Automate to use different authentication methods. This article explains them.
author: taiki-yoshida
ms.service: flow
ms.topic: conceptual
ms.custom: guidance
ms.date: 12/05/2020
ms.author: tayoshi
ms.reviewer: kathyos

---

# Authentication and security

Your automation will probably access data and systems that are protected
by requiring users to sign in. Different automation scenarios require Power
Automate to use different authentication methods.

Before you set up your automation, you should ask yourself how you currently
sign in to the systems or computers to do the tasks manually. Below are some
examples of different types of authentication (sign-ins) that can be used when
automating with Power Automate.<!--note from editor: In the image, please change "Office 365" to "Microsoft 365", and make it "On-premises data gateway"--><!--tayoshi: Done-->

![Different types of automation](media/automation-types.png "Different types of automation")

To set up the automation, make sure you have the necessary authentication
(sign-in) information ready. You'll need this information when you're [making a new connection](../../add-manage-connections.md) to set up your automation, setting up to [access data via an on-premises data gateway](../../add-manage-connections.md#connect-to-your-data-through-an-on-premises-data-gateway),
or when using [UI flows](../../ui-flows/overview.md).

## On-premises data gateway

For desktop and website automation, an on-premises data gateway is required so that
programs that are installed on the on-premises computers (for example, browser extensions
and Power Automate Desktop) can be accessed from the Power Automate cloud-based
service. More information: [Install an on-premises data gateway](https://docs.microsoft.com/data-integration/gateway/service-gateway-install)

## Authentication by using Microsoft 365 and Azure AD

This is the authentication for any automation that you use with Microsoft
services. When the automation is run, it runs on behalf of the user
who's running the automation and not the user who set up the automation originally.

![Azure AD sign-in screen](media/azure-ad-login.png "Azure AD sign-in screen")

## Authentication by using a username and password

This type of authentication is used for systems and services that have an
independent system other than what's used with Microsoft 365 and Azure Active Directory (Azure AD), with a
separate username and password. Sign-ins for services such as Google, Facebook, and
Twitter all have their own methods for authentication<!--note from editor: Edit okay? I'm not too keen on calling Google, Facebook, and Twitter "systems," but I suppose it's all right here.--><!--tayoshi: Changed to service as it is a "Social Media Service"-->. Some enterprise systems provide
[single sign-on (SSO)](https://docs.microsoft.com/azure/active-directory/manage-apps/what-is-single-sign-on).

![Browser sign-in pop-up window](media/browser-login.png "Browser sign-in popup window")

In the expense reporting example, the online banking system has its own
sign-in ID and password.

## Authentication by using an on-premises system or Windows sign-in
<!--note from editor: Can you please verify this term? I don't find "Windows login" in any style guide or other content. It's okay if it matches the UI (but it doesn't seem to).-->
<!--tayoshi: Changed to Windows sign-in -->
This type of authentication will be required if you're planning to automate
with the Power Automate Desktop application or desktop flows. It's separate from
Microsoft 365 or Azure AD. If a computer is connected to a corporate
network, it's highly likely that it uses Windows Server Active Directory.<!--note from editor: Edit okay? Active Directory is a trademark that requires a modifier, so "an Active Directory" won't work. If this reference needs to be generic, could it be "...it's highly likely that it uses an identity service"?--><!--tayoshi: That would work-->

![Windows sign-in screen](media/windows-login.jpg "Windows sign-in screen")

## Authentication by using a shared key

This authentication is usually used for online services and is used for
system-to-system (API) automation where the services are shared across the
company. This is typically provided and set up by your IT department, where the
connector is shared with you.

![API keys in the Azure portal](media/azure-api-key.png "API keys in the Azure portal")
