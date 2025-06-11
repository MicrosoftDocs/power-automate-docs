---
title: Use auditing in Microsoft Dataverse and Microsoft Purview
description: Learn how to use auditing in Microsoft Dataverse and Microsoft Purview to meet compliance and security policies.
#customer intent: As a Power Automate user, I want to use auditing in Microsoft Dataverse and view audit logs in Microsoft Purview so that I can ensure adherence to compliance and security policies.
author: manuelap-msft
ms.service: power-automate
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

Microsoft Dataverse and Microsoft Purview offer robust auditing capabilities to help organizations meet compliance and security policies.

## Manage Dataverse auditing

The auditing feature of Microsoft Dataverse meets external and internal auditing, compliance, security, and governance policies common to many enterprises. Dataverse auditing logs changes made to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or the SDK in an environment.

View audit logs in the **Audit History** tab for a single record and in the **Audit Summary** view for all audited operations in a single environment. Retrieve audit logs using the web API or the SDK for .NET. Audit logs are created when there are changes to the record on a table where auditing is turned on. Audit logs for updates are created when a new value is different from the old value of a column.

Enable auditing on the *workflows* and *connection reference* tables to gain more visibility into changes made.

Audit logs help administrators and other privileged users answer questions like:

- Who created or updated a record and when?
- Which fields in a record were updated?
- What was the previous field value before the update?
- Who was accessing the system and when?
- Who deleted a record?

> [!NOTE]
> Dataverse auditing is only applicable to cloud flows created in solutions. Dataverse auditing must be enabled and configured per environment.

Learn more: [Configure auditing for an environment](/power-platform/admin/manage-dataverse-auditing#configure-auditing-for-an-environment)

## Power Automate activity logging in Microsoft Purview

You can also find logs of Power Automate activities in the [Microsoft Purview compliance portal](https://compliance.microsoft.com/). These logs are also accessible to developers via the [Office 365 Management API](/office/office-365-management-api/office-365-management-apis-overview).

Learn more: [View Power Automate audit logs](/power-platform/admin/logging-power-automate)