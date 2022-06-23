---
title: Get started with task mining in process advisor  | Microsoft Docs
description: Walk through a tutorial with demo data to experience task mining in the process advisor feature of Power Automate.
author: nijemcevic 
ms.subservice: process-advisor
ms.topic: article
ms.custom: intro-internal
ms.date: 05/25/2022
ms.author: tatn
ms.reviewer: angieandrews
search.app: 
  - Flow[https://preview.flow.microsoft.com/?processinsights-core.tabularData=true](https://preview.flow.microsoft.com/?processinsights-core.tabularData=true)
search.audienceType: 
  - flowmaker
  - enduser
---

# Tutorial: Get started with task mining

This tutorial with sample data allows you to experience task mining in the process advisor feature. In this tutorial, you will:

- [Import a solution](#import-a-solution)
- [View sample recordings](#view-sample-recordings)
- [Analyze a process](#analyze-a-process)
- [Gather insights with a process map](#gather-insights-with-a-process-map)
- [View metrics with activity combinations and variants](#view-metrics-with-activity-combinations-and-variants)
- [Identify automation opportunities](#identify-automation-opportunities)

For the task mining tutorial, download [User recording demo data](https://go.microsoft.com/fwlink/?linkid=2175600). For the process mining tutorial, go to [Tutorial: Get started with process mining (preview)](process-mining-tutorial.md).

## Get process advisor ready

1. Sign in to [Power Automate](https://flow.microsoft.com/).

1. Select your environment.

1. On the navigation pane to the left, select **Process advisor** > **Processes**.

    You might see a **Getting things ready** message. Allow this process to complete. It will take a few minutes.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Processes screen.](media/task-mining-tutorial/processes.png "Processes screen")

    Once this process has completed, you should see the following screen:

    > [!div class="mx-imgBorder"]
    > ![Screenshot of screen when processes are ready.](media/task-mining-tutorial/new-processes.png "Screen when processes are ready")

## Import a solution

1. On the navigation pane to the left, select **Solutions**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Solutions screen.](media/task-mining-tutorial/solutions.png "Solutions screen")

1. In the toolbar at the top, select **Import**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Import screen.](media/task-mining-tutorial/import.png "Import screen")

1. Select **Browse**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Import a solution - Browse screen.](media/task-mining-tutorial/browse.png "Import a solution screen - Browse")

1. [Download the **RPAinaDayProcessAdvisor_1_0_0_7** solution .zip file](https://download.microsoft.com/download/9/9/5/9952b396-d9fb-4384-8d4e-5f127bf576c2/RPAinaDayProcessAdvisor_1_0_0_7.zip) and open it.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the downloaded file folder.](media/task-mining-tutorial/download.png "Downloaded file folder")

1. Select **Next**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Import a solution screen.](media/task-mining-tutorial/import-solution.png "Import a solution screen")

1. Select **Import** and wait for the solution to import.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Solutions screen with a message that the import was a success.](media/task-mining-tutorial/import-success.png "Import was a success message")

## View sample recordings

1. Once you've successfully imported the zip file, on the navigation pane to the left, select **Process advisor** > **Processes**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the process advisor home screen.](media/task-mining-tutorial/select-processes.png "Process advisor home screen")

1. Select the **Invoice submission process**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the invoice submission process.](media/task-mining-tutorial/invoice-submission.png "Invoice submission process")

    > [!NOTE]
    > If this is the first time you're accessing process advisor, make sure you've selected **Processes** at least once and waited until the **Getting things ready** loading spinner has disappeared before importing. If you try to import the RPAinaDayProcessAdvisor_1_0_0_7.zip solution without first initializing the **Processes** section of process advisor, you'll see only a couple of recordings in the imported solution.

    You can see some of the existing recordings under **Recordings**.

1. To be sure you see the entire list of existing recordings, select **See all**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Recordings screen.](media/task-mining-tutorial/recordings.png "Recordings screen")

1. Go back to the Invoice submission process by selecting **Invoice submission process**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Invoice submission process screen.](media/task-mining-tutorial/go-back.png "Invoice submission process screen")

### Explore the features

You'll see the following features:

> [!div class="mx-imgBorder"]
> ![Screenshot of the toolbar features.](media/task-mining-tutorial/features.png "Toolbar features")

- **New recording**: Create a new recording.

- **Analytics**: See the process map and insights.

- **Share**: Share your processes with your team members.

    Process owners can pick two role options when sharing with other users: contributor and co-owner. The contributor role gives the user the ability to upload their own recording to the process. The co-owner role gives the user the ability to upload recordings and edit other recordings.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of role options.](media/task-mining-tutorial/roles.png "Role options")

- **Analyze**: Analyze a process.

- **Create activity names**: Create activity names for your process.

- **Delete process**: Delete your process.

## Analyze a process

1. Select **Analyze** to analyze a process. When you perform this action, process advisor will analyze existing recordings to identify any bottlenecks within the business process.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the analyze button.](media/task-mining-tutorial/analyzing-recs.png "Analyze button")

1. Select **Confirm**.

   > [!div class="mx-imgBorder"]
   > ![Screenshot of Analyze this process? screen.](media/task-mining-tutorial/confirm.png "Analyze this process? screen")

1. The analysis will take a few minutes to complete. During this process, a status message displays under the **New recording** button. If you run into an error during the analysis stage, select **Analyze** to trigger this action again.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the process analysis status screen.](media/task-mining-tutorial/analyzing.png "Process analysis status")

1. Once it's done, you'll see the **Process analysis status**  change to **Analyzed**. Select **Analytics** to see the process map and insights. This step may take a couple minutes to complete after the analysis has been performed.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Analytics button.](media/task-mining-tutorial/analytics-screen.png "Analytics button")

### Analytics page layout

This section explains what you can do on the Analytics screen.

> [!div class="mx-imgBorder"]
> ![Screenshot of the Analytics screen.](media/task-mining-tutorial/analytics-layout.png "Analytics screen")

- **Automate activities (preview)**: If during the recording process, a user ran an application that has its Power Automate actions (for example, Microsoft Outlook or Excel), then after selecting **Automate activities (preview)**, a draft Power Automate process would be opened containing the actions related to the used applications that can be automated. The user would then be able to start building the final process using the proposed draft.

- **Legend**: Displays information about the report to let users better understand what they see.

- **Process**: Provides detailed information about the analyzed process. This is where users can find the process map and general information about the process (time analytics per variant and per the recording’s author).

- **Application (preview)**: Provides information about the apps used in recordings. This includes what apps were used by authors, how often were they used, and what the transitions were between them. This report explains which connectors should be used when implementing automation for the process, and where potentially to use desktop flows as there’s no existing connector.

### Business process step relationships

In the previous example, you'll see the various steps in the business process and their related durations. These steps include:

- **Download invoice attachment from email (48 seconds)**

- **Open Excel invoice list (11.5 seconds)**

- **Open invoice from OneDrive (21 seconds)**

- **Enter invoice details (53.6 seconds)**

- **Save and submit (9 seconds)**

- **Notify team of submission (26.67 seconds)**

## Gather insights with a process map

The process map makes it possible to visualize and analyze processes. By looking at a graphical representation of how your business processes are performed, you can gather insights about where improvement opportunities exist.

Go to the process map by selecting **Analytics** > **Process map**.

> [!div class="mx-imgBorder"]
> ![Screenshot of the process map.](media/task-mining-tutorial/gather-insights.png "Process map")

## View metrics with activity combinations and variants

This section explains the **Variants by frequency** bars on the right.

> [!div class="mx-imgBorder"]
> ![Screenshot of the Variants by time in seconds bars.](media/task-mining-tutorial/variant.png "Variants by time in seconds bars")

Different activity combinations and variants are shown separately on the process map. A process variant is a unique path from the beginning to the end of the process. A process variant is a specific activity sequence, like a "trace" through the process, from start to end. Each variant differs from the others by at least one activity. You can see additional metrics, frequency of the activities, and throughput time on the process map. Frequency shows you the total number of recordings/cases passing through it. Throughput time is the time between the first event of the case and the last.
 
> [!div class="mx-imgBorder"]
> ![Screenshot of the Variants by time in minutes bars.](media/task-mining-tutorial/variant-time.png "Variants by time in minutes bars")

You can see that the invoice coming through email is the most frequent process variant.

It might take a while for you to see the changes from the chart.

> [!div class="mx-imgBorder"]
> ![Screenshot of the invoice coming from email variant.](media/task-mining-tutorial/variant-email.png "Invoice coming from email variant")

## Identify automation opportunities

You can see that people spend a lot of their time entering the information in the application. This helps identify an opportunity to automate the process.

> [!div class="mx-imgBorder"]
> ![Screenshot of entering invoice details.](media/task-mining-tutorial/invoice-details.png "Enter invoice details")

### View analytics data

1. Deselect **Var 1** by selecting any blank space within the **Variant by frequency** area.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of selecting a blank space.](media/task-mining-tutorial/variant-blank.png "Select a blank space")
  
1. Look at the top analytics data. The average process time is 1.78 minutes out of five recordings.  

    > [!div class="mx-imgBorder"]
    > ![Screenshot of analytics data.](media/task-mining-tutorial/analytics-data.png "Analytics data")

1. Analyze other time-based metrics dashboards:

   - **Activity by average time in sec**: Notice that **Enter invoice details** and **Download invoice** are taking the most time.

        > [!div class="mx-imgBorder"]
        > ![Screenshot of activity by average time in seconds.](media/task-mining-tutorial/avg-time-sec.png "Activity by average time in seconds")

    - **Recording by average time in min**: Notice that some people (**Preston Morales** and **Shakti Menon**) are taking more time than others.

        > [!div class="mx-imgBorder"]
        > ![Screenshot of recording by average time in minutes.](media/task-mining-tutorial/avg-time-min.png "Recording by average time in minutes")
 
1. Select the **Application (preview)** tab to see details on which applications were used.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of Application (preview).](media/task-mining-tutorial/app-preview.png "Application (preview)")

    It might take a while to load the reports.

    - This report is important, as it allows you to discover insights into the different applications used in a business process, the frequency with which they're accessed, and how much time is spent on the application.

    - *For example, the dashboard shows that a legacy invoicing app, Outlook, and Excel have significant contributions to time spent and actions by applications.*

    - Take time to get familiar with the different reports.
 
    > [!div class="mx-imgBorder"]
    > ![Screenshot of Application (preview) screen.](media/task-mining-tutorial/app-preview-screen.png "Application (preview) screen")

1. Go back to the process map by selecting **Process**.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Process tab.](media/task-mining-tutorial/process-tab.png "Process tab")

1. Look at the automate activities feature. From the process map, you can see that process advisor has highlighted several activities as potential candidates for automation based on applications involved inside the small blue circles.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of process map with blue circles.](media/task-mining-tutorial/blue-circles.png "Process map with blue circles")

1. Start creating a flow for automation by selecting **Automate activities (preview)** at the top.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of Automate activities (preview).](media/task-mining-tutorial/automate.png "Automate activities (preview)")

    A tab will open in the browser and show the flow designer. The recommended actions that match to the activities from the process map automatically appear on the right panel. For example, several email connectors are suggested for you to use in order to automate the **Download invoice attachment from email** activity.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of recommended email connectors.](media/task-mining-tutorial/connectors.png "Recommended email connectors")
 

