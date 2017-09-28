---
title: Run flows on a schedule | Microsoft Docs
description: Automate recurring tasks by running flows on a schedule, such as every day or every hour.
services: ''
suite: flow
documentationcenter: na
author: stepsic-microsoft-com
manager: erikre
editor: ''
tags: ''

ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/22/2016
ms.author: stepsic

---
# Run flows on a schedule
Create a flow that performs the same task or tasks, such as sending a report in email, every day, hour, or minute. As an alternative, create a flow that waits a certain number of minutes or until a certain date before performing a task or tasks.

## Prerequisites
* An account on [flow.microsoft.com](https://flow.microsoft.com)

## Create a recurring flow
1. In [flow.microsoft.com](https://flow.microsoft.com), select **My flows** in the top navigation bar.
   
    ![Create a flow from blank](./media/run-tasks-on-a-schedule/create-flow.png)
2. Select **Create from blank**.
   
    ![Create a flow from blank](./media/run-tasks-on-a-schedule/create-from-blank.png)
3. Select **Recurrence** in the box that says **How would you like to start?**
   
    ![Every day](./media/run-tasks-on-a-schedule/add-recurrence.png)
4. In the **Recurrence** dialog box, specify how often you want the flow to run.
   
    For example, specify **Day** under **Frequency** and **2** under **Interval** if you want the flow to run every two days.
   
    ![Recurrence dialog box](./media/run-tasks-on-a-schedule/specify-recurrence.png)
5. Add the action or actions that you want the flow to take, as [Create a flow from scratch](get-started-logic-flow.md) describes.

## Delay a flow
1. In [flow.microsoft.com](https://flow.microsoft.com), select **My flows** in the top navigation bar.
   
    ![Create a flow from blank](./media/run-tasks-on-a-schedule/create-flow.png)
2. Select **Create from blank**.
   
    ![Create a flow from blank](./media/run-tasks-on-a-schedule/create-from-blank.png)
3. Specify an event as [Create a flow from scratch](get-started-logic-flow.md) describes.
4. Select the plus icon, and then select **Add an action**.
   
    ![Option to add an action to a flow](./media/run-tasks-on-a-schedule/add-action.png)
5. In the list of actions, do either of the following:
   
   * Select **Delay**, and then specify a number of minutes,
   * Select **Delay until**, and then specify a date.
     
     ![Option to add an action to a flow](./media/run-tasks-on-a-schedule/add-delay.png)

