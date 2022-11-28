---
title: Customize a report with your own Power BI workspace (preview)
description: Learn how to use your own custom Power BI workspace and leverage a higher capacity to analyze processes with process mining in the process advisor feature in Power Automate.
author: donums
contributors:
  - donums
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: derahonuorah
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Customize a report with your own Power BI workspace (preview) 

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

You can use your own custom Power BI workspace and leverage a higher capacity to analyze processes with a lot more data. You'll also be able to customize the look and feel of the report.

## Setup your workspace

You'll need to setup your Power BI workspace to connect it to process advisor and then customize it. The following sections in this article walk you through how to set up your workspace.

### Connect your Power BI workspace to process advisor

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for **azure active directory** in the search bar and select **Azure Active Directory**.

    :::image type="content" source="media/process-mining-pbi-workspace/azure-add.png" alt-text="Screenshot of Azure Active Directory search.":::

1. Under **Manage**, select **Users**.

    :::image type="content" source="media/process-mining-pbi-workspace/az-users.png" alt-text="Screenshot of the 'Users' selection under 'Manage'.":::

1. Select **User settings** and review the **App registrations** selection.

    - If **App registrations** is **Yes**, any user can register process advisor as an app.
    - If **App registrations** is **No**,  only admins can register apps. If you are an admin, you can choose to turn this on to allow others to register process advisor as an app.

    :::image type="content" source="media/process-mining-pbi-workspace/az-app-reg.png" alt-text="Screenshot of the 'App registrations' option.":::

 1. In the Windows taskbar, select **Search**.
 
    :::image type="content" source="media/process-mining-pbi-workspace/search.png" alt-text="Screenshot of the 'Search' button.":::

 1. Type **powershell**, and then select **Run as Administrator**.

    :::image type="content" source="media/process-mining-pbi-workspace/powershell-run.png" alt-text="Screenshot of the search for the Windows PowerShell app.":::

### Install Azure tools

If you haven't done this yet, install the Azure tools.

1. In the **Administrator: Windows PowerShell** window, type **Install-Module AzureAD**, and then select **Enter**.

1. When prompted to confirm installation, enter **Y**, and then select **Enter**.

1. Connect your Azure account by typing **Connect-AzureAD** and then sign in.

1. Validate that you're signed in.

1. Register the process advisor app service principal by typing this command:

    **New-AzureADServicePrincipal -AppId dad3c6de-ed58-42ef-989f-9c0303aaeedc -DisplayName ‘Process Insights Prod’**

    :::image type="content" source="media/process-mining-pbi-workspace/svc-principal.png" alt-text="Screenshot of the service principal registration.":::

1. Sign in to [Microsoft Power BI](https://powerbi.microsoft.com/).

1. Select (**...**) > **Settings** > **Admin portal**.

1. Scroll down to **Developer settings** and do the following:

    1. Select the dropdown menu for **Allow service principals to use Power BI APIs**.

    1. Enable it by toggling the slider.

    :::image type="content" source="media/process-mining-pbi-workspace/admin-portal.png" alt-text="Screenshot of the 'Admin portal' screen.":::

1. Go back to the Power BI home page.

### Create your own custom Power BI workspace

Now that you've connected your Power BI workspace to process advisor and installed the Microsoft Azure tools, you can create your own custom Power BI workspace.

1. On the left panel, select **Workspaces** > **Create a Workspace**.

1. In **Advanced Options**, select a premium Power BI license. (We recommend a **premium per capacity** license.)

1. Select **Save**.

1. Select **Access**.

1. Search for and add **Process Insights Prod**.

1. Assign it **admin access**.

## Load your process analytics in Power BI

Load your process analytics in Power BI to start customizing your report.

1. After analyzing a process, go to the process **Details** page by selecting the left arrow under **Share**.

    :::image type="content" source="media/process-mining-pbi-workspace/share-arroe.png" alt-text="Screenshot of the left pointing arrow in the 'Share' screen.":::

1. On the **Details** card, select **Edit**.

1. In the **Power BI Workspace** dropdown menu, select **Select a Power BI workspace**, and then select **Save**.

    :::image type="content" source="media/process-mining-pbi-workspace/pbi-details.png" alt-text="Screenshot of the 'Select a Power BI workspace' selection.":::

## Customize reports in Power BI workspace

With Process advisor’s powerful integration with Power BI, you can customize your process reports in an attached Power BI workspace. In this example, we'll perform a simple customization of the Power BI report to include a card that holds or tracks one of the analytic measures.

 To be able to do this, make sure you've completed these steps in this article:

- [Connect your Power BI workspace to process advisor](#connect-your-power-bi-workspace-to-process-advisor)

- [Create your own custom Power BI workspace](#create-your-own-custom-power-bi-workspace)

- [Load your process analytics in Power BI](#load-your-process-analytics-in-power-bi)

After completing the these steps, return to the analytics page of your process in process advisor.

1. To refresh and reanalyze the process, select **Refresh**.

1. Select **Open in Power BI**. If you don't see this button, make sure you completed the steps in the [Load your process analytics in Power BI](#load-your-process-analytics-in-power-bi) section in this article.

    :::image type="content" source="media/process-mining-pbi-workspace/open-pbi.png" alt-text="Screenshot of the 'Open in Power BI' button.":::

    You'll be redirected to a Power BI web screen that will show you a report of your process.

1. To begin customizing your report, select **Edit** in the command bar. 

1. Move the cards that hold the donuts (blue circles) for the **Paths**, **Cases**, and **Activities** metrics to the right by selecting and dragging each card.

    This will create space for a new card that we want to store a new metric in. Be sure to select off into an empty space before continuing.

    :::image type="content" source="media/process-mining-pbi-workspace/select-card.png" alt-text="Screenshot of the  paths, cases, and activities metrics.":::

1. In the **Visualizations** pane, select the card element.

    :::image type="content" source="media/process-mining-pbi-workspace/card.png" alt-text="Screenshot of the 'Visualizations' pane.":::

1. A new card will appear on the screen. Resize it and drag it to the left of the **Paths** donut (blue circle).

1. In the **Fields** pane, expand **ReportMeasures** and select **Self Loop %**.

1. On the command bar, select **Save**.

    In our process, we don’t have any self loops, so you should see **0.00%** show up in that card.

    :::image type="content" source="media/process-mining-pbi-workspace/self-loop.png" alt-text="Screenshot of the 'Self Loop' card.":::

    You've successfully customized your Power BI workspace. Every time you refresh your process and reopen your Power BI report, your metrics and customizations will be updated. Try out Power BI and customize your reports to learn how they can help you analyze your process effectively.

    Once this step is done, you'll see the report in your Power BI workspace with the report name that you entered. You can edit this report and save it. Your report on process advisor will be updated with all of the changes that you make with Power BI.

## Troubleshoot issues

If you encounter issues or error messages, go to [Issues with your own Power BI workspace (preview)](process-mining-troubleshoot.md#issues-with-your-own-power-bi-workspace-preview).

### See also

[Workspaces in Power BI](/power-bi/collaborate-share/service-new-workspaces)
