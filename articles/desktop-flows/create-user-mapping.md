---
title: Create a User-credential Mapping 
description: Learn how to create a user-credential mapping for your desktop flows.
author: YiannisMavridis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 08/25/2026
ms.author: iomavrid
ms.reviewer: dmartens
contributors:
  - DanaMartens
search.audienceType:
  - flowmaker
  - enduser
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:08/24/2026
---

# Create a user mapping credential (Preview)

This feature lets you map user credentials to your applications used in robotic process automation (RPA) desktop flows.

## How a user mapping works

A user mapping is a type of credential that you can use in desktop flows to use specific app credentials depending on the user running the flow.

- **Example**

    For a desktop or web application that requires sign in and is automated in the context of a desktop flow, you can define for each user running that flow which application credential to use to sign in.

    > [!NOTE]
    > If you map multiple app credentials to the same user, the first one in the mapping list is used.

## Availability

Currently, this feature isn't available for US Government Clouds and China regions.

## Prerequisites

To create a mapping between users and app credentials used in desktop flows, follow these steps:

1. Ensure the Microsoft Flow Extensions core package (MicrosoftFlowExtensionsCore) Dataverse solution in your environment is equal to 1.10.12.0 or higher.
1. Ensure the version of Power Automate desktop app is 2.71 or higher.
1. Use [Azure Key Vault](create-AzureKeyVault-credential.md) or [CyberArk](create-cyberark-credential.md) to create your credentials. To select them in your mapping, define these credentials as usable in desktop flows.
1. CyberArk only: Configure all user accounts by using CyberArk credentials for their apps with a [CyberArk application](create-cyberark-credential.md).

## Create a user mapping

1. From the left navigation, select **Credentials**. If this option isn't visible, select **More** > **Discover all**, and then select **Credentials** within the **Data** section.
1. Select **New** > **Mapping** > **Mapping between user and application credential(s) (Preview)**.
1. In the wizard, enter a credential name and a brief description, and then select **Next**.
1. Define the default value of your mapping that will be used when a user account doesn't have a mapped credential.
1. For each user, select one credential to use in the desktop flow through the `Get credential` action to sign in to the flow's target application.

    1. In the user account field, enter the username (format as **username**, **domain\username**, or **username@domain.com**) you want to apply the mapping to.

    1. From the application credential dropdown, select the credential to map to this user.

         > [!NOTE]
         > In the dropdown, you only see credentials that you can use in desktop flows.
         > You can't map a mapping credential to another mapping.

        :::image type="content" source="./media/credentials/create-user-mapping/user-mapping.png" alt-text="Screenshot of create new mapping.":::

1. When you finish the mapping between a user and an app credential, you see it in the list of mappings. You can edit the mapping to change the credentials or delete it.
1. If you need to define a new mapping, select **Add new**.
1. After you complete the mappings, select **Save**.

## Use the user mapping in a desktop flow

You can now use this mapping in a desktop flow. Instead of selecting a single credential from [Azure Key Vault](create-AzureKeyVault-credential.md#use-the-credential-in-a-desktop-flow-action) or [CyberArk](create-cyberark-credential.md#use-the-credential-in-a-desktop-flow-action), you can select this mapping.

During runtime, the appropriate application credential defined in your user mapping is used to connect to the target application.

## Share a machine mapping

From the list of credentials, you can share a mapping with other users:

1. Select a credential.
1. Select **Share**.
1. In **Add People**, enter the names of the people you want to share the mapping with.
1. Select the permissions for this user (user, user + share, co-owner).

When you share the mapping, you also share all the credentials selected for this mapping. Whenever you update the mapping with new credentials, you share those credentials with other users of this mapping. Removing permissions on a user mapping credential doesn't remove permissions on the mapped credentials.

## Limitations

- In user mapping credentials, you can export and import the default credential, but you must reconfigure the mappings between user and application credentials in the environment where you import the user mapping credential.
