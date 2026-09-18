title: Schedule desktop flows with scheduled triggers
description: Scheduled triggers, allow you to schedule desktop flows directly.
author: cochamos
ms.author: cochamos
ms.reviewer:
ms.date: 09/18/2026
ms.topic: feature-guide

# Schedule desktop flows with scheduled triggers (preview)

Scheduled triggers let you run desktop flows on a recurring schedule without creating a cloud flow as an intermediary. You can create and manage scheduled triggers in Automation center, select the desktop flow and execution connection, and review upcoming scheduled runs from a centralized experience.

Before scheduled triggers, scheduling a desktop flow required a scheduled cloud flow that invoked the desktop flow. Scheduled triggers remove this dependency and make it easier to understand which desktop flow runs, when it runs, and which machine or machine group executes it.

> [!IMPORTANT]
> Scheduled triggers are currently in preview and support desktop flows only.

## Prerequisites

To create and use a scheduled trigger, you need:

- A work or school account that can access the target Power Platform environment.
- A published desktop flow that you own or co-own.
- A machine or machine group registered in the same environment.
- A connection reference for the target machine or machine group. You can create the connection reference while creating the scheduled trigger.
- The licensing and capacity required for the selected attended or unattended run mode.


## Open scheduled triggers

1. Sign in to Power Automate and select the environment in which you want to manage scheduled triggers.
1. In the left navigation pane, select **Automation center**.
1. Under **Manage**, select **Scheduled triggers (Preview)**.

The **Scheduled triggers** page contains the following tabs:

- **Overview**: Lists the scheduled triggers available to you.
- **Upcoming**: Lists projected scheduled-trigger executions.

## Understand the Overview tab

The **Overview** tab lists the scheduled triggers available to you. Use the desktop flow and connection reference filters to narrow the list. Select **Refresh** to retrieve the latest information.

The following columns are available:

| Column | Displayed by default | Description |
|---|---|---|
| Name | Yes | The name of the scheduled trigger. |
| Flow | Always | The desktop flow that the scheduled trigger runs. |
| Status | Yes | Whether the scheduled trigger is enabled or disabled. |
| Trigger details | Yes | A readable summary of the recurrence, such as `Every day at 5:00 PM`. |
| Run mode | Yes | Whether the desktop flow runs in attended or unattended mode. |
| Machine | Yes | The target machine, when applicable. |
| Machine group | Yes | The target machine group, when applicable. |
| Description | Yes | The optional description of the scheduled trigger. |
| Created on | No | The date and time when the scheduled trigger was created. |
| Modified on | No | The date and time when the scheduled trigger was last modified. |
| Connection reference | No | The connection reference used by the scheduled trigger. |
| Created by | No | The user who created the scheduled trigger. |

The **Flow** column is always displayed. You can show or hide the other columns.

## Create a scheduled trigger

1. On the **Scheduled triggers** page, select **New**.
1. In the **Create a scheduled flow trigger (Preview)** pane, configure the scheduled trigger.
1. To activate the trigger immediately after you create it, turn on **Enable**.
1. Select **Save**.

Configure the following fields:

| Field | Required | Description |
|---|---|---|
| Name | Yes | Enter a name that identifies the scheduled trigger. |
| Enable | No | Turn on the scheduled trigger so that it can create scheduled runs. Leave it off to save the trigger in a disabled state. |
| Description | No | Add a description that explains the purpose of the scheduled trigger. |
| Selected flow | Yes | Select the desktop flow to run. The list contains desktop flows that you own or co-own. |
| Connection reference | Yes | Select an existing connection reference, or select **New connection reference** to create one. |
| Run mode | Yes | Select **Attended** or **Unattended**. |
| Start date | Yes | Select the date from which the schedule applies. |
| Start time | Yes | Select the time at which the scheduled run starts. |
| Repeat every | Yes | Enter the recurrence interval, and then select **Minute**, **Hour**, **Day**, **Week**, or **Month**. |
| Select time zone | Yes | Select the time zone used to interpret the configured start date and time. |

Choose the time zone that corresponds to the intended business time. For example, if the desktop flow must run at 1:00 PM Pacific Time, select the appropriate Pacific time zone.

## Create a connection reference

The **Connection reference** list displays the available connection references.

If the connection reference that you need isn't available, create one while configuring the scheduled trigger:

1. Under **Connection reference**, select **New connection reference**.
1. In the **Add a new connection reference** dialog, enter a connection reference name.
1. Under **Connect**, select the authentication method.
1. Under **Machine or machine group**, select the execution target.
1. Enter the required credentials, or turn on **Windows credential** to use a Windows credential.
1. Select **Add**.

Configure the following fields:

| Field | Required | Description |
|---|---|---|
| Name | Yes | Enter a name for the connection reference. |
| Connect | Yes | Select how Power Automate connects to the execution target. |
| Machine or machine group | Yes | Select the machine or machine group that runs the desktop flow. |
| Windows credential | No | Use a Windows credential instead of entering the user account and password directly. |
| User account | Conditional | When you enter credentials directly, enter the account in `domain\username` or `username@domain.com` format. |
| Password | Conditional | When you enter credentials directly, enter the password for the user account. |

If a machine or machine group isn't listed, register it first. Select **Refresh** to display recently registered machines or machine groups.

## Configure a weekly schedule

When you select **Week** as the recurrence unit, the **On these days** control appears.

1. In **Repeat every**, enter the number of weeks between runs.
1. Select **Week**.
1. Under **On these days**, select one or more days.
1. Confirm the **Start date**, **Start time**, and **Select time zone** values.
1. Select **Save**.

For example, to run a desktop flow every Monday, Wednesday, and Friday, set **Repeat every** to **1 Week**, and then select **Monday**, **Wednesday**, and **Friday**.

## Understand recurrence behavior

Scheduled triggers use Azure Logic Apps recurrence scheduling.

Consider the following behavior:

- A recurrence can use **Minute**, **Hour**, **Day**, **Week**, or **Month** as its frequency.
- For a weekly recurrence, you can select one or more days of the week.
- The schedule uses the selected time zone to interpret the configured start date and time.
- If the start time is in the past, missed occurrences aren't run. The trigger starts at the next future occurrence.
- If the trigger or the underlying service is unavailable, missed occurrences aren't processed. The schedule resumes at the next scheduled occurrence.
- For weekly schedules with multiple selected days, the start time specifies the earliest time at which the trigger can run.
- Daylight saving time changes can cause some local start times to be invalid or ambiguous.

>[!Important]
>For weekly schedules with one or more selected days, create the schedule at least seven days before the intended first occurrence. Otherwise, the first occurrence might be skipped.

For more information about the underlying recurrence behavior, refer to the [Azure Logic Apps recurrence scheduling](https://learn.microsoft.com/azure/logic-apps/concepts-schedule-automated-recurring-tasks-workflows) article.

## Manage scheduled triggers

On the **Overview** tab, open the **More commands** menu for the scheduled trigger that you want to manage.

### Edit a scheduled trigger

1. Select **Edit**.
1. Update the configuration.
1. Select **Save**.

### Enable or disable a scheduled trigger

For an enabled trigger, select **Disable**. For a disabled trigger, select **Enable**.

Disabling a scheduled trigger stops future scheduled runs without deleting its configuration. When you enable it again, the schedule resumes with its next occurrence. Occurrences missed while the trigger was disabled aren't run.

### Delete a scheduled trigger

Select **Delete** to permanently remove the scheduled trigger and its schedule.

To stop future scheduled runs without removing the configuration, disable the trigger instead.

## Customize the Overview columns

1. On the **Overview** tab, select **Show/hide columns**.
1. In the **Edit columns** pane, select the columns that you want to display.
1. Optionally, select **Clear all** or **Select all**.
1. Select **Save**.

The default columns are:

- **Name**
- **Flow**
- **Status**
- **Trigger details**
- **Run mode**
- **Machine**
- **Machine group**
- **Description**

The **Flow** column is always displayed.

## View upcoming scheduled runs

Select the **Upcoming** tab to view projected scheduled-trigger executions.

Use the following filters to narrow the list:

- **All desktop flows**
- **All scheduled triggers**
- **All connection references**

The following columns are available:

| Column | Displayed by default | Description |
|---|---|---|
| Starting | Yes | The projected date and time of the upcoming run. |
| Flow | Yes | The desktop flow that the scheduled trigger runs. |
| Scheduled trigger | Yes | The scheduled trigger that initiates the run. |
| Trigger details | Yes | A summary of the recurrence configuration. |
| Run mode | Yes | The configured attended or unattended run mode. |
| Connection reference | Yes | The connection reference used for the run. |

A recurring scheduled trigger can produce multiple upcoming entries, one for each projected occurrence.

## Restore an environment that contains scheduled triggers

During preview, scheduled triggers aren't automatically synchronized when an environment is restored. As a result, triggers might continue running unexpectedly or fail to resume after the restore.

> [!IMPORTANT]
> Before you restore an environment, disable all scheduled triggers in that environment. Re-enabling triggers after the restore doesn't prevent issues caused by leaving them enabled during the restore operation.

After the restore completes, re-enable only the scheduled triggers that you want to run. If a trigger already appears enabled, disable it and then enable it again to re-establish its schedule.

