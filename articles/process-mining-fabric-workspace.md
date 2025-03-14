---
title: Customize a report with your own Fabric workspace (preview)
description: Learn how to use your own custom Fabric workspace and leverage a higher capacity to analyze processes with the process mining capability.
author: rosikm
contributors:
  - rosikm
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/14/2025
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Customize a report with your own Fabric workspace (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

You can use your own custom Fabric workspace and leverage a higher capacity to analyze processes with a lot more data. You're also able to customize the look and feel of the report.
When using custom Fabric workspace, data from Power Automate Process Mining will be first stored in Fabric Lakehouse from where they are transformed into delta tables. A semantic model is automatically created on top of the tables to power the default report. The Power BI report is connected to the data using [Direct Lake mode](/fabric/fundamentals/direct-lake-overview).

> [!IMPORTANT]
> [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Set up your workspace

To connect the workspace to the process mining capability and then customize the default report (or create a new one) you need to:
- Create and set up your Fabric workspace 
- Assign admin access rights on the workspace to Process Insights service principal
- Create a Fabric Lakehouse in the connected workspace
    
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

    **New-AzureADServicePrincipal -AppId dad3c6de-ed58-42ef-989f-9c0303aaeedc -DisplayName ‘Process Insights Prod’**

1. Sign in to [Microsoft Power BI](https://app.powerbi.com/).

1. Select the ellipsis (**...**) > **Settings** > **Admin portal**.

1. Scroll down to **Developer settings** and do the following steps:

    1. Expand the dropdown menu for **Embed content in apps** and enable it by toggling the slider.
    2. Expand the dropdown menu for **Allow service principals to use Power BI APIs** and enable it by toggling the slider.
  
    :::image type="content" source="media/process-mining-pbi-workspace/pbi-api-toggles.png" alt-text="Screenshot of the developer settings.":::

1. Return to the Power BI home page.

### Create your own custom Fabric workspace

Now that you connected to the process mining capability and installed the Microsoft Azure tools, you can create your own custom Fabric workspace.

1. On the left panel, select **Workspaces** > **Create a Workspace**.

1. In **Advanced Options**, select a Fabric capacity.

1. Select **Apply**.

1. In the created workspace, select **Manage access**.

2. Select **Add people or groups**.

1. Select **Search for**, and then add **Process Insights Prod**.

1. Assign it **admin access**.

   > [!IMPORTANT]
   > It's required that the service principal gets added as an admin. If you skip this step, the feature doesn't work.

### Use existing Fabric workspace

You can also use an already existing Fabric workspace. In this case please ensure, that you account has at least **Contributor** access rights in that workspace and ensure other pre-requisites are also met.

### Create a Fabric Lakehouse

Now it is necessary to create a Fabric Lakehouse to store the delta tables for the semantic model:
1.	Navigate to your workspace

2.	Click the **New item** button in the top left corner

3.	In the right panel search or select **Lakehouse**

4.	Fill in the name of your Lakehouse and ensure that the Lakehouse schemas option is unchecked. 
(*Lakehouse schemas are currently not supported*)

You can use a single Lakehouse for all your processes in this workspace, or you can create a new Lakehouse for each process. A separate semantic model is always created for a single process.
5.	Wait until the Lakehouse is successfully created.

6.	Lakehouse is automatically created with a default semantic model and a SQL analytics endpoint. After the process is ingested and analyzed a new semantic model will be created. The default semantic model is not used by Power Automate Process Mining.

## Load your process analytics in Fabric

Load your process analytics in Fabric to start customizing your report.

1.	Navigate to your [Power Platform environment](https://make.powerautomate.com)

2.	Select **Process mining** from the left navigation and click **Start here** in the **Create new process** section
 
3.	Fill in the process name and select the ingestion type (location of your data)

4.	Click **Continue**

5.	From the selection choose the **Your Fabric workspace** option and click **Continue** 

6.	Select your Fabric workspace and Fabric Lakehouse from the lists and give the report a unique name in the required **Report name** field.

    We recommend that you use a unique name. If you use a name of a report that already exists, the process mining capability overwrites the existing report of another process. This could lead to loss of custom reports and composite datasets of that process. After refreshing the process, if you decide to change the report name, you'll need to publish a new report.

7.	Click **Continue**

8.	Follow the rest of the wizard steps based on the selected ingestion method.

9.	After the process is successfully analyzed, you can access the default report created in the workspace, [newly created semantic model](process-mining-fabric-semantic-model.md) and delta tables created in your Fabric Lakehouse.

## Customize reports in Fabric workspace

With the powerful integration of the process mining capability with Power BI, you can customize your process reports in an attached Fabric workspace. In this example, you perform a simple customization of the Power BI report to include a card that holds or tracks one of the analytic measures.

 To be able to do this, make sure you completed these steps in this article:

- [Connect your Power BI workspace to the process mining capability](#connect-your-power-bi-workspace-to-the-process-mining-capability)

- [Create your own custom Power BI workspace](#create-your-own-custom-power-bi-workspace)

- [Load your process analytics in Power BI](#load-your-process-analytics-in-power-bi)

After completing these steps, return to the analytics page of your process in the process mining capability.

1. Select **Open in Power BI**. If you don't see this button, make sure you completed the steps in the [Load your process analytics in Fabric](#load-your-process-analytics-in-power-bi) section in this article.

    You're redirected to a Power BI web screen that shows you a report of your process.

1. Begin customizing your report by downloading it to your local machine. To do this, select **File** > **Download this file**.

    :::image type="content" source="media/process-mining-pbi-workspace/download-file.png" alt-text="Screenshot of downloading this file.":::

1. Select the **A copy of your report with a live connection to data online (.pbix)** radio button. The report is downloaded with live connection.

1. Open the downloaded report in Power BI Desktop. Ensure you have the latest Power BI Desktop version and the preview feature [Enable PBIR format is switched on](/power-bi/developer/projects/projects-report#enable-pbir-format-preview-feature).

1. Move the cards that hold the donuts (blue circles) for the **Variants**, **Cases**, and **Activities** metrics to the right by selecting and dragging each card.

1. On the **Visualizations** pane, select the card element.

1. A new card appears. Resize it, and then drag it to the left of the **Variants** donut (blue circle).

1. On the **Data** pane, expand **ReportMeasures** and select **Self Loop %**.

1. On the command bar, select **Save**.

    In your process, you don’t have any self loops, so you should see **0.00%** in that card.

    :::image type="content" source="media/process-mining-pbi-workspace/zero-self-loops.png" alt-text="Screenshot of a new card with 0.00 percent.":::

1. Save the report.

1. From the **Home** tab, select **Publish**.

1. Select your workspace, and choose **Select** to publish the report to the Power BI service.

    After the report is successfully published, you can open it from the pop-out window.

You successfully customized your Power BI report. Every time you refresh your process and reopen your Power BI report, your metrics and customizations are updated. Try out Power BI and customize your reports to learn how they can help you analyze your process effectively.

Once this step is done, you see the report in your Fabric workspace with the report name that you entered. You can edit and save it. Your report is updated with the changes that you made with Power BI.

If you encounter issues or error messages, go to [Troubleshooting](process-mining-troubleshoot.md#issues-with-your-own-power-bi-workspace).

## Related information

[Workspaces in Fabric and Power BI](/fabric/fundamentals/workspaces)
