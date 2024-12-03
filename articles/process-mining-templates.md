---
title: Power Platform templates for process mining
description: Learn how to use Power Platform templates for process mining in Power Automate.
author: donums
contributors:
  - donums
  - v-aangie 
  - tatn 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/18/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Platform templates for process mining

Templates designed to work with the process mining capability make it easy for organizations to onboard their data for process mining and gain insights with just a few selections. Unlike traditional process mining tools, Power Platform templates eliminate the need for data identification and manipulation.

Templates are available for [Desktop flows](#desktop-flows-template), [Power Virtual Agents](#power-virtual-agents-template), and [Power Apps insights](#power-apps-insights-template). Each template provides insights that help identify automation opportunities and address performance and compliance issues in workflows.

By using templates in the process mining capability, organizations can quickly and easily start mining their processes for insights and streamline their workflows. Templates simplify the process and allow organizations to focus on the insights and opportunities that matter most, rather than getting bogged down in data manipulation and processing.

## Desktop flows template

The Desktop Flows template analyzes the run history of flows created using [robotic process automation (RPA)](https://powerautomate.microsoft.com/robotic-process-automation/) in Power Automate. This template provides insights into the performance and compliance of RPA workflows. To learn more about desktop flows, please refer to the [Introduction to desktop flows](desktop-flows/introduction.md) documentation.

By analyzing the run history of RPA flows, the Desktop Flows template can identify potential issues, such as errors or inefficiencies, and provide recommendations for improvement. This information can help organizations optimize their RPA workflows and improve overall performance. Additionally, the Desktop Flows template can help organizations ensure compliance with regulatory requirements by identifying potential violations and recommending corrective actions.

Overall, the Desktop Flows template is a powerful tool that can help organizations maximize the value of their RPA workflows while minimizing risks and improving compliance.

### Create and run the Desktop flows template

1. In Power Automate in the left panel, select **Process mining**.

1. In the **Start with a popular template** section, select the **Power Platform** tab, and then select the **Desktop flows** tile.

1. In the **Process name** field, enter a name for your process.

1. If you know the Flow ID of the flow you want to analyze, enter it in the **Flow ID (optional)** field. If you don't know the Flow ID, you can skip this step.

    > [!TIP]
    > To find the Flow ID, edit the flow and look at the URL in your browser's address bar. Everything between "flows/" and "/details" is the Flow ID:
    >
    >:::image type="content" source="media/process-mining-templates/find-flow-id.png" alt-text="Screenshot of a flow URL with the Flow ID highlighted.":::

1. (Optional) In the **Description** field, enter a description for the process.

1. Select **Create**.

1. In the **Authentication kind** field, replace "Anonymous" with **Organizational account**.

    If you're signed in, you'll see your credentials. You can switch to a different account if needed. If you're not signed in, select **Sign in** and sign in to your account.

The process mining capability will analyze your process. It might take up to two minutes for the analytics to appear.

Learn how to [visualize and gain insights from processes](process-mining-visualize.md). You can also use the custom attributes filter to dive deeper into your insights.

## Power Virtual Agents template

The Power Virtual Agents template is designed to analyze the performance and usage of your chatbots, providing insights into your users' journeys and helping you maximize the bots' effectiveness. To learn more, go to [Microsoft Copilot Studio overview](/power-virtual-agents/fundamentals-what-is-power-virtual-agents) (formerly, Power Virtual Agents).

### Create and run the Power Virtual Agents template

1. In Power Automate on the left panel, select **Process mining**.

1. In the **Start with a popular template** section, select the **Power Platform** tab, and then select the **Power Virtual Agents** tile.

1. In the **Process name** field, enter a name for your process.

1. (Optional) In the **Description** field, enter a description for the process.

1. Select **Create**.

1. In the **Authentication kind** field, replace "Anonymous" with **Organizational account**.

    If you're signed in, you'll see your credentials. You can switch to a different account if needed. If you're not signed in, select **Sign in** and sign in to your account.

1. Select **Save**.

The process mining capability will analyze your process. It might take several minutes for the analytics to appear.

Learn how to [visualize and gain insights from processes](process-mining-visualize.md). You can also use the custom attributes filter to dive deeper into your insights.

## Power Apps insights template

The Power Apps insights template helps you visualize the performance and usage of your Power Apps. It enables you to optimize your apps' functionality and manage its success rate. To learn more about Power Apps, check out [What is Power Apps?](/power-apps/powerapps-overview)

The Power Apps insights template uses telemetry data from [Azure Monitor Application Insights](/azure/azure-monitor/app/app-insights-overview) to analyze your apps. To use this template, you'll need to obtain an Application ID for your app in an Application Insights resource.

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

1. In Power Automate on the left panel, select **Process mining**.

1. In the **Start with a popular template** section, select the **Power Platform** tab, and then select the **Power Apps insights** tile.

1. In the **Process name** field, enter a name for your process.

1. In the **Power Apps application insights app ID** field, paste the Application ID from Application Insights.

1. In the **Case ID field name** and **Activity field name** fields, select the dimensions that represent the Case ID and Activity you want to analyze.

1. (Optional) In the **Description** field, enter a description for the process.

1. Select **Create**.

1. In the **Authentication kind** field, replace "Anonymous" with **Organizational account**.

    If you're signed in, you'll see your credentials. You can switch to a different account if needed. If you're not signed in, select **Sign in** and sign in to your account.

1. Go back to the **Create a new process** screen in process mining and paste it in the **Power apps application insights app Id** field.

1. Identify the parameter that you want to analyze from your app and enter it in the **Case Id field name** and **Activity field name** fields in the **Create a new process** screen.

1. Select **Save**.

The process mining capability will analyze your process. It might take up to two minutes for the analytics to appear. You can leave the page and return later.

Learn how to [visualize and gain insights from processes](process-mining-visualize.md). You can also use the custom attributes filter to dive deeper into your insights.

## Related information

- [Introduction to desktop flows](desktop-flows/introduction.md)  
- [Power Virtual Agents overview](/power-virtual-agents/fundamentals-what-is-power-virtual-agents)
- [Azure Monitor Application Insights](/azure/azure-monitor/app/app-insights-overview)
- [What is Power Apps?](/power-apps/powerapps-overview)
