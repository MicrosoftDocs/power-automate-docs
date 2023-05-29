---
title: Customize a report with your own Power BI workspace
description: Learn how to use your own custom Power BI workspace and leverage a higher capacity to analyze processes with process mining.
author: donums
contributors:
  - donums
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 04/03/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Customize a report with your own Power BI workspace

You can use your own custom Power BI workspace and leverage a higher capacity to analyze processes with a lot more data. You'll also be able to customize the look and feel of the report.

## Set up your workspace

You'll need to set up your Power BI workspace to connect it to process advisor and then customize it. The following sections in this article walk you through how to set up your workspace.

### Connect your Power BI workspace to process advisor

1. Sign in to the [Azure portal](https://portal.azure.com/).

1. Search for **azure active directory** in the search bar and select **Azure Active Directory**.

    :::image type="content" source="media/process-mining-pbi-workspace/azure-add.png" alt-text="Screenshot of Azure Active Directory search.":::

1. Under **Manage**, select **Users**.

1. Select **User settings** and review the **App registrations** selection.

    - If **App registrations** is **Yes**, any user can register process advisor as an app.
    - If **App registrations** is **No**,  only admins can register apps. If you are an admin, you can choose to turn this on to allow others to register process advisor as an app.

 1. On the Windows taskbar, select **Search**.

 1. Type **powershell**, and then select **Run as Administrator**.

    :::image type="content" source="media/process-mining-pbi-workspace/powershell-run.png" alt-text="Screenshot of the search for the Windows PowerShell app.":::

### Install Azure tools

If you haven't done this yet, install the Azure tools.

1. On the **Administrator: Windows PowerShell** screen, type **Install-Module AzureAD**, and then select **Enter**.

1. When prompted to confirm installation, enter **Y**, and then select **Enter**.

1. Connect your Azure account by typing **Connect-AzureAD**, and then sign in.

1. Validate that you're signed in.

1. Register the process advisor app service principal by typing this command:

    **New-AzureADServicePrincipal -AppId dad3c6de-ed58-42ef-989f-9c0303aaeedc -DisplayName ‘Process Insights Prod’**

    :::image type="content" source="media/process-mining-pbi-workspace/svc-principal.png" alt-text="Screenshot of the service principal registration.":::

1. Sign in to [Microsoft Power BI](https://powerbi.microsoft.com/).

1. Select (**...**) > **Settings** > **Admin portal**.

1. Scroll down to **Developer settings** and do the following:

    1. Select the dropdown menu for **Allow service principals to use Power BI APIs**.

    1. Enable it by toggling the slider.

1. Return to the Power BI home page.

### Create your own custom Power BI workspace

Now that you've connected your Power BI workspace to process advisor and installed the Microsoft Azure tools, you can create your own custom Power BI workspace.

1. On the left panel, select **Workspaces** > **Create a Workspace**.

1. In **Advanced Options**, select a premium Power BI license. (We recommend a **premium per capacity** license.)

1. Select **Save**.

1. Select **Access**.

1. Search for and add **Process Insights Prod**.

1. Assign it **admin access**.

    >[!IMPORTANT]
    >
    >It's required that the service principal gets added as an admin. If you skip this step, the feature won't work.

## Load your process analytics in Power BI

Load your process analytics in Power BI to start customizing your report.

1. After analyzing a process, go to the process **Details** page by selecting the name of the process in the breadcrumbs.

    Alternatively, you can select **Details** on the command bar at the top.

1. On the **Details** card, select **Edit**.

1. In the **Power BI Workspace** dropdown menu, select **Select a Power BI workspace**, and then select **Save**.

## Customize reports in Power BI workspace

With Process advisor’s powerful integration with Power BI, you can customize your process reports in an attached Power BI workspace. In this example, we'll perform a simple customization of the Power BI report to include a card that holds or tracks one of the analytic measures.

 To be able to do this, make sure you've completed these steps in this article:

- [Connect your Power BI workspace to process advisor](#connect-your-power-bi-workspace-to-process-advisor)

- [Create your own custom Power BI workspace](#create-your-own-custom-power-bi-workspace)

- [Load your process analytics in Power BI](#load-your-process-analytics-in-power-bi)

After completing these steps, return to the analytics page of your process in process advisor.

1. To refresh and reanalyze the process, select **Refresh**.

1. Select **Open in Power BI**. If you don't see this button, make sure you've completed the steps in the [Load your process analytics in Power BI](#load-your-process-analytics-in-power-bi) section in this article.

    :::image type="content" source="media/process-mining-pbi-workspace/open-pbi.png" alt-text="Screenshot of the 'Open in Power BI' button.":::

    You'll be redirected to a Power BI web screen that will show you a report of your process like below.
   

1. To begin customizing your report download the report to your local machine by clicking **Download this file** from the file menu.

![image](https://github.com/MicrosoftDocs/power-automate-docs-pr/assets/113051637/471ff4ab-99c2-4a17-8bdb-aab54ecae749)

2. Select the **A copy of your report with a live connection to data online (.pbix)** radio button. The report will be downloaded with live connection. 

3. Open the downloaded report in Power BI Desktop. Ensure you have the latest Power BI Desktop version.

4. After the report opens in Power BI Desktop, navigate to the **Modeling** tab and select **Make changes to this model**. You may need to have the _contributor_ role to be able to see that option in the **Modeling** tab. Then select **Add a local model**.

![image](https://github.com/MicrosoftDocs/power-automate-docs-pr/assets/113051637/3db348ae-68c8-4d13-8640-75d90f51bcca)

5. Select the tables which you would like to include in the local model. We recomend that you keep the default selection. Then select **Submit** button. 

![image](https://github.com/MicrosoftDocs/power-automate-docs-pr/assets/113051637/f462c7ea-bffc-4eca-a7f1-2f5f5e6b761a)

6. The local model will be created and now you can make changes to existing visuals or add a new data source to the report. Move the cards that hold the donuts (blue circles) for the **Variants**, **Cases**, and **Activities** metrics to the right by selecting and dragging each card.

7. In the **Visualizations** pane, select the card element.

8. A new card will appear on the screen. Resize it and drag it to the left of the **Variants** donut (blue circle).

9. In the **Data** pane, expand **ReportMeasures** and select **Self Loop %**.

10. On the command bar, select **Save**.

    In our process, we don’t have any self loops, so you should see **0.00%** show up in that card.
    
![image](https://github.com/MicrosoftDocs/power-automate-docs-pr/assets/113051637/dbb2d3b7-3a30-4359-8ab1-b980357e077c)

11. Save the report and from the **Home** tab select, **Publish**. Choose your workspace and click **Select** to publish the report to the Power BI service.

12. After the report has been successfully published you can open it from the pop-out window on the screen.

![image](https://github.com/MicrosoftDocs/power-automate-docs-pr/assets/113051637/a0fbfa3b-eb92-4995-aa7a-63643cb8bd55)

You've successfully customized your Power BI workspace. Every time you refresh your process and reopen your Power BI report, your metrics and customizations will be updated. Try out Power BI and customize your reports to learn how they can help you analyze your process effectively.

Once this step is done, you'll see the report in your Power BI workspace with the report name that you entered. You can edit this report and save it. Your report on process advisor will be updated with all of the changes that you make with Power BI.

## Troubleshoot issues

If you encounter issues or error messages, go to [Issues with your own Power BI workspace](process-mining-troubleshoot.md#issues-with-your-own-power-bi-workspace).

### See also

[Workspaces in Power BI](/power-bi/collaborate-share/service-new-workspaces)
