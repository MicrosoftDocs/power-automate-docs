---
title: Security and privacy | Microsoft Docs
description: Security and privacy in process advisor.
author: nijemcevic 
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.date: 5/25/2021
ms.author: tatn
ms.reviewer: v-aangie
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Security and privacy

## Security

Process advisor relies on environment security and Microsoft Dataverse security roles and privileges to grant access to its features in Power Automate. For more information, see [Power Platform security overview](/power-platform/admin/wp-security).

Some privileges are set by default in Dataverse. This allows built-in security roles to use process advisor without further actions from system administrators. Specifically:

- Process advisor user can create, share, and contribute to processes. This role has a restricted set of privileges that are only meant to be used by process advisor. If you need to provide access to other Power Platform features, make sure to assign less restrictive security roles on top of the process advisor user role.

- Environment makers can use process advisor to create, share and contribute to processes.

- Administrators and system customizers can access all processes created in the environment.

These security roles have privileges to the process advisor tables in Dataverse. Custom security roles can create processes in process advisor if they have the following permissions:

- Organization read permission on the Organization, User, and User Settings tables (Business management tab).
- Organization read permission on the table, field, and relationship tables (Customization tab).
- User create, read, write, delete, append, append to, assign, and share permissions on the process table (Customization tab).
- User create, read, write, delete, append, append to, assign, and share permissions on the PM inferred task, PM recording, and workflow binary tables (Custom tables tab).

> [!IMPORTANT]
> The Process Advisor Application is an **internal security role** that process advisor uses. Do no assign this security role to users. We do not recommend to modify the Process Advisor Uer or Process Advisor Application security roles set of privileges.

## Privacy

Sharing processes and their recordings is essential to create rich analysis and insights in process advisor. Users can add recordings to a process. They can then use Power Automate Desktop to record processes and then import the processes into process advisor. Owners and contributors can see some data from the process and its recordings.
While most of the information process recordings capture can be essential to the understanding of the process activities, some steps may contain sensitive information. However, you can modify and delete any Personal Identifiable Information (PII) or any sensitive data in your recordings.

In Power Automate Desktop, users can:

- Delete sensitive steps or modify input data information.

- Pause and resume recording to avoid recording sensitive information and PII.

After you import the recording into process advisor, you can still remove sensitive information by doing the following:

- Rename step names or descriptions.

- Delete screenshots.

[!INCLUDE[footer-include](includes/footer-banner.md)]
