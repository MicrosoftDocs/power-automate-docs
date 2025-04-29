---
title: Secure your data
description: Protect sensitive data and ensure compliance with security standards in Power Automate by using credentials, sensitive variables, and DLP policies.
# customer intent: As a Power Automate user, I want to set up credentials securely so that I can protect sensitive data in desktop flows and network connections.
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 04/29/2025
ms.author: mapichle
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
---

# Secure your data

Protecting sensitive data is critical when automating processes with Power Automate. This article explains best practices and actionable steps to secure your data: setting up credentials, managing sensitive variables, controlling access to desktop flows and related components, enforcing data loss prevention (DLP) policies, and capturing audit logs. 

Following these guidelines helps ensure compliance with security standards and safeguards your automation workflows.

## Setup Power Automate credentials

Create, edit, and share **Power Automate credentials** using [**Azure Key Vault**](/power-automate/desktop-flows/create-azurekeyvault-credential) or [**CyberArk**](/power-automate/desktop-flows/create-cyberark-credential) and use them in desktop flow connections, desktop flows, or network connections.

:::image type="content" source="media/secure-your-data/credentials.png" alt-text="Screenshot of the Power Automate credentials setup screen.":::

- **Desktop flow connection**: Use credentials in desktop flow connections to log in to the machine during runtime (attended and unattended runs). Learn more about [managing desktop flow connections](/power-automate/desktop-flows/desktop-flow-connections).

  - Create a mapping between machines and user account credentials to log in to each machine or Windows session with dedicated credentials. Learn more about [machine mapping](/power-automate/desktop-flows/create-machine-mapping).
  - Meet multi-factor authentication (MFA) requirements with [Certificate-Based Authentication](/power-automate/desktop-flows/configure-certificate-based-auth).

- **Desktop flow**: Use credentials in desktop flow actions to log in to applications and files. This way, you can enter passwords or sensitive values without keeping sensitive information in the script. For example, SAP credential, SharePoint credential, or Excel password. Learn more about [Power Automate secret variables actions](/power-automate/desktop-flows/actions-reference/powerautomatesecretvariables).

- **Network**: Use credentials when creating Microsoft Entra hybrid join network connection to connect hosted machine groups to Active Directory (AD) domain. Learn more about [using a custom virtual network for your hosted machine groups](/power-automate/desktop-flows/hosted-machine-groups#use-a-custom-virtual-network-for-your-hosted-machine-groups).

> [!NOTE]
> - In desktop flows, use the **Get credential** action to retrieve sensitive values instead of passing them as input variables. This ensures credential variables are marked as **sensitive** by default and aren’t stored in the flow run logs.
> - An alternative approach to retrieve application or file credentials is through environment variables, using the **Dataverse connector’s** action **Perform an unbound action in selected environment** in desktop flows. Make sure to mark the output of that action as sensitive. Learn more about [using environment variables for Azure Key Vault secrets](/power-apps/maker/data-platform/environmentvariables-azure-key-vault-secrets).

## Use sensitive variables

The values of sensitive variables are masked during debugging in the flow designer, and they aren't stored in the flow run logs.

- Mark as sensitive all variables that store and use sensitive data, including Input, Output, and Flow variables.

:::image type="content" source="media/secure-your-data/variables.png" alt-text="Screenshot of sensitive variable settings in the flow designer.":::

- Don't store sensitive values in non-sensitive variables, as sensitivity isn't inheritable (except for credential variable types). For example, don't use a sensitive password variable in a non-sensitive connection string.

- Instead of passing sensitive values to the desktop flow as input variables, use the **Get credential** action. This ensures credential variables are marked as sensitive by default and aren't stored in flow run logs.

Learn more about [sensitive variables](/power-automate/desktop-flows/manage-variables#sensitive-variables) and how to [use passwords in desktop flows](/power-automate/desktop-flows/how-to/use-passwords).

## Manage access to desktop flows

Any user with some level of access to a desktop flow can have either owner, co-owner, or user access.

- To enable other makers to manage your flow and collaborate on it, share it with them with **Co-owner access**.
- To enable other users to just trigger your flow without providing any additional access, share it with them with **User access**.

> [!NOTE]
> - Desktop flows are stored in the **Process** Dataverse table, along with other types of flows.
> - Users that have a Dataverse security role that grants them **Read** access to **all records** in the **Process** table automatically become co-owners to all desktop flows of the environment.

Learn more about [managing desktop flows access](/power-automate/desktop-flows/manage#manage-desktop-flows-access) and [managing security for Power Automate](/power-automate/desktop-flows/desktop-flows-security). 

## Manage access to desktop flows’ related components

While sharing a desktop flow that references other Power Platform components, ensure that the end users have appropriate access to those as well.

Access can be managed either through the **dedicated page of each component in the Power Automate Portal**, or through a **Dataverse security role** that grants access to the records in the component’s table.

Find below a list of the most common components that may be referenced by a desktop flow, how to reference them through the flow, the location of their access management settings, and their respective Dataverse tables.

| **Component**           | **How to reference component in Designer**                                       | **Access management settings**                                                                                                                                                                                                        | **Dataverse table**                                                                                                                                                                                                           |
|--------------------------|----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| (Child) Desktop flows    | Use the **Run desktop** **flow** action                                          | [Share desktop flows](/power-automate/desktop-flows/manage#share-desktop-flows)                                                                                                                                                       | [Process](/power-apps/developer/data-platform/reference/entities/workflow)                                                                                                                                                    |
| Work queues              | Use an action from **Work queues** group of actions                              | [Share a work queue](/power-automate/desktop-flows/work-queues-manage#share-a-work-queue)                                                                                                                                             | [Work Queue](/power-apps/developer/data-platform/reference/entities/workqueue), [Work Queue Item](/power-apps/developer/data-platform/reference/entities/workqueueitem)                                                     |
| Credentials              | Use the **Get credential** action                                                | [Share a credential](/power-automate/desktop-flows/create-azurekeyvault-credential#share-a-credential)                                                                                                                                | [Credential](/power-apps/developer/data-platform/reference/entities/credential)                                                                                                                                               |
| UI elements collections  | Open **Assets Library** and add the collection                                   | [Share a UI elements collection](/power-automate/desktop-flows/manage-ui-elements-collections#share-a-ui-elements-collection)                                                                                                         | [Desktop Flow Module](/power-apps/developer/data-platform/reference/entities/desktopflowmodule)                                                                                                                               |
| Custom actions           | Open **Assets Library** and add the custom action                                | [Share custom actions](/power-automate/desktop-flows/upload-custom-actions#share-custom-actions)                                                                                                                                      | [Desktop Flow Module](/power-apps/developer/data-platform/reference/entities/desktopflowmodule)                                                                                                                               |
| Connection references    | Add a cloud connector action and manage through **Connection references** window | Access is managed through desktop flow sharing. Learn how to [share desktop flows that contain connector actions](/power-automate/desktop-flows/how-to/share-desktop-flows-that-contain-connector-actions)                             | [Connection Reference](/power-apps/developer/data-platform/reference/entities/connectionreference)                                                                                                                            |

> [!NOTE]
> For reference, review the list of additional [automation-related tables](/power-automate/automation-analytics-with-fabric-queries#list-of-automation-related-tables) frequently used for reporting and observability.

## Enable data loss prevention (DLP) policies

Protect your business data by creating and enforcing policies that **classify desktop flows’ action groups as business or non-business** and **mark actions or action groups as blocked**.

:::image type="content" source="media/secure-your-data/data-privacy.png" alt-text="Screenshot of the interface for creating and enforcing DLP policies.":::

For more fine-grained control, select **More actions \>** **Configure connector \> Connector actions** to allow or block individual actions within a given group and set the **Default connector action settings** to allow or block for any new connector actions that will be added to the connector in the future.

:::image type="content" source="media/secure-your-data/more-actions.png" alt-text="Screenshot of the interface for configuring connector actions in DLP policies.":::

Learn more about [Data loss prevention (DLP) policies in desktop flows](/power-automate/desktop-flows/data-loss-prevention).

## Capture Audit logs

Use Dataverse auditing to log changes and access to desktop flows’ related tables.

Enable Dataverse auditing both at the **environment level** and for the specific **automation-related tables** from which you intend to capture logs.

Learn more about [managing Dataverse auditing](/power-platform/admin/manage-dataverse-auditing).

> [!NOTE]  
> For reference, review the list of [automation-related tables](/power-automate/automation-analytics-with-fabric-queries#list-of-automation-related-tables) frequently used for reporting and observability.