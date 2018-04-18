---
title: Microsoft Flow GDPR Data Subject Requests Summary | Microsoft Docs
description: Learn how to use Microsoft Flow to respond to GPDR Data Subject Requests.  
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
ms.date: 4/18/2018
ms.author: keweare

---
# Responding to GDPR Data Subject Requests for Microsoft Flow

## Introduction to Data Subject Rights (DSRs) Requests

This document prepares you and your organization for the European Union's General Data Protection Regulation (GDPR). This document not only describes what Microsoft is doing to prepare for the GDPR but also shares examples of steps you can take today to support GDPR compliance when using PowerApps, Microsoft Flow, and Common Data Service for Apps.

The GDPR gives rights to people (known in the GDPR as data subjects) to manage the personal data that has been collected by an employer or other type of agency or organization (known as the data controller or just controller). Personal data is defined very broadly under the GDPR as any data that relates to an identified or identifiable natural person. The GDPR gives data subjects specific rights to their personal data; these rights include obtaining copies of personal data, requesting corrections to it, restricting the processing of it, deleting it, or receiving it in an electronic format so it can be moved to another controller. A formal request by a data subject to a controller to take an action on their personal data is called a Data Subject Rights (DSR) Request.

This guide discusses how to use Microsoft's products, services and administrative tools to help controllers find and act on personal data when responding to DSRs. Specifically, this document includes how to find, access, and act on personal data that reside in Microsoft's cloud. Here’s a quick overview of the processes outlined in this guide:

1. Discover—Use search and discovery tools to more easily find customer data that may be the subject of a DSR. Once potentially responsive documents are collected, you can perform one or more of the DSR actions described in the following steps to respond to the request. Alternatively, you may determine that the request doesn't meet your organization’s guidelines for responding to DSRs. [Microsoft Flow DSR Discovery documentation](gdpr-dsr-discovery.md)

1. Access—Retrieve personal data that resides in the Microsoft cloud and, if requested, make a copy of it that can be available to the data subject.

1. Rectify—Make changes or implement other requested actions on the personal data, where applicable. [Microsoft Flow DSR Rectify documentation](gdpr-dsr-rectify.md)

1. Restrict—Restrict the processing of personal data, either by removing licenses for various online services or turning off the desired services where possible. You can also remove data from the Microsoft cloud and retain it on-premises or at another location. [Microsoft Flow DSR Restrict documentation](gdpr-dsr-restrict.md)

1. Delete—Permanently remove personal data that resides in Microsoft's cloud. [Microsoft Flow DSR Delete documentation](gdpr-dsr-delete.md)

1. Export—Provide an electronic copy (in a machine-readable format) of personal data to the data subject.

Each section in this guide outlines the technical procedures that a data controller organization can take to respond to a DSR for personal data in Microsoft's cloud. [Microsoft Flow DSR Export documentation](gdpr-dsr-export.md)

## Responding to DSRs for Microsoft Flow Customer Data

The following prerequisites exist to perform the actions suggested in this documentation.  They have been separated into two personas: user and administrator.

### User Requirements

In order for a user to perform the actions described within this document, they need to have an active Azure Active Directory account with a [Microsoft Flow license](https://preview.flow.microsoft.com/pricing/). In the event a user does not meet these requirements, an administrator must perform these actions.

### Administrator Requirements

You can perform the operations that require admin privileges, outlined in this document if you sign into the [Microsoft Flow Admin center](https://admin.flow.microsoft.com/)  or [PowerApps Admin PowerShell](https://go.microsoft.com/fwlink/?linkid=871804) with an account that has both of these permissions:

1. A paid or trial license for PowerApps Plan 2.

    If you [sign up for a trial license](http://web.powerapps.com/trial), it expires after 30 days.

1. [Office 365 Global Administrator](https://support.office.com/article/assign-admin-roles-in-office-365-for-business-eac4d046-1afd-4f1a-85fc-8219c79e1504) or [Azure Active Directory Global Administrator](https://docs.microsoft.com/azure/active-directory/active-directory-assign-admin-roles-azure-portal).
