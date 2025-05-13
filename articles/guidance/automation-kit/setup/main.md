---
title: Set up the automation kit main components
description: Learn how to set up the automation kit main components.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
contributors:
  - Grant-Archibald-MS
  - v-aangie
editor: ''
ms.custom: guidance
ms.topic: how-to
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/21/2023
ms.author: macarrer
ms.reviewer: angieandrews
---

# Set up the automation kit main component

This section includes the manual install process for the main solution of the automation kit. There's an automated [command line installer](./command-line-install.md) that will also guide you through this process.

Once you've completed the main solution setup, you can setup the following optional components:

- [Satellite](./satellite.md): Allows you to meter deployed Automation Project solutions.

- [Scheduler](./scheduler.md) - Provides a calendar view of recurring cloud flows that include Power Automate Desktop flows.

>[!IMPORTANT]
>Perform all steps using the **Automation CoE Admin** account mentioned in the [Prerequisites](prerequisites.md) article.

## Import the main solution into the main environment

Create an environment in which to set up the automation kit.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select **Environments > + New**, and then enter a name, type, and purpose.

1. Select **Yes** to create the database, and then select **Next**.

1. Keep sample apps and data set to **No**.

1. Select **Save**.

## Enable the Power Apps component framework

Once the environment is created, enable the Power Apps component framework.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select an environment where you want to enable this feature.

    You need to do this for **main** and all **satellite** environments.

1. On the top pane, select **Settings**.

1. Select **Product** > **Features**.

1. Turn on **Allow publishing of canvas apps with code components**.

16. Select **Save**.

### Import the Creator Kit

Next, import the [Power Platform Creator Kit](/power-platform/guidance/creator-kit/overview).

1. Download the [Power Platform Creator Kit](https://aka.ms/creatorkitdownload).

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to the environment you just created in which the main solution will be imported. For this example, we're importing to the environment named **Contoso_Main**.

1. On the left pane, select **Solutions**.

1. Select **Import** > **Browse**.

1. Select the Creator Kit solution named **CreatorKitCore_x_x_x_x_managed.zip**.

1. Select **Import**.

    Wait for the Creator Kit to finish importing before continuing to the next step.

### Import the automation kit main solution

1. Download the most recent release of the automation kit main managed solution from the **Assets** section of the [automation kit](https://github.com/microsoft/powercat-automation-kit/releases) file.

1. On the left pane, select **Solutions**.

1. Select **Import** > **Browse**.

1. Select the Automation CoE main solution (**AutomationCoEMain_x_x_x_x_managed.zip**).

1. After the compressed (.zip) file loads, select **Next**.

1. Review the information, and then select **Next**.

1. Establish connections to activate your solution.

    If you create a new connection, you must select **Refresh**. You won't lose your import progress.

1. Select **Import**. The import process can take 10 to 20 minutes to complete.

1. After importation completes, verify that all the flows are turned on, and share the apps with the appropriate users.

## (Optional) Provision the approvals solution

This step is optional.

In new environments, Power Automate approvals functionality isn't configured by default. After Power Automate initiates an approval, the approvals solution gets created.

This process usually takes 5 to 10 minutes. You can do this step while the main solution is being imported.

1. Sign in to [Power Automate](https://make.powerautomate.com). This is where the main solution is being imported.

1. On the menu to the left, select **My flows** > **New flow** > **Instant cloud flow**.

1. Under the button trigger, add the **Start and wait for approval** action to the flow.

1. Fill in your details to trigger the flow.

   Here's is an example of how you can configure the **Start and wait for approval** action.

    :::image type="content" source="../media/approval-card.png" alt-text="Screenshot of the start and wait for an approval action card configured.":::

To learn more about approvals provisioning, go to [Power Automate Approvals Provisioning Overview and Troubleshooting](https://support.microsoft.com/topic/power-automate-approvals-provisioning-overview-and-troubleshooting-2306313a-49fa-efde-c716-a34c573ec942).

## Assign security roles

Once the importation completes, assign security roles to members of the organization. The main solution comes with three security roles.

Review roles and assign roles based on responsibility.

- **Automation Project Admin**: Maintains the configuration data in the automation kit and maps automation projects to environments.

- **Automation Project Contributor**: Generates or requests new automation projects.

- **Automation Project Viewer**: The business process owner who approves or rejects automation project requests.

To assign roles:

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).

1. Select your main environment.

1.  Under **Security roles** on the **Access** card, select **See all**.

1. Select the security role, and then add members to the security role.

## Sync environments

Follow these steps to sync environments. The main solution has a cloud flow called **Sync Environments**.

1. Select the **Sync Environments** flow.

1. Trigger it if it hasn’t run.

1. Wait for the run to complete.

## Import the desktop flow actions csv

Import all the desktop flow actions from the csv file into the **Desktop Flow Action** table.

This must be done for all environments in which the automation kit is installed, such as main and all satellites.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Go to your environment where the solution is installed.

1. Select the **Solutions** tab.

1. Find and then select the Automation COE Main solution.

1. Select the **Desktop Flow Action** table.

1. Expand the **Import** list near the top.

1. Select **Import data from Excel**.

1. After the popup opens, select **Upload**, and then upload the included Excel file named **autocoe_desktopflowactions.csv**.

1. Wait for the **mapping status** to show as successful.

1. Select **Import**.

1. After the import completes, verify that the data was imported.
