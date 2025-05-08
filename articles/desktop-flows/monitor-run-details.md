---
title: Monitor run details
description: Monitor desktop flow run details in Power Automate to understand performance, status, and metadata.
services: ''
suite: flow
documentationcenter: na
author: quseleba
editor: ''
tags: ''
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/11/2025
ms.author: quseleba
ms.reviewer: dmartens
contributors:
- DanaMartens
- rpapostolis
search.audienceType: 
- flowmaker
- flowadmin
---

# Monitor run details

From this page, you can view all the details of one of your desktop flow runs for the current environment.
The information provided in this page can help you to understand better how your flows are running, what went good or bad, and all the useful related metadata (owner, inputs, and others).

You can access this page:

- from the monitor section in the left nav of Power Automate
- from Desktop flow activity: in last runs pivot by selecting one run from the desktop flows runs card.
- from Desktop flow runs

## Run details

The run details card displays all the parameters related to your run.

  :::image type="content" source="media/monitor-run-details/run-details-card.png" alt-text="Screenshot of the run details card.":::

- **Parent cloud flow run**: the name of the cloud flow that contains the executed desktop flow. The link redirects to the run details page of the parent cloud flow (for attended and unattended runs). If the run mode is local attended (flow triggered from Power Automate for desktop), the field remains empty.
- **Parent desktop flow run**: if there's no parent desktop flow, the field remains empty. The link redirects to the run details page of the parent desktop flow.
- **Start**: when the desktop flow action is requested.
- **Duration**: the duration of the desktop flow runs includes steps where Power Automate is trying to find the machine to target (it also includes the period in queue when all the machines are already busy)
- **Status**: displays the result of the desktop flow runs. Result can be succeeded, failed, canceled, skipped.
- **Target machine**: this provides you with the information about the registered machine that is selected to run the desktop flow in attended or unattended mode. If you're running with local attended mode, you don’t see machine information.
- **Target machine group**: when a machine is part of a group or the flow is run on a hosted group, you see the name of group displayed in this section. Link redirects you to the details page of the group.
- **Run mode**: can be attended or unattended when the flow is triggered from the cloud, local attended when the flow is triggered manually from Power Automate for desktop.
- **Flow inputs and outputs**: when a desktop flow is using inputs or provides outputs, you can see the details of both inputs and outputs by clicking on See {inputs/outputs} details.

    > [!NOTE]
    >
    > When inputs / outputs are secure inputs / outputs, you won't see the value in the details but only {}.
    > Inputs and outputs are also viewable from the Dataverse `Flow session` table.
  
- **Version**: the version of Power Automate for desktop agent used to run the flow.
- **Action log version**: indicates which [desktop flow log version](./configure-desktop-flow-logs.md#configure-desktop-flow-action-log-version) is used for this run.
- **Expiration date**: refers to the date and time when action logs based on [desktop flow logs V2](./configure-desktop-flow-logs.md#configure-desktop-flow-action-log-version) start to be automatically deleted.
- **Machine credential user**: indicates which machine username is used to connect and run the desktop on the machine.

## Run status

The run status is a timeline that allows to understand how works a desktop flow run from request to finalization. Running a desktop flow from a cloud flow (attended or unattended) has previous steps before being executed on your machine, the timeline describes these different steps.

It might be critical for your orchestration to identify if a step took too much time or if a desktop flow always fails during the same step.

  :::image type="content" source="media/monitor-run-details/run-details-timeline.png" alt-text="Screenshot of the run details timeline.":::

## Progressive action logging

> [!NOTE]
>
> - This feature is only available when [desktop flow logs V2](./configure-desktop-flow-logs.md#configure-desktop-flow-action-log-version) is configured in your environment.
> - You need Power Automate desktop version 2.52 or higher installed to use progressive logging.

With [desktop flow logs V2](./configure-desktop-flow-logs.md#configure-desktop-flow-action-log-version) enabled, you receive near real-time updates of actions as your desktop flow runs. This feature might be essential for long-running flows that need frequent action status update monitoring throughout the flow's execution.

:::image type="content" source="media/monitor-run-details/progressive-desktop-flow-logging.png" alt-text="Screenshot of progressive logging feature showing action logs as flow is running." lightbox="media/monitor-run-details/progressive-desktop-flow-logging.png":::

## Actions details

This card allows you to see information and status for each action of your desktop flow:

- **Start**: timestamp when the action started.
- **Subflow**: your flow can be composed of one or several subflows. By default, your actions are in the main subflow. This information helps you to quickly identify in which subflows the action is to fix potential errors.
- **Action index**: in the desktop flow script, each action is linked to an action index (this corresponds to the number of the line).
- **Action name**
- **Duration**
- **Log level**: indicates the severity level (Info/Warning/Error) of the logged action. The only action that is associated with a log level is the **Log message** action. For any other logged action, the column remains empty.
- **Status**: this column gives you for each action the result of its run.

By default, the actions are sorted from the latest to the earliest. If you don’t see all the action in the card, select see all to view the full list of action details.

## View queue events

The queue event list provides a detailed overview of lifecycle events for desktop flow runs. It includes the status and progress of each flow run, along with corresponding machine queue events, enabling users to monitor and understand every stage of the process.

  :::image type="content" source="media/monitor-run-details/run-details-queue-events.png" alt-text="Screenshot of the run details page with the view queue events hyperlink.":::
  
> [!NOTE]
>
> Queue events are only available for desktop flows that were launched from a cloud flow.
  
The following table lists the various queue events supported by this feature.

### Supported Queue Events

| Event text                                                                                                 | Event details                                                                                                        |
|-------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| A flow run is queued and is ready to run                                                        | The desktop flow service received a desktop flow run, and it's now in queue to be executed.          |
| The flow run is starting on machine {0}                                               | The desktop flow service starts executing the desktop flow run now.                                        |
| Machine {0} is returning error {1}, preventing it from accepting the run request             | The desktop flow service selected a machine to run the desktop flow, but the machine was unable to accept the request due to a specific error. |
| Before machine {0} can start the run, it needs to complete some preliminary checks               | The desktop flow service selected a machine to run the desktop flow. The machine must still run preliminary checks before execution can start. |
| This run's priority has changed, which might affect its position in the queue   | While still in queue, the run's priority changed. This might affect its position in the queue.         |
| This run's priority has changed, which might affect its position in the queue    | While still in queue, the run's priority was changed. This change might affect its position in the queue.         |
| This flow run was moved to the front of the queue and will run next  | The run moved to the front of the queue. The service executes it next as soon as an available host is found.|
| This flow run was moved back to its previous spot in the queue    | A run was previously moved to the front of the queue, but that action was undone. The run goes back to its previous position. |
| This flow run completed successfully                                                            | The run finished executing without any error.                                                              |
| This flow run completed on machine {1}, but with error {0}                               | The run finished executing, but encountered an error.                                                     |

Is there anything else you need help with?

### Queue event detail panel

  :::image type="content" source="media/monitor-run-details/run-details-queue-event-details.png" alt-text="Screenshot of the queue event details panel listing queue events.":::

## Storage location for queue events

By default, queue event data is stored for seven days (10,080 minutes). If you want to modify the duration of how long the queue events can be stored, you can update the [TTL for new desktop flow queue log records in the Organization table](/power-apps/developer/data-platform/reference/entities/organization#BKMK_DesktopFlowQueueLogsTtlInMinutes) value on the Organization table in an environment backed with Dataverse. Depending on your environment’s storage capacity, you can adjust the length of storage for these queue event records.

The [DesktopFlowQueueLogsTtlInMinutes](/power-apps/developer/data-platform/reference/entities/organization#BKMK_DesktopFlowQueueLogsTtlInMinutes) value on the Organization table can be changed in the [Power Apps table browser](/power-apps/maker/data-platform/create-edit-entities-portal?tabs=excel#view-tables) or using the [Dataverse Web API](https://github.com/MicrosoftDocs/power-automate-docs-pr/assets/13593424/25bd0eda-0dde-4378-9793-7090fbca5916).

## Change queue event data retention time frames

If the [DesktopFlowQueueLogsTtlInMinutes](/power-apps/developer/data-platform/reference/entities/organization#BKMK_DesktopFlowQueueLogsTtlInMinutes) value in the Organization table is changed, then the lifetime of any new **[FlowLog](/power-apps/developer/data-platform/reference/entities/flowlog)** record of type queue event is retained for that length of time. Lowering the value can reduce the number of [FlowLog](/power-apps/developer/data-platform/reference/entities/flowlog) records, and storage used, over time.

## Time To Live (TTL) value calculation examples

Time to live (TTL) values for [Organization.DesktopFlowQueueLogsTtlInMinutes](/power-apps/developer/data-platform/reference/entities/organization#BKMK_DesktopFlowQueueLogsTtlInMinutes) and [FlowLog.TTLInSeconds](/power-apps/developer/data-platform/reference/entities/flowlog#BKMK_TTLInSeconds) are specified in minutes. The following table contains common values that can be used in the Organization and FlowLog tables.

|Days  |Minutes  |
|---------|---------|
|1 day |1,140 minutes|
|3 days |4,320 minutes|
|7 days |10,080 minutes|
|14 days |20,160 minutes|
|28 days |40,320 minutes|
|60 days |68,400 minutes|
