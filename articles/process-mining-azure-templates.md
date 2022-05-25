---
title: Azure templates for process mining in process advisor | Microsoft Docs
description: This topic describes the Azure templates you can use for process mining in the process advisor feature in Power Automate.
author: nijemcevic 
ms.subservice: process-advisor
ms.topic: article
ms.date: 05/25/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Azure templates for process mining

Process advisor templates allow you to easily onboard your data with a few selections, which avoids the traditional data identification and manipulation required in traditional process mining tools. Templates will enable users to reach their insights quickly and without the previously required data mastery. Our templates like ADO, Power Apps, Bot Framework, and more, will empower all to reach process insights and implement optimizations and automations.

## Azure DevOps Work Tracking template

The process advisor **Azure DevOps Work Tracking template** will enable you to visualize the execution process and handling of tracked Azure DevOps work items. Insights will allow you to maximize your development processes and manage dependencies.

To learn more about Azure DevOps, go to the [Azure DevOps documentation](/azure/devops).

### Prerequisites

Before you can visualize your Azure DevOps work items, you must have an Azure DevOps account and user license. To learn more, go to [Pricing for Azure DevOps](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/).

### Create and run the Azure DevOps Work Tracking template

1. On the **Azure** tab in the **Start with a popular template** section, select the **Azure DevOps Work Tracking** tile.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Azure DevOps Work Tracking tile.](media/process-mining-azure-templates/az-devops.png "Azure DevOps Work Tracking tile")

1. In the **Process name** field, enter a name for your process.

1. Go to your Azure DevOps environment and select **Boards** on the left panel to find the information you'll need to enter in the **Create a new process** screen.

    1. Find the names for the **Organization name** and **Project name** fields (as indicated at the top of the following screenshot).

    1. On the **Boards** tab to the right, scroll down to the **Area** heading to find the name you'll use in the **Area Name** field.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of  Azure DevOps Boards screen.](media/process-mining-azure-templates/az-boards.png "Azure DevOps Boards screen")

    c. (Optional) Enter a description of the process in the **Description** field.
    
    d. Select **Create**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Create a new process screen using the Azure DevOps Work Tracking template.](media/process-mining-azure-templates/create-az-devops.png "Create a new process screen")

1. In the **Connect to data source** screen in the **Authentication kind** field, replace "Anonymous" with **Organizational account**.

1. Select **Sign in** and authenticate through AAD.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Connect to data source screen.](media/process-mining-azure-templates/connect.png "Connect to data source screen")

1. After connection credentials are established, select **Save**. Process advisor will analyze your process.

   The process might take at least two minutes to complete.

### Visualize the process map for the Azure DevOps Work Tracking template

After your process report has been published, you can visualize the process map and use the **Custom attributes** filter to dig deeper into your insights.

> [!div class="mx-imgBorder"]
> ![Screenshot of the process map for the Azure DevOps Work Tracking template.](media/process-mining-azure-templates/devops-map.png "Process map for the Azure DevOps Work Tracking template")

## Azure Pipelines template

The process advisor **Azure Pipelines** template will enable you to visualize the execution process and handling of tracked Azure pipelines and boards. Insights will allow you to maximize your development processes and manage dependencies.

To learn more about Azure DevOps, go to the [Azure DevOps documentation](/azure/devops).

### Prerequisite

Before you can visualize your Azure pipelines, you must have an Azure DevOps Individual or User license. To learn more, go to [Pricing for Azure DevOps](https://azure.microsoft.com/pricing/details/devops/azure-devops-services/).

### Create and run the Azure Pipelines template

1. On the **Azure** tab in the **Start with a popular template** section, select the **Azure Pipelines** tile.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Azure Pipelines tile.](media/process-mining-azure-templates/az-pipelines.png "Azure Pipelines tile")

1. In the **Process name** field, enter a name for your process.

1. Go to your Azure DevOps environment and select **Pipelines** on the left panel to find the information you'll need to enter in the **Create a new process** screen.

    1. Find the names for the **Organization name**, **Project name**, ad **Pipeline Name** fields (as indicated in the following screenshot).

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Azure DevOps Pipelines screen.](media/process-mining-azure-templates/az-pipelines-names.png "Azure DevOps Pipelines screen")

    c. (Optional) Enter a description of the process in the **Description** field.
    
    d. Select **Create**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Create a new process screen using the Azure Pipelines template.](media/process-mining-azure-templates/create-az-pipelines.png "Create a new process screen")

1. Complete the **Connect to data source** screen by doing steps 4 through 6 in the **Create and run the Azure DevOps Work Tracking template** section earlier in this article.

### Visualize the process map for the Azure Pipelines template

After your process report has been published, you can visualize the process map.

> [!div class="mx-imgBorder"]
> ![Screenshot of the process map for the Azure Pipelines template.](media/process-mining-azure-templates/pipelines-map.png "Process map for the Azure Pipelines template")

## Logic Apps with App Insights template

The process advisor **Logic Apps with App Insights** template will enable you to visualize the execution and orchestration of your Logic Apps. Insights will allow you to maximize your automated processes and manage dependencies.

To learn more about Logic Apps, go to the [Azure Logic Apps documentation](/azure/logic-apps/).

### Prerequisite

Before you can visualize your Logic Apps, you must have an Azure Logic Apps Standard Plan (Single-tenant) license. To learn more, go to [Logic Apps pricing](https://azure.microsoft.com/pricing/details/logic-apps/).

### Create and run the Logic Apps with App Insights template

1. In order to deploy template, you'll need to create an Application Insights Resource. For instructions, go to [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).

1. On the **Azure** tab in the **Start with a popular template** section, select the **Logic Apps with App Insights** tile.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Logic Apps with App Insights tile.](media/process-mining-azure-templates/az-logic-apps.png "Logic Apps with App Insights tile")

1. In the **Process name** field, enter a name for your process.

1. Go to the Application Insights Azure Resource you created in step 1 to find the information you'll need to enter in the **Create a new process** screen.

1. On left panel, select **Configure** > **API Access**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the API Access option in the Configure menu.](media/process-mining-templates/api-access.png "API Access option in the Configure menu")

1. Copy the Power App **Application ID**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Application ID in the API Access screen.](media/process-mining-templates/app-id.png "Application ID in the API Access screen")

1. Go back to the process advisor **Create a new process** screen and paste it in the **Logic App Application Insights Application Id** field.

1. (Optional) Enter a description of the process in the **Description** field.

1. Select **Create**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Create a new process screen for the Logic Apps with App Insights template.](media/process-mining-azure-templates/create-az-logic-apps-insights.png "Create a new process screen")

1. In the **Connect to data source** screen in the **Authentication kind** field, replace "Anonymous" with **Organizational account**.

1. Select **Sign in** and authenticate through AAD.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Connect to data source for the Logic Apps with App Insights template.](media/process-mining-templates/connect.png "Connect to data source screen")

1. After connection credentials are established, select **Save**. Process advisor will analyze your process. This might take at least two minutes to complete.

### Visualize the process map for the Logic Apps with App Insights template

After your process report has been published, you can visualize the process map and use the **Custom attributes** filter to dig deeper into your insights.

> [!div class="mx-imgBorder"]
> ![Screenshot of the process map for the Logic Apps with App Insights template.](media/process-mining-azure-templates/logic-apps-insights-map.png "Process map for the Logic Apps with App Insights template")

## Logic App Consumption Plan template

The process advisor **Logic App Consumption Plan** template will enable you to visualize the execution and orchestration of your Logic Apps. Insights will allow you to maximize your automated processes and manage dependencies.

To learn more about Logic Apps, go to the [Azure Logic Apps documentation](/azure/logic-apps/).

### Prerequisite

Before you can visualize your Logic Apps, you must have an Azure Logic Apps Consumption Plan (Multi-tenant) license. Find out more, go to [Logic Apps pricing](https://azure.microsoft.com/pricing/details/logic-apps/).

### Create and run the Azure Logic App Consumption Plan template

1. On the **Azure** tab in the **Start with a popular template** section, select the **Logic App Consumption Plan** tile.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Logic App Consumption Plan tile.](media/process-mining-azure-templates/az-logicapp-cp.png "Logic App Consumption Plan tile")

1. In the **Process name** field, enter a name for your process.

1. Go to the Application Insights Azure Resource you created in step 1 to find the information you'll need to enter in the **Create a new process** screen.

    1. Go to your Azure DevOps environment and select **Overview** on the left panel.

    1. Find the names for the **Azure subscription Id**, **Resource Group Name**, and **Logic App Name** fields (as indicated in the following screenshot).

        > [!div class="mx-imgBorder"]
        > ![Screenshot of the Azure DevOps Overview screen.](media/process-mining-azure-templates/az-overview.png "Azure DevOps Overview screen")

    1. (Optional) Enter a description of the process in the **Description** field.

    1. Select **Create**.

        > [!div class="mx-imgBorder"]
        > ![Screenshot of the Create a new process screen for the Azure Logic App Consumption Plan template.](media/process-mining-azure-templates/create-az-logic-app-cp.png "Create a new process screen")

1. Complete the Connect to data source screen by doing steps 4 through 6 in the **Create and run the Azure DevOps Work Tracking template** section earlier in this article.

### Visualize the process map for the Azure Logic App Consumption Plan template

After your process report has been published, you can visualize the process map and use the **Custom attributes** filter to dig deeper into your insights.

If a map doesn't load, you'll get this message: **The data was too complex to load. Please select a variant to proceed.**

> [!div class="mx-imgBorder"]
> ![Screenshot of the Azure Logic App Consumption Plan process map message.](media/process-mining-azure-templates/logic-app-cp-map1.png "Azure Logic App Consumption Plan process map message")

You can select a variant to get the map to show with filtered data.

> [!div class="mx-imgBorder"]
> ![Screenshot of the process map for the Azure Logic App Consumption Plan template.](media/process-mining-azure-templates/logic-app-cp-map2.png "Process map for the Azure Logic App Consumption Plan template")

## Durable Functions template

The Process advisor **Durable Functions** template will enable you to visualize the execution process and handling of your durable functions. Insights will allow you to maximize your development processes and manage dependencies.

To learn more, go to [What are Durable Functions?](/azure/azure-functions/durable/durable-functions-overview)

### Prerequisite

Before you can visualize your Azure durable functions, you must have an Azure Durable Functions license. To learn more, go to [What are Durable Functions?](/azure/azure-functions/durable/durable-functions-overview)

### Create and run the Durable Functions template

1. On the **Azure** tab in the **Start with a popular template** section, select the **Durable Functions** tile.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Durable Functions tile.](media/process-mining-azure-templates/az-durable-functions.png "Durable Functions tile")

1. In the **Process name** field, enter a name for your process.

1. Go to your Azure Durable Functions Storage Account in the Azure portal to find the information you'll need to enter in the **Create a new process** screen.

    1. On the left panel under **Data storage**, select **Tables**.

        > [!div class="mx-imgBorder"]
        > ![Screenshot of the Data storage, Tables option.](media/process-mining-azure-templates/durable-functions-tables.png "Data storage, Tables option")

    1. You'll find at least two tables names. Copy the tables named (*your function app name*)**History** and (*your function app name*)**Instances**, and then paste them in the **Instance Table Storage Name** and **History Table Storage Name** in the **Create a new process** screen.

        > [!div class="mx-imgBorder"]
        > ![Screenshot of the table names.](media/process-mining-azure-templates/durable-functions-names.png "Table names")

    1. Copy the Url, and then paste it in the **Table Storage Account URL** field in the **Create a new process** screen.

        > [!div class="mx-imgBorder"]
        > ![Screenshot of the Url name.](media/process-mining-azure-templates/durable-functions-url.png "Url name")

    1. (Optional) Enter a description of the process in the **Description** field.

    1. Select **Create**.

        > [!div class="mx-imgBorder"]
        > ![Screenshot of the Create a new process screen for the Durable Functions template.](media/process-mining-azure-templates/create-durable-functions.png "Create a new process screen")

1. On the **Connect to data source** screen, copy the URL from the **Table Storage Account URL** field you just pasted in the **Create a new process** screen, and then paste it in the **Account name or URL** field in the **Connection settings** section.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Connection setting section.](media/process-mining-azure-templates/durable-functions-settings.png "Connection setting section")

1. Go back to your Azure Durable Functions Storage Account in the Azure portal, and select **Security + Networking** > **Access keys** on the left panel.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Access keys menu option.](media/process-mining-azure-templates/durable-functions-access-keys.png "Access keys menu option")

1. Select **Show keys**, copy **Key1** or **Key2**, and then paste it into the **Account key** field in the **Connect to data source screen** screen.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Access keys screen.](media/process-mining-azure-templates/durable-functions-key-page.png "Access keys screen")

### Visualize the process map for the Durable Functions template

After your process report has been published, you can visualize the process map and use the **Custom attributes** filter to dig deeper into your insights.

> [!div class="mx-imgBorder"]
> ![Screenshot of the process map for the Durable Functions template.](media/process-mining-azure-templates/durable-functions-map.png "Process map for the Durable Functions template")