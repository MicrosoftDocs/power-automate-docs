---
title: Customize a report with your own Fabric workspace
description: Learn how to use your own custom Fabric workspace and leverage a higher capacity to analyze processes with the process mining capability.
author: rosikm
contributors:
  - rosikm
  - v-aangie 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 04/03/2025
ms.author: michalrosik
ms.reviewer: ellenwehrle
search.audienceType: 
  - flowmaker
  - enduser
#customer intent: As a business process analyst, I want to customize a report with my own Fabric workspace so that I can leverage a higher capacity to analyze processes with a lot more data.
---

# Customize a report with your own Fabric workspace

You can use your own custom Fabric workspace and leverage a higher capacity to analyze processes with a lot more data. You're also able to customize the look and feel of the report.

When using you own custom Fabric workspace, data from Power Automate Process Mining is first stored in Fabric Lakehouse where they're transformed into delta tables. A semantic model is automatically created on top of the tables to power the default report. The Power BI report connects to the data using [Direct Lake mode](/fabric/fundamentals/direct-lake-overview).

## Set up your workspace prerequisites

To connect the workspace to the process mining capability and then customize the default report (or create a new one) you need to:

- Ensure that [Users can access data stored in OneLake with apps external to the Fabric](/fabric/admin/service-admin-portal-onelake#users-can-access-data-stored-in-onelake-with-apps-external-to-fabric) option is switched on in the OneLake tenant settings.
- Create and set up your Fabric workspace.
- Assign admin access rights on the workspace to Process Insights service principal.
- Create a Fabric Lakehouse in the connected workspace.

The following sections in this article walk you through how to set up your workspace.

### Check the App registration settings in AAD

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Search for **azure active directory** in the search bar and select **Microsoft Entra ID**.
1. Under **Manage**, select **Users**.
1. Select **User settings** and review the **App registrations** selection.

    - If **App registrations** is **Yes**, any user can register the process mining capability as an app.
    - If **App registrations** is **No**,  only admins can register apps. If you're an admin, you can choose to turn this on to allow others to register the process mining capability as an app.

1. On the Windows taskbar, select **Search**.
1. Type **powershell**, and then select **Run as Administrator**.

### Install Azure tools and register a Process Insights service principal in AAD

If you didn't do this yet, install the Azure tools.

1. On the **Administrator: Windows PowerShell** screen, type **Install-Module AzureAD**, and then select **Enter**.
1. When prompted to confirm installation, enter **Y**, and then select **Enter**.
1. Connect your Azure account by typing **Connect-AzureAD**, and then sign in.
1. Validate that you're signed in.
1. Register the process mining service principal by typing this command:

    **New-AzureADServicePrincipal -AppId dad3c6de-ed58-42ef-989f-9c0303aaeedc -DisplayName 'Process Insights Prod'**

1. Sign in to [Microsoft Power BI](https://app.powerbi.com/).
1. Select the ellipsis (**...**) > **Settings** > **Admin portal**.
1. Scroll down to **Developer settings** and do the following steps:

    1. Expand the dropdown menu for **Embed content in apps** and enable it by toggling the slider.
    1. Expand the dropdown menu for **Allow service principals to use Power BI APIs** and enable it by toggling the slider.
  
    :::image type="content" source="media/process-mining-pbi-workspace/pbi-api-toggles.png" alt-text="Developer settings in Power BI to enable embedding content and allow service principals to use APIs.":::

1. Return to the Power BI home page.

### Create your own custom Fabric workspace

Now that you connected to the process mining capability and installed the Microsoft Azure tools, you can create your own custom Fabric workspace.

1. Select **Workspaces** > **Create a Workspace**.
1. In **Advanced Options**, select a *Fabric capacity*.
1. Select **Apply**.
1. In the created workspace, select **Manage access**.
1. Select **Add people or groups**.
1. Select **Search for**, and then add **Process Insights Prod**.
1. Assign it **admin access**.

   > [!IMPORTANT]
   > It's required that the service principal gets added as an admin. If you skip this step, the feature doesn't work.

### Use existing Fabric workspace

You can also use an already existing Fabric workspace. Ensure that your account has at least **Contributor** access rights in that workspace and ensure you meet the other prerequisites.

### Create a Fabric Lakehouse

Now it's necessary to create a Fabric Lakehouse to store the delta tables for the semantic model:

1. Go to your workspace.
1. On the top left corner, select **New item**.
1. On the panel to the right, search or select **Lakehouse**.
1. Fill in the name of your Lakehouse and ensure that the Lakehouse schemas option is **unchecked** (*Lakehouse schemas are currently not supported*). You can use a single Lakehouse for all your processes in this workspace, or you can create a new Lakehouse for each process. A separate semantic model is always created for a single process.
1. Wait until the Lakehouse is successfully created.
1. Lakehouse is automatically created with a default semantic model and a SQL analytics endpoint. After the process is ingested and analyzed, a new semantic model is created. The default semantic model isn't used by Power Automate Process Mining.

## Load your process analytics in Fabric

To start customizing your report, load your process analytics in Fabric. Take these steps:

1. Sign in to [Power Automate](https://make.powerautomate.com/).
1. Navigate to your Power Platform environment.
1. from the left navigation, select **Process mining**.
1. In the **Create new process** section, select **Start here**.
1. Fill in the process name and select the ingestion type (location of your data).
1. Select **Continue**.
1. Select **Your Fabric workspace** > **Continue**.
1. From the lists, select your **Fabric workspace** and **Fabric Lakehouse**.
1. In the required **Report name** field, give the report a unique name.

    We recommend that you use a *unique name*. If you use a report name that already exists, the process mining capability overwrites the existing report of another process. This could lead to loss of custom reports and composite datasets of that process. After refreshing the process, if you decide to change the report name, you need to publish a new report.

1. Select **Continue**.
1. Follow the rest of the wizard steps based on the selected ingestion method.
1. Once the process analysis completes successfully, you can access the default report created in the workspace, [newly created semantic model](process-mining-fabric-semantic-model.md), and delta tables created in your Fabric Lakehouse.

## Customize reports in Fabric workspace

With the powerful integration of the process mining capability with Power BI, you can customize your process reports in an attached Fabric workspace. In this example, you perform a simple customization of the Power BI report to include a card that holds or tracks one of the analytic measures.

 To be able to do this, make sure you completed these steps in this article:

- [Connect your Fabric workspace to the process mining capability](#set-up-your-workspace-prerequisites)
- [Create your own custom Fabric workspace](#create-your-own-custom-fabric-workspace)
- [Load your process analytics in Fabric](#load-your-process-analytics-in-fabric)

After completing these steps, return to the analytics page of your process in the process mining capability.

1. Select **Open in Power BI**. If you don't see this button, make sure you completed the steps in the [Load your process analytics in Fabric](#load-your-process-analytics-in-fabric) section in this article. This redirects you to a Power BI web screen that shows you a report of your process.
1. Begin customizing your report by downloading it to your local machine. To do this, select **File** > **Download this file**.

    :::image type="content" source="media/process-mining-pbi-workspace/download-file.png" alt-text="Screenshot of the 'Download this file' dropdown menu option.":::

1. To download a report with a live connection., select **A copy of your report with a live connection to data online (.pbix)**.
1. Open the downloaded report in Power BI for desktop. Ensure you have the latest Power BI for desktop version and the preview feature [Enable PBIR format is switched on](/power-bi/developer/projects/projects-report#enable-pbir-format-preview-feature).
1. Move the cards that hold the donuts (blue circles) for the **Variants**, **Cases**, and **Activities** metrics to the right by selecting and dragging each card.
1. On the **Visualizations** pane, select the *card element*.
1. A new card appears. Resize it, and then drag it to the left of the **Variants** donut (blue circle).
1. On the **Data** pane, expand **ReportMeasures** and select **Self Loop %**.
1. On the command bar, select **Save**.

    In your process, you don't have any self loops, so you should see **0.00%** in that card.

    :::image type="content" source="media/process-mining-pbi-workspace/zero-self-loops.png" alt-text="Highlights a new 'Self Loop' card with 0.00 percent in a report.":::

1. Save the report.
1. Go to the **Home** tab and then select **Publish**.
1. Select your *workspace*, and choose **Select** to publish the report to the Power BI service.

    After the report successfully publishes, you can open it from the pop-out window.

You successfully customized your Power BI report. Every time you refresh your process and reopen your Power BI report, it updates your metrics and customizations. Try out Power BI and customize your reports to see and learn how they can help you analyze your process effectively.

Once this step is done, the report in your Fabric workspace displays with the report name that you entered. You can edit and save it. Your report is updated with the changes that you made with Power BI.

If you encounter issues or error messages, go to [Troubleshooting](process-mining-troubleshoot.md#issues-with-your-own-power-bi-workspace).

## Related information

[Workspaces in Fabric and Power BI](/fabric/fundamentals/workspaces)
