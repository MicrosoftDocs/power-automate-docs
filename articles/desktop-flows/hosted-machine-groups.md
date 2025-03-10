---
title: Hosted machine groups
description: Learn how to create and use hosted machine groups to distribute your automation workload.
author: kenseongtan
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 02/03/2025
ms.author: kenseongtan
ms.reviewer: angieandrews
contributors:
- DanaMartens
---

# Hosted machine group

Hosted machine group allows you to run unattended automation at scale without providing or setting up any machines. You can create hosted machine groups like any other machine group, and Power Automate automatically provisions the machines based on the specified configuration.

Desktop flows assigned to a hosted machine group get queued to it when triggered to run. Then, like for any machine group, the next desktop flow in the queue runs when a bot in the group is available. To find more information about queues, go to [Monitor desktop flow queues](monitor-desktop-flow-queues.md).

Here are some of the key features of hosted machine group:

- Run unattended desktop flows at scale.
- Autoscale the number of bots in your hosted machine group based on current workloads.
- Load balance bots across all hosted machine groups in an environment.
- Work or school account integration: Enables access to resources that are part of the business plan linked to your organization, such as Office, SharePoint, and Azure.
- Vanilla or Custom VM images: Use a vanilla VM image provided by Microsoft or personalize your hosted machine group by providing your own Windows image directly from your Azure Compute Gallery.

## Licensing requirements

To use hosted machine group, you need the **Power Automate Hosted Process** license (previously Power Automate hosted RPA add-on). Assign to your environment as many capacity as the number of hosted bots you want to run in parallel in your environment.

### Trial licenses for evaluation

To evaluate the hosted machine group, you need one of the following trial licensing options:

- Use the **Power Automate Hosted Process** license

    The Power Automate Hosted Process license has trial versions that last 30 days and can be extended once to a total of 60 days. Organization admins can obtain up to 25 seats from [Microsoft 365 admin center](https://admin.microsoft.com/adminportal/home) and assign Power Automate Hosted Process capacity to the targeted environment.

- Use the 90-days self-assisted premium trial.

    Trial users can create up to 10 hosted machine groups and have up to two bots running in parallel in a given environment. To start a trial, select **Try free** under **Power Automate Premium** in the [Power Automate pricing page](https://powerautomate.microsoft.com/pricing/) or the desktop flow page of the [Power Automate portal](https://make.powerautomate.com/).

## Prerequisites

This section presents all the prerequisites to create and use hosted machine groups.

### Get access to the default VM image

> [!NOTE]
> - The default VM image provided by Power Automate with Microsoft Edge preinstalled is based on the [Windows 365 Cloud PC image template: Windows 11 Enterprise Cloud PC 24H2](https://azuremarketplace.microsoft.com/marketplace/apps/microsoftwindowsdesktop.windows-ent-cpc). If you have specific software, configuration, or security constraints, use the [custom VM image](#use-custom-vm-images-for-your-hosted-machine-groups) capability.

The default VM image is available to all users in the environment. If you can't see the default VM image, your admin disabled sharing of default VM images to users. In this case:
- Users need either the **System Administrator** or **Desktop Flows Machine Configuration Admin** role to see and manage the default image.
- For other users, the **System Administrator** or **Desktop Flows Machine Configuration Admin** has to share the default image with them before they can use it.

View the default image in **Monitors** > **Machines** > **VM images**.

:::image type="content" source="media/hosted-machines/default-vm-image.png" alt-text="Screenshot of the default VM image in the VM images list.":::

### Share the default image

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to  **Monitor** > **Machines** > **VM images**.

1. Select the default windows desktop image from the list, and then **Manage access**.

1. Select **Add people**, and then enter the names of the persons in your organization with whom you'd like to share the image.

1. Select the names of the persons and which permissions they have to get access to the machine or co-own it as well.

1. Select **Save**.

> [!NOTE]
> When users aren't part of an environment anymore, you can continue to see them as deactivated users. You'll be notified in the **Manage access** section of the image if it's shared with deactivated users. In this situation, remove access to them.

:::image type="content" source="media/hosted-machine-groups/share-vm-image.png" alt-text="Screenshot of the Manage access dialog of the default VM image.":::

## Create hosted machine groups

To create a hosted machine group:

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines**.

1. Select **New** > **Hosted machine group**.

1. In the hosted machine group creation wizard

    - Enter a **name** for your hosted machine group, then optionally add a description.

    - Determine if you want to **reuse a Windows session** in unattended mode.

    - Define the **maximum number of bots** you want to assign to this group.

    > [!NOTE]
    > - **Max bots allow** your hosted machine group to automatically scale to the max bots configuration when required and when resources are available.
    > - If multiple hosted machine groups are used in the same environment, bots are automatically load balanced between the groups.
    > - You can't exceed the total number of Hosted Process capacity assigned to your environment.
    > - To find more information about load balancing, go to [Load balance hosted machine groups](#load-balance-hosted-machine-group).

    - Define the **committed number of bots (optional)** you want to assign to this group.
  
    > [!NOTE]
    > - **Committed bots guarantee** your hosted machine group to automatically scale to the committed bots configuration when required.
    > - The sum of hosted machines and committed bots configured in your environment can't exceed the Hosted Process capacity assigned to the environment. View usage of Hosted Process capacity in your environment in the [Hosted Process capacity utilization dashboard](./capacity-utilization-hosted.md).

    :::image type="content" source="media/hosted-machine-groups/create-hmg-scaling.png" alt-text="Screenshot of the hosted machine group scaling configuration in creation wizard.":::

    - Select the **VM image** to use for your hosted machine group. A proposed default Windows 11 image called **Default Windows Desktop Image** is available. If you don't see it, make sure you followed the steps described in [Prerequisites](#prerequisites).

    - Select the **Network connection (optional)** to use for your hosted machine group.

    - Select how you would like to **access** your hosted machine group. You can use your [work or school account](#use-your-work-or-school-account) or use a local admin account you want created. This account is used to run your automations by the bots.

     > [!NOTE]
     > If you select work or school account, enter your email address (and not domain\username) when creating a connection to the hosted machine group.

    - **Review and create** your hosted machine group.

    :::image type="content" source="media/hosted-machine-groups/create-hosted-machine-group.png" alt-text="Screenshot of the hosted machine group creation wizard.":::

## Hosted machine groups availability

Hosted bots in a hosted machine group are created when needed. Whenever a desktop flow waits in the queue and no bot is available, a bot is created automatically. A bot is created as long as the maximum number of bots for this group isn't reached and you have enough unattended add-ons assigned to your environment. You can find more information about licensing requirements in [Licensing requirements](#licensing-requirements).

> [!NOTE]
> If the hosted machine group has just been created or hasn't been used for more than three hours, hosted bots are created before a run gets addressed from the queue. The creation of a bot can take more than 10 minutes depending on its configuration.

## Use custom VM images for your hosted machine groups

You can personalize your hosted machine groups by providing your own Windows image directly from your Azure Compute Gallery. This feature allows you to have all your applications installed on your hosted machine group.

### Image requirements

Custom VM images must meet the following requirements:

- Generation 2 images
- Generalized VM image. Learn more in [generalize VM image](/azure/virtual-machines/generalize).
- 127-GB limit on VM image size
- Microsoft Edge version 80 or higher
- The image definition must have [trusted launch enabled as the security type](/azure/virtual-machines/trusted-launch)


### Create an Azure compute gallery in Azure and add an image

1. Go to the [Azure portal](https://portal.azure.com/).

1. Create a new Azure Compute Gallery and select **Role based access control (RBAC)** in the **Sharing** tab.

1. Select **Review + create**, validate all the settings, and select **Create**.

1. Once you've created an Azure Compute Gallery, create an image definition following the steps in [Create an image definition and an image version](/azure/virtual-machines/image-version). You should create the image in the exact location where we deploy your hosted machine group. You can find the following mapping with your environment Geo:

    - Asia: East Asia
    - Australia: Australia East
    - Brazil: Brazil South
    - Canada: Canada Central
    - Europe: North Europe
    - France: France Central
    - Germany: Germany West Central
    - India: Central India
    - Japan: Japan East
    - Korea: Korea Central
    - Norway: Norway East
    - South Africa: South Africa North
    - Singapore: Southeast Asia (Allowlisted tenants only)
    - Switzerland: Switzerland North
    - United Arab Emirates: UAE North
    - United Kingdom: UK South
    - United States: East US

### Share the Azure compute gallery with Power Automate Hosted Machine Groups service principal

To use the image in Power Automate, you need to share the image with Power Automate through the Azure portal.

1. In the [Azure portal](https://portal.azure.com/), go to your Azure Compute Gallery.

2. Go to the **Access Control (IAM)** settings.

3. Select **Add** > **Add role assignment**.

4. Select the role **Reader** and search for the Hosted machine group application: **Power Automate Hosted Machine Groups**. This allows our service to access the image to create the Hosted machine group.

> [!NOTE]
> If you can't find the application above, verify that the application exists in your tenant and provision it if necessary.
> To verify that the application exists, go to the [Azure portal](https://portal.azure.com/) > **Microsoft Entra** > **Enterprise applications** > **All applications**, and search for application id: **51699864-8078-4c9e-a688-09a1db1b2e09**. If you can't find the application, provision it using the following command:
> ```
> az ad sp create --id 51699864-8078-4c9e-a688-09a1db1b2e09
> ```

### Share the gallery with Power Automate makers

The last step before using your image in Power Automate is to share the image with the Power Automate makers.

1. In the [Azure portal](https://portal.azure.com/), go to your Azure Compute Gallery.

1. Go to the **Access Control (IAM)** settings.

1. Select **Add** > **Add role assignment**.

1. Assign at least **Reader** permissions access to the Power Automate makers you want to share the gallery with. Then select **Next**.

1. Select **Select members** and search for the Power Automate makers you want to share with.

1. Once you select all the members to add, review the permissions and users, and assign them.

### Add a new custom VM image

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select **New** > **VM image**.

1. Enter an image name, a description, and the usage.

    - **Image name:** A unique name to identify the image.
    - **Image description:** An optional description for the image.
    - **Use with:** Select either **Hosted machine group** or **Both**, if you want the image to work with both hosted machines and hosted machine groups.

1. Select one of the images that you have access to from the Azure Compute Gallery.

    :::image type="content" source="media/hosted-machine-groups/new-custom-vm-image.png" alt-text="Screenshot of a new VM image.":::

    > [!NOTE]
    >
    > - The image needs to be replicated in the same Azure region as the hosted machine group.
    > - The list of images available may vary depending on the usage you are selecting.

### Share the image

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines** > **VM images**.

1. Select the image you created.

1. Select **Manage access**.

1. Select **Add people** and enter the names of the persons in your organization with whom you'd like to share the image.

1. Select the names of the persons and choose with which permissions they can access the image.

    :::image type="content" source="media/hosted-machine-groups/share-custom-vm-image.png" alt-text="Screenshot of the Manage access dialog of the VM image.":::

1. Select **Save**.

> [!NOTE]
> When a user isn't part of an environment anymore, you can continue to see it as a deactivated user. You'll be notified in the **Manage access** section of the image if it's shared with deactivated users. In this situation, remove access to them.

## Use a custom virtual network for your hosted machine groups

You can connect to your own virtual network with your hosted machine groups to securely communicate with each other, the Internet, and on-premises networks. Providing your own virtual network from your Azure subscription allows your hosted machine groups to be provisioned with your virtual network automatically.

> [!NOTE]
> You can have up to 30 custom virtual networks configured per tenant.

### General network requirements

To use your own network and provision Microsoft Entra joined hosted machine groups, you must meet the following requirements:

- You must have a virtual network in your Azure subscription in the same region where you created the hosted machine groups.
- Follow [Azure’s Network guidelines](/windows-server/remote/remote-desktop-services/network-guidance).
- A subnet within the virtual network and available IP address space.
- [Allow network connectivity](/power-automate/ip-address-configuration#desktop-flows-services-required-for-runtime) to required services.

The virtual network needs to be created in the same location as your hosted machine groups. Following are the currently supported Power Platfrom geographies and their region mapping:

- Asia: East Asia
- Australia: Australia East
- Brazil: Brazil South
- Canada: Canada Central
- Europe: North Europe
- France: France Central
- Germany: Germany West Central
- India: Central India
- Japan: Japan East
- Korea: Korea Central
- Norway: Norway East
- South Africa: South Africa North
- Singapore: Southeast Asia (Allowlisted tenants only)
- Switzerland: Switzerland North
- United Arab Emirates: UAE North
- United Kingdom: UK South
- United States: East US

### Additional requirements for Microsoft Entra hybrid joined hosted machines groups (preview)

[!INCLUDE [cc-preview-features-definition](../includes/cc-beta-prerelease-disclaimer.md)]

Microsoft Entra hybrid join using custom virtual networks (VNETs) with hosted machine groups lets your hosted machine group bots enroll in both your on-premises Active Directory (AD) and Microsoft Entra ID. This feature is useful when automation requires authentication using an AD account or when devices need to be managed using Group Policy (GPO).

[!INCLUDE [preview-tags](../includes/cc-preview-features-definition.md)]

To use your own network and provision Microsoft Entra hybrid joined machines, you must meet the following requirements:

#### Domain requirements

- Configure your infrastructure to automatically Microsoft Entra hybrid join any devices that domain joins to the on-premises Active Directory. [configuration lets them be recognized and managed in the cloud](/azure/active-directory/devices/overview).
- Microsoft Entra hybrid joined hosted machines need periodic network line of sight to your on-premises domain controllers. Without this connection, devices become unusable. Learn more in [Plan your Microsoft Entra hybrid join deployment](/azure/active-directory/devices/hybrid-join-plan).
- If you specify an organizational unit, ensure it exists and is valid.
- Ensure an Active Directory user account has sufficient permissions to join the computer into the specified organizational unit within the Active Directory domain. If you don't specify an organizational unit, ensure the user account has sufficient permissions to join the computer to the Active Directory domain.
- User accounts that create hosted machines must have a synced identity available in both Active Directory and Microsoft Entra ID.

#### Role and identity requirements

Hosted machine groups users must be configured with [hybrid identities](/azure/active-directory/hybrid/whatis-hybrid-identity) so that they can authenticate with resources both on-premises and in the cloud.

#### DNS requirements

As part of the Microsoft Entra hybrid join requirements, ensure your hosted machine groups can join on-premises Active Directory. To achieve this requirement, the hosted machine groups must resolve DNS records for your on-premises AD environment.
Configure your Azure Virtual Network where the hosted machine groups are provisioned as follows:

1. Ensure your Azure Virtual Network has network connectivity to DNS servers that can resolve your Active Directory domain.
1. From the Azure Virtual Network's Settings, select **DNS Servers** and then choose **Custom**.
1. Enter the IP address of DNS servers that can resolve your Active Directory DNS domain.

### Share the virtual network with Power Automate Hosted Machine Groups service principal

To use your virtual network for hosted machine groups, you need to share the virtual network with Power Automate through the Azure portal.

1. In the [Azure portal](https://portal.azure.com/), go to your Virtual Network

1. Go to the **Access Control (IAM)** settings.

1. Select **Add** > **Add role assignment**.

1. Select the role **Network Contributor** and search for the Hosted machine group application: **Power Automate Hosted Machine Groups**.

> [!NOTE]
> If you can't find the application above, verify that the application exists in your tenant and provision it if necessary.
> To verify that the application exists, go to [Azure portal](https://portal.azure.com/) > **Microsoft Entra** > **Enterprise applications** > **All applications**, and search for application id: **51699864-8078-4c9e-a688-09a1db1b2e09**. If you can't find the application, provision it using the following command:
> ```
> az ad sp create --id 51699864-8078-4c9e-a688-09a1db1b2e09
> ```

### Delegate subnet to Microsoft.PowerAutomate/hostedRpa

To use the subnet configured in your virtual network for hosted machine groups, you need to perform subnet delegation to the **Microsoft.PowerAutomate/hostedRpa** service.

1. In the [Azure portal](https://portal.azure.com/), go to your subnet

1. Go to the **Subnet Delegation** section.

1. Select **Microsoft.PowerAutomate/hostedRpa** from the dropdown list.

### Share the virtual network with Power Automate makers

The last step before being able to reference your virtual network from Power Automate is to share the virtual network with the Power Automate makers.

1. Go to the [Azure portal](https://portal.azure.com/).

1. In the Azure portal, go to your **Virtual network**.

1. Go to the **Access Control (IAM)** settings.

1. Select **Add** > **Add role assignment**.

1. Assign at least **Reader** permissions access to the Power Automate makers you want to share the virtual network with. Then select **Next**.

1. Select **Select members** and search for the Power Automate makers you want to share with.

1. Once you selected all the members to add, review the permissions and users, and assign them.

### Add a new network connection

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines**.

1. Select **New** > **Network connection**.

1. Enter a network connection name, a description, and the usage.

    - **Network connection name:** A unique name to identify the network connection.
    - **Description:** An optional description for the network connection.
    - **Use with:** Select hosted machine group (preview).

1. Select one of the **Azure virtual network** available in Azure that meets the network requirements.

1. Select the **Subnet** the hosted machine groups use.

1. Select the **Domain join type** for the machine.

1. If you select **'Microsoft Entra hybrid join (preview)'**, provide the following information:
   - **DNS domain name** : The DNS name of the Active Directory domain used for connecting and provisioning hosted machines. For example, corp.contoso.com.
   - **Organizational unit (optional)** : An organizational unit (OU) is a container within an Active Directory domain that can hold users, groups, and computers. Ensure this OU syncs with Microsoft Entra Connect. Provisioning fails if this OU isn't syncing.
   - **Network credential** : Stored as an [Azure Key Vault credential](create-azurekeyvault-credential.md). The user principal name (UPN) and its password connect the hosted machine groups to your Active Directory domain. For example, svcDomainJoin@corp.contoso.com. This service account must have permission to join computers to the domain and, if set, the target OU.

    > [!NOTE]
    > Provisioning a new network connection with Microsoft Entra hybrid join domain join type takes 10-15 minutes.

### Share the network connection

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines** > **Network connection**.

1. Select the network connection you created.

1. Select **Manage access**.

1. Select **Add people** and enter the names of the persons in your organization with whom you’d like to share the network connection.

1. Select the names of the persons and choose which permissions they can access the network connection with.

1. Select **Save**.

:::image type="content" source="media/hosted-machines/share-network-connection.png" alt-text="Screenshot of the Manage access of the network connection.":::

> [!NOTE]
> When a user isn't part of an environment anymore, you can continue to see the user as deactivated. You are notified in the **Manage access** section of the network connection if it's shared with deactivated users. In this situation, remove access to the deactivated users.

## View list of hosted machine groups

Once you created your hosted machine group in an environment, you can view its details in the Power Automate portal.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Go to **Monitor** > **Machines**.
1. Select **Machine groups**.

    The list contains both hosted machine groups and standard machine groups. For each item in the list, you can see:

    - The name of the item.
    - The description of the item.
    - The number of the machines in the group (only for standard machine groups).
    - The number of flows running in the item.
    - The number of flows queued in the item.
    - The type of access you have to the item.
    - The owner of the item.

    :::image type="content" source="media/hosted-machine-groups/view-machine-groups.png" alt-text="Screenshot of the available machine groups.":::

    Selecting a hosted machine group in the list takes you to the machine group's details page where you can:

    - View and edit the details of the hosted machine group.
    - Update the VM image used by the hosted machine group.
    - Monitor the machine group's run queue.
    - View past runs.
    - List existing connections referencing the hosted machine group.
    - View provisioning errors on the hosted machine group, if any.
    - Manage access by sharing (or not) the hosted machine group.
    - Delete the hosted machine group.

## Share hosted machine groups

You can share your hosted machine groups with other users so they can create connections and run desktop flows on them. To share a hosted machine group:

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select **Monitor** > **Machines**.

1. Select the **Machine groups** tab.

1. Select a hosted machine group in the list, or navigate to the details page of the desired hosted machine group.

1. Select **Manage access**.

1. Populate the username or email you want to share the hosted machine group with, and select the user you want to add.

1. For each user, you can grant different permissions: **User** or **Co-owner**.

    **User** permission only allows the targeted user to run desktop flows on the selected hosted machine group. A **Co-Owner** can also edit the hosted machine's group details.

> [!NOTE]
> When a user isn't part of an environment anymore, you may continue to see the user as a deactivated user. You'll be notified in the **Manage access** section of the hosted machine if it's shared with deactivated users. In this situation, remove access to them.

## Run desktop flows on hosted machine groups

Power Automate enables you to trigger desktop flows on your hosted machine groups as you do on standard machine groups. To implement this functionality, you need a [desktop flow connection](desktop-flow-connections.md) to your hosted machine group.

To find more information about triggering desktop flows from cloud flows, go to [Trigger desktop flows from cloud flows](link-pad-flow-portal.md).

> [!IMPORTANT]
>
> - Only direct connectivity connections are supported for hosted machine groups.
> - Only available for [unattended run mode](./run-pad-flow.md#unattended-mode).
> - Desktop flows targeting hosted machine groups aren't yet compatible with the **Test flow** feature. It's possible that you observe errors when trying to test your flow. This problem is due to the nature of the [machine groups availability](#hosted-machine-groups-availability). The scheduled test run will still be accessible from the flow run history.

## Monitor your hosted machine groups

You can't directly access or sign in to your hosted machine groups. They're not persisted unless they're running desktop flows. Hosted bots in a group are created based on the current size of the queue, the configuration of the group, and the licenses assigned to the current environment.

For instance, if the hosted machine group is newly created or it wasn't used for more than 3 hours, new hosted bots might need to be provisioned before desktop flow runs. The creation of a bot takes at least 10 minutes, depending on the type of VM Image in use. It's expected that the queue would appear stuck for more than 10 minutes before desktop flows start running.

After this process, new hosted bots are provisioned to run desktop flows in the queue as efficiently as possible.

To monitor your hosted bots:

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to **Monitor** > **Machines**.

1. Select **Machine groups**.

1. Select one of your hosted machine groups.

    In the following example, two hosted bots are available to pick up the first two desktop flows in the queue, and three other desktop flows are queued. The desktop flow runs are marked as **Running** or **Queued** to indicate their state.

    :::image type="content" source="media/hosted-machine-groups/hosted-machine-groups-monitoring.png" alt-text="Screenshot of some queued desktop flows.":::

    After a few minutes, another bot is provisioned to run a third flow as the queue is large enough.

    :::image type="content" source="media/hosted-machine-groups/hosted-machine-groups-monitoring-new-bot.png" alt-text="Screenshot of the queued desktop flows after a new bot is provisioned.":::

## Load balance hosted machine group

The key feature of hosted machine groups is the ability to automatically load balance hosted bots between different groups, hence optimizing your automation resources seamlessly between your different workloads.

The number of hosted bots that can run in your environment is equal to the number of Hosted Process capacity you assigned to your environment excluding the number of hosted machines provisioned in the environment (for example, if you have 10 Hosted Process assigned to your environment, and two hosted machines provisioned, then the number of hosted bots that can run in your environment is eight). This capacity is then load balanced across all the hosted machine groups you have in your environment. Each hosted machine group has a max bot and committed bot configuration that enables you to control the scaling capabilities of the hosted machine group.

The hosted machine group requests to scale out when there aren't enough hosted bots to run desktop flows. It takes into consideration the max and committed bot configuration in the hosted machine group and the available capacity in the environment. The hosted machine group scale-in when the desktop flow queue is lesser than the number of available hosted bots. This capacity then becomes available to other hosted machine groups in the environment.

> [!NOTE]
>
> - **Max bots allow** your hosted machine group to automatically scale to the max bots configuration when required and when resources are available.
> - **Committed bots guarantee** your hosted machine group to automatically scale to the committed  bots configuration when required.
> - View usage of Hosted Process capacity in your environment in the [Hosted Process capacity utilization dashboard](./capacity-utilization-hosted.md).

To update the scaling configuration of your hosted machine group:

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select **Monitor** > **Machines**.

1. Select **Machine groups**.

1. Select one of your hosted machine groups.

1. Select **Settings** at the top of the page.

    :::image type="content" source="media/hosted-machine-groups/edit-hosted-machine-group.png" alt-text="Screenshot of the Edit details of a hosted machine group.":::

### Hosted machine group scaling & load balancing example

In this example, the customer has 10 Hosted Process capacity assigned to the environment and has configured three hosted machine groups with the following configuration.

| Hosted machine group name | Max bots | Committed bots | 
| ----------| -------| -------|
| Invoice Processing | 10 | 4 |
| New Sales Processing | 10 | 4 |
| Refund Request Processing | 10 | 2 |

:::image type="content" source="media/hosted-machine-groups/hosted-machine-group-example.png" alt-text="Hosted machine group scaling example.":::

| Time | Event |
| ----------| ---------------------|
| 9AM - 11:59 AM | The Invoice Processing group has a high volume of desktop flow jobs and autoscales to 10 hosted bots (Max bots configuration) as no other groups have desktop flow jobs. |
| 12PM - 4:59 PM | In addition to the high volume of desktop flow jobs for the Invoice Processing group, the New Sales Processing group now also has a high volume of desktop flow jobs queued, and therefore consumes the committed capacity of four hosted bots.|
| 5PM - 6:59 PM | In addition to the high volume of desktop flow jobs for the Invoice Processing and New Sales Processing groups, the Refund Request Processing group now also has a high volume of desktop flow jobs queued, and therefore consumes the committed capacity of two hosted bots. |

## Update VM Image used by the hosted machine group

You can update the VM image that is used by your hosted machine group. This is beneficial in situations where a custom VM image requires software updates and additional customization to run desktop flows. This feature allows you to update the VM image to be used when creating new hosted bots in your hosted machine group, eliminating the need to delete and recreate it. To update VM image:

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select **Monitor** > **Machines**.

1. Select **Machine groups**.

1. Select one of your hosted machine groups.

1. Select **Update VM image** at the top of the page.

1. From the drop-down list, select the updated VM image to be used by the hosted machine group.

> [!NOTE]
>
> - Upon updating of VM image, all existing hosted bots complete their ongoing desktop flow runs prior to being reprovisioned with the new VM image.
> - The current and updated VM image must have the same security type. For example, you can't update from non-trusted launch enabled to trusted launch enabled, and vice versa.

:::image type="content" source="media/hosted-machine-groups/vm-image-update-select.png" alt-text="Screenshot of the VM image update action on the hosted machine group details page.":::

## Permissions based on security roles

Hosted machine group permissions and roles are iterations on top of [Desktop Flows Machine Management permissions and roles](manage-machines.md#update-permissions-based-on-security-role). Hosted machine groups follow the same rules and privileges as regular machine groups.

### Environment Maker role

By default, users with the **Environment Maker** role can create hosted machine groups in their environment. The four tables that require privileges to use hosted machine groups are:

- Flow Capacity Assignment
- Flow Machine
- Flow Machine Group
- Flow Machine Image
- Flow Machine Network (if using custom virtual network for your hosted machine groups)

:::image type="content" source="media/hosted-machine-groups/environment-maker-role.png" alt-text="Screenshot of the permissions for the Environment Maker role.":::

The Environment Maker role can [create and share custom VM images](#use-custom-vm-images-for-your-hosted-machine-groups) because this functionality requires create and append privileges on the Flow Machine Image.

The Environment Maker role can [create and share custom virtual networks](#use-a-custom-virtual-network-for-your-hosted-machine-groups) because these actions require create and append privileges on the Flow Machine Network.

Admins can also use the roles provided as part of desktop flows. Learn more about desktop flow security roles in [Manage Machines](manage-machines.md#update-permissions-based-on-security-role).

### Desktop Flows Machine Owner role

By default, **Desktop Flows Machine Owners** can create hosted machine groups but can't create custom VM images. They can only use previously shared [custom VM images](#use-custom-vm-images-for-your-hosted-machine-groups) in their own hosted machine groups.

:::image type="content" source="media/hosted-machine-groups/desktop-flows-machine-owner-role.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine Owner role.":::

### Desktop Flows Machine Configuration Admin role

The **Desktop Flows Machine Configuration Admin** role  brings full privileges on the **Flow Machine Image** entity and **Flow Machine Network** entities.. In particular, it allows users with this role to share/unshare VM images to be used for created hosted machine group in their environment. You can find more information about sharing pre-provisioned VM Images in [Create hosted machine groups](#create-hosted-machine-groups).

:::image type="content" source="media/hosted-machine-groups/desktop-flow-machine-configuration-admin-role.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine Configuration Admin role.":::

### Custom virtual network permissions

The [custom virtual network](#use-a-custom-virtual-network-for-your-hosted-machine-groups) feature requires permissions to the  **Flow Machine Network** table. You can grant or deny privileges to this table to control which user can create and share custom virtual networks.

## Use your work or school account

Hosted machine groups support work and school accounts. If you use your work or school account, your hosted machine group has access to your resources that are part of the business plan linked to your organization, such as Office, SharePoint, Azure, and more.

When you register a hosted machine group with this access option, you aren't prompted for credentials. Instead, the machine is registered to your Microsoft Entra, and you can sign in with your Microsoft Entra credentials. To [create a desktop flow connection](desktop-flow-connections.md) to target the hosted machine group, enter your work or school account email address and the associated password.

:::image type="content" source="media/hosted-machine-groups/use-work-school-account-option.png" alt-text="Screenshot of the Use your work or school account option in the hosted machine group creation wizard.":::

### Disable/enable work or school accounts in an environment

The work or school accounts feature is enabled by default. System admins and environment admins can disable or enable the feature from the Power Platform admin center.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Go to **Environments**, and select the appropriate environment.

1. Select **Settings** > **Features**.

1. Under **Hosted RPA**, select the toggle for **Enable work or school accounts for hosted machine groups** to disable or enable this feature.

    :::image type="content" source="media/hosted-machine-groups/enable-work-school-accounts-hosted-machine-groups-option.png" alt-text="Screenshot of the Enable work or school accounts for hosted machine groups option in the tPower Platform admin center.":::

1. Select **Save**.

> [!NOTE]
> Disabling this feature at the environment level will remove the **Work or school account** option in the hosted machine group creation wizard. Also, it will prevent any desktop flows from running using hosted machine groups configured with work or school accounts.

### Disable  work or school accounts at tenant level

To prevent users from creating hosted machine groups with work or school accounts at the tenant level, send a request to support to disable the feature at the tenant level.

> [!NOTE]
>
> - Disabling this feature at tenant level won't hide the **Work or school account** option in the hosted machine group creation wizard. However, the hosted machine group creation will fail with an error.
> - Desktop flows will continue to run using work or school account connection. You need to manually remove hosted machine groups that have been created with the **Work or school account** option.

## Hosted machine groups limitations

This section presents all the limitation of hosted machine groups.

### Geographic availability and restrictions

> [!IMPORTANT]
>
> Starting May 2nd, 2024, we will be updating the region mapping for environments in the United States and United Kingdom to ensure our services are deployed in regions with Azure Availability Zones support. This change will enhance the resiliency and availability of our services. The updated region mapping is as follows:
> - United States: West US -> East US 
> - United Kingdom: UK West -> UK South
>
> After the transition date, all new hosted machine groups will be provisioned in the updated region. If you have an existing hosted machine group that was provisioned before the transition, you will have the option to reprovision your hosted machine group via the Power Automate portal. If you’re using a custom VM image, please ensure that the VM image version has been replicated to the updated region before you reprovision your hosted machine group. Please ensure there are no desktop flow runs queued on the hosted machine group before you run the reprovision process.

The following list displays all the supported geographies in the public clouds:

- Asia
- Australia
- Brazil
- Canada
- Europe
- France
- Germany
- India
- Japan
- Korea
- Norway
- South Africa
- Singapore (Allowlisted tenants only)
- Switzerland
- United Arab Emirates
- United Kingdom
- United States

The following list displays all supported sovereign clouds:

- Government Community Cloud (GCC): US Gov Virginia
- Government Community Cloud High (GCC High): US Gov Virginia
- Department of Defense (DoD): US DoD East

Hosted machine groups aren't yet available in the following sovereign cloud:

- China

### Default VM image deprecation for Windows 11 Enterprise 22H2

Windows versions are supported for a limited time to provide the latest security updates, performance improvements, and features. The default VM image on Windows 11 Enterprise 22H2 is deprecated and replaced by Windows 11 Enterprise 24H2.

> [!NOTE]
> This deprecation doesn't affect Windows version used in custom VM images.

Image scheduled for deprecation:

| Name | Description | Reference | Deprecation date (0:00 UTC) | End of support date (0:00 UTC) |
|------|-------------|-----------|-----------------------------|--------------------------------|
| Default Windows 11 Enterprise 22H2 Image | Default Windows Desktop Image for use in Microsoft Desktop Flows. Windows 11 Enterprise 22H2 with Microsoft Edge. | `MicrosoftWindowsDesktop:windows-ent-cpc:win11-22h2-ent-cpc-os` | February 28, 2025 | May 31, 2025 |

Recommended alternative image:

| Name | Description | Reference |
|------|-------------|-----------|
| Default VM image – Windows 11 Enterprise 24H2 | Default Windows Desktop Image for use in Microsoft Desktop Flows. Windows 11 Enterprise 24H2 with Microsoft Edge. | `MicrosoftWindowsDesktop:windows-ent-cpc:win11-24h2-ent-cpc` |

Impact:

- After the deprecation date, you can't deploy new hosted machine groups with the deprecated image.
- If you don't take action by the end of support, affected hosted machine groups are automatically reprovisioned to the recommended default image.

Action:

1. Review all affected hosted machine groups by navigating to the **VM images** tab under the **Machines** page in the Power Automate Portal.
1. To ensure compatibility, test your desktop flows with the recommended alternative image in a nonproduction environment.
1. After validation, use the [update VM image](#update-vm-image-used-by-the-hosted-machine-group) to reprovision the hosted machine groups to the recommended alternative default image.

### Sovereign clouds limitations for hosted machine groups

The following features aren't supported in sovereign clouds:

| Feature not supported | Sovereign clouds|
| ----------| --------------|
| Work or school account | GCC, GCC High, DoD |
| Custom VM images | GCC, DoD |

### Remote desktop to hosted machine groups

Remote desktop to hosted machine groups isn't supported. Hosted machine groups are meant to be used for unattended runs only, and remote desktop access from the Internet isn't required to run Power Automate desktop flows.

### Limit on the number of hosted machine groups per environment

The number of hosted machine groups is limited to 10 for each environment. If you reach this limit, delete an existing hosted machine group to create a new one.

### Limit on the number of bots per hosted machine group

The maximum number of hosted bots per hosted machine group is limited to 50.

### Delete unused resources

We delete unused resources to ensure the service is available for everyone. Therefore, all hosted machine groups that don't have a committed bot configured are automatically deleted if they remain inactive for more than 28 days. Although the deleted groups remain visible, they can't be used. An inactive group is defined as a group that hasn’t run any desktop flows in the last 28 days.

> [!NOTE]
> You must delete the hosted machine group and create a new one to continue using its features. You'll need to reconfigure the connection that's associated with your cloud flow.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
