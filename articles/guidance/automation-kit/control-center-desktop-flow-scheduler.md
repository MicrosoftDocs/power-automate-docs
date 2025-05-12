---
title: Control Center desktop flow scheduler
description: Learn how to use control center desktop flow scheduler.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
editor: ''
ms.custom: guidance
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/04/2023
ms.author: macarrer
ms.reviewer: angieandrews
---

# Control Center desktop flow scheduler

In the Automation Kit, the Control Center offers comprehensive desktop flow scheduling capabilities, allowing users to check the Power Automate Desktop flows that are scheduled for execution triggered by a recurring Power Automate Cloud Flow. This scheduling feature provides users with the option to view the overall status of scheduled flows and restart either the cloud flow or desktop flow.

## Features

The scheduler page of the control center provides the following functionality:

- View the schedule of recurring Power Automate Cloud flows contained within a solution that call a Power Automate Desktop flow.
- A schedule view by day
- View the status of scheduled flows yet to start, succeeded or failed
- Filter by machine or cloud flow status
- Calendar view by Month, Week or Day
- Run the desktop or cloud flow now
- Open the Power Automate portal desktop flow run monitoring page for deeper analysis

## Cloud flows

As noted only cloud flows that are included as part of a solution. The recent [https://powerautomate.microsoft.com/blog/more-manageable-cloud-flows-with-dataverse-solutions-by-default/](https://powerautomate.microsoft.com/vi-vn/blog/more-manageable-cloud-flows-with-dataverse-solutions-by-default/) includes information on how to use the new preview of "Dataverse solutions by default" to help ensure that cloud flows are included in solutions. Using this feature can assist users in ensuring the scheduled cloud flows that are created are visible in the scheduler.

## Calendar views

## Day, week, and month views

:::image type="content" source="./media/control-center-desktop-flow-scheduler-calendar.png" alt-text="Screenshot of Scheduler Calendar view with month selected.":::

The day, week, month views display information on Desktop Cloud flow runs that are color coded as follows:

- Green indicates successful run

- Red indicates failed run

- Blue indicates a scheduled future run.

The status and run information is available with long touch or hover mouse on the event.

### Schedule

:::image type="content" source="./media/control-center-desktop-flow-scheduler.png" alt-text="Screenshot of Automation Kit - Control Center Desktop Flow Scheduler.":::

The schedule view includes a set of cloud flows based on time from the current time and future scheduled flows over the next days.

## Run Now

:::image type="content" source="./media/control-center-desktop-flow-scheduler-run-now.png" alt-text="Screenshot of Automation Kit - Control Center Desktop Flow Scheduler run now dialog.":::

The current version of Run Now executes the selected Power Automate desktop flow. It's assumed that there's no parameters required to execute the desktop flow.

## Open Grid View

:::image type="content" source="./media/control-center-desktop-flow-scheduler-open-grid-view.png" alt-text="Screenshot of new Button 'Open Grid View' on home page to navigate to desktop flows runs page in Power Automate portal.":::

Users can navigate to desktop flows runs page in power automate portal from our Control Center Home page.

## Security

To see scheduled desktop flows, the following must be set up:

1. The Cloud flow and desktop flow must be part of a solution
1. The user be an owner or have the had the flow shared with them
1. Belong to a Security role like the **System Customizer** to see all flows in the environment

## Error messages

Possible error messages that could occur when executing run flow.

### Error message: "InvalidArgument - Cannot find a valid connection associated with the provided connection reference."

#### Description

This error message typically indicates that there's an issue with the connection reference provided in the code or configuration. The system can't locate a valid connection associated with the reference, which prevents it from executing the requested action.

#### Causes

There are several potential causes for this error message, including:

- Incorrect or invalid connection reference: The provided connection reference may be invalid or incorrect, which can cause the system to fail to locate a valid connection associated with it.

- Connection deleted or changed: If the connection used in the code or configuration has been deleted or modified, it can cause the system to fail to locate a valid connection associated with the reference.

- Permissions issue: The user account executing the code or configuration may not have the necessary permissions to access the connection or the resources associated with it.

#### Resolution

To resolve this issue, you can take the following steps:

- Verify the connection reference: Check the connection reference provided in the code or configuration and ensure that it's valid and correct.

- Delete existing connections and recreate: When the Flow Checker warns that a connection reference hasn't been used, you can use the flow checker to delete existing connections. Once the connections are deleted, you can recreate connection references to the Machine or Machine group to enable the flow to be run.

## Notes

For the current release, the following notes apply:

1. Only Power Automate Desktop and Power Automate solutions contained within a solution are displayed.
1. At least one Power Automate Desktop has been registered and executed.

