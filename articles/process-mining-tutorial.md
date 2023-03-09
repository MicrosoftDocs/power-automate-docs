---
title: Get started with process mining
description: This topic is a tutorial with sample data in process mining for Power Automate.
author: donums
contributors:
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 03/31/2023
ms.author: derahonuorah
ms.reviewer: angieandrews
search.app: 
  - Flow[https://preview.flow.microsoft.com/en-us/?processinsights-core.tabularData=true](https://preview.flow.microsoft.com/en-us/?processinsights-core.tabularData=true)
search.audienceType: 
  - flowmaker
  - enduser
---

# Tutorial: Get started with process mining

This tutorial allows you to experience process mining with sample data. In this tutorial, you'll create a process, import data, and then analyze it.

> [!NOTE]
>
> If you're not able to see all of the features described below and are using your default environment, create a new environment and retry.

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

1. On the navigation pane to the left, select **Process advisor**.

    :::image type="content" source="media/process-mining-tutorial/process-adv-menu.png" alt-text="Screenshot of the process advisor menu selection.":::

1. In the **Create new process** section, select **Start here**.

5. In the **Create a new process** screen, enter a process name, and then select **Import data**.

6. (Optional) Enter a description for your process.

    :::image type="content" source="media/process-mining-tutorial/description.png" alt-text="Screenshot of creating a new process.":::


7. Select **Continue**.

## Import data

1. In the **Choose a data source** screen, select **Text/CSV**.

    :::image type="content" source="media/process-mining-tutorial/text-csv.png" alt-text="Screenshot of blank table selection.":::

1. Under the **Connection settings** heading, select **Upload file (Preview)**.

1. Select **Browse**.

    :::image type="content" source="media/process-mining-tutorial/upload-browse.png" alt-text="Screenshot of the Upload file selection and Browse button.":::

1. Find and select **SampleData_AP_Refunds_Financial_EventLog.csv**, which you downloaded previously.

1. Select **Open**.

    :::image type="content" source="media/process-mining-tutorial/open-sample-data.png" alt-text="Screenshot of the downloaded sample data file.":::

1. You may be required to authenticate, so do so by selecting the **Sign in** button.
2. Select **Next**.

1. When you see the power query, which allows you to transform your data, select **Next**.

1. Match the **Attribute Name** from sample data to the **Attribute Type** as appropriate. In this sample, the data attributes you’ll change are **InvoiceValue**, **Resource**, **StartTimestamp**, **EndTimestamp**, **CaseId**, and **ActivityName**.

    When you're finished, the attribute mapping should look like the following screenshot.

    :::image type="content" source="media/process-mining-tutorial/attribute-table.png" alt-text="Screenshot of the attribute mapping.":::

1. Select **Save and analyze**. The analysis may take a few minutes to run.

When the analysis process is complete, you’ll see a process map and a dashboard with other insights about your process. On the dashboard, you can view many metrics that will help you analyze your process. To learn how to analyze the process map and metrics, go to [Visualize and gain insights from processes in process advisor](process-mining-visualize.md).

:::image type="content" source="media/process-mining-tutorial/process-map-dash.png" alt-text="Screenshot of the process map and dashboard.":::

## Analyze a process

Let’s take the analysis of our process beyond KPIs. We'll use the minit desktop application, where you can edit and analyze your processes created in process advisor.

1. From the command bar of the analytics report page click **Download minit** to download the minit desktop application.
 
1. In the desktop app select the environment from the top right of the **Processes** screen.

1. Search for the process that you created on process advisor (**AP Refunds Process**).

1. Select **Default** to display the default view.

    You’re ready to use the advanced capabilities of the minit desktop application in process advisor.

1. In the dropdown menu for **Frequency**, select **Case count**.

    ![image](https://user-images.githubusercontent.com/113051637/222485047-9a9d3d3a-b7db-4dc0-8da6-29e0266bf7bc.png)

    The following process map displays the number of cases of the process that include the activity specified at each node.

    ![image](https://user-images.githubusercontent.com/113051637/222484984-76cd9d55-8024-4336-a538-d66381e82ad0.png)

1. In the **Customize** panel, select the clock icon, and then select **Mean duration** from the dropdown menu.

    ![image](https://user-images.githubusercontent.com/113051637/222486152-d6241de6-a194-47dc-bcee-5e15f5459110.png)

    Notice that the **Refund with special voucher** step has a long mean duration compared to other steps.

    ![image](https://user-images.githubusercontent.com/113051637/222486290-5c5a697d-d54a-47b2-800e-828062ab230a.png)

1. Select the finance icon, and then select **Mean** from the **Metric** dropdown menu.

    ![image](https://user-images.githubusercontent.com/113051637/222486485-aa678b92-7191-4dad-96fe-4f0a236f7e9b.png)

    Notice that the same **Refund With Special Voucher** step involves only $631.11 in invoice value, which is less than half of most of the other steps.

    ![image](https://user-images.githubusercontent.com/113051637/222486843-65e07a9e-56b7-4421-8a2e-f3c1c7a100b2.png)

1. This step might be a good candidate for extra investigation, so select the stepby clicking on its node.

1. In the **Customization** panel, select **Create Filter** > **Attributes**.

    ![image](https://user-images.githubusercontent.com/113051637/222487143-131bd550-0f51-451f-ab69-a52e57a84f9c.png)

## Compare paths with different views

We want to compare the paths that have this **Refund With Special Voucher** step with the paths that don't have this step, but instead have another step called **Refund With Standard Voucher**. Let's filter for paths that have **Refund With Special Voucher** and *not* **Refund With Standard Voucher**. Let's also filter for paths *with* **Refund With Standard Voucher** and *without* **Refund With Special Voucher**.

### Create the 'Refund With Special Voucher' view

10.	On the filter page, ensure **Refund With Special Voucher** is selected in the **holds any of the values** field.

    ![image](https://user-images.githubusercontent.com/113051637/222487438-3f5b537e-56c6-45a3-add1-727e66c12a6a.png)

1. Select the **+ Add filter** from the command bar, and then select **Attributes** from the dropdown. This time, select **Does not include** from the **Filter result** dropdown menu.

1. Select **Refund With Standard Voucher** from the **holds any of the values** field.

    ![image](https://user-images.githubusercontent.com/113051637/222488419-6356b84b-961b-4d36-85af-a9400f598ee1.png)

13. Your **Filtering** screen should look like this:

    ![image](https://user-images.githubusercontent.com/113051637/222488330-c8040953-3810-4de5-bfd5-f9c9edf1fbc7.png)

1. In the bottom right corner, select **Apply**.

1. In the command bar at the top, select **Save** > **Save as**, and enter **Refund w/ Special Voucher** > **Save**.

    ![image](https://user-images.githubusercontent.com/113051637/222488788-62317346-d853-4f69-80f3-624f6bf9c2b0.png)

### Create the 'Refund With Standard Voucher' view

1. Go back to the filter screen by selecting the **Filter** button in the bottom left of the screen.

    ![image](https://user-images.githubusercontent.com/113051637/222489194-8327f13a-5154-4c96-937e-cb24430836c7.png)

1. Clear the **Filter criteria set** and repeat steps 10 through 14, but choose **Refund With *Standard* Voucher** and **Refund With *Special* Voucher**, for steps corresponding to 10 and 12 respectively.

1. In the command bar at the top, select **Save** > **Save as**, and enter **Refund w/ Standard Voucher** > **Save**.

### Compare views

We've created two different views. One view shows the paths that have the **Refund With Special Voucher** step but not the **Refund With Standard Voucher** step (Refund w/ Special Voucher). The other view is its inverse (Refund w/ Standard Voucher). Let's compare these two views.

1. In the left panel, select **Process compare**.
   
   ![image](https://user-images.githubusercontent.com/113051637/222491886-2acac7b6-8aff-43c7-ac4e-120b70aa6a30.png)

1. In the **Compare** tile, **Add layer**

1. From the **Views** dropdown menu, select **Refund w/ Special Voucher**, and then select **Add layer**.

    ![image](https://user-images.githubusercontent.com/113051637/222492232-df43688e-7bf8-4049-a1a8-345a9104b7dd.png)

    The process map that's created is a comparison of the two views. In the **Customize** panel, ensure that **Mean duration** is selected as the metric.

1. Save this view as **Standard vs. Special**.

## Understand the process map with different views

The green nodes represent steps common to both views. Red node represents the step that take place in only the process with a special voucher (as indicated by the **Compare** legend). Blue nodes represent steps that take place only in the paths with standard voucher.

![image](https://user-images.githubusercontent.com/113051637/222492545-592250ed-ec41-49ba-b780-9ee8c461145e.png)

2. Expand the **Customize** panel using the **Customize** button in the right navigation bar and select **Mean duration** from the **Metric** dropdown of **Performance**.

![image](https://user-images.githubusercontent.com/113051637/222494904-11fcce7b-fa7a-41ae-9c7b-200fbad54112.png)

From the screenshot in step 5 of the **Analyze a process** section above, we can see that there were only nine cases with **Refund With Special Voucher**, but on average, that step lengthens the process by almost 17 hours according to the process compare map immediately above.

![image](https://user-images.githubusercontent.com/113051637/222495536-6db072ab-ef88-4341-9c13-d5333daeaf93.png)

Notice that cases that have the **Refund With Standard Voucher** step also have the possibility of invoices being rejected as the blue node which represents the **Reject Invoice** step suggests. This **Reject Invoice** step contributes only 2.8 hours on average to the process.

![image](https://user-images.githubusercontent.com/113051637/222497640-f100a176-e55f-4760-8522-2d7db5fd982d.png)

Based on insights we derived from this analysis, let's summarize our findings, derive a conclusion, and offer some recommendations for this process.

### Insights summary

- **Refund With Special Voucher**:

    - Takes place only a few times in the process compared to other steps.

    - Has a relatively low amount of money flowing through it.

    - Significantly increases the mean duration of the entire process.

- **Refund With Standard Voucher**:

    - The cases with this step also have the invoices being subsequently rejected causing rework and adding little bit of time to the mean duration of the process.

### Considerations for choosing a special or standard voucher

This organization has two ways to make refunds using vouchers: **Refund With Special Voucher** or **Refund With Standard Voucher**. The latter may sometimes cause some rework because some of those invoices are subsequently rejected. On the other hand, using the special voucher never causes invoice rejection, which may make it seem like using a special voucher should be the consistent course of action.

However, having the possibility of the invoice being rejected via a standard voucher saves the organization more time than using a special voucher, which never causes the invoice to be rejected&mdash;in fact the difference in mean duration is approximately 13.79 hours.

### Recommendation

An organization should focus on using standard vouchers versus special vouchers because just a few special vouchers can add a lot of time to the process.

An organization should do further analysis to determine why using the standard invoice often causes invoice rejection. If they're able to uncover a remedy for this, the organization can implement this to further improve the process.

To learn more about how to take advantage of the advanced capabilities of the minit desktop application, go to [Minit desktop application overview (preview)](minit/minit-desktop-application-overview.md).
