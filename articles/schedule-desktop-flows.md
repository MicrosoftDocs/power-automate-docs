---
title: Schedule desktop flows with Scheduled triggers (preview)
description: Learn how to schedule desktop flows directly by using scheduled triggers in Automation center.
author: cochamos
ms.author: cochamos
ms.reviewer: smurkute
ms.date: 09/28/2026
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
---

# Schedule desktop flows with Scheduled triggers (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](includes/cc-beta-prerelease-disclaimer.md)]

**Scheduled triggers** let you run desktop flows on a recurring schedule without creating a cloud flow. 
Create and manage **Scheduled triggers** in **Automation center**, choose the desktop flow and execution connection, and review upcoming scheduled runs in one place.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and might have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - Learn more in [preview terms](https://go.microsoft.com/fwlink/?linkid=2189520).
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

Scheduled triggers run desktop flows directly, making it easier to understand what runs, when it runs, and where it runs.

> [!IMPORTANT]
> Scheduled triggers support desktop flows only.

## Prerequisites

Before you create a scheduled trigger, make sure that you have:

- A work or school account that can access the target Power Platform environment.
- A published desktop flow that you own or co-own.
- A machine or machine group registered in the same environment.
- A connection reference for the target machine or machine group. You can create the connection reference while creating the scheduled trigger.
- The licensing and capacity required for the selected attended or unattended run mode.

## Go to scheduled triggers

1. Sign in to Power Automate and select the environment where you want to manage scheduled triggers.
1. In the left navigation pane, select **Automation center**.
1. Under **Manage**, select **Scheduled triggers (Preview)**.

The **Scheduled triggers** page contains the following tabs:

- **Overview**: Lists the scheduled triggers available to you.
- **Upcoming**: Lists projected scheduled-trigger executions.

## View scheduled triggers

The **Overview** tab lists the scheduled triggers available to you. Use the desktop flow and connection reference filters to find specific scheduled triggers. Select **Refresh** to retrieve the latest information.

Available columns:

| Column               | Displayed by default | Description                                                                    |
|----------------------|----------------------|--------------------------------------------------------------------------------|
| Name                 | Yes                  | The name of the scheduled trigger.                                             |
| Flow                 | Always               | The desktop flow that the scheduled trigger runs.                              |
| Status               | Yes                  | Whether the scheduled trigger is enabled or disabled.                          |
| Trigger details      | Yes                  | A summary of the recurrence schedule, such as `Every day at 5:00 PM`.           |
| Run mode             | Yes                  | Whether the desktop flow runs in attended or unattended mode.                  |
| Machine              | Yes                  | The target machine, when applicable.                                           |
| Machine group        | Yes                  | The target machine group, when applicable.                                     |
| Description          | Yes                  | The optional description of the scheduled trigger.                             |
| Created on           | No                   | The date and time when the scheduled trigger was created.                      |
| Modified on          | No                   | The date and time when the scheduled trigger was last modified.                |
| Connection reference | No                   | The connection reference used by the scheduled trigger.                        |
| Created by           | No                   | The user who created the scheduled trigger.                                    |

The **Flow** column is always displayed. You can show or hide the other columns.

## Create a scheduled trigger

1. On **Scheduled triggers**, select **New**.
1. In **Create a scheduled flow trigger (Preview)**, configure the scheduled trigger.
1. To activate the trigger immediately after you create it, turn on **Enable**.
1. Select **Save**.

Configure these fields:

| Field                | Required    | Description                                                                                                        |
|----------------------|-------------|--------------------------------------------------------------------------------------------------------------------|
| Name                 | Yes         | Enter a name that identifies the scheduled trigger.                                                               |
| Enable               | No          | Turn on the scheduled trigger so that it can create scheduled runs. Leave it off to save the trigger as disabled. |
| Description          | No          | Add a description that explains the purpose of the scheduled trigger.                                              |
| Selected flow        | Yes         | Select the desktop flow to run. The list contains desktop flows that you own or co-own.                            |
| Connection reference | Yes         | Select an existing connection reference, or select **New connection reference** to create one.                    |
| Run mode             | Yes         | Select **Attended** or **Unattended**.                                                                             |
| Start date           | Yes         | Select the date when the schedule starts.                                                                          |
| Start time           | Yes         | Select the time when the scheduled run starts.                                                                     |
| Repeat every         | Yes         | Enter the recurrence interval, and then select **Minute**, **Hour**, **Day**, **Week**, or **Month**.              |
| Select time zone     | Yes         | Select the time zone used to interpret the configured start date and time.                                         |

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

Configure these fields:

| Field                    | Required    | Description                                                                                                         |
|--------------------------|-------------|---------------------------------------------------------------------------------------------------------------------|
| Name                     | Yes         | Enter a name for the connection reference.                                                                          |
| Connect                  | Yes         | Select how Power Automate connects to the execution target.                                                          |
| Machine or machine group | Yes         | Select the machine or machine group that runs the desktop flow.                                                      |
| Windows credential       | No          | Use a Windows credential instead of entering the user account and password directly.                                |
| User account             | Conditional | When you enter credentials directly, enter the account in `domain\username` or `username@domain.com` format.         |
| Password                 | Conditional | When you enter credentials directly, enter the password for the user account.                                       |

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
- If the start time is in the past, the trigger doesn't run missed occurrences. The trigger starts at the next future occurrence.
- If the trigger or the underlying service is unavailable, the trigger doesn't process missed occurrences. The schedule resumes at the next scheduled occurrence.
- For weekly schedules with multiple selected days, the start time specifies the earliest time at which the trigger can run.
- Daylight saving time changes can cause some local start times to be invalid or ambiguous.

> [!IMPORTANT]
> For weekly schedules with one or more selected days, create the schedule at least seven days before the intended first occurrence. Otherwise, the trigger might skip the first occurrence.

For more information about the underlying recurrence behavior, see [Azure Logic Apps recurrence scheduling](/azure/logic-apps/concepts-schedule-automated-recurring-tasks-workflows).

## Manage scheduled triggers

On the **Overview** tab, open the **More commands** menu for the scheduled trigger that you want to manage.

### Edit a scheduled trigger

1. Select **Edit**.
1. Update the configuration.
1. Select **Save**.

### Enable or disable a scheduled trigger

Select **Disable** for an enabled trigger. Select **Enable** for a disabled trigger.

Disabling a scheduled trigger stops future scheduled runs without deleting its configuration. When you enable it again, the schedule resumes with its next occurrence. Occurrences missed while the trigger was disabled aren't run.

### Delete a scheduled trigger

Select **Delete** to permanently remove the scheduled trigger and its schedule.

To stop future scheduled runs without removing the configuration, disable the trigger instead.

## Customize the Overview columns

1. On the **Overview** tab, select **Show/hide columns**.
1. In the **Edit columns** pane, select the columns that you want to display.
1. (Optional) Select **Clear all** or **Select all**.
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

The **Flow** column always displays.

## View upcoming scheduled runs

Select the **Upcoming** tab to view projected scheduled-trigger executions.

Use the following filters to narrow the list:

- **All desktop flows**
- **All scheduled triggers**
- **All connection references**

Available columns:

| Column               | Displayed by default | Description                                                        |
|----------------------|----------------------|--------------------------------------------------------------------|
| Starting             | Yes                  | The projected date and time of the upcoming run.                    |
| Flow                 | Yes                  | The desktop flow that the scheduled trigger runs.                   |
| Scheduled trigger    | Yes                  | The scheduled trigger that initiates the run.                       |
| Trigger details      | Yes                  | A summary of the recurrence configuration.                          |
| Run mode             | Yes                  | The configured attended or unattended run mode.                     |
| Connection reference | Yes                  | The connection reference used for the run.                          |

A recurring scheduled trigger can produce multiple upcoming entries, one for each projected occurrence.

## Manage scheduled desktop flows

In environments where **Scheduled triggers** is available, users assigned the Power Automate *Operator* role can manage desktop-flow schedules, in addition to the schedule owner. They can create, view, update, enable or disable, and delete schedules.

The *Operator* role includes organization-level permissions for the **Flow trigger** and **Flow trigger instance** tables. These permissions apply to the entire environment where the role is assigned, not just to records owned by the operator. 

Managing a schedule is separate from editing a flow. The *Operator* role itself doesn't grant permission to create or modify the underlying desktop flow definition. Other security roles assigned to the user might grant those permissions. 

Users must still meet all scheduled triggers prerequisites, including licensing requirements and access to the resources required to run the flow. Schedule management permissions don't override those requirements or grant access to cloud flow runtime details.

## Restore an environment that contains scheduled triggers

During preview, scheduled triggers don't automatically synchronize when you restore an environment. As a result, triggers might continue running unexpectedly or fail to resume after the restore.

> [!IMPORTANT]
> Before you restore an environment, disable all scheduled triggers in that environment. Re-enabling triggers after the restore doesn't prevent issues caused by leaving them enabled during the restore operation.

After the restore is complete, re-enable only the scheduled triggers that you want to run. If a trigger already appears enabled, disable it and then enable it again to reestablish its schedule.
