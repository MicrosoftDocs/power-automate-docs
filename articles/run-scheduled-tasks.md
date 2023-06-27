---
title: Run flows on a schedule in Power Automate | Microsoft Docs
description: Learn how to automate recurring tasks by running flows on a schedule, such as every day or every hour.
services: ''
suite: flow
documentationcenter: na
author: natalie-pienkowska
contributors:
  - natalie-pienkowska
  - kartikraop
  - v-aangie
ms.author: napienko
ms.reviewer: angieandrews
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/12/2023
search.audienceType: 
  - flowmaker
  - enduser
---
# Run flows on a schedule

Create a cloud flow that performs one or more tasks (such as sending a report in email).

- Once a day, an hour, or a minute.

- On a date that you specify.

- After a number days, hours, or minutes that you specify.

## Create a recurring flow

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. Select **My flows** > **New flow** > **Scheduled cloud flow**.

1. In the fields next to **Starting**, specify the date and time when your flow should start.

1. In the fields next to **Repeat every**, specify the flow's recurrence.

1. Select **Create**.

    :::image type="content" source="media/run-scheduled-tasks/select-recurrence-aa.png" alt-text="Screenshot of the options to set up a scheduled flow.":::

When you create a cloud flow, your flow opens in either the current designer or the AI-powered designer. The instructions for how to run flows on a schedule are slightly different for each designer. If you see the **Copilot** pane on the right, you're using the AI-powered designer. In this article, select the **Current designer** or **AI-powered designer** tab for instructions.

## Configure advanced options

# [Current designer](#tab/current-designer)

1. Follow the steps in the previous section.

1. Select **Recurrence** > **Show advanced options**. When you select **Show advanced options**, the dropdown name changes to **Hide advanced options**.

    >[!div class="mx-imgBorder"]
    >![Screenshot of show/hide advanced options.](./media/run-scheduled-tasks/select-recurrence1.png "Show/hide advanced options")

    >[!NOTE]
    >These options change based on the values to which **Interval** and **Frequency** are set. If your screen doesn't match the graphic below, make sure that **Interval** and **Frequency** are set to the same values that the graphic shows.

1. In the **Time zone** field, select a time zone from the dropdown list to specify whether the **Start time** reflects a local time zone, Coordinated Universal Time (UTC), or other time zone.

1. In the **Start time** field, enter a start time in this format: YYYY-MM-DDTHH:MM:SSZ

1. If you specified **Day** under **Frequency**, select the time of day when the flow should run in the **At these hours** and **At these minutes** dropdown lists.

1. If you specified **Week** under **Frequency**, do the following.<br/>
    - In the **On these days** and **At these hours** dropdown lists, select the day or days of the week on which the flow should run and the time or times of day when the flow should run.
    - In the **At these minutes** field, enter the minute values (from 0 to 59) separated by a comma.

    For example, configure the options as shown to start a cloud flow no sooner than 3:00 PM (Pacific time) on Thursday, March 24, 2022, and run it every two weeks on Tuesdays at 5:30 PM (Pacific time).

    >[!div class="mx-imgBorder"]
    >![Screenshot of specified advanced options.](./media/run-scheduled-tasks/advanced-options.png "Specify advanced options")

   > [!NOTE]
   > If you run a flow on the month frequency, the flow runs on the same date each month.

1. Add the action or actions that you want the flow to take, as described in [Create a cloud flow from scratch](get-started-logic-flow.md).

# [AI-powered designer](#tab/ai-powered-designer)




---

### See also

[Advanced options in Azure Logic Apps](/azure/connectors/connectors-native-recurrence)

[!INCLUDE[footer-include](includes/footer-banner.md)]

