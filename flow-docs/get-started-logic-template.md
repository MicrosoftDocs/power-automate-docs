---
title: Create a flow from a template | Microsoft Docs
description: Create a flow from any of several built-in templates.
services: ''
suite: flow
documentationcenter: na
author: aftowen
manager: anneta
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 02/07/2017
ms.author: anneta
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Create a flow from a template in Microsoft Flow
Create a flow from one of many built-in templates that can, for example, send you a Slack message when your manager sends you an email in Office 365.

**Note:** [Create a flow from scratch](get-started-logic-flow.md) if you already have a process in mind and can't find a template for it.

**Prerequisites**

* An account on [flow.microsoft.com](https://flow.microsoft.com)
* A Slack account
* Office 365 credentials

## Choose a template
<iframe width="560" height="315" src="https://www.youtube.com/embed/ZJK8cYdjAic?list=PL8nfc9haGeb55I9wL9QnWyHp3ctU2_ThF" frameborder="0" allowfullscreen></iframe>

1. In [flow.microsoft.com](https://flow.microsoft.com), select **Templates** in the top navigation bar.
2. In the search bar, type **Slack**, and then select the search icon.
3. You'll see only templates related to Slack, so you can now select **Send a message on Slack when my manager emails me**.
   
    ![New option in the left navigation bar](./media/get-started-logic-template/select-template.png)
4. Confirm that this template will do what you want, and then select **Use this template**.
5. If you aren't signed into Office or Slack, select **Sign in** and then follow the prompts.
   
    ![List of connections that the template requires](./media/get-started-logic-template/confirm-connections.png)
6. After you confirm your connections, select **Continue**.
   
    Your flow appears, showing each action with an orange title bar.
   
    ![Default events and actions from template](./media/get-started-logic-template/template-default.png)

## Customize your flow
1. Select the title bar for an event to expand it, and then customize it (for example, by specifying a filter on the email that interests you).
2. Actions that require input from you will automatically be expanded.
   
    For example, the **Post message** action is expanded because you need to enter a channel, such as your *\@username*. You can also customize the message content. By default, the message will contain just the subject, but you can include other information.
   
    ![Specify channel for slack](./media/get-started-logic-template/specify-keyword.png)
3. Near the top of the screen, specify a name for your flow, and then select **Create flow**.
4. Finally, if you're happy with your flow, select **Done**.
   
    ![Done button](./media/get-started-logic-template/done.png)

Now, when your manager sends you an email, you'll receive a Slack message that contains the information that you specified.

## Next steps
* [Watch your flow in action](see-a-flow-run.md)
* [Publish your own template](publish-a-template.md)
* [Use a template for the Common Data Service](common-data-model-intro.md)
* [Get started with team flows](create-team-flows.md) and invite others to collaborate with you to design flows.

