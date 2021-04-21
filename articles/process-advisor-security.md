---
title: Security and privacy | Microsoft Docs
description: Security and privacy in process advisor.
services: ''
suite: flow
documentationcenter: na
author: nijemcevic 
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 4/26/2021
ms.author: tatn
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

- Environment makers can use process advisor to create and share processes.

- Administrators and system customizers can access all processes created in the environment.

These security roles have privileges to the process advisor entities in Dataverse. Custom security roles can create process in process advisor if they have the following permissions:

- Organization read permission on the User and User Settings tables (Business Management tab).

- Organization read permission on the Entity, Field and Relationship tables (Customization tab).

- User create, read, write, delete, append, append to, assign and share permissions on the Process table (Customization tab).

- User create, read, write, delete, append, append to, assign and share permissions on the PM Inferred Task, PM Recording and Workflow Binary tables (Custom Entities tab).

## Privacy

Sharing processes and their recordings is essential to create rich analysis and insights in process advisor. Users are invited to contribute to a process by adding recordings. They use Power Automate Desktop to record processes that are then saved in process advisor. Owners and contributors may be able to see some data from the process and its recordings

While most of the information captured in process recordings can be essential to the understanding of the process activities, some steps may contain sensitive information. However, you can modify and delete any Personal Identifiable Information (PII) or any sensitive data in your recordings. In Power Automate Desktop, users can:

- Delete sensitive steps or modify input data information.

- Pause and resume recording to avoid recording sensitive information and PII.

Once the recording is imported into process advisor, you can still remove sensitive information by doing the following:

- Rename step names and/or description.

- Delete screenshots.

[!INCLUDE[footer-include](includes/footer-banner.md)]