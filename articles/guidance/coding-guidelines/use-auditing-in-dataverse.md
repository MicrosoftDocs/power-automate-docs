---
title: Use auditing in Dataverse and Purview
description: Learn how to use auditing in Dataverse and Purview
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 01/31/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
search.audienceType: 
  - admin
  - flowmaker
---

# Use auditing in Dataverse and purview



## Manage Dataverse auditing

The Dataverse auditing feature is designed to meet the external and internal auditing, compliance, security, and governance policies that are common to many enterprises. Dataverse auditing logs changes that are made to customer records in an environment with a Dataverse database. Dataverse auditing also logs user access through an app or through the SDK in an environment.

Audit logs can be viewed in the **Audit History** tab for a single record and in the **Audit Summary** view for all audited operations in a single environment. Audit logs can also be retrieved using the web API or the SDK for .NET. Audit logs are created when there are changes to the record on a table where auditing is turned on. Audit logs for updates are created when a new value is different from the old value of a column.

You can enable auditing on the **workflows** and **connection reference** tables to gain more visibility into changes that are made.

Audit logs help administrators and other privileged users to answer questions like:

- Who created or updated a record and when?
- Which fields in a record were updated?
- What was the previous field value before the update?
- Who was accessing the system and when?
- Who deleted a record?

>[!NOTE]
> Dataverse auditing is only applicable to cloud flows created in solutions. Dataverse auditing has to be enabled and configured per environment. 

Learn more: [Configure auditing for an environment](/power-platform/admin/manage-dataverse-auditing#configure-auditing-for-an-environment)

## Power Automate activity logging

You can also find logs of Power Automate activities in the [Microsoft Purview compliance portal](https://compliance.microsoft.com/). These logs are also accessible to developers via the [Office 365 Management API](/office/office-365-management-api/office-365-management-apis-overview).

Learn more: [View Power Automate audit logs](/power-platform/admin/logging-power-automate)