---
title: Hosted RPA bots (preview) | Microsoft Docs
description: Hosted RPA bots (preview)
author: mustlaz

ms.subservice: desktop-flow
ms.topic: article
ms.date: 5/5/2022
ms.author: mustlaz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Hosted RPA bots (preview)

[!INCLUDE cc-beta-prerelease-disclaimer]

Hosted RPA bots (preview) allow you to run unattended automation at scale without the need to provide or setup any machine. Hosted RPA bots (preview) can be created like any other machine group and machines will be automatically provisioned by Power Automate based on the defined configuration. Desktop flows assigned to a group of hosted RPA bots (preview) will get queued to it when triggered to run.
Like for any machine group, when a bot in the group is available, it will be assigned the next desktop flow to be executed in the queue. Learn more about [the desktop flow queues](monitor-desktop-flow-queues.md).

## Licensing requirements

To be able to use Hosted RPA bots (preview), one of the following licensing options is needed:

### Using the existing Power Automate per user plan with attended RPA or per flow plan + the Power Automate unattended RPA add-ons

During the preview period, Hosted RPA bots (preview) will be available using the existing licenses to run unattended RPA which means the Power Automate per user plan with attended RPA or the per flow plan + the Power Automate unattended RPA add-on with no additional charges. You need to assign to your environment as many add-ons as many bots you want to run in parallel in your environment.

### Using the Power Automate per user plan with attended RPA trial + the Power Automate unattended RPA add-on trials

The plans and add-ons mentioned above have trial versions which last 30 days and could be extended once to a total of 60 days. Organization admins could obtain up to 25 seats from [Microsoft 365 admin center](../overview-cloud.md), assign those attended RPA trials to 25 individual makers, and assign the unattended add-ons to targeted environments. [Click here](../organization-q-and-a.md#power-automate-rpa-license) to learn more.

### Using the 90-days self-assisted premium trial

Trial users can create up to 10 hosted RPA bots groups and can have up to 2 bots running in parallel in a given environment. You can start a trial either from the From the Power Automate [pricing page](https://powerautomate.microsoft.com/pricing/) click the Try free link under Per-user plan with attended RPA or from the Power Automate portal [desktop flow page](https://flow.microsoft.com/manage/uiflows).

## Prerequisites

### Getting access to the default VM image

To be able to create Hosted RPA bots (preview), you need to have access to the default VM image that is part of your environment. You can view the default image from **Monitors** > **Machines** > **VM images (preview)**

![vm-images-preview-list.png](./media/hosted-rpa-bots/vm-images-preview.png)

> - Users will need either the **System Administrator** or **Desktop Flow Machine Image Admin** role to be able to see and manage the default image.
> - For other users, the System Administrator or Desktop Flow Machine Image Admin will need to first share the default image with them before they can use it.

### Sharing the default image

1. Sign into Power Automate
2. Select **Monitor** > **Machines** > **VM images (preview)**
3. Select the "Default Windows Desktop Image" from the list.
4. Select **Manage access**.
5. Select the **Add people** field, then enter the name of the person in your organization with whom you’d like to share the image.
6. Select the name of the person and which permissions they have to get access to the machine or co-own it as well.
7. Click **Save**

![share-vm-image-panel.png](./media/hosted-rpa-bots/share-vm-image.png)

## Create hosted RPA bots (preview)

Hosted RPA bots (preview) can be created from the Power Automate portal:

1. Sign into Power Automate.
2. Select **Monitor**, then select **Machines**.
3. Select **New machine**, then select **Group**.
4. Select "**hosted RPA bots (preview)**" as your machine group type.
5. Enter a name for your hosted RPA bots (preview), then optionally enter a description.
6. Define how many bots maximum you want to assign to this group.

>[!NOTE]
>
> - You cannot go beyond the total number of bots assigned to your environment.
> - If multiple Hosted RPA bots (preview) groups are used in the same environment, bots will be automatically load balanced between the groups. Learn more about [Hosted RPA bots (preview) load balancing](./hosted-rpa-bots.md#load-balance-hosted-rpa-bots-preview).

7. Select a **VM image** from the ones you have access to. We propose a default Windows 11 image called "Default Windows Desktop Image". if you don't see it, make sure you follow the steps described in the [prerequisites](./hosted-rpa-bots.md#prerequisites) section.
8. Provide the local admin account you want to be created and that would be used to run your automations by the bots.
9. Click **Create**.

![create-hosted-bots-panel.png](./media/hosted-rpa-bots/create-hosted-rpa-bots.png)

## Hosted RPA bots (preview) availability

 Bots in a group are created when needed. Whenever a desktop flow is waiting in the queue and no bot is available, a bot will be created as long as the maximum number of bots for this group is not reached and you have enough unattended add-ons assigned to your environment. See more information about the [licensing requirements](./hosted-rpa-bots.md#licensing-requirements).

>[!NOTE]
>
> - If the Hosted RPA bots (preview) group has just been created or haven't been used for more than 24 hours, bots will be created before a run gets addressed from the queue. The creation of a bot can take 10 minutes or even more based on its setup.

## Use custom VM images (preview) for your hosted RPA bots (preview)

>[!NOTE]
>
> - If you would like to use this feature, which is still in private preview, please contact us through this form: <https://forms.office.com/r/JhGRsZbTWX>.

You can personalize your **Hosted RPA bots (preview)** by providing your own Windows image directly from your [Azure Compute Gallery](https://docs.microsoft.com/azure/virtual-machines/shared-image-galleries), it will allow you to have all your application installed on the Hosted RPA bots that we provision for you.

### Add a new custom VM image (preview)

1. Sign into Power Automate.
2. Select **Monitor**, then select **Machines**.
3. Select **New VM image (preview)**
4. Enter an image name and a description.

- Image name: A unique name to identify the image.
- Image description: An optional description for the image.

5. Select one of the images that you have access to directly from Azure.

![new-custom-vm-image-panel.png](./media/hosted-rpa-bots/new-custom-vm-image.png)

The image needs to be replicated in the same Azure region as the Hosted RPA bot is deployed.

### Sharing the image

1. Sign into Power Automate.
2. Select **Monitor** > **Machines** > **VM images (preview)**.
3. Select the image you have created.
4. Select **Manage access**.
5. Select the **Add people** field, then enter the name of the person in your organization with whom you’d like to share the image.
6. Select the name of the person to choose with which permissions they can access the machine.
7. Click **Save**.

![share-custom-image.png](./media/hosted-rpa-bots/share-custom-vm-image.png)

## View list of hosted RPA bots (preview)

Once you have created your Hosted RPA bots (preview) group in an environment, you can view its details in the Power Automate portal. You can also view all other Hosted RPA bots (preview) that you have access to.

1. Sign into Power Automate.
2. Select **Monitor > Machines**.
3. Select **Machine groups**.

The list contains both Hosted RPA bots and standard machine groups, for each item in the list, you can view:

- The name of the item.
- The description of the item.
- The number of the machines in the group (only for standard machine groups).
- The number of flows running in the item.
- The number of flows queued in the item.
- The type of access you have to the item.
- The owner of the item.

![view-machine-groups.png](./media/hosted-rpa-bots/machine-group-view.png)

Clicking on a Hosted RPA bots (preview) in the list will take you to the Hosted RPA bot details page where you will be able to:

- View and edit the details of the bots group.
- Monitor the bots run queue.
- View past runs.
- List existing connections referencing the bot.
- View provisioning errors on the bot (if any).
- Manage access by sharing (or not) the bot.
- Delete the group.

## Share Hosted RPA bots (preview)

You can share Hosted RPA bots with other users so they can create connections to them and run Desktop Flows on them. To share a Hosted RPA Bot:

1. Sign into Power Automate.
2. Select **Monitor > Machines**.
3. Select the **Machine groups** tab.
4. Select a Hosted RPA bot in the list, or click on the item in the list to navigate to the Hosted RPA bot details page.
5. Click on **Manage acccess**.
6. Type in the user name or email you want to share the Hosted RPA bot with, select the user you want to add.
7. For each user you can grant different permissions: **User** or **Co-owner**.

**User** permission will only allow the targeted user to run Desktop Flows on the selected Hosted RPA bots (preview). A **Co-Owner** can also edit the Hosted RPA bots (preview) details.

## Trigger a desktop flow to run on your Hosted RPA bots (preview)

   >[!IMPORTANT]
   >
   > To trigger desktop flows to run on Hosted RPA bots (preview), you need:
   >
   > - A machine group of type "Hosted RPA bots (preview)". To create a machine group of type "Hosted RPA bots (preview)", please refer to the [Create Hosted RPA bots (preview)](./hosted-rpa-bots.md#create-hosted-rpa-bots-preview)) section.
   > - A connection targeting your Hosted RPA bots.
   >
   > **Hosted RPA bots (preview) setup limitations**:
   >
   > - Only direct connectivity connections are supported.
   > - Only local account credentials are supported for now. E.g.: the credentials that were provided upon hosted RPA bots (preview) creation.
   > - Only available for [unattended run mode](./run-pad-flow.md#unattended-mode).

### Trigger a desktop flow

You can trigger a desktop flow to run on your Hosted RPA bots the same way you trigger desktop flows on standard machine groups. If you are not familiar with how to trigger Power Automate desktop flows, please refer to [this section](./link-pad-flow-portal.md).

1. While editing your Power Automate flow, add a Power Automate desktop flow action, and create a connection of type "Directly to machine".

![connection-directly-to-machine.png](./media/hosted-rpa-bots/connection-direct-to-machine.png)

1. Select the Hosted RPA bots you want to target. Hosted RPA bots will appear among the machines or standard machine groups.

    ![connection-setup.png](./media/hosted-rpa-bots/connection-sample-rpa-bots.png)

2. Enter the credentials of the account you want to use.

    ![connection-credentials.png](./media/hosted-rpa-bots/connection-sample-rpa-bots-password.png)

3. Select the Power Automate desktop flow to run.

    ![connection-desktop-flow.png](./media/hosted-rpa-bots/connection-sample-desktop-flow.png)

4. Set the run mode to **unattended**.

   ![connection-run-unattended.png](./media/hosted-rpa-bots/connection-unattended-mode.png)

5. Now you can save your flow and run it like any other flow triggering a Power Automate desktop flow.

   >[!IMPORTANT]
   >
   > **Known issue**: Power Automate desktop flows targeting hosted RPA bots are not yet compatible with the "Test flow" feature. It is possible that you observe errors (e.g. Flow run timed out. Please try again.) when trying to test your flow. This problem is due to the nature of the [bots availability](./hosted-rpa-bots.md#hosted-rpa-bots-preview-availability). The scheduled test run will still be accessible from the flow run history.

## Monitor your hosted RPA Bots (preview)

You cannot directly access or log into your Hosted RPA Bots (preview). They are generally speaking not persisted unless they are running Desktop Flows.

Bots in a group are created based on the current size of the queue, the configuration of the group and the licenses assigned to the current environment.

For instance, if the group was just created or if it was not used for more than 24 hours, new bots may need to be provisioned before a desktop flow can run. The creation of a bot generally takes at least 10 minutes, depending on the type of VM Image in use. It is expected that the queue would appear "stuck" for more than 10 minutes before desktop flows start running.

After that, new bots will spawn to run desktop flows in the queue as efficiently as possible.

To monitor your bots:

1. Sign into Power Automate.
2. Select **Monitor > Machines**.
3. Select **Machine groups**.
4. Select one of your hosted RPA bots (preview) group

In the example below, 2 bots are available to pick up the first two desktop flows in the queue, and three other desktop flows are queued. The desktop flow runs are marked as "Running" or "Queued" to indicate this.

 ![image-bots-monitoring.jpg](./media/hosted-rpa-bots/hosted-rpa-bots-monitoring.jpg)

After a few minutes, another bot is provisioned to run a third flow as the queue is big enough.

 ![image-new-bot.jpg](./media/hosted-rpa-bots/hosted-rpa-bots-monitoring-new-bot.jpg)

## Load balance hosted RPA bots (preview)

One key feature of hosted RPA bots (preview) is the ability re-assign them to different groups and hence be able to seamlessly load balance your automation resources between your different workloads. For instance, you may have two groups of bots, one for your sales automations and one for finance in one same environment with 10 bots assigned. You can put more on one group or the other at any time by editing a hosted RPA bots (preview) group and using the max number of bots slider.

1. Sign into Power Automate.
2. Select **Monitor > Machines**.
3. Select **Machine groups**.
4. Select one of your hosted RPA bots (preview) group
5. Click on **Edit details** button at the top

 ![bots-edition.png](./media/hosted-rpa-bots/edit-rpa-bots.png)

## Updated permissions based on security roles

Hosted RPA Bots (preview) permissions and roles are iterations on top of Desktop Flows Machine Management permissions and roles - see : [Manage Machines - Update permissions based on security roles](./manage-machines.md#update-permissions-based-on-security-role). Using a previously created Hosted RPA Bots (preview) group follows the same rules and privileges as a regular group.

### Environment Maker Role

By default, Environment Maker role can create Hosted RPA Bots (preview) in their environment. The three entities that require privileges to use Hosted RPA Bots (preview) are:

- Flow Machine
- Flow Machine Group
- Flow Machine Image

 ![environment maker role.jpg](./media/hosted-rpa-bots/hosted-rpa-bots-roles.jpg)

Environment Maker role can create and share custom VM Images (see also [Use custom VM Images for your hosted RPA bots (preview)](./hosted-rpa-bots.md#use-custom-vm-images-preview-for-your-hosted-rpa-bots-preview), as this requires create and append privileges on the Flow Machine Image.

Admins can also use the roles provided as part of Desktop Flows ( see [Manage Machines - Update permissions based on security roles](./manage-machines.md#update-permissions-based-on-security-role).

### Desktop Flows Machine Owner Role

By default, Desktop Flows Machine owner can create Hosted RPA Bots (preview) groups but cannot create custom VM images  - they can only used previously shared custom VM images in their own Hosted RPA Bots (preview) groups (see also [Use custom VM images (preview) for your hosted RPA bots (preview)](./hosted-rpa-bots.md#use-custom-vm-images-preview-for-your-hosted-rpa-bots-preview).

![machine owner role.jpg](./media/hosted-rpa-bots/hosted-rpa-bots-roles-2.jpg)

### Desktop Flows Machine Image Admin Role

The Desktop Flows Machine Image Admin role only brings full privileges on the Flow Machine Image entity. In particular, it allows users with this role to share / unshare VM images to be used for created Hosted RPA Bots (preview) in their environment. See also [Create Hosted RPA bots (preview)](./hosted-rpa-bots.md#create-hosted-rpa-bots-preview) for information about sharing pre-provisioned VM Images before creating your first Hosted RPA Bots (preview) group.

![image admin role.jpg](./media/hosted-rpa-bots/hosted-rpa-bots-roles-3.jpg)

## Hosted RPA bots (preview) limitations

### Geographical availabilities/restrictions

Here is the list of supported geographies in the public clouds:

- United States
- Germany
- Brazil
- Canada
- Europe
- France
- Asia Pacific
- Australia
- Japan
- India
- United Kingdom
- Switzerland
- Norway

   >[!Important]
   >
   > Hosted RPA bots (preview) is not yet available in sovereign clouds and is not yet available in the following public cloud geographies:
   > - United Arab Emirates
   > - Korea

### Setup desktop flows connections for hosted RPA bots (preview)

Hosted RPA bots (preview) can be accessed only with local windows accounts.
   >[!Note]
   >
   > When creating Hosted RPA bots (preview), you are asked to provide credentials for a local account. You can use this account to setup connections targeting the Hosted RPA bots (preview).

Active Directory and Azure Active Directory accounts are not supported yet. This feature will be available in a next release.

### Network limitations for hosted RPA bots (preview)

Hosted RPA bots (preview) do not have access to on-premises data sources or other on-premises resources.
Hosted RPA bots (preview) can't be accessed from internet, the inbound traffic is blocked.

   >[!Note]
   >
   > Connecting on-premises network to hosted RPA bots (preview) will be available in a next release.

### Remote desktop to Hosted RPA bots (preview)

Remote desktop to Hosted RPA bots (preview) is not supported. Hosted RPA bots (preview) are meant to be used for unattended runs only, remote desktop access from internet is not required to execute Power Automate desktop flows.

### Limit on the number of Hosted RPA bots (preview) group per environment during Public preview

During the Public preview, number of bot groups is limited to 10 for each environment. If you reach this limit, please delete an existing hosted RPA bots (preview) group to create a new one.
