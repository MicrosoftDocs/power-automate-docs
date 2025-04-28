---
title: Security and privacy
description: Learn about security and privacy issues in the process mining capability.
author: donums
contributors:
  - donums
  - v-aangie 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Security and privacy

The process mining capability relies on environment security and Microsoft Dataverse security roles and privileges to grant access to its features in Power Automate. For more information, go to [Power Platform security overview](/power-platform/admin/wp-security).

## Security

Some privileges are set by default in Dataverse. This allows built-in security roles to use the process mining capability without further actions from system administrators. Specifically:

- The **Environment maker** role can use the process mining capabilities to create, share, and contribute to processes.

- Administrators and system customizers can access all processes created in the environment.

- The **Process Mining User** security role can only view created process reports.

> [!IMPORTANT]
> The **Process Mining Application** is an *internal security role* that process mining uses. (Process mining was formerly named *process advisor*). Don't assign this security role to users. Don't modify the set of privileges in the **Process Mining User** or **Process Mining Application** security roles.
>
> The **Process Mining User** security role won't suffice to create, share, and contribute to processes.
> 
> If you’re using Conditional Access polices to limit access to Power Automate and its features, the following apps must be included in **Cloud apps** policy application:
>
> - Power Apps
> - Power Automate
>
> Currently, having conditional access to only Power Automate isn't enough. To learn how to set up Conditional Access policies, go to [Plan a Conditional Access deployment](/azure/active-directory/conditional-access/plan-conditional-access) and [Control Access to Power Apps and Power Automate with Microsoft Entra Conditional Access Policies](https://devblogs.microsoft.com/premier-developer/control-access-to-power-apps-and-power-automate-with-azure-ad-conditional-access-policies/#:~:text=Control%20Access%20to%20Power%20Apps%20and%20Power%20Automate,a%20Conditional%20Access%20Policy.%20...%204%20Summary.%20).

## Privacy

Sharing processes and their recordings is essential to create rich analysis and insights in the process mining capability. Users can add recordings to a process. They can then use Power Automate to record processes and then import the processes into the process mining capability. Owners and contributors can see some data from the process and its recordings.

While most of the information process recordings capture can be essential to the understanding of the process activities, some steps might contain sensitive information. You can modify and delete sensitive information such as personally identifiable information (PII) from your recordings.

In Power Automate, users can:

- Delete sensitive steps or modify input data information.

- Pause and resume recording to avoid recording sensitive information and PII.

After you import the recording into the process mining capability, you can remove sensitive information by doing the following:

- Rename step names or descriptions.

- Delete screenshots.

[!INCLUDE[footer-include](includes/footer-banner.md)]