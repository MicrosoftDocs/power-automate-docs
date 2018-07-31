---
title: GDPR Data Subject Requests Summary | Microsoft Docs
description: Learn how to respond to GPDR Data Subject Requests for Microsoft Flow.  
services: ''
suite: flow
documentationcenter: na
author: KentWeareMSFT
manager: anneta
editor: ''
tags: ''

ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 4/24/2018
ms.author: keweare

---
# Responding to GDPR Data Subject Requests for Microsoft Flow

This article prepares you and your organization for the European Union's General Data Protection Regulation (GDPR). This article not only describes what Microsoft is doing to prepare for the GDPR but also shares examples of steps you can take today to support GDPR compliance when using PowerApps, Microsoft Flow, and Common Data Service for Apps.

## Prerequisites

Users and administrators can perform the actions outlined in this article.

### Users

A user needs to have an active Azure Active Directory account with a [Microsoft Flow license](https://preview.flow.microsoft.com/pricing/). Users who do not meet this requirement need to ask an administrator to perform these actions.

### Administrators

You can perform the operations that require admin privileges, outlined in this article if you sign into the [Microsoft Flow Admin center](https://admin.flow.microsoft.com/)  or [PowerApps Admin PowerShell](https://go.microsoft.com/fwlink/?linkid=871804) with an account that has both of these permissions:

- A paid or trial license for PowerApps Plan 2.

    [A trial license](http://web.powerapps.com/trial) expires in 30 days.

- [Office 365 Global Administrator](https://support.office.com/article/assign-admin-roles-in-office-365-for-business-eac4d046-1afd-4f1a-85fc-8219c79e1504) or [Azure Active Directory Global Administrator](https://docs.microsoft.com/azure/active-directory/active-directory-assign-admin-roles-azure-portal).

### Unmanaged Tenants
If you are a member of an [unmanaged tenant](https://docs.microsoft.com/azure/active-directory/domains-admin-takeover), meaning that your Azure AD tenant does not have global administrator, then you will still be able to follow the steps outlined in this article to export and remove your own personal data. 

## Responding to DSRs for Microsoft Flow customer data

The GDPR gives rights to people (known in the GDPR as data subjects) to manage the personal data that has been collected by an employer or other type of agency or organization (known as the data controller or just controller). Personal data is defined very broadly under the GDPR as any data that relates to an identified or identifiable natural person. The GDPR gives data subjects specific rights to their personal data; these rights include obtaining copies of personal data, requesting corrections to it, restricting the processing of it, deleting it, or receiving it in an electronic format so it can be moved to another controller. A formal request by a data subject to a controller to take an action on their personal data is called a Data Subject Rights (DSR) Request.

This article discusses how to use Microsoft's products, services and administrative tools to help controllers find and act on personal data when responding to DSRs. Specifically, this article includes how to find, access, and act on personal data that reside in Microsoft's cloud. Here’s a quick overview of the processes outlined in this guide:

1. Discover: Use search and discovery tools to more easily find customer data that may be the subject of a DSR. Once potentially responsive documents are collected, you can perform one or more of the DSR actions described in the following steps to respond to the request. Alternatively, you may determine that the request doesn't meet your organization’s guidelines for responding to DSRs. [Microsoft Flow DSR Discovery documentation](gdpr-dsr-discovery.md)

1. Access: Retrieve personal data that resides in the Microsoft cloud and, if requested, make a copy of it that can be available to the data subject.

1. Rectify: Make changes or implement other requested actions on the personal data, where applicable.

    If a data subject asks you to rectify their personal data that resides in your organization, you and your organization must determine if it’s appropriate to honor the request.  Rectifying the data may include taking actions such as editing, redacting, or removing personal data.

    You can use Azure Active Directory to manage Microsoft Flow users' identities. Enterprise customers can manage DSR rectify requests, including limited editing features, per the nature of a given Microsoft service.  As a data processor, Microsoft doesn't offer the ability to correct system-generated logs because these logs reflect factual activities and constitute a historical record of events within Microsoft services.  [Learn more about DSR](https://docs.microsoft.com/microsoft-365/compliance/gdpr-dsr-azure).

1. Restrict: Restrict the processing of personal data, either by removing licenses for various online services or turning off the desired services where possible. You can also remove data from the Microsoft cloud and retain it on-premises or at another location.

    Data subjects may request that you restrict processing of their personal data.  Microsoft provides application programming interfaces (APIs) and user interfaces (UIs) for this purpose.  These interfaces allow the enterprise customer’s tenant administrator to manage such DSRs through a combination of data export and data deletion. A customer may (1) export an electronic copy of the personal data of the user, including account(s), system-generated logs, and associated logs, followed with (2) deletion of the account and associated data residing within Microsoft systems.

1. Delete: Permanently remove personal data that resides in Microsoft's cloud. [Learn more about deleting personal data](gdpr-dsr-delete.md).

1. Export: Provide an electronic copy (in a machine-readable format) of personal data to the data subject. Each section in this article outlines the technical procedures that a data controller organization can take to respond to a DSR for personal data in Microsoft's cloud. [Learn more about exporting personal data](gdpr-dsr-export.md).

## System-generated logs

Refer to this [guide](https://docs.microsoft.com/powerapps/administrator/powerapps-gdpr-dsr-guide-systemlogs) for more information on system-generated logs for Microsoft Flow.
