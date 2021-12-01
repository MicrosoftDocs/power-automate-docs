---
title: Add a condition to a cloud flow | Microsoft Docs
description: Specify that a cloud flow performs one or more tasks only if a condition is true.
services: ''
suite: flow
documentationcenter: na
author: msftman
manager: kvivek
editor: ''
tags: ''
ms.service: power-automate
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/08/2020
ms.author: deonhe
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Add a condition to a cloud flow


Use a **Condition** to specify that a cloud flow performs one or more tasks only if a condition is true or false. For example, you can use a **Condition** that indicates that you'll get an email only if a tweet that contains a keyword is retweeted at least 10 times.

Check out the following video tutorial to learn more about conditions.

>[!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RWKUx0]
## Prerequisites

* [Create a cloud flow](get-started-logic-template.md) from a template - this tutorial [uses this template](https://flow.microsoft.com/galleries/public/templates/e78571e5c70e4806a18eeacba5a897c8/) as the example

## Add a condition

1. In [Power Automate](https://flow.microsoft.com), select **My flows**.

    You might need to sign in if you're not already signed in.

1. Select one of the flows from **My flows**, and then select **More commands** (the three dots).

   ![Select edit.](./media/add-condition/select-edit.png)

    This tutorial uses an example with a Twitter trigger and a SharePoint action.

1. Select **Edit**.

1. Under the last action, select **New step** > **Condition**.

1. On the **Condition** card, select an empty area in box on the left.

    The **Dynamic content** list opens.

1. Select the **Retweet count** parameter to add it to the box.

1. In the box in the middle of the **Condition** card, select **is greater than or equal to**.

1. In the box on the right, enter **10**.

    ![The OBJECT NAME box with a parameter in it.](./media/add-condition/specify-condition.png)

    Now that you've configured the condition, continue with the following steps to send an email if the **Retweet count** is more than 10.

1. Select **Add an action** on the **If yes** send of the condition. 
1. Enter **Send an email** into the search box, and then select **Send an email (V2)**.

   ![Search to send an email.](./media/add-condition/if-yes-condition.png)

1. Configure the **Send an email (V2)** card to your liking, indicating the contents of the email that the flow sends if the **Retweet count** is greater than 10.

   You can also configure the **If no** side of the condition if you'd like to take an when the **Retweet count** is less than 10.

1. Save the flow.

>[!TIP]
>You can create complex conditions by using the **Add** button on the condition card.

![Add complex conditions.](./media/add-condition/add-complex-condition.png)

Learn about all the available [expressions](/azure/logic-apps/logic-apps-workflow-definition-language).

## Next steps

Learn how to [use expressions](use-expressions-in-conditions.md) in conditions in advanced mode.


[!INCLUDE[footer-include](includes/footer-banner.md)]