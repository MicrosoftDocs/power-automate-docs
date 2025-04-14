---
title: Use auditing in Microsoft Dataverse and Microsoft Purview
description: Learn how to use auditing in Microsoft Dataverse and Microsoft Purview to help your Power Automate flows meet compliance and security policies.
#customer intent: As a Power Automate user, I want to use auditing in Microsoft Dataverse and view audit logs in Microsoft Purview so that I can ensure adherence to compliance and security policies.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/18/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
  - flowmaker
---

# Use auditing in Microsoft Dataverse and Microsoft Purview

Microsoft Dataverse and Microsoft Purview offer robust auditing capabilities to help your cloud flows meet your organization's compliance and security policies. This article describes how to view audit logs in Dataverse and Microsoft Purview.

Audit logs help administrators and other privileged users answer questions like:

- Who created or updated a record and when?
- Which fields in a record were updated?
- What was the previous field value before the update?
- Who was accessing the system and when?
- Who deleted a record?

## Dataverse auditing

Dataverse auditing applies only to cloud flows that are created in solutions. At the environment level, it logs changes to records in a Dataverse database and user access through an app or the SDK. Dataverse auditing must be turned on and configured for each environment. Learn more in [Configure auditing for an environment](/power-platform/admin/manage-dataverse-auditing#configure-auditing-for-an-environment).

An audit log is created when a change is made to a record in a table where auditing is turned on. Turn on auditing on the `Workflows` and `Connection reference` tables to gain more visibility into changes.

View audit logs in the **Audit History** tab for a single record and in the **Audit Summary** view for all audited operations in an environment. You can retrieve audit logs using the web API or the SDK for .NET.

## Power Automate activity logging in Microsoft Purview

Microsoft Purview logs Power Automate activities, too. The logs are available in the Microsoft Purview portal and are accessible to developers through the Office 365 Management APIs. Learn more in the following articles:

- [View Power Automate audit logs](/power-platform/admin/logging-power-automate)
- [Learn about the new Microsoft Purview portal](/purview/purview-portal)
- [Office 365 Management APIs overview](/office/office-365-management-api/office-365-management-apis-overview)
