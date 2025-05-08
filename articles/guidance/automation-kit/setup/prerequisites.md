---
title: Prerequisites to install and use the automation kit
description: Learn about the required prerequisites to install and use the automation kit.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
contributors:
  - Grant-Archibald-MS
  - v-aangie
ms.custom: guidance
ms.topic: install-set-up-deploy
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/21/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Prerequisites to install and use the automation kit

The following prerequisites are required to install and use the automation kit.

- An administrative account, which is called **Automation CoE Admin** or similar.

- The automation kit requires access to your Power Platform environments, and some Azure resources, such as Key Vault and app registration. The account you set up as the **Automation CoE Admin** needs the following.

## Roles

- Microsoft Power Platform service admin or Dynamics 365 service admin.
- Account must be mail enabled.
- Azure contributor role (for Key Vault and app registration).

## Azure app registration

An Azure app registration is used for an application user for the Dataverse Web API in each of the satellite environments.

## Azure Key Vault

The automation kit uses the new [Azure Key Vault secrets (preview)](/powerapps/maker/data-platform/EnvironmentVariables#use-azure-key-vault-secrets-preview).

   > [!IMPORTANT]
   > Azure Key Vault is required only for automation kit satellite release March 2023 or earlier. Starting with the April 2023 release, Azure Key Vault is no longer required as a prerequisite.

Azure Key Vaults are used to store secrets for the Azure app registration, depending on your requirements. There might be one Key Vault per satellite environment. Here's an example of how you might name your Key Vaults.

- KV-Contoso-Dev
- KV-Contoso-Test
- KV-Contoso-Prod

To store your secrets:

1. Register the **Microsoft.PowerPlatform** resource provider in your Azure subscription. Follow these steps to verify and configure it: [Azure resource providers and types](/azure/azure-resource-manager/management/resource-providers-and-types).

   Azure Key Vault must have **Get** secret access policy set for the Dataverse service principal.

1. Select **Access policies**.

1. Select **Create**.

1. Under **Secret permissions** select **Get** and click **Next**.

1. In the service principal search blank, search for **Dataverse**.

1. Select the Dataverse service principal with the **00000007-0000-0000-c000-000000000000** identity.

1. Select **Next** > **Next** > **Create**.

## License requirements

All users must have one of the following licenses:

- Microsoft 365 license (E3, E5).

- Power Automate Premium license (non-trial, previously Power Automate per user with attended RPA).

- Optional Power Automate Process license (non-trial, previously Power Automate with unattended RPA).

- Power App Pay As You Go, Per User or Per App license (non-trial).

- Power BI Pro license.

## Enable code components

The Automation Kit uses the Power Platform Creator Kit. It was developed to bootstrap and enhance the canvas apps look and feel. The Creator Kit uses Fluent UI references and guidelines. To learn more about Fluent, go to [Fluent Design System](https://www.microsoft.com/design/fluent/).

The Creator Kit uses a component library and code components. You must enable code components inside all the environments into which the automation kit will be installed.

> [!WARNING]
> You'll have to uninstall and potentially lose all data if the Power Apps component framework for canvas apps isn't turned on for the environments where the automation kit is installed or upgraded. Enable the component framework before installing or upgrading.
>
>:::image type="content" source="../media/CodeComponentsTurnedOn.png" alt-text="Screenshot of the environments.":::

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/home).

1. Select an environment where you want to enable this feature. This is needed in both the [main](/power-automate/guidance/automation-kit/setup/main) and all [satellite](/power-automate/guidance/automation-kit/setup/satellite) environments.

1. Select **Settings** at the top of the screen.

1. Below **Product**, select **Features**.

1. Turn on **Allow publishing of canvas apps with code components**.

1. Select **Save**.
