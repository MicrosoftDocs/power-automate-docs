---
title: Security and privacy | Microsoft Docs
description: This topic explains security and privacy issues in process advisor.
author: nijemcevic 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 12/17/2021
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

- Environment makers can use process advisor to create, share, and contribute to processes.

- Administrators and system customizers can access all processes created in the environment.

These security roles have privileges to the process advisor tables in Dataverse. Custom security roles can create processes in process advisor if they have the following permissions:

- Organization read permission on the Organization, User, and User Settings tables (Business management tab).

- Organization read permission on the table, field, and relationship tables (Customization tab).

- User create, read, write, delete, append, append to, assign, and share permissions on the process table (Customization tab).

- User create, read, write, delete, append, append to, assign, and share permissions on the PM inferred task, PM recording, and workflow binary tables (Custom tables tab).

> [!IMPORTANT]
> The Process Advisor Application is an *internal security role* that process advisor uses. Don't assign this security role to users. Don't modify the set of privileges in the Process Advisor User or Process Advisor Application security roles.
>
> If you’re using Conditional Access polices to limit access to Power Automate and it’s features, the following apps must be included in **Cloud apps** policy application:
> 
> - Microsoft PowerApps
> - Microsoft Flow
> 
> Currently, **having conditional access to only Microsoft Flow is not enough**. To learn how to set up Conditional Access policies, see [Plan a Conditional Access deployment](/azure/active-directory/conditional-access/plan-conditional-access) and [Control Access to Power Apps and Power Automate with Azure AD Conditional Access Policies](https://devblogs.microsoft.com/premier-developer/control-access-to-power-apps-and-power-automate-with-azure-ad-conditional-access-policies/#:~:text=Control%20Access%20to%20Power%20Apps%20and%20Power%20Automate,a%20Conditional%20Access%20Policy.%20...%204%20Summary.%20).

## Privacy

Sharing processes and their recordings is essential to create rich analysis and insights in process advisor. Users can add recordings to a process. They can then use Power Automate to record processes and then import the processes into process advisor. Owners and contributors can see some data from the process and its recordings.

While most of the information process recordings capture can be essential to the understanding of the process activities, some steps might contain sensitive information. You can modify and delete sensitive information such as Personal Identifiable Information (PII) from your recordings.

In Power Automate, users can:

- Delete sensitive steps or modify input data information.

- Pause and resume recording to avoid recording sensitive information and PII.

After you import the recording into process advisor, you can still remove sensitive information by doing the following:

- Rename step names or descriptions.

- Delete screenshots.

[!INCLUDE[footer-include](includes/footer-banner.md)]
