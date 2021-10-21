---
title: Analyze processes with process mining in process advisor | Microsoft Docs
description: This topic explains how to analyze processes with process mining in process advisor.
author: nijemcevic 
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: article
ms.date: 5/25/2021
ms.author: tatn
ms.reviewer: v-aangie
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Analyze processes with process mining in process advisor

Once you are done with Setup, select **Analyze**. You'll be able to view the Analytics page when Analyze is complete. Analysis typically takes a few minutes but may be faster or slower depending on how much data needs to be analyzed.
Please note that if you do not visit the Analytics page for a period of 14 days, you will need to re-analyze the process to access the Analytics page again.

## Issues with dataflow refresh

**There was an issue with a recent dataflow refresh, check your dataflow refresh history.**

When you go through setup, Process advisor creates a dataflow that is tied to the process. While normally you don’t need to interact with the dataflow, if there are issues with the dataflow refresh (which is what reads the data source and makes it ready for analyze), you may need to troubleshoot the issue. To troubleshoot:
1.	Note the environment in the environment display on the top right of the page
 
2.	Note the value of Name in the Data Source card below the Details card.
3.	Go to https://powerapps.microsoft.com/
4.	Go to the same environment as the one you noted in step 1.
5.	Expand Dataverse menu item and select Dataflows
6.	Find the dataflow name noted in step 2.
7.	Click on the warning icon next the Last refresh to view the issue.
 
8.	Click the download icon under Actions to download the report.
 
9.	Open the report to see details of the issue.

## Issues with analyze

“You must have one case with at least two activities to analyze your process. Please change your data.”
“More than 50% of your data has invalid format. Please check your data and try again.”
“Following column(s) do not have the right data types: [x]. Please check your data and try again.”
“Following column(s) are missing from your dataflow: [x]. Please check your data and try again.
“Your entity contains no data, check your dataflow and try again.”
“The number of rows in your data exceeds the limit. [x] rows have been ignored.”
“There are too many columns in your data. Please select no more than 5 columns.
“Analysis failed, please try again.”

## Issues with datetime conversion

