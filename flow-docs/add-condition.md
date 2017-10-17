---
title: Add a condition to a flow | Microsoft Docs
description: Specify that a flow performs one or more tasks only if a condition is true.
services: ''
suite: flow
documentationcenter: na
author: stepsic-microsoft-com
manager: anneta
editor: ''
tags: ''

ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/17/2017
ms.author: stepsic

---
# Add a condition to a flow

Specify that a flow performs one or more tasks only if a condition is true. For example, specify that you'll get an email only if a tweet that contains a keyword is retweeted at least 10 times.

## Prerequisites

* [Create a flow](get-started-logic-template.md) from a template - this tutorial [uses this template](https://flow.microsoft.com/galleries/public/templates/e78571e5c70e4806a18eeacba5a897c8/) as the example

## Add a condition

1. In [Microsoft Flow](https://flow.microsoft.com), select **My flows** in the top navigation bar.

    You might need to sign in if you're not already signed in.

1. In the list of flows, select one of the flows that you've created.

    This tutorial uses an example with a Twitter trigger and a SharePoint action.

1. Select **Edit flow**.

1. Under the last action, select **New step**.

1. Select **Add a condition**.

    ![Condition button](./media/add-condition/add-condition.png)

1. On the **Condition** card, select an empty area in box on the left.

    The **Dynamic content** list opens.

1. Select the **Retweet count** parameter to add it to the box.

1. In the box in the middle of the **Condition** card, select **is greater than or equal to**.

1. In the box on the right, enter **10**.

    ![The OBJECT NAME box with a parameter in it](./media/add-condition/specify-condition.png)

1. Select the header of the action you want to use inside the condition (such as **Create item**) and drag it underneath the text that reads **If yes**.

    When you release the cursor, the action moves into that box.

    ![Drag action](./media/add-condition/drag-action.png)

1. Configure the action as necessary.

1. Save the flow.

## Edit in advanced mode

You can also select **Edit in advanced mode** to write more advanced conditions. You can use any expression from the *Workflow definition language* in advanced mode. Learn about all available [expressions](https://msdn.microsoft.com/library/azure/mt643789.aspx).

## Next steps

Learn how to [use expressions](use-expressions-in-conditions.md) in conditions in advanced mode.
