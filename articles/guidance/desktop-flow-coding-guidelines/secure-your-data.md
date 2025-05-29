---
title: Secure your data
description: Secure your Power Automate workflows by managing credentials, sensitive variables, and access to desktop flows.
#customer intent: As a Power Automate user, I want to secure my workflows so that I can protect sensitive data and ensure compliance with security standards.  
author: PetrosFeleskouras
ms.subservice: guidance
ms.topic: best-practice
ms.date: 05/29/2025
ms.author: pefelesk
ms.reviewer: pankajsharma2087
search.audienceType:
  - admin
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:05/14/2025
---

# Secure your data

Protecting sensitive data is critical when automating processes with Power Automate. This article explains best practices and actionable steps to secure your data: setting up credentials, managing sensitive variables, controlling access to desktop flows and related components, enforcing data loss prevention (DLP) policies, and capturing audit logs. Follow these guidelines to comply with security standards and safeguard your automation workflows.

## Set up Power Automate credentials

Create, edit, and share Power Automate credentials using [Azure Key Vault](../../desktop-flows/create-AzureKeyVault-credential.md) or [CyberArk](../../desktop-flows/create-cyberark-credential.md). Use them in desktop flow connections, desktop flows, or network connections.

:::image type="content" source="media/secure-your-data/credentials.png" alt-text="Screenshot of the Power Automate credentials setup screen.":::

- **Desktop flow connection**: Use credentials in desktop flow connections to sign in to the machine during runtime (attended and unattended runs). Learn more about [managing desktop flow connections](../../desktop-flows/desktop-flow-connections.md).

  - Create a mapping between machines and user account credentials to sign in to each machine or Windows session with dedicated credentials. Learn more about [machine mapping](../../desktop-flows/create-machine-mapping.md).
  - Meet multifactor authentication (MFA) requirements by using [certificate-based authentication](../../desktop-flows/configure-certificate-based-auth.md).

- **Desktop flow**: Use credentials in desktop flow actions to sign in to applications and files. This way, you can enter passwords or sensitive values without keeping sensitive information in the script. For example, SAP credential, SharePoint credential, or Excel password. Learn more about [Power Automate secret variables actions](../../desktop-flows/actions-reference/powerautomatesecretvariables.md).

- **Network**: Use credentials when creating Microsoft Entra hybrid join network connection to connect hosted machine groups to the Active Directory (AD) domain. Learn more about [using a custom virtual network for your hosted machine groups](../../desktop-flows/hosted-machine-groups.md#use-a-custom-virtual-network-for-your-hosted-machine-groups).

> [!TIP]
> - In desktop flows, use the **Get credential** action to retrieve sensitive values instead of passing them as input variables. This practice ensures credential variables are marked as sensitive by default and aren't stored in the flow run logs.
> - Another way to retrieve application or file credentials is through environment variables, using the Dataverse connector's action **Perform an unbound action in selected environment** in desktop flows. Make sure to mark the output of that action as sensitive. Learn more about [using environment variables for Azure Key Vault secrets](/power-apps/maker/data-platform/environmentvariables-azure-key-vault-secrets).

## Use sensitive variables

The values of sensitive variables are masked during debugging in the flow designer, and they aren't stored in flow run logs.

- Mark as sensitive all variables that store and use sensitive data, including input, output, and flow variables.

    :::image type="content" source="media/secure-your-data/variables.png" alt-text="Screenshot of sensitive variable settings in flow designer.":::

- Don't store sensitive values in non-sensitive variables, as sensitivity isn't inheritable (except for credential variable types). For example, don't use a sensitive password variable in a non-sensitive connection string.

- Instead of passing sensitive values to the desktop flow as input variables, use the **Get credential** action. This practice ensures that credential variables are marked as sensitive by default and aren't stored in flow run logs.

Learn more about [sensitive variables](../../desktop-flows/manage-variables.md#sensitive-variables) and [using passwords in desktop flows](../../desktop-flows/how-to/use-passwords.md).

## Manage access to desktop flows

Any user with access to a desktop flow can have owner, co-owner, or user access.

- To enable other makers to manage your flow and collaborate on it, share it with them with **Co-owner access**.
- To enable other users to trigger your flow without providing additional access, share it with them with **User access**.

> [!NOTE]
> - Desktop flows are stored in the Process Dataverse table along with other types of flows.
> - Users with a Dataverse security role that grants them Read access to all records in the Process table automatically become co-owners of all desktop flows in the environment.

Learn more about [managing desktop flows access](../../desktop-flows/manage.md#manage-desktop-flows-access) and [managing security for Power Automate](../../desktop-flows/desktop-flows-security.md). 

## Manage access to the desktop flow's related components

While sharing a desktop flow that references other Power Platform components, ensure that end users have appropriate access to the connectors as well.

Access is managed either through the dedicated page of each component in the Power Automate Portal or through a Dataverse security role that grants access to the records in the component's table.

The following table lists the most common components that may be referenced by a desktop flow, how to reference them through the flow, the location of their access management settings, and their respective Dataverse tables.

| **Component**           | **How to reference component in  designer**                                       | **Access management settings**                                                                                                                                                                                                        | **Dataverse table**                                                                                                                                                                                                           |
|--------------------------|----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| (Child) Desktop flows    | Use the **Run desktop** **flow** action                                          | [Share desktop flows](../../desktop-flows/manage.md#share-desktop-flows)                                                                                                                                                       | [Process](/power-apps/developer/data-platform/reference/entities/workflow)                                                                                                                                                    |
| Work queues              | Use an action from **Work queues** group of actions                              | [Share a work queue](../../desktop-flows/work-queues-manage.md#share-a-work-queue)                                                                                                                                             | [Work Queue](/power-apps/developer/data-platform/reference/entities/workqueue), [Work Queue Item](/power-apps/developer/data-platform/reference/entities/workqueueitem)                                                     |
| Credentials              | Use the **Get credential** action                                                | [Share a credential](../../desktop-flows/create-AzureKeyVault-credential.md#share-a-credential)                                                                                                                                | [Credential](/power-apps/developer/data-platform/reference/entities/credential)                                                                                                                                               |
| UI elements collections  | Open **Assets Library** and add the collection                                   | [Share a UI elements collection](../../desktop-flows/manage-ui-elements-collections.md#share-a-ui-elements-collection)                                                                                                         | [Desktop Flow Module](/power-apps/developer/data-platform/reference/entities/desktopflowmodule)                                                                                                                               |
| Custom actions           | Open **Assets Library** and add the custom action                                | [Share custom actions](../../desktop-flows/upload-custom-actions.md#share-custom-actions)                                                                                                                                      | [Desktop Flow Module](/power-apps/developer/data-platform/reference/entities/desktopflowmodule)                                                                                                                               |
| Connection references    | Add a cloud connector action and manage through **Connection references** | Access is managed through desktop flow sharing. Learn how to [share desktop flows that contain connector actions](../../desktop-flows/how-to/share-desktop-flows-that-contain-connector-actions.md).                             | [Connection Reference](/power-apps/developer/data-platform/reference/entities/connectionreference)                                                                                                                            |
> [!TIP]
> Review the list of additional [automation-related tables](/power-automate/automation-analytics-with-fabric-queries#list-of-automation-related-tables) frequently used for reporting and observability.

## Enable data loss prevention (DLP) policies

Protect your business data by creating and enforcing policies that classify the desktop flow's action groups as **Business** or **Non-business** and to mark actions or action groups as **Blocked**.

:::image type="content" source="media/secure-your-data/data-privacy.png" alt-text="Screenshot of the interface for settting up a new security policy to assign a connector to Business, Non-business, or Blocked." lightbox="media/secure-your-data/data-privacy.png":::

For more fine-grained control, select **More actions \>** **Configure connector \> Connector actions** to allow or block individual actions within a given group. Set the **Default connector action settings** to allow or block any new connector actions added to the connector in the future.

:::image type="content" source="media/secure-your-data/more-actions.png" alt-text="Screenshot of the interface for configuring the default connector action settings to Allow." lightbox="media/secure-your-data/more-actions.png":::

Learn more about [data loss prevention (DLP) policies in desktop flows](../../desktop-flows/data-loss-prevention.md).

## Capture audit logs

Use Dataverse auditing to track changes and access to tables related to desktop flows.

Enable Dataverse auditing at both the environment level and for the specific automation-related tables where you intend to capture logs.

Learn more about [managing Dataverse auditing](/power-platform/admin/manage-dataverse-auditing).
