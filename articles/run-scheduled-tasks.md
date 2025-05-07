---
title: Run a cloud flow on a schedule in Power Automate
description: Learn how to automate recurring tasks by running a cloud flow on a schedule, such as every day or every hour.
suite: flow
author: HeatherOrt
contributors:
  - puneet-singh1
  - kisubedi
  - natalie-pienkowska
  - kartikraop
  - v-aangie
ms.author: matow
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 04/14/2025
ms.custom: bap-template
ms.collection: bap-ai-copilot
search.audienceType: 
  - flowmaker
  - enduser
---
# Run a cloud flow on a schedule

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

You can ask Copilot to create a scheduled cloud flow. For example, you can ask by typing the following prompt:

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. In the **Create your automation with Copilot** field, type the following prompt:

    **Create a flow that runs Monday every week starting 04/14/2025 which sends an email to contoso@gmail.com that their MPR doc is due.**

1. Select **Generate**.

    :::image type="content" source="./media/run-scheduled-tasks/copilot-generate.png" alt-text="Screenshot of a prompt to create a scheduled flow.":::

1. Copilot generates a flow based on your prompt. You can review the generated flow and make any necessary adjustments. If you're satisfied with the suggested flow, select **Keep it and continue**.

    :::image type="content" source="./media/run-scheduled-tasks/copilot-generate-keep-it.png" alt-text="Screenshot of a generated flow.":::

1. Review the connected apps and services. A green checkmark means the connection is ready to go.

    If you don't have a green checkmark, select the connection to set it up.

1. Select **Create flow**.

1. To define parameters for an action, select the action in the flow designer. The action configuration pane opens on the left side of the screen.

    :::image type="content" source="./media/run-scheduled-tasks/copilot-create-flow.png" alt-text="Screenshot of a prompt to create a scheduled flow in the action configuration pane.":::

    You can ask Copilot to make changes to your scheduled flow using the Copilot panel in the designer.

    After Copilot generates a response, it confirms that it made the update successfully. If you change your mind, you can select **Undo** to revert the changes.

    :::image type="content" source="./media/run-scheduled-tasks/copilot-designer-prompt.png" alt-text="Screenshot of a prompt to create a scheduled flow in the Copilot pane.":::

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

    For example, enter **2025-03-24T22:00:00Z** to specify 3:00 PM Pacific time on March 24, 2025.
1. If you specified **Day** under **Frequency**, select the time of day when the flow should run in the **At these hours** and **At these minutes** dropdown lists.
1. If you specified **Week** under **Frequency**, do the following.<br/>
    - In the **On these days** and **At these hours** dropdown lists, select the day or days of the week on which the flow should run and the time or times of day when the flow should run.
    - In the **At these minutes** field, enter the minute values (from 0 to 59) separated by a comma.

   > [!NOTE]
   > If you run a flow on the month frequency, the flow runs on the same date each month.

1. Add the action or actions that you want the flow to take, as described in [Create a cloud flow from scratch](get-started-logic-flow.md).

---

## Related information

[Advanced options in Azure Logic Apps](/azure/connectors/connectors-native-recurrence)

[!INCLUDE[footer-include](includes/footer-banner.md)]
