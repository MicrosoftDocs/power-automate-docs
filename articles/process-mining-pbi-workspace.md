---
title: Customize a report with your own Power BI workspace
description: Learn how to use your own custom Power BI workspace and leverage a higher capacity to analyze processes with the process mining capability.
author: rosikm
contributors:
  - rosikm
  - nvigne
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 04/04/2025
ms.author: michalrosik
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Customize a report with your own Power BI workspace

You can use your own custom Power BI workspace and leverage a higher capacity to analyze processes with a lot more data. You're also able to customize the look and feel of the report.

## Set up your workspace

You need to set up your Power BI workspace to connect it to the process mining capability and then customize it. The following sections in this article walk you through how to set up your workspace.

### Connect your Power BI workspace to the process mining capability

1. Sign in to the [Azure portal](https://portal.azure.com/).
1. Search for **azure active directory** in the search bar and select **Microsoft Entra ID**.
1. Under **Manage**, select **Users**.
1. Select **User settings** and review the **App registrations** selection.

    - If **App registrations** is **Yes**, any user can register the process mining capability as an app.
    - If **App registrations** is **No**,  only admins can register apps. If you're an admin, you can choose to turn this on to allow others to register the process mining capability as an app.

1. On the Windows taskbar, select **Search**.
1. Type **powershell**, and then select **Run as Administrator**.

### Install Azure tools

If you didn't do this yet, install the Azure tools.

1. On the **Administrator: Windows PowerShell** screen, type **Install-Module AzureAD**, and then select **Enter**.
1. When prompted to confirm installation, enter **Y**, and then select **Enter**.
1. Connect your Azure account by typing **Connect-AzureAD**, and then sign in.
1. Validate that you're signed in.
1. Register the process mining service principal by typing this command:

    **New-AzureADServicePrincipal -AppId dad3c6de-ed58-42ef-989f-9c0303aaeedc -DisplayName ‘Process Insights Prod’**

1. Sign in to [Microsoft Power BI](https://powerbi.microsoft.com/).
1. Select the ellipsis (**...**) > **Settings** > **Admin portal**.
1. Scroll down to **Developer settings** and do the following steps:

    1. Expand the dropdown menu for **Embed content in apps** and enable it by toggling the slider.
    1. Expand the dropdown menu for **Service principals can use Fabric APIs** and enable it by toggling the slider.
  
        :::image type="content" source="media/process-mining-pbi-workspace/pbi-api-toggles2.png" alt-text="Screenshot of the developer settings.":::

        Both settings can be applied to the whole organization. Alternatively, you can set up a dedicated security group and include the **Process Insights Prod** service principal (registered in step 5) in it.

1. Return to the Power BI home page.

### Create your own custom Power BI workspace

Now that you connected your Power BI workspace to the process mining capability and installed the Microsoft Azure tools, you can create your own custom Power BI workspace.

1. On the left panel, select **Workspaces** > **Create a Workspace**.
1. In **Advanced Options**, select a premium Power BI license. (We recommend a **premium per capacity** license.)
1. Select **Apply**.
1. In the created workspace, select **Manage access**.
1. Select **Add people or groups**.
1. Select **Search for**, and then add **Process Insights Prod**.
1. Assign it **admin access**.

   > [!IMPORTANT]
   > It is required that the service principal gets added as an admin. If you skip this step, the feature doesn't work.

## Load your process analytics in Power BI

Load your process analytics in Power BI to start customizing your report.

1. After analyzing a process, go to the process **Details** page by selecting the name of the process in the breadcrumbs.
1. On the **Details** card, select **Edit**.
1. In the **Power BI Workspace (optional)** dropdown menu, select a workspace of your choice.
1. If you select a workspace, give the report a unique name in the required **Report name** field.

    We recommend that you use a unique name. If you use a name of a report that already exists, the process mining capability overwrites the existing report of another process. This could lead to loss of custom reports and composite datasets of that process. After refreshing the process, if you decide to change the report name, you'll need to publish a new report.

1. You might then toggle the **Update report when refreshing data** option between **on** and **off**.

    If the toggle is **on**, a new report is published in Power BI and is embedded in the analytics page of the process mining capability. If the toggle is **off** after refreshing the data, the existing report isn't updated in the process mining capability.

## Customize reports in Power BI workspace

With the powerful integration of the process mining capability with Power BI, you can customize your process reports in an attached Power BI workspace. In this example, you perform a simple customization of the Power BI report to include a card that holds or tracks one of the analytic measures.

 To be able to do this, make sure you completed these steps in this article:

- [Connect your Power BI workspace to the process mining capability](#connect-your-power-bi-workspace-to-the-process-mining-capability)
- [Create your own custom Power BI workspace](#create-your-own-custom-power-bi-workspace)
- [Load your process analytics in Power BI](#load-your-process-analytics-in-power-bi)

After completing these steps, return to the analytics page of your process in the process mining capability.

1. Refresh and reanalyze the process by selecting **Refresh**.
1. Select **Open in Power BI**. If you don't see this button, make sure you completed the steps in the [Load your process analytics in Power BI](#load-your-process-analytics-in-power-bi) section in this article.

    You're redirected to a Power BI web screen that shows you a report of your process.

1. Begin customizing your report by downloading it to your local machine. To do this, select **File** > **Download this file**.

    :::image type="content" source="media/process-mining-pbi-workspace/download-file.png" alt-text="Screenshot of downloading this file.":::

1. Select the **A copy of your report with a live connection to data online (.pbix)** radio button. The report is downloaded with live connection.
1. Open the downloaded report in Power BI Desktop. Ensure you have the latest Power BI Desktop version.
1. Go to the **Modeling** tab and select **Make changes to this model**. You might need to have the **Contributor** role to be able to see that option in the **Modeling** tab.
1. Select **Add a local model**.

    :::image type="content" source="media/process-mining-pbi-workspace/add-local-model.png" alt-text="Screenshot of adding a local model.":::

1. Select the tables that you'd like to include in the local model. We recommend that you keep the default selection.
1. Select **Submit**.

    The local model is created. Now you can make changes to existing visuals, or add a new data source to the report.

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

You successfully customized your Power BI workspace. Every time you refresh your process and reopen your Power BI report, your metrics and customizations are updated. Try out Power BI and customize your reports to learn how they can help you analyze your process effectively.

Once this step is done, you see the report in your Power BI workspace with the report name that you entered. You can edit and save it. Your report is updated with the changes that you made with Power BI.

If you encounter issues or error messages, go to [Issues with your own Power BI workspace](process-mining-troubleshoot.md#issues-with-your-own-power-bi-workspace).

## Related information

[Workspaces in Power BI](/power-bi/collaborate-share/service-new-workspaces)
