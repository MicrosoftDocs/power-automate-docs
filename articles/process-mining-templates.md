---
title: Power Platform templates for process mining in process advisor
description: Learn how to use Power Platform templates for process mining in the Power Automate process advisor.
author: nijemcevic 
ms.subservice: process-advisor
ms.topic: article
ms.date: 07/08/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Platform templates for process mining

Easily onboard your data for process mining with a process advisor template. Templates help you start mining your processes for insights with just a few selections. You'll avoid the data identification and manipulation that's required with traditional process mining tools. Templates for [Desktop flows](#desktop-flows-template), [Power Virtual Agents](#power-virtual-agents-template), and [Power Apps insights](#power-apps-insights-template) provide insights that help you identify automation opportunities and address performance and compliance opportunities in your flows.

Creating and running a template is similar for all the process advisor Power Platform templates.

## Desktop flows template

The Desktop flows template analyzes the run history of flows that you create with [robotic process automation (RPA)](https://powerautomate.microsoft.com/robotic-process-automation/) in Power Automate. To learn more, go to [Introduction to desktop flows](desktop-flows/introduction.md).  

### Create and run the Desktop flows template

1. In Power Automate in the left panel, select **Process advisor**.

1. In the **Start with a popular template** section, select the **Power Platform** tab, and then select the **Desktop flows** tile.

1. In the **Process name** box, enter a name for your process.

1. If you know the Flow ID of the flow you want to analyze, enter it in the **Flow ID (optional)** box. If you don't know the Flow ID, you can skip this step.

    > [!TIP]
    > To find the Flow ID, edit the flow and look at the URL in your browser's address bar. Everything between "flows/" and "/details" is the Flow ID:
    >
    >:::image type="content" source="media/process-mining-templates/find-flow-id.png" alt-text="Screenshot of a flow URL with the Flow ID highlighted.":::

1. (Optional) In the **Description** box, enter a description for the process.

1. Select **Create**.

1. In the **Authentication kind** box, replace "Anonymous" with **Organizational account**.

    If you're signed in, you'll see your credentials. You can switch to a different account if needed. If you're not signed in, select **Sign in** and sign in to your account.

1. Select **Save**.

1. If you know your flow ID, enter it in the **Flow ID (optional)** field. If you don't know your flow ID, go to the next step.

    To learn more about the flow ID, go to the [General Power Automate Discussion](https://powerusers.microsoft.com/t5/General-Power-Automate/Flow-ID/m-p/83160#M19806).

1. (Optional) In the **Description** field, enter a description for the process.

1. Select **Create**.

1. In the **Connect to data source** screen in the **Authentication kind** field, replace "Anonymous" with **Organizational account**.

1. If you're signed in, you'll see your credentials. You can choose to switch accounts.

    If you're not signed in, select **Sign in** and authenticate through AAD.

Process advisor will analyze your process. It may take up to two minutes for the analytics to appear. You can leave the page and return later if you don't want to wait around.

[Learn how to visualize and gain insights from processes](process-mining-visualize.md). You can also use the custom attributes filter to dive deeper into your insights.

## Power Virtual Agents template

The Power Virtual Agents template analyzes your bots to help you better understand your users' journey and maximize the bots' effectiveness. To learn more, go to [Power Virtual Agents overview](/power-virtual-agents/fundamentals-what-is-power-virtual-agents).

### Create and run the Power Virtual Agents template

1. In Power Automate in the left panel, select **Process advisor**.

1. In the **Start with a popular template** section, select the **Power Platform** tab, and then select the **Power Virtual Agents** tile.

1. In the **Process name** box, enter a name for your process.

1. (Optional) In the **Description** box, enter a description for the process.

1. Select **Create**.

1. In the **Authentication kind** box, replace "Anonymous" with **Organizational account**.

    If you're signed in, you'll see your credentials. You can switch to a different account if needed. If you're not signed in, select **Sign in** and sign in to your account.

1. Select **Save**.

Process advisor will analyze your process. It may take several minutes for the analytics to appear. You can leave the page and return later if you don't want to wait around.

[Learn how to visualize and gain insights from processes](process-mining-visualize.md). You can also use the custom attributes filter to dive deeper into your insights.

## Power Apps insights template

The Power Apps insights template enables you to visualize the actions and success of your Power Apps. It allows you to maximize your apps' functionality and manage its success rate. To learn more, go to [What is Power Apps?](/power-apps/powerapps-overview)

The Power Apps insights template uses telemetry data from [Azure Monitor Application Insights](/azure/azure-monitor/app/app-insights-overview) to analyze your apps. That means you'll need to get an Application ID for your app in an Application Insights resource before you can run the Power Apps insights template.

### Get your app's Application Insights Application ID

**If you're not an Azure admin:** Ask your Azure admin to create an Application Insights resource for your app and give you the app's Application ID and the dimensions to enter for Case ID and Activity.

**If you're an Azure admin:**

1. [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource) for your app.

1. In the left panel, select **Configure** > **API Access**.

1. Copy the **Application ID**.

1. Take note of the dimensions you'll want to map to Case ID and Activity in the Power Apps insights template.

    To test the dimensions, go to **Log Analytics** and enter the following query:

    ```azurecli
        traces
        | where timestamp > ago(30d)
        | project
            timestamp,
            message,
            severityLevel,
            operation_Name,
            operation_Id,
            session_Id,
            user_Id,
            client_Type,
            client_City,
            client_StateOrProvince,
            client_CountryOrRegion,
            client_Browser,
            appId,
            customDimensions
    ```

### Create and run the Power Apps insights template

1. In Power Automate in the left panel, select **Process advisor**.

1. In the **Start with a popular template** section, select the **Power Platform** tab, and then select the **Power Apps insights** tile.

1. In the **Process name** box, enter a name for your process.

1. In the **Power Apps application insights app ID** box, paste the Application ID from Application Insights.

1. In the **Case ID field name** and **Activity field name** boxes, select the dimensions that represent the Case ID and Activity you want to analyze.

1. (Optional) In the **Description** box, enter a description for the process.

1. Select **Create**.

1. In the **Authentication kind** box, replace "Anonymous" with **Organizational account**.

    If you're signed in, you'll see your credentials. You can switch to a different account if needed. If you're not signed in, select **Sign in** and sign in to your account.

1. Go back to the process advisor **Create a new process** screen and paste it in the **Power apps application insights app Id** field.

1. Identify the parameter that you want to analyze from your app and enter it in the **Case Id field name** and **Activity field name** fields in the **Create a new process** screen.

1. Select **Save**.

Process advisor will analyze your process. It may take up to two minutes for the analytics to appear. You can leave the page and return later if you don't want to wait around.

[Learn how to visualize and gain insights from processes](process-mining-visualize.md). You can also use the custom attributes filter to dive deeper into your insights.

### See also

[Introduction to desktop flows](desktop-flows/introduction.md)  
[Power Virtual Agents overview](/power-virtual-agents/fundamentals-what-is-power-virtual-agents)<br/>
[Azure Monitor Application Insights](/azure/azure-monitor/app/app-insights-overview)<br/>
[What is Power Apps?](/power-apps/powerapps-overview)
