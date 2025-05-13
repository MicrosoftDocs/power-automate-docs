---
title: Get started with the process mining capability
description: Learn how to use the process mining capability with sample data in a tutorial.
author: rosikm
contributors:
  - rosikm
  - donums
  - v-aangie  
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 02/10/2025
ms.author: janpidych
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Tutorial: Get started with the process mining capability

This tutorial allows you to experience the process mining capability with sample data. In this tutorial, you create a process, import data, and then analyze it.

> [!NOTE]
>
> If you don't see all of the features described in this article and are using your default environment, create a new environment and retry.

## Download the sample data

For the process mining tutorial, download the sample event log CSV file:  

- [English version](https://go.microsoft.com/fwlink/?linkid=2181220)
- [French version](https://go.microsoft.com/fwlink/?linkid=2226086)

The sample data in this tutorial is for illustration only and is fictitious. No real association is intended or inferred.

## Create a process

> [!NOTE]
>
> If you encounter an error message while attempting to create and analyze a process, it may be due to a missing security role. To resolve this, please contact the administrator of your environment and request that they assign you the **Environment Maker** security role.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select your environment.
1. On the navigation pane to the left, select **Process mining**.
1. In the **Create new process** section, select **Start here**.
1. In the **Create a new process** screen, enter a process name, and then select **Import data**.
1. (Optional) Enter a description for your process.
1. Select **Continue**.
1. (Optional) Select a Power BI workspace to attach your process to and give your report a name.
1. Select **Continue**.

## Import data

1. In the **Choose a data source** screen, select **Text/CSV**.
1. Under the **Connection settings** heading, select **Upload file (Preview)**.
1. Select **Browse**.
1. Find and select **SampleData_AP_Refunds_Financial_EventLog.csv**, which you downloaded previously.
1. Select **Open**.

    :::image type="content" source="media/process-mining-tutorial/open-sample-data.png" alt-text="Screenshot of the downloaded sample data file.":::

1. If you're asked to authenticate, select **Sign in** and follow the prompts.
1. Select **Next**.
1. When you see the power query, which allows you to transform your data, select **Next**.
1. Match the **Attribute Name** from sample data to the **Attribute Type** as appropriate. In this sample, the data attributes you change are **InvoiceValue**, **Resource**, **StartTimestamp**, **EndTimestamp**, **CaseId**, and **ActivityName**.

    When you finish, the attribute mapping should look like the following screenshot.

    :::image type="content" source="media/process-mining-tutorial/attribute-table.png" alt-text="Screenshot of the attribute mapping.":::

1. Select **Save and analyze**. The analysis might take a few minutes to run.

    When the analysis process is complete, you see a process map and a dashboard with other insights about your process. On the dashboard, you can view many metrics that can help you analyze your process. To learn how to analyze the process map and metrics, go to [Visualize and gain insights from processes in the process mining capability](process-mining-visualize.md).

    :::image type="content" source="media/process-mining-tutorial/process-map-dash.png" alt-text="Screenshot of the process map and dashboard.":::

## Analyze a process

Let's take the analysis of our process beyond KPIs. We use the Power Automate Process Mining desktop app, where you can edit and analyze your processes created in the process mining capability.

1. From the command bar of the analytics report page, select **Download Process Mining app** to download it.
1. On the toolbar, select the environment from the top right.
1. Search for the process you created with the process mining capability in Power Automate (**AP Refunds Process**).
1. To display the default view, select **Default**.

    Based on your settings, the process model is:

    - Downloaded to your local computer and analyzed locally
    - Kept and analyzed in the cloud (preview). You're notified about the availability of this option with message on top of your application.

    :::image type="content" source="media/process-mining-tutorial/papm-desktop-message-marked.png" alt-text="Screenshot of the 'keep and analyze in cloud' message.":::

    Learn more about setting the new option in [Application settings](minit/options.md).

    You’re ready to use the advanced capabilities of the Process Mining desktop app.

1. On the **Customize** panel toolbar, select **Frequency** (the first icon), and then select **Case count** in the **Metric** dropdown menu.

    :::image type="content" source="media/process-mining-tutorial/frequency.png" alt-text="Screenshot of the case count metric.":::

    The process map displays the number of cases of the process that include the activity specified at each node.

1. On the **Customize** panel, select the clock icon, and then select **Mean duration** from the dropdown menu.

    Notice that the **Refund with special voucher** step has a long mean duration compared to other steps.

    :::image type="content" source="media/process-mining-tutorial/refund.png" alt-text="Screenshot of the refund with special voucher mean duration.":::

1. On the **Customize** panel, select **Finance** (the piece of paper icon), and then select **Mean** from the **Metric** dropdown menu.

    Notice that the same **Refund With Special Voucher** step involves only $631.11 in invoice value, which is less than half of most of the other steps.

    :::image type="content" source="media/process-mining-tutorial/refund-mean.png" alt-text="Screenshot of the refund with special voucher mean.":::

1. This step might be a good candidate for extra investigation, so select this step's node.

1. On the **Customization** panel, select **Create filter** > **Attributes**.

    :::image type="content" source="media/process-mining-tutorial/create-filter.png" alt-text="Screenshot of the Create filter dropdown menu.":::

## Compare paths with different views

We want to compare the paths that have this **Refund With Special Voucher** step with the paths that don't have this step, but instead have another step called **Refund With Standard Voucher**. Let's filter for paths that have **Refund With Special Voucher** and *not* **Refund With Standard Voucher**. Let's also filter for paths *with* **Refund With Standard Voucher** and *without* **Refund With Special Voucher**.

### Create the 'Refund With Special Voucher' view

1. On the **Filtering** page, ensure **Refund With Special Voucher** is selected in the **holds any of the values** field.

1. On the command bar, select **Add filter** > **Attributes**. 

1. This time, select **Does not include** from the **Filter result** dropdown menu.

1. On the **List** tab, select **Refund With Standard Voucher** to place it in the **holds any of the values** field.

    Your **Filtering** screen should look like this:

    :::image type="content" source="media/process-mining-tutorial/does-not-include.png" alt-text="Screenshot of creating the 'Refund With Special Voucher' view.":::

1. On the bottom right corner, select **Apply**.

1. On the command bar at the top, select **Save** > **Save as**, and then enter **Refund w/ Special Voucher** > **Save**.

### Create the 'Refund With Standard Voucher' view

1. Go back to the filter screen by selecting the **Filter** button in the bottom left of the screen.

1. Clear the **Filter criteria set** and repeat steps 1 through 4 of the previous section, but choose **Refund With *Standard* Voucher** in step 1 and **Refund With *Special* Voucher** in step 4.

1. In the command bar at the top, select **Save** > **Save as**, and then enter **Refund w/ Standard Voucher** > **Save**.

### Compare views

You created two different views. One view shows the paths that have the **Refund With Special Voucher** step but not the **Refund With Standard Voucher** step (Refund w/ Special Voucher). The other view is its inverse (Refund w/ Standard Voucher). Let's compare these two views.

1. On the left panel, select **Process compare**.

1. Below the **Compare** tile, select **Add layer**.

1. From the **Views** dropdown menu, select **Refund w/ Special Voucher** > **Add layer**.

    The process map that is created is a comparison of the two views.

1. In the **Customize** panel, ensure that **Mean duration** is selected as the metric.

1. Save this view as **Standard vs. Special**.

## Understand the process map with different views

The green nodes represent steps common to both views. A red node represents the step that takes place only in the process with a special voucher (as indicated by the **Compare** legend). Blue nodes represent steps that take place only in the paths with standard voucher.

:::image type="content" source="media/process-mining-tutorial/compare-legend.png" alt-text="Screenshot of a process map with color nodes.":::

1. Expand the **Customize** panel by selecting **Customize** on the right navigation bar.

1. Select the **Performance** (the clock icon).

1. From the **Metric** dropdown menu, select **Mean duration**.

From the procedure in [Analyze a process](#analyze-a-process) (previously in this article), there were only nine cases with **Refund With Special Voucher**. On average, the process is lengthened by almost 17 hours according to the process compare map in this section.

:::image type="content" source="media/process-mining-tutorial/analyze-compare.png" alt-text="Screenshot of the 'Refund With Special Voucher' with a case comparison.":::

Notice that cases that have the **Refund With Standard Voucher** step also have the possibility of invoices being rejected as the blue node, which represents the **Reject Invoice** step suggests. This **Reject Invoice** step contributes only 2.8 hours on average to the process.

:::image type="content" source="media/process-mining-tutorial/reject-invoice.png" alt-text="Screenshot of the 'Reject Invoice' node.":::

Based on insights we derived from this analysis, let's summarize our findings, derive a conclusion, and offer some recommendations for this process.

### Insights summary

- **Refund With Special Voucher**:

    - Takes place only a few times in the process compared to other steps.

    - Has a relatively low amount of money flowing through it.

    - Significantly increases the mean duration of the entire process.

- **Refund With Standard Voucher**:

    - The cases with this step also have the invoices being subsequently rejected. This causes rework and adds some time to the mean duration of the process.

### Considerations for choosing a special or standard voucher

This organization has two ways to make refunds using vouchers: **Refund With Special Voucher** or **Refund With Standard Voucher**. The latter might sometimes cause some rework because some of those invoices are subsequently rejected. Alternatively, using the special voucher never causes invoice rejection. This might make it seem like using a special voucher should be the consistent course of action.

However, having the possibility of the invoice being rejected through a standard voucher saves the organization more time than using a special voucher. This never causes the invoice to be rejected&mdash;the difference in mean duration is approximately 13.79 hours.

### Recommendation

An organization should focus on using standard vouchers versus special vouchers because just a few special vouchers can add much time to the process.

An organization should do further analysis to determine why using the standard invoice often causes invoice rejection. If they're able to uncover a remedy for this, the organization can implement this to further improve the process.

To learn more about how to take advantage of the advanced capabilities of Power Automate Process Mining, go to [Overview of Power Automate Process Mining](minit/minit-desktop-application-overview.md).
