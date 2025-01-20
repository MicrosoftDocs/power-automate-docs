---
title: Create a machine-credential mapping (preview)
description: Learn how to create a machine-credential mapping for your desktop flow connection.
author: QuentinSele
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 01/16/2025
ms.author: quseleba
ms.reviewer: dmartens
contributors:
  - DanaMartens
search.audienceType:
  - flowmaker
  - enduser
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:01/16/2025
---

# Create a machine mapping credential (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

This feature lets you map user account credentials to your robotic process automation (RPA) machines.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## How a machine mapping works

A machine mapping is a type of credential that can be used in desktop flow connections to use specific credentials depending on the machine assigned.

- **Example 1**

    For a machine group that contains multiple machines, you can define for each machine which user account must be used to sign in.

    > [!NOTE]
    > There isn't a restriction on mapping multiple credentials to the same machine.

- **Example 2**

    For a server, you can define all the user accounts that can execute your desktop flow.

    :::image type="content" source="./media/manage-machines/machine-mapping.png" alt-text="Screenshot of mapping architecture.":::

## Availability

Currently, this feature isn't available for US Government Clouds and China regions.

## Prerequisites

To create a mapping between machines and credentials, follow these steps:

1. Ensure you have a Dataverse solution equals to 1.8.36.0 or above.
2. Ensure the version of Power Automate desktop app is 2.50 or above. 
3. Create your [credentials](create-cyberark-credential.md). These credentials must be defined as usable in **connection** to be selected in your mapping.

    > [!NOTE]
    > Currently, only CyberArk credentials can be used in a mapping.

1. You need to have machines registered in this environment. If you didn't register your machine, follow the steps in [Manage Machines](manage-machines.md).  
1. For CyberArk credentials, the machine must be [configured with a CyberArk application](create-cyberark-credential.md).

## Create a machine mapping

1. From the left navigation, select **Credentials**.
1. Select **New** > **Mapping between machine and account credential(s)**.
1. In the wizard, define a credential name and a brief description, then select **Next**.
1. Define the default value of your mapping used when an assigned machine doesn't have a mapped credential.
1. For each machine, select one or several credentials to be used to sign in to the machine.

    1. From the machine dropdown, select the machine you would like to apply the mapping to.

          > [!NOTE]
          > - You can map a machine with multiple credentials.
          > - After a machine is mapped with credentials, it can't be selected for another mapping.
          > - Map all your machines with credentials in the same machine mapping or define a mapping for each machine group.

    1. From the credential dropdown, select the credentials to map to this machine.

         > [!NOTE]
         > In the dropdown, you only see credentials that are usable in **connections** and using CyberArk as a credential store.
         > You cannot map a mapping credential to another mapping.

        :::image type="content" source="./media/manage-machines/machine-mapping-2.png" alt-text="Screenshot of create new mapping.":::

1. Once the mapping between a machine and credentials is done, you can see it in the list of mappings. You can edit the mapping to change the credentials or delete it.
1. If you need to define a new mapping, select **Add new**.
1. After you complete the mappings, select **Save**.

## Use the machine mapping in a desktop flow connection

You can now use this mapping in a [desktop flow connection](desktop-flow-connections.md). Instead of selecting a single credential, you can select this mapping.

During runtime, the appropriate user account credential defined in your mapping is used to connect to the assigned machine.

## Limitations

1. During this preview phase, sharing a mapping isn't supported.
1. During this preview phase, machine mapping can't use Azure Key Vault credentials.
1. The run detail page doesn't display the credential used in the credential mapping. Retrieve the credential used in the `flowsession` table in the `credentials` field.
1. In machine mapping credential, the default credential can be exported / imported but the mappings between machines and user credentials must be reconfigured in the environment where the machine mapping credential has been imported. 
