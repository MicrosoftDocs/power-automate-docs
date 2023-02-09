---
title: Get started with process mining in process advisor (preview)
description: This topic is a tutorial with sample data in process mining using the process advisor feature in Power Automate.
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
  - Flow[https://preview.flow.microsoft.com/en-us/?processinsights-core.tabularData=true](https://preview.flow.microsoft.com/en-us/?processinsights-core.tabularData=true)
search.audienceType: 
  - flowmaker
  - enduser
---

# Tutorial: Get started with process mining (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

This tutorial allows you to experience process mining with sample data. In this tutorial, you'll create a process, import data, and then analyze it.

> [!NOTE]
>
> If you're not able to see all of the features described below and are using your default environment, create a new environment and retry.

## Download the sample data

For the process mining tutorial, download the sample event log CSV file:  

- [English version](https://go.microsoft.com/fwlink/?linkid=2181220)
- [French version](https://download.microsoft.com/download/3/9/c/39c5a305-8cf6-464e-af19-7d37b3f84628/Exemples_FR.csv)

The sample data in this tutorial is for illustration only and is fictitious. No real association is intended or inferred.

## Create a process

1. Sign in to [Power Automate](http://make.powerautomate.com).

1. Select your environment.

1. On the navigation pane to the left, select **Process advisor**.

    :::image type="content" source="media/process-mining-tutorial/process-adv-menu.png" alt-text="Screenshot of the process advisor menu selection.":::

1. In the **Create new process** section, select **Start here**.

    :::image type="content" source="media/process-mining-tutorial/start-here.png" alt-text="Screenshot of the 'Start here' message.":::

1. In the **Create a new process** screen, enter a process name, and then select **Data (preview)**.

1. (Optional) Enter a description for your process.

    :::image type="content" source="media/process-mining-tutorial/process-name-data.png" alt-text="Screenshot of the process name and Data (preview) button.":::

1. Select **Create**.

## Import data

1. In the **Choose a data source** screen, select **Text/CSV**.

    :::image type="content" source="media/process-mining-tutorial/text-csv.png" alt-text="Screenshot of blank table selection.":::

1. Under the **Connection settings** heading, select **Upload file (Preview)**.

1. Select **Browse**.

    :::image type="content" source="media/process-mining-tutorial/upload-browse.png" alt-text="Screenshot of the Upload file selection and Browse button.":::

1. Find and select **SampleData_AP_Refunds_Financial_EventLog.csv**, which you downloaded previously.

1. Select **Open**.

    :::image type="content" source="media/process-mining-tutorial/open-sample-data.png" alt-text="Screenshot of the downloaded sample data file.":::

1. Select **Next**.

1. When you see the power query, which allows you to transform your data, select **Next**.

1. Match the **Attribute Name** from sample data to the **Attribute Type** as appropriate. In this sample, the data attributes you’ll change are **InvoiceValue**, **Resource**, **StartTimestamp**, **EndTimestamp**, **CaseId**, and **ActivityName**.

    When you're finished, the attribute mapping should look like the following screenshot.

    :::image type="content" source="media/process-mining-tutorial/attribute-names.png" alt-text="Screenshot of the completed mapping.":::

1. Select **Save and analyze**. The analysis may take a few minutes to run.

When the analysis process is complete, you’ll see a process map and a dashboard with other insights about your process. On the dashboard, you can view many metrics that will help you analyze your process. To learn how to analyze the process map and metrics, go to [Visualize and gain insights from processes in process advisor](process-mining-visualize.md).

:::image type="content" source="media/process-mining-tutorial/insights.png" alt-text="Screenshot of the process map and dashboard.":::

## Analyze a process

Let’s take the analysis of our process beyond KPIs. We'll use the minit desktop application, where you can edit and analyze your processes created in process advisor.

1. On the process advisor home page, download the [minit desktop application](minit/how-to-start-with-minit-desktop-application.md).

1. On the top right of the **Process hub** screen, select the environment.

1. Search for the process that you created on process advisor (**Hello World**).

1. Select **Default** to display the default view.

    :::image type="content" source="media/process-mining-tutorial/analyze-world.png" alt-text="Screenshot of the Process hub screen in the minit desktop application.":::

    You’re ready to use the advanced capabilities of the minit desktop application in process advisor.

1. In the dropdown menu for **Frequency**, select **Case count**

    :::image type="content" source="media/process-mining-tutorial/case-count.png" alt-text="Screenshot of the Case count option.":::

    The following process displays.

    :::image type="content" source="media/process-mining-tutorial/case-count-process.png" alt-text="Screenshot of the Case count process.":::

1. In the **Customize** panel, select the clock icon, and then select **Mean duration** from the dropdown menu.

    :::image type="content" source="media/process-mining-tutorial/clock.png" alt-text="Screenshot of the 'Mean duration' option.":::

    Notice that the **Refund with special voucher** step has a long mean duration compared to other steps.

    :::image type="content" source="media/process-mining-tutorial/refund.png" alt-text="Screenshot of the Refund with special voucher step.":::

1. Select the finance icon, and then select **Mean** from the dropdown menu.

    :::image type="content" source="media/process-mining-tutorial/finance-a.png" alt-text="Screenshot of the 'Mean' option.":::

    Notice that the same **Refund With Special Voucher** step involves only $656.31 in invoice value, which is less than half of most of the other steps.

    :::image type="content" source="media/process-mining-tutorial/refund-voucher.png" alt-text="Screenshot of refund with special voucher of $656.31 in invoice value.":::

1. This step might be a good candidate for extra investigation, so select the step.

1. In the **Customization** panel, select **Filter** > **Attributes**.

    :::image type="content" source="media/process-mining-tutorial/attributes-refund.png" alt-text="Screenshot of the Customization panel.":::

## Compare paths with different views

We want to compare the paths that have this **Refund With Special Voucher** step with the paths that don't have this step, but instead have another step called **Refund With Standard Voucher**. Let's filter for paths that have **Refund With Special Voucher** and *not* **Refund With Standard Voucher**. Let's also filter for paths *with* **Refund With Standard Voucher** and *without* **Refund With Special Voucher**.

### Create the 'Refund With Special Voucher' view

10.	On the filter page, ensure **Refund With Special Voucher** is selected in the **holds any of the values** field.

    :::image type="content" source="media/process-mining-tutorial/holds.png" alt-text="Screenshot of the 'holds any of the values' field.":::

1. Select (**+**), and then select **Attributes**. This time, select **Does not include** from the **Filter result** dropdown menu.

1. Select **Refund With Standard Voucher** from the **holds any of the values** field.

1. In the bottom right corner, select **Apply**.

1. In the command bar at the top, select **Save** > **Save as**, and enter **Refund w/ Special Voucher**.

    :::image type="content" source="media/process-mining-tutorial/save-refund.png" alt-text="Screenshot of the 'Save as' option.":::

### Create the 'Refund With Standard Voucher' view

1. Go back to the filter screen by selecting the **Filter** button in the bottom left of the screen.

    :::image type="content" source="media/process-mining-tutorial/filter-button.png" alt-text="Screenshot of the filter button.":::

1. Repeat steps 10 through 13, but choose **Refund With *Standard* Voucher** and **Refund With *Special* Voucher**, respectively.

1. In the command bar at the top, select **Save** > **Save as**, and enter **Refund w/ Standard Voucher**.

### Compare views

We've created two different views. One view shows the paths that have the **Refund With Special Voucher** step but not the **Refund With Standard Voucher** step (Refund w/ Special Voucher). The other view is its inverse (Refund w/ Standard Voucher). Let's compare these two views.

1. In the left panel, select **Process compare**.

1. In the bottom right corner, select (**+**).

1. From the **Views** dropdown menu, select **Refund w/ Special Voucher**, and then select **ADD LAYER**.

    :::image type="content" source="media/process-mining-tutorial/add-layer.png" alt-text="Screenshot of the 'Refund w/ Special Voucher' view selection.":::

    The process map that's created is a comparison of the two views. In the **Customize** panel, ensure that **Mean duration** is selected as the metric.

1. Save this view as **Standard vs. Special**.

## Understand the process map with different views

The orange nodes represent steps common to both views. Green nodes represent the steps that take place in only the process with a special voucher. Blue nodes represent steps that take place only in the paths with standard voucher.

:::image type="content" source="media/process-mining-tutorial/comparison-view.png" alt-text="Screenshot of the comparison view process.":::

From the screenshot in the earlier screenshot, we can see that there were only nine cases with **Refund With Special Voucher**, but on average, that step lengthens the process by almost 17 hours according to the process compare map immediately above.

Notice that cases that have the **Refund With Standard Voucher** step also have the possibility of invoices being rejected as the **Reject Invoice** step suggests. This **Reject Invoice** step contributes only 2.8 hours on average to the process.

Based on insights we derived from this analysis, let's summarize our findings, derive a conclusion, and offer some recommendations for this process.

### Insights summary

- **Refund With Special Voucher**:

    - Takes place only a few times in the process compared to other steps.

    - Has a relatively low amount of money flowing through it.

    - Significantly increases the mean duration of the entire process.

- **Refund With Standard Voucher**:

    - Often causes the invoice to be subsequently rejected which only adds a little bit of time to the mean duration of the process.

### Considerations for choosing a special or standard voucher

This organization has two ways to make refunds using vouchers: **Refund With Special Voucher** or **Refund With Standard Voucher**. The latter may sometimes cause some rework because some of those invoices are subsequently rejected. On the other hand, using the special voucher never causes invoice rejection, which may make it seem like using a special voucher should be the consistent course of action.

However, having the possibility of the invoice being rejected via a standard voucher saves the organization more time than using a special voucher, which never causes the invoice to be rejected&mdash;in fact the difference in mean duration is approximately 13.79 hours.

### Recommendation

An organization should focus on using standard vouchers versus special vouchers because just a few special vouchers can add a lot of time to the process.

An organization should do further analysis to determine why using the standard invoice often causes invoice rejection. If they're able to uncover a remedy for this, the organization can implement this to further improve the process.

To learn more about how to take advantage of the advanced capabilities of the minit desktop application, go to [Minit desktop application overview (preview)](minit/minit-desktop-application-overview.md).
