---
title: Analyze and troubleshoot issues in process advisor (preview) | Microsoft Docs
description: This topic explains how to analyze processes and troubleshoot issues with process mining in the process advisor feature in Power Automate.
author: nijemcevic 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 11/02/2021
ms.author: tatn
ms.reviewer: v-aangie
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Analyze and troubleshoot issues in process advisor (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

Once you are done with setup, select **Analyze**. You'll be able to view the Analytics page when the analysis is complete. Analysis typically takes a few minutes but may be faster or slower depending on how much data needs to be analyzed.

*If you don't visit the Analytics page for 14 days, you'll need to re-analyze the process to access the Analytics page again.*

> [!IMPORTANT]
> - This is a preview feature.
>
> - [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

For more information and a short video of analytics, go to [Visualize and analyze processes with process mining (preview)](process-mining-visualize.md#use-kpis-and-visualizations-for-analytics).

## Issues with dataflow refresh

### "There was an issue with a recent dataflow refresh, check your dataflow refresh history."

When you go through setup, process advisor creates a dataflow that's tied to the process. Normally you don’t need to interact with the dataflow, but if there are issues with the dataflow refresh (which is what reads the data source and makes it ready to be analyzed), you might need to troubleshoot the issue.

To troubleshoot:

1.	Make a note of the environment in the environment display on the top-right of the page:

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the environment name.](media/process-mining-analyze/environment.png "Environment name")

1. Make a note of the value of **Name** in the Data Source card below the Details card. <!--What screen are you on? -->

1. Go to https://powerapps.microsoft.com/. <!-- Do you select Start free here? -->

1. Go to the same environment as the one you noted in step 1.

1. Select **Dataverse** > **Dataflows**.

1. Find the dataflow name that you noted in step 2.

1. View the issue by selecting the **Warning** icon in the **Last refresh** column.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Warning icon.](media/process-mining-analyze/warning.png "Warning icon")
 
1. Download the report by selecting the **Download** icon in the **Actions** column.

    > [!div class="mx-imgBorder"]
    > ![Screenshot of the Download icon.](media/process-mining-analyze/download.png "Download icon")

9.	Open the report to see details of the issue.

## Issues with analyze

### "You must have one case with at least two activities to analyze your process. Please change your data."

### "More than 50% of your data has invalid format. Please check your data and try again."


### "Following column(s) do not have the right data types: [x]. Please check your data and try again."


### "Following column(s) are missing from your dataflow: [x]. Please check your data and try again."


### "Your entity contains no data, check your dataflow and try again."


### "The number of rows in your data exceeds the limit. \[x] rows have been ignored."


### "There are too many columns in your data. Please select no more than 5 columns."


### "Analysis failed, please try again."

## Troubleshoot issues with datetime conversion

(Complete or delete.)