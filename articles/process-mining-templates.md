---
title: Power Platform templates for process mining in process advisor | Microsoft Docs
description: This topic describes the Power Platform templates you can use for process mining in the process advisor feature in Power Automate.
author: nijemcevic 
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/06/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Platform templates for process mining

Process advisor templates allow you to easily onboard your data with a few selections, which avoids the traditional data identification and manipulation required in traditional process mining tools. Templates will enable users to reach their insights quickly and without the previously required data mastery. Our templates like ADO, Power Apps, Bot Framework, and more, will empower all to reach process insights and implement optimizations and automations.

## Desktop Flows template

The process advisor Power Automate **Desktop Flows** template will enable you to visualize the actions your RPA bots are executing. Insights will allow you to maximize your RPA functionality and manage bot success rate.

To learn more about Power Automate desktop flows, go to [Introduction to desktop flows](desktop-flows/introduction.md).  

### Prerequisites

Before you can visualize your Power Automate Desktop Flows, you must have a Power Automate RPA license. To learn more, go to [Introduction to desktop flows](desktop-flows/introduction.md).

### Create and run the Desktop Flows template

The process of creating and running a template is similar for all templates.

1. On the **Power Platform** tab in the **Start with a popular template** section, select the **Desktop Flows** tile.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Desktop Flows tile](media/process-mining-templates/desktop-flows.png "Desktop Flows tile")

1. In the **Process name** field, enter a name for your process.

1. If you know your flow ID, enter it in the **Flow ID (optional)** field. If you don't know your flow ID, go to the next step.

    To learn more about the flow ID, go to the [General Power Automate Discussion](https://powerusers.microsoft.com/t5/General-Power-Automate/Flow-ID/m-p/83160#M19806).

1. (Optional) In the **Description** field, enter a description for the process.

1. Select **Create**.

1. In the **Connect to data source** screen in the **Authentication kind** field, replace "Anonymous" with **Organizational account**.

1. If you're signed in, you'll see your credentials. You can choose to switch accounts.

    If you're not signed in, select **Sign in** and authenticate through AAD.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Connect to data source screen.](media/process-mining-templates/connect.png "Connect to data source screen")

1. After connection credentials are established, select **Save**. Process advisor will analyze your process.

   The process for the **Desktop flows** and **Power Apps Insights** templates might take at least two minutes to complete. The process for the **Power Virtual Agents** template will take longer to complete. You can leave the page and return later while it is processing.

### Visualize the process map for the Desktop Flows template

After your process report has been published, you can visualize the process map and use the custom attributes filter to dig deeper into your insights.

> [!div class="mx-imgBorder"]
> ![Screenshot of the process map for the Desktop Flows template.](media/process-mining-templates/insights.png "Process map for the Desktop Flows template")

## Power Virtual Agents template

The Power Virtual Agents template will enable you to visualize the process map and variant use of your virtual agents. Insights will allow you to better understand your users' journey and be able to maximize the bots effectiveness.

To learn more, go to [Power Virtual Agents overview](/power-virtual-agents/fundamentals-what-is-power-virtual-agents).

### Prerequisites

Before you can visualize your Power Virtual Agents, you must have a Power Virtual Agent license. To learn more, go to [Power Virtual Agents overview](/power-virtual-agents/fundamentals-what-is-power-virtual-agents).

### Create and run the Power Virtual Agents template

The process of creating and running a template is similar for all templates.

1. On the **Power Platform** tab in the **Start with a popular template** section, select the **Power Virtual Agents** tile.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Power Virtual Agents tile.](media/process-mining-templates/pva.png "Power Virtual Agents tile")

1. In the **Process name** field, enter a name for your process.

1. If you know your bot ID, enter it in the **Bot ID (optional)** field. If you don't know your bot ID, go to the next step.

1. Do steps 4 through 8 in the **Create and run the Desktop Flows template** section earlier in this article.

### Visualize the process map for the Power Virtual Agents template

After your process report has been published, you can visualize the process map and the variants of the customer journey through your virtual agents. You can also leverage the custom attributes filter to dig deeper into your insights.

> [!div class="mx-imgBorder"]
> ![Screenshot of the process map for the Power Virtual Agents template.](media/process-mining-templates/pva-insights.png "Process map for the Power Virtual Agents template")

## Power Apps Insights template

The **Power Apps Insights** template will enable you to visualize the actions and success of your Power Apps. The template will enable you to maximize your apps' functionality and manage its success rate.

To learn more about Power Apps, go to the [Microsoft Power Apps documentation](/power-apps/).

### Prerequisites

Before you can visualize your Power Apps, you must have a Power Apps license. To learn more, go to the [Microsoft Power Apps documentation](/power-apps/).

### Create and run the Power Apps Insights template

In order to deploy the **Power Apps Insights** template, you'll need to create an Application Insights resource.

1.	Create an Application Insights resource by following the instructions in [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).

1. On the **Power Platform** tab in the **Start with a popular template** section, select the **Power Apps Insights** tile.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Power Apps Insights tile.](media/process-mining-templates/power-apps-insights.png "Power Apps Insights tile")

1. In the **Process name** field, enter a name for your process.

1. Go to the Application Insights Azure Resource you created in step 1.

1. On left panel, select **Configure** > **API Access**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the API Access option in the Configure menu.](media/process-mining-templates/api-access.png "API Access option in the Configure menu")

1. Copy the Power App **Application ID**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Application ID in the API Access screen.](media/process-mining-templates/app-id.png "Application ID in the API Access screen")

1. Go back to the process advisor **Create a new process** screen and paste it in the **Power apps application insights app Id** field.

1. Identify the parameter that you want to analyze from your app and enter it in the **Case Id field name** and **Activity field name** fields in the **Create a new process** screen.

    These field names can be either the name of a custom parameter (defined in customDimensions) or one of the following parameters: `appId`, `appName`, `client_Browser`, `client_City`,  `client_CountryOrRegion`, `client_StateOrProvince`, `client_Type`, `message`, `operation_Name`, `operation_Id`, `session_Id`, `severityLevel`, or `user_Id`. You can find these parameters in the dropdown lists in the **Case ID field name** and **Activity field name** dropdown lists in the **Create a new process** screen.

    These fields can be tested by navigating to the **Log Analytics** menu in your Application Insights resource with this query:

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the query in the Application Insights resource.](media/process-mining-templates/query.png "Application Insights resource query")

1. Do steps 4 through 8 in the **Create and run the Desktop Flows template** section earlier in this article.

### Visualize the process map for the Power Apps Insights template

After your process report has been published, you can visualize the process map and use the custom attributes filter to dig deeper into your insights.

> [!div class="mx-imgBorder"]
> ![Screenshot of the process map for the Power Apps Insights template.](media/process-mining-templates/visualize-insights.png "Process map for the Power Apps Insights template")
