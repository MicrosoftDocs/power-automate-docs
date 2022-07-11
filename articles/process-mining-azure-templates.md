---
title: Azure templates for process mining in process advisor
description: Learn how to use Azure templates for process mining in the Power Automate process advisor.
author: nijemcevic 
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/11/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Azure templates for process mining

Easily onboard your data for process mining with a process advisor template. Templates help you start mining your processes for insights with just a few selections. You'll avoid the data identification and manipulation that's required with traditional process mining tools. [Azure DevOps Work Tracking](#azure-devops-work-tracking-template), [Azure Pipelines](#azure-devops-pipelines-template), [Logic Apps with App Insights](#logic-apps-with-app-insights-template), [Logic App Consumption Plan](#logic-app-consumption-plan-template), and [Durable Functions](#durable-functions-template) templates provide insights that help you identify opportunities and optimize your development processes.

Creating and running a template is similar for all the process advisor templates.

## Azure DevOps Work Tracking template

The Azure DevOps Work Tracking template analyzes the execution and handling of tracked Azure DevOps (ADO) work items to help you maximize your development processes and manage dependencies. To learn more, go to [What is Azure DevOps?](/azure/devops/what-is-azure-devops).

<!-- I removed the Prerequisites sections because users won't have anything to analyze in the first place if they don't have the proper licenses. -->

The Azure DevOps Work Tracking template uses data from your Azure Boards to analyze your work items. You'll need to gather some information from ADO before you can run the template.

### Gather information from ADO Boards

1. In your Azure DevOps environment in the left panel, select **Project settings**. Under **Boards**, select **Team configuration**. Then select the **Area** tab.

    :::image type="content" source="media/process-mining-azure-templates/az-boards.png" alt-text="Screenshot of an Azure DevOps Project Settings page with organization, project name, and other information highlighted.":::

1. Find the organization name and project name at the top of the Project Settings page. Take note of the area name.

### Create and run the Azure DevOps Work Tracking template

1. In Power Automate in the left panel, select **Process advisor**.

1. In the **Start with a popular template** section, select the **Azure** tab, and then select the **Azure DevOps Work Tracking** tile.

1. In the **Process name** box, enter a name for your process.

1. In the **Organization name**, **Project name**, and **Area name** boxes, enter the information from ADO.

1. (Optional) In the **Description** box, enter a description of the process.

1. Select **Create**.

    :::image type="content" source="media/process-mining-azure-templates/create-az-devops.png" alt-text="Screenshot of the Create a new process screen using the Azure DevOps Work Tracking template.":::

1. In the **Connect to data source** screen in the **Authentication kind** box, replace "Anonymous" with **Organizational account**.

    If you're signed in, you'll see your credentials. You can switch to a different account if needed. If you're not signed in, select **Sign in** and sign in to your account.

1. Select **Save**.

Process advisor will analyze your process. It may take a few minutes for the analytics to appear. You can leave the page and return later if you don't want to wait around.

[Learn how to interpret process advisor analytics](process-advisor-visualize.md).

## Azure DevOps Pipelines template
<!-- According to the Cloud + AI Style Guide, "Azure DevOps Pipelines" is incorrect. It should be "Azure Pipelines." See https://styleguides.azurewebsites.net/Styleguide/Read?id=2696&topicid=44177 Can you please let the dev team know? I'll leave it as-is for now for consistency with the UI. -->

The Azure DevOps Pipelines template analyzes the execution and handling of tracked pipelines and boards to help you maximize your development processes and manage dependencies. To learn more, go to [What is Azure Pipelines?](/azure/devops/pipelines/get-started/what-is-azure-pipelines).

The Azure DevOps Pipelines template uses data from Azure DevOps to analyze your pipelines. You'll need to gather some information from ADO before you can run the template.

### Gather information from ADO Pipelines

1. In your Azure DevOps environment in the left panel, select **Pipelines**, and then select **Pipelines** again.

    :::image type="content" source="media/process-mining-azure-templates/az-pipelines-names.png" alt-text="Screenshot of the Azure Pipelines page with organization and pipeline name highlighted.":::

1. Find the organization name and project name at the top of the Pipelines page. Take note of the pipeline name.

### Create and run the Azure Pipelines template

1. In Power Automate in the left panel, select **Process advisor**.

1. In the **Start with a popular template** section, select the **Azure** tab, and then select the **Azure DevOps Pipelines** tile.

1. In the **Process name** box, enter a name for your process.

1. In the **Organization name**, **Project name**, and **Pipeline name** boxes, enter the information from ADO.
<!-- There's inconsistent capitalization in the field names on this dialog. Can you please inform the dev team? -->

1. (Optional) In the **Description** box, enter a description of the process.

1. Select **Create**.

    :::image type="content" source="media/process-mining-azure-templates/create-az-pipelines.png" alt-text="Screenshot of the Create a new process screen using the Azure DevOps Pipelines template.":::

1. In the **Connect to data source** screen in the **Authentication kind** box, replace "Anonymous" with **Organizational account**.

    If you're signed in, you'll see your credentials. You can switch to a different account if needed. If you're not signed in, select **Sign in** and sign in to your account.

1. Select **Save**.

Process advisor will analyze your process. It may take a few minutes for the analytics to appear. You can leave the page and return later if you don't want to wait around.

[Learn how to interpret process advisor analytics](process-advisor-visualize.md).

## Logic Apps with App Insights template

The Logic Apps with App Insights template analyzes the execution of your Logic Apps to help you maximize your automated processes and manage dependencies. To learn more, go to [What is Azure Logic Apps?](/azure/logic-apps/logic-apps-overview).

The Logic Apps with App Insights template uses telemetry data from [Azure Monitor Application Insights](/azure/azure-monitor/app/app-insights-overview) to analyze your apps. You'll need to get an Application ID for your app in an Application Insights resource before you can run the template.

### Get your app's Application Insights Application ID

**If you're not an Azure admin:** Ask your Azure admin to create an Application Insights resource for your app and give you the app's Application ID and the dimensions to enter for Case ID and Activity.

**If you're an Azure admin:**

1. [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource) for your app.

1. In the left panel, select **Configure** > **API Access**.

1. Copy the **Application ID**.

### Create and run the Logic Apps with App Insights template

1. In Power Automate in the left panel, select **Process advisor**.

1. In the **Start with a popular template** section, select the **Azure** tab, and then select the **Logic Apps with App Insights** tile.

1. In the **Process name** box, enter a name for your process.

1. In the **Logic App Application Insights Application Id** box, paste the Application ID from Application Insights.
<!-- The capitalization and naming of this field is different from the same field in the Power Apps insights template dialog. -->

1. (Optional) In the **Description** box, enter a description of the process.

1. Select **Create**.

1. In the **Authentication kind** box, replace "Anonymous" with **Organizational account**.

    If you're signed in, you'll see your credentials. You can switch to a different account if needed. If you're not signed in, select **Sign in** and sign in to your account.

1. Select **Save**.

Process advisor will analyze your process. It may take up to two minutes for the analytics to appear. You can leave the page and return later if you don't want to wait around.

[Learn how to interpret process advisor analytics](process-advisor-visualize.md).

## Logic App Consumption Plan template

The Logic App Consumption Plan template analyzes the execution of your Logic Apps to help you identify opportunities and optimize your Logic App Consumption Plan usage. To learn more, go to [Usage metering, billing, and pricing models for Azure Logic Apps](/azure/logic-apps/logic-apps-pricing).

The Logic App Consumption Plan template uses data from Azure DevOps to analyze your consumption. You'll need to gather some information from ADO before you can run the template.

### Gather information from ADO Logic Apps

1. In your Azure Logic Apps environment, select your app, and then in the left panel, select **Overview**.

    :::image type="content" source="media/process-mining-azure-templates/az-overview.png" alt-text="Screenshot of the Logic Apps Overview page with resource group and subscription information highlighted.":::

1. Take note of the app name, resource group, and Subscription ID.

### Create and run the Logic App Consumption Plan template

1. In Power Automate in the left panel, select **Process advisor**.

1. In the **Start with a popular template** section, select the **Azure** tab, and then select the **Logic App Consumption Plan** tile.

1. In the **Process name** box, enter a name for your process.

1. In the **Azure subscription Id**, **Resource group name**, and **Logic app name** boxes, enter the information from ADO.

1. (Optional) In the **Description** box, enter a description of the process.

1. Select **Create**.

1. In the **Authentication kind** box, replace "Anonymous" with **Organizational account**.

    If you're signed in, you'll see your credentials. You can switch to a different account if needed. If you're not signed in, select **Sign in** and sign in to your account.

1. Select **Save**.

Process advisor will analyze your process. It may take a few minutes for the analytics to appear. You can leave the page and return later if you don't want to wait around.

[Learn how to interpret process advisor analytics](process-advisor-visualize.md).

## Durable Functions template

The Durable Functions template analyzes the execution of your Durable Functions to help you identify opportunities and optimize states, checkpoints, and restarts. To learn more, go to [What are Durable Functions?](/azure/azure-functions/durable/durable-functions-overview).

The Durable Functions template uses data from your Azure Durable Functions storage account for its analysis. You'll need to gather some information from Azure before you can run the template.

### Create and run the Durable Functions template

1. Have both Power Automate process advisor and Azure portal open in separate browser tabs.

1. In Power Automate process advisor, in the **Start with a popular template** section, select the **Azure** tab, and then select the **Durable Functions** tile.

1. In the **Process name** box, enter a name for your process.

    :::image type="content" source="media/process-mining-azure-templates/create-durable-functions.png" alt-text="Screenshot of the Create a new process screen for the Durable Functions template.":::

1. In Azure portal, go to your Azure Durable Functions storage account. In the left panel under **Data storage**, select **Tables**. Copy the table names that end with **Instances** and **History**.

    :::image type="content" source="media/process-mining-azure-templates/durable-functions-tables.png" alt-text="Screenshot of the Azure storage account Tables page with two table names highlighted.":::

1. In process advisor, paste the **Instances** table name in the **Instance Table Storage Name** box and the **History** table name in the **History Table Storage Name** box.

1. In Azure portal, copy the value in the **Url** column.

1. In process advisor, paste the URL in the **Table Storage Account URL** box.

1. (Optional) In the **Description** box, enter a description of the process.

1. Select **Create**.

1. On the **Connect to data source** screen, paste the URL from Step 6 in the **Account name or URL** box.

    :::image type="content" source="media/process-mining-azure-templates/durable-functions-settings.png" alt-text="Screenshot of the Connection settings screen, with the Account name or URL box highlighted.":::

1. In Azure portal in the left pane, select **Security + Networking** > **Access keys**.

    :::image type="content" source="media/process-mining-azure-templates/durable-functions-access-keys.png" alt-text="Screenshot of the Security + Networking menu with Access keys highlighted.":::

1. Select **Show keys**. Copy the value of **Key1** or **Key2**.

1. In process advisor, paste the key value in the **Account key** box.
<!-- The instructions stop here. I don't have a way to follow along in this template, so I can't verify for myself. Does the user have to sign in and select Save to kick off the analysis, as with the other templates? -->

Process advisor will analyze your process. It may take a few minutes for the analytics to appear. You can leave the page and return later if you don't want to wait around.

[Learn how to interpret process advisor analytics](process-advisor-visualize.md).

### See also

[What is Azure DevOps?](/azure/devops/what-is-azure-devops)  
[Learn how to interpret process advisor analytics](process-advisor-visualize.md)  
[What is Azure Pipelines?](/azure/devops/pipelines/get-started/what-is-azure-pipelines)  
[What is Azure Logic Apps?](/azure/logic-apps/logic-apps-overview)  
[Azure Monitor Application Insights](/azure/azure-monitor/app/app-insights-overview)  
[Usage metering, billing, and pricing models for Azure Logic Apps](/azure/logic-apps/logic-apps-pricing)  
[What are Durable Functions?](/azure/azure-functions/durable/durable-functions-overview)
