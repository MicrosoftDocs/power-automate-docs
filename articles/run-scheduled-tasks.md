---
title: Run flows on a schedule in Power Automate
description: Learn how to automate recurring tasks by running flows on a schedule, such as every day or every hour.
suite: flow
author: kisubedi
contributors:
  - puneet-singh1
  - kisubedi
  - natalie-pienkowska
  - kartikraop
  - v-aangie
ms.author: heortaol
ms.reviewer: angieandrews
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 04/14/2025
ms.custom: bap-template
ms.collection: bap-ai-copilot
search.audienceType: 
  - flowmaker
  - enduser
---
# Run flows on a schedule

Create a cloud flow that performs one or more tasks such as sending a report in email.

- Once a day, an hour, or a minute.
- On a date that you specify.
- After many days, hours, or minutes that you specify.

## Create a recurring flow

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select **My flows** > **New flow** > **Scheduled cloud flow**.
1. In the fields next to **Starting**, specify the date and time when your flow should start.
1. In the fields next to **Repeat every**, specify the flow's recurrence.
1. Select **Create**.

    :::image type="content" source="media/run-scheduled-tasks/select-recurrence-aa.png" alt-text="Screenshot of the options to set up a scheduled flow.":::

[!INCLUDE[copilot-designer-note](./includes/copilot-designer-note.md)]

## Configure advanced options

# [New designer](#tab/new-designer)

The steps to configure an action in the cloud flows designer with Copilot are identical to the classic cloud flows designer. However, if you have access to Copilot, you can ask Copilot to create a scheduled flow. For example, you can ask by typing the following prompt:

**Create a flow that runs Monday every two weeks starting 09/25/2023 which sends an email to contoso@gmail.com that their MPR doc is due**

:::image type="content" source="./media/run-scheduled-tasks/copilot-scheduled-prompt.png" alt-text="Screenshot of a prompt to create a scheduled flow.":::

You can ask Copilot to create a scheduled flow using the same prompt in the Copilot panel in the designer.

:::image type="content" source="./media/run-scheduled-tasks/copilot-designer-prompt.png" alt-text="Screenshot of a prompt to create a scheduled flow in the Copilot pane.":::

Copilot adds the following parameters to the flow it created for you in the action configuration pane on the left:

:::image type="content" source="./media/run-scheduled-tasks/copilot-create-flow.png" alt-text="Screenshot of a prompt to create a scheduled flow in the action configuration pane.":::

# [Classic designer](#tab/classic-designer)

1. Follow the steps in the previous section.
1. Select **Recurrence** > **Show advanced options**. When you select **Show advanced options**, the dropdown name changes to **Hide advanced options**.

    :::image type="content" source="./media/run-scheduled-tasks/select-recurrence1.png" alt-text="Screenshot of show/hide advanced options.":::

1. In the **Time zone** field, select a time zone from the dropdown list to specify whether the **Start time** reflects a local time zone, Coordinated Universal Time (UTC), or other time zone.
1. In the **Start time** field, enter a start time in this format: YYYY-MM-DDTHH:MM:SSZ.
    - YYYY = four-digit year
    - MM = two-digit month (01-12)
    - DD = two-digit day of the month (01-31)
    - T = literal character that separates the date and time
    - HH = two-digit hour in 24-hour format (00-23)
    - MM = two-digit minute (00-59)
    - SS = two-digit second (00-59)
    - Z = literal character that indicates UTC time

    For example, enter **2022-03-24T22:00:00Z** to specify 3:00 PM Pacific time on March 24, 2022.
1. If you specified **Day** under **Frequency**, select the time of day when the flow should run in the **At these hours** and **At these minutes** dropdown lists.
1. If you specified **Week** under **Frequency**, do the following.<br/>
    - In the **On these days** and **At these hours** dropdown lists, select the day or days of the week on which the flow should run and the time or times of day when the flow should run.
    - In the **At these minutes** field, enter the minute values (from 0 to 59) separated by a comma.

    For example, configure the options as shown to start a cloud flow no sooner than 3:00 PM (Pacific Time) on Thursday, March 24, 2022, and run it every two weeks on Tuesdays at 5:30 PM (Pacific Time).

    :::image type="content" source="./media/run-scheduled-tasks/advanced-options.png" alt-text="Screenshot of configured advanced options.":::

   > [!NOTE]
   > If you run a flow on the month frequency, the flow runs on the same date each month.

1. Add the action or actions that you want the flow to take, as described in [Create a cloud flow from scratch](get-started-logic-flow.md).

---

## Related information

[Advanced options in Azure Logic Apps](/azure/connectors/connectors-native-recurrence)

[!INCLUDE[footer-include](includes/footer-banner.md)]
