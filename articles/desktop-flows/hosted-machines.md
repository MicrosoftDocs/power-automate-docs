---
title: Hosted machines
description: See how to create and use Power Automate hosted machines.
author: kenseongtan
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 12/28/2023
ms.author: kenseongtan
ms.reviewer: angieandrews
contributors:
---

# Hosted machines

Hosted machines allow you to build, test, and run attended and unattended desktop flows without providing or setting up any physical machines.

You can create hosted machines directly through the Power Automate portal. Power Automate will automatically provision a Windows machine based on your configuration and register it to your environment. Access your hosted machines in the Power Automate portal and start building your desktop flows within minutes. Hosted machines use [Windows 365](https://www.microsoft.com/windows-365) for provisioning and access.

Here are some of the highlights of what you can do with hosted machines:

- Build and test desktop flows using Power Automate for desktop.
- Run attended and unattended desktop flows.
- Assign your hosted machines to [machine groups](hosted-machine-groups.md) to distribute your automation workload.

Key capabilities:

- **Work or school account integration**: Enables access to resources that are part of the business plan linked to your organization, such as Office, SharePoint, and Azure.

- **Vanilla or custom VM images for your hosted machine**: Use a vanilla VM image provided by Microsoft or personalize your hosted machines by providing your own Windows image directly from your Azure Compute Gallery. Providing your own Windows image allows you to have all your applications installed on the provisioned hosted machines.

- **Connect to your own virtual network**: Securely communicate with each other, the Internet, and your on-premises networks.

    > [!NOTE]
    > Sign-in access is only available to the creator of the hosted machine.


## Licensing requirements

To use hosted machines, you need the following licensing option:

- Use your existing **Power Automate Premium plan** (previously Power Automate per user plan with attended RPA) and the **Power Automate hosted RPA add-on**.

   Assign to your environment as many add-ons as the number of hosted machines you want to run in your environment.

You'll also need the following prerequisite licenses: Windows, Intune, Microsoft Entra ID.


### Trial licenses for evaluation

To evaluate hosted machines, you need one of the following trial licensing options:

- Use the **Power Automate Premium** plan (previously Power Automate per user plan with attended RPA ) and the **Power Automate hosted RPA add-on trials**.

    The Power Automate hosted RPA add-on have trial versions that last 30 days and can be extended once to a total of 60 day. Organization admins can obtain up to 25 seats from [Microsoft 365 admin center](https://admin.microsoft.com/adminportal/home), assign those Power Automate Premium (previously Power Automate per user plan with attended RPA) trials to 25 individual makers, and assign the hosted RPA add-ons to the targeted environment.

- Use the **90-days self-assisted premium trial.**

    Trial users are granted the capacity of one hosted machine per tenant. To start a trial, select **Try free** under **Power Automate Premium** in the [Power Automate pricing page](https://powerautomate.microsoft.com/pricing/) or the desktop flow page of the [Power Automate portal](https://make.powerautomate.com/).

## Prerequisites

This section presents all the prerequisites to create and use hosted machines.

### Microsoft Entra and Intune requirements

- A valid and working Intune and Microsoft Entra tenant.
- Ensure that Intune device type enrollment restrictions are set to **Allow Windows (MDM) platform for corporate enrollment**.

To find more information about the Microsoft Entra and Intune requirements, go to [Windows 365 requirements](/windows-365/enterprise/requirements?tabs=enterprise%2Cent#azure-active-directory-and-intune-requirements).

### Windows 365 Cloud PC and Azure Virtual Desktop service principal

> [!NOTE]
> The Windows 365 and Azure Virtual Desktop service principals should automatically be created in your tenant. You can skip this step, unless you face an error  with service principals not created in your tenant when you provision the hosted machine.
    
1. Validate if the Windows 365 service principal is already created:

    1. Sign in to the [Azure portal](https://portal.azure.com/).

    1. Navigate to **Microsoft Entra** > **Enterprise applications** > **All applications**.

    1. Remove filter **Application type == Enterprise Applications**.

    1. Fill filter **Application ID starts with** with the Windows 365 application ID **0af06dc6-e4b5-4f28-818e-e78e62d137a5**.

        If the service principal is provisioned in your Microsoft Entra, the page should look like the following screenshot:

        :::image type="content" source="media/hosted-machines/azure-portal.png" alt-text="Screenshot of the Enterprise applications in Microsoft Entra ID.":::

        If the application is like the presented screenshot, you don't need to perform any extra steps. However, you must create the service principal if the application isn't showing up.

1. Create the Windows 365 service principal.

    You can create an Azure service principal with the [az ad sp create](/cli/azure/ad/sp) command from the [Azure Command-Line Interface (CLI)](/cli/azure/).

    ```Azure-CLI-command
    az ad sp create --id 0af06dc6-e4b5-4f28-818e-e78e62d137a5
    ```

1. Create other service principals related to Azure Virtual Desktop.

    To create a hosted machine, you must create the following Azure Virtual Desktop services in your tenant.


    | Application name                   | Application ID                       |
    |------------------------------------|--------------------------------------|
    | Azure Virtual Desktop              | 9cdead84-a844-4324-93f2-b2e6bb768d07 |
    | Azure Virtual Desktop Client       | a85cf173-4192-42f8-81fa-777a763e6e2c |
    | Azure Virtual Desktop ARM Provider | 50e95039-b200-4007-bc97-8d5790743a63 |

    Follow the same instruction as for creating the Windows 365 application to check and create the service principals.

### Get access to the default VM image

To create hosted machines, you need access to the default image that is part of your environment. You can view the default image in **Monitors** > **Machines** > **VM images**.

:::image type="content" source="media/hosted-machines/default-vm-image.png" alt-text="Screenshot of the default VM image in the VM images list.":::

Users need either the **System Administrator** or **Desktop Flow Machine Image Admin** role to see and manage the default image. For other users, the **System Administrator** or **Desktop Flow Machine Image Admin** needs to [share the default image](#share-the-default-image) with them before they can use it.

### Share the default image

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines** > **VM images**.

1. Select the default Windows desktop image from the list.

1. Select **Manage access**.

1. Select **Add people** and enter the name of the person in your organization with whom you’d like to share the image.

1. Select the names of the persons and choose which permissions they can access the machine with.

1. Select **Save**.

:::image type="content" source="media/hosted-machines/share-default-image.png" alt-text="Screenshot of the Manage access dialog of a VM image.":::

## Create a hosted machine

To create a hosted machine:

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines**.

1. Select **New** > **Hosted machine**.

1. In the hosted machine creation wizard:

    1. Enter a name for your hosted machine and optionally add a description.

    1. Select the VM image to use for your hosted machine. A proposed default Windows 11 image called **Default Windows Desktop Image** is available. If you don't see it, make sure you followed the steps described in [Prerequisites](#prerequisites).

        Alternatively, you can select a [custom VM image](#use-custom-vm-images-for-your-hosted-machine) that has been shared with your account.

    1. Optionally, select the [custom network connection](#use-custom-vnet-for-your-hosted-machines) you want your hosted machine to be provisioned with Microsoft Entra ID. Otherwise, you'll automatically connect to the Microsoft Hosted Network.

    1. Review and create your hosted machine.

:::image type="content" source="media/hosted-machines/create-hosted-machine.png" alt-text="Screenshot of the hosted machine creation wizard.":::

> [!NOTE]
> The time needed to provision a hosted machine varies depending on the configuration of the hosted machine. It can take over 30 minutes for the machine to be ready for access.

## Access a hosted machine

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines**.

1. Select the **Machines** tab

1. Select your hosted machine from the list of machines.

1. In the machine details page, you should observe the following details:

    - **Machine type:** Hosted machine
    - **Connectivity status:** Connected
    - **Machine status:** Active

    :::image type="content" source="media/hosted-machines/access-hosted-machine.png" alt-text="Screenshot of the details of a hosted machine.":::

1. Select **Open in browser**.

1. A new tab in the browser should open and load the hosted machine access. Sign in with your work or school account.

1. The hosted machine is preregistered into the Power Automate environment.

    :::image type="content" source="media/hosted-machines/power-automate-machine-runtime.png" alt-text="Screenshot of the Power Automate machine runtime application.":::

## Use custom VM images for your hosted machine

You can personalize your hosted machines by providing your own Windows image directly from your Azure Compute Gallery. This feature allows you to have all your applications installed on your hosted machines.

### Create an Azure Compute Gallery in Azure and add an image

1. Go to the [Azure portal](https://portal.azure.com/).

1. Create a new Azure Compute Gallery and select **Role based access control (RBAC)** in the **Sharing** tab.

1. Select **Review + create**, and once you've validated all the settings, select **Create**.

1. Once you've created an Azure Compute Gallery, create an image definition following the steps in [Create an image definition and an image version](/azure/virtual-machines/image-version). You should create the image in the exact location where we deploy your hosted machines. You can find the following mapping with your environment Geo:

- Australia: Australia East
- Asia: East Asia
- Brazil: Brazil South
- Canada: Canada Central
- Europe: North Europe
- France: France Central
- Germany: Germany West Central (Restricted, please send your request to hostedrpa@microsoft.com) 
- India: Central India
- Japan: Japan East
- Korea: Korea Central
- Norway: Norway East
- Switzerland: Switzerland North
- United Arab Emirates: UAE North
- United Kingdom: UK South
- United States: East US


### Image requirements

Custom VM images must meet the following requirements:

- Windows 10 Enterprise version 20H2 or later
- Windows 11 Enterprise 21H2 or later
- Generation 2 image
- Generalized VM image
- Single Session VM images (multi-session isn’t supported)
- No recovery partition. To find more information about how to remove a recovery partition, go to [Windows Server command: delete partition](/windows-server/administration/windows-commands/delete-partition)
- Default 64-GB OS disk size. The OS disk size will be automatically adjusted to 256-GB
- The image definition must have [trusted launch enabled as the security type](/azure/virtual-machines/trusted-launch)

### Share the reader permission on Azure subscription with Windows 365 service principal

To use your VM image for hosted machines, you'll need to grant Windows 365 service principal with the following permissions:

- Reader permission on the Azure subscription.

When you upload a custom image, you must be signed in with an account that is an owner or admin of the subscription.

### Share the Azure Compute Gallery with Power Automate makers

The last step before using your image in Power Automate is to share the image with the Power Automate makers.

1. In the [Azure portal](https://portal.azure.com/), go to your Azure Compute Gallery.

1. Go to the **Access Control (IAM)** settings.

1. Select **Add** > **Add role assignment**.

1. Assign at least **Reader** permissions access to the Power Automate makers you want to share the gallery with. Then select **Next**.

1. Select **Select members** and search for the Power Automate makers you want to share with.

1. Once you've selected all the members to add, review the permissions and users, and assign them.

### Add a new custom VM image

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines**.

1. Select **New** > **VM image**.

1. Enter a VM image name, a description, and the usage.

    - **VM Image name:** A unique name to identify the image.
    - **VM Image description:** An optional description for the image.
    - **Use with:** Select either **Hosted machine** or **Both**, if you want the image to work with both hosted machines and hosted machine groups.

1. Select one of the images that you have access to from the Azure Compute Gallery.

    :::image type="content" source="media/hosted-machines/add-new-custom-vm-image.png" alt-text="Screenshot of a new VM image.":::

    > [!NOTE]
    >
    > - The image needs to be replicated in the same Azure region as the hosted machine.
    > - The list of images available may vary depending on the usage you are selecting.

### Share the image

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines** > **VM images**.

1. Select the image you've created.

1. Select **Manage access**.

1. Select **Add people** and enter the names of the persons in your organization with whom you'd like to share the image.

1. Select the names of the persons and choose with which permissions they can access the image.

1. Select **Save**.

:::image type="content" source="media/hosted-machines/vm-image-permissions.png" alt-text="Screenshot of the Manage access dialog of the VM image.":::

> [!NOTE]
> When a user isn't part of an environment anymore, you can continue to see the user as deactivated. You'll be notified in the **Manage access** section of the image if it's shared with deactivated users. In this situation, remove access to them.

## Use custom VNet for your hosted machines

You can connect to your own virtual network (vNET) with your hosted machines to securely communicate with each other, the Internet, and on-premises networks. Providing your own VNet from your Azure subscription will allow your hosted machines to be provisioned with your VNet automatically.

### General network requirement

To use your own network and provision Microsoft Entra joined hosted machines, you must meet the following requirements:

- You must have a virtual network (vNET) in your Azure subscription in the same region where you've created the hosted machines.
- Follow [Azure’s Network guidelines](/windows-server/remote/remote-desktop-services/network-guidance).
- A subnet within the virtual network and available IP address space.

The VNet needs to be created in the same location with your hosted machines. You can find the following mapping with your environment Geo:

- Australia: Australia East
- Asia: East Asia
- Brazil: Brazil South
- Canada: Canada Central
- Europe: North Europe
- France: France Central
- Germany: Germany West Central (Restricted, please send your request to hostedrpa@microsoft.com) 
- India: Central India
- Japan: Japan East
- Korea: Korea Central
- Norway: Norway East
- Switzerland: Switzerland North
- United Arab Emirates: UAE North
- United Kingdom: UK South
- United States: East US


### Share the virtual network with Windows 365 service principal

To use your virtual network for hosted machines, you'll need to grant Windows 365 service principal with the following permissions:

- Reader permission on the Azure subscription.
- Network contributor permission on the specified resource group.
- Network contributor permission on the virtual network.

### Share the virtual network with Power Automate makers

The last step before being able to reference your virtual network from Power Automate is to share the virtual network with the Power Automate makers.

1. Go to the [Azure portal](https://portal.azure.com/).

1. In the Azure portal, go to your **Virtual network**.

1. Go to the **Access Control (IAM)** settings.

1. Select **Add** > **Add role assignment**.

1. Assign at least **Reader** permissions access to the Power Automate makers you want to share the virtual network with. Then select **Next**.

1. Select **Select members** and search for the Power Automate makers you want to share with.

1. Once you've selected all the members to add, review the permissions and users, and assign them.

### Add a new network connection

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines**.

1. Select **New** > **Network connection**.

1. Enter a network connection name, a description, and the usage.

    - **Network connection name:** A unique name to identify the network connection.
    - **Description:** An optional description for the network connection.

1. Select one of the virtual networks available in Azure that meets the network requirement.

1. Select the subnet that the hosted machine will use.

:::image type="content" source="media/hosted-machines/create-network-connection.png" alt-text="Screenshot of the New network connection dialog.":::

### Share the network connection

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines** > **Network connection**.

1. Select the network connection you've created.

1. Select **Manage access**.

1. Select **Add people** and enter the names of the persons in your organization with whom you’d like to share the network connection.

1. Select the names of the persons and choose which permissions they can access the network connection with.

1. Select **Save**.

:::image type="content" source="media/hosted-machines/share-network-connection.png" alt-text="Screenshot of the Manage access of the network connection.":::

> [!NOTE]
> When a user isn't part of an environment anymore, you can continue to see the user as deactivated. You'll be notified in the **Manage access** section of the network connection if it's shared with deactivated users. In this situation, remove access to them.

## View list of hosted machines

Once you've created your hosted machine in an environment, you can view its details in the Power Automate portal.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Go to **Monitor** > **Machines**.
1. Select **Machines**.

The list contains both hosted machines and standard machines. For each item in the list, you can view:

- The name of the machine.
- The description of the machine.
- The Power Automate for desktop version of the machine
- The machine group it belongs to, if it's part of a machine group.
- The number of flows running in the machine.
- The number of flows queued in the machine.
- The type of access you have to the machine.
- The owner of the machine.

:::image type="content" source="media/hosted-machines/hosted-machines-list.png" alt-text="Screenshot of the hosted machines list in the Power Automate portal.":::

Selecting a hosted machine in the list will take you to the hosted machine details page where you can:

- View and edit the details of the machine.
- Access the machine.
- Add the machine to a machine group.
- Monitor the run queue.
- View past runs.
- List existing connections referencing the machine.
- View provisioning errors on the machine, if any.
- Manage access of the machine.
- Delete the machine.

:::image type="content" source="media/hosted-machines/hosted-machine-overview.png" alt-text="Screenshot of a hosted machine's detail page.":::

## Share hosted machines

You can share your hosted machines with other users so they can run desktop flows with the creator's connection on them. To share a hosted machine:

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines**.

1. Select the **Machines** tab.

1. Select a hosted machine in the list and navigate to the details page of it.

1. Select **Manage access**.

1. Enter the username or email you want to share the hosted machine with, and select the user you want to add.

1. For each user, you can grant different permissions: **User** or **Co-owner**.

    **User** permission only allows the targeted user to run desktop flows on the selected hosted machine. A **Co-Owner** can also edit the hosted machine details.

> [!NOTE]
> - Sign-in access is only available to the creator of the hosted machine.
> - When a user isn't part of an environment anymore, you may continue to see the user as deactivated. You'll be notified in the **Manage access** section of the hosted machine if it's shared with deactivated users. In this situation, remove access to them.

## Run desktop flows on hosted machines

Power Automate enables you to trigger desktop flows on your hosted machines as you do on standard machines. To implement this functionality, you need a [desktop flow connection](desktop-flow-connections.md) to your hosted machine.

To find more information about triggering desktop flows from cloud flows, go to [Trigger desktop flows from cloud flows](link-pad-flow-portal.md).

> [!NOTE]
> If you intend to run unattended desktop flows on your hosted machine using the default virtula machine (VM) image option, you'll need to [disable Network Level Authentication](/troubleshoot/power-platform/power-automate/ui-flows-run-failed-with-aadlogonfailure-error) on your machine.


## Restart hosted machines

Power Automate enables you to restart your hosted machines from the Power Automate portal. To restart your hosted machine:

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines**.

1. Select the **Machines** tab.

1. Select a hosted machine in the list and navigate to the details page of it.

1. Select **Restart machine**.

> [!NOTE]
> The hosted machine is restart may take a few minutes to complete. Please wait for a few minutes before trying to [access the hosted machine](#access-a-hosted-machine).

:::image type="content" source="media/hosted-machines/restart-hosted-machine.png" alt-text="Screenshot of the restart hosted machine capability.":::


## Permissions based on security roles

Hosted machine permissions and roles are iterations on top of [Desktop Flows Machine Management permissions and roles](manage-machines.md#update-permissions-based-on-security-role). A hosted machine group follows the same rules and privileges as a regular group.

### Creation of hosted machine and privileges

This section describes the permissions for hosted machines.

#### Environment Maker role

By default, the **Environment Maker** role can create hosted machines in their environment. The entities that require privileges to use hosted machines are:

- Flow Machine
- Flow Machine Group
- Flow Machine Image
- Flow Machine Network (if using custom VNet for your hosted machine)

The Environment Maker role can [create and share custom VM images](#use-custom-vm-images-for-your-hosted-machine), as these actions require create and append privileges on the **Flow Machine Image**.

The Environment Maker role can [create and share custom VNet](#use-custom-vnet-for-your-hosted-machines), as these actions require create and append privileges on the **Flow Machine Network**.

Admins can also use the roles provided as part of Desktop Flows. You can find more information about desktop flow security roles in [Manage Machines](manage-machines.md#update-permissions-based-on-security-role).

:::image type="content" source="media/hosted-machines/environment-maker-role.png" alt-text="Screenshot of the permissions for the Environment Maker role.":::

#### Desktop Flows Machine Owner role

By default, the **Desktop Flows Machine owner** can create hosted machines, but can't create custom VM images or custom VNet. They can only use previously shared [custom VM images](#use-custom-vm-images-for-your-hosted-machine) or [custom VNets](#use-custom-vnet-for-your-hosted-machines) in their own hosted machine.

:::image type="content" source="media/hosted-machines/desktop-flows-machine-owner-role.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine Owner role.":::

#### Desktop Flows Machine Configuration Admin role

The **Desktop Flows Machine Configuration Admin role** role only brings full privileges on the **Flow Machine Image** and **Flow Machine Network** entities. In particular, it allows users with this role to share/unshare VM images and VNets to be used for created hosted machines in their environment. You can find more information about sharing pre-provisioned VM images and VNets in [Create hosted machines](#create-a-hosted-machine).

:::image type="content" source="media/hosted-machines/desktop-flow-machine-configuration-admin-role.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine Configuration Admin role.":::

## Hosted machines limitations

This section presents the limitations of hosted machines.

### Geographical availabilities/restrictions

The following list displays all the supported Power Platform geographies in the public cloud:

- Australia
- Asia
- Brazil
- Canada
- Europe
- France
- Germany (Restricted, please send your request to hostedrpa@microsoft.com) 
- India
- Japan 
- Korea
- Norway
- Switzerland
- United Arab Emirates
- United Kingdom
- United States

> [!NOTE]
> Hosted machines aren't yet available in sovereign clouds.


### Azure tenant country/region and supported geographies in the public cloud

A hosted machine stores limited metadata in the geography of your tenant's country, which can be different from the region of your Power Automate environment. By default, the cross-geo support for hosted machines is enabled. System admins and environment admins can disable or enable the feature from the Power Platform admin center.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Go to **Environments**, and select the appropriate environment.

1. Select **Settings** > **Features**.

1. Under **Hosted RPA**, select the toggle for **Enable cross-geo support for hosted machines** to disable or enable this feature.

    :::image type="content" source="media/hosted-machines/enable-cross-geo-support-hosted machines.png" alt-text="Screenshot of the Enable cross-geo support for hosted machines option in the Power Platform admin center.":::

1. Select **Save**.

> [!NOTE]
> Disabling this feature at the environment level will restrict creation of hosted machines when your tenant's country or region on Azure don't fall within the same scope of the region for your Power Automate environment.
> To check the tenant country/region on Azure:
> 1. Go to the [Azure portal](https://portal.azure.com/).
> 1. Open the **Tenant properties** service. The **Country or region** is available as one of the properties.
>
>    :::image type="content" source="media/hosted-machines/tenant-properties.png" alt-text="Screenshot of the Country or region tenant property.":::

### Deletion of unused resources

For environments without the Power Automate hosted RPA add-on, we clean unused resources to ensure our service is available for everyone. A hosted machine that has been inactive for 14 days may be automatically deleted. The deleted hosted machine will still be visible but can't be used anymore. An inactive hosted machine is a machine that has no flow runs and no usage of Power Automate for desktop for the last 14 days.

> [!NOTE]
> You need to delete the inactive hosted machine and recreate a new one to continue using the hosted machines feature. You need to reconfigure the connections associated with your cloud flows.

## Troubleshoot hosted machines

To find information on how to troubleshoot hosted machines, go to [Troubleshoot hosted machines](troubleshoot.md#troubleshoot-hosted-machines).

[!INCLUDE[footer-include](../includes/footer-banner.md)]
