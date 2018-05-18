---
title: Learn about Microsoft Flow environments| Microsoft Docs
description: Learn how to use environments to isolate your flows
services: ''
suite: flow
documentationcenter: na
author: sunaysv
manager: anneta
editor: ''
tags: ''

ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 11/27/2017
ms.author: sunayv

---
# Choosing an environment

This article introduces you to Microsoft Flow **environments** in which you can create, and securely isolate your flows, gateways, connections, and other resources.

You'll learn about:

* The features that environments provide.
* Switching between environments.
* How to create a flow in the right environment.

## Environments overview

When you create a flow, you choose an environment to host the flow and the resources the flow uses. You can use separate environments for different scenarios.

## Here are a few scenarios for using environments

Scenario|Recommendation
-----|-----
You want to create a flow that uses a connection to the Microsoft Common Data Service.|Place your flow and the Common Data Service into the same environment. This ensures all the data is isolated within that environment (isolation boundary).
You're creating a flow for your Human Resources department. You want to ensure that only users in your Human Resources department have access to the flow.|Create an environment and add only the HR users to it. Place the flow and any other resources the flow uses into this environment.
There are users in Europe who use a flow to show SharePoint data.|Create an environment in Europe, and then create your flow and the SharePoint connection in it. This Europe environment gives the European users the best performance, since all resources are local to Europe (data locality).

To create environments, you must be a Microsoft Flow administrator. Administrators control who has access to environments. For details on how you can create and manage environments, see the [administer environments](environments-overview-admin.md) topic.

## Switching environments

Microsoft Flow makes it easy to switch between environments. When you switch environments, you see only items that are created in that specific environment; you won't see or have access to items in any other environment.

Here's an example.

You’ve created a flow named *NewEmployee* in the *Human Resources* environment. In [Microsoft Flow](https://flow.microsoft.com), you open the *Sales* environment. The *NewEmployee* flow isn’t listed. To see the *NewEmployee* flow, open the *Human Resources* environment. Remember, the same rules apply to any other items you created in the environment, including connections, gateways, flows, and more.

Follow these steps to switch environments:

1. Sign into [Microsoft Flow](https://flow.microsoft.com).
1. In the top right corner, you see an image that represents your profile.

   ![profile image](./media/environments-overview-maker/default-environment.png)

1. Select the image. A drop-down list displays all the environments available to you. The environment in which you're currently signed in is checked:

   ![list of environments image](./media/environments-overview-maker/all-environments.png)
1. To switch to another environment, select that environment in the list:

   ![select an environment to switch to](./media/environments-overview-maker/select-europe.png)
1. Microsoft Flow switches to the new environment.

## Create flows in the right environment

Before you create a flow, select the environment into which you'll add the flow and its resources.

> [!NOTE]
> If you create a flow in the wrong environment, you'll have to delete it, and then create it in the correct environment.

Consider the following factors when choosing an environment to host your flows:

* You can only create gateways in the default environment. So, if you want to use a gateway to connect your flow to on-premises data, you'll need to use the default environment.
* Microsoft Common Data Service databases are tied to a specific environment. So, if you want to create a flow that uses the Common Data Service, you must create the flow in the environment that hosts the database.
* You'll see all environments in which you can edit resources. However, you'll need to ask an administrator to add you as a maker to all environments in which you want to create flows.

> [!NOTE]
> You'll always be able to create flows in the default environment.

## Next steps

* [Create a flow from a template](get-started-logic-template.md)
* [Create a flow](get-started-logic-flow.md)
* [Environment overview for Administrators](environments-overview-admin.md)