---
title: Frequently asked questions
description: Frequently asked questions for hosted RPALearn how to create and use hosted machine groups to distribute your automation workload.
author: kenseongtan
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 07/04/2024
ms.author: kenseongtan
ms.reviewer: 
contributors:
---

# Hosted machine group

Hosted machine group allows you to run unattended automation at scale without providing or setting up any machines. You can create hosted machine groups like any other machine group, and Power Automate will automatically provision the machines based on the specified configuration.

Desktop flows assigned to a hosted machine group get queued to it when triggered to run. Then, like for any machine group, the next desktop flow in the queue runs when a bot in the group is available. To find more information about queues, go to [Monitor desktop flow queues](monitor-desktop-flow-queues.md).

Here are some of the key features of hosted machine group:

- Run unattended desktop flows at scale.
- Autoscale the number of bots in your hosted machine group based on current workloads.
- Load balance bots across all hosted machine groups in an environment.
- Work or school account integration: Enables access to resources that are part of the business plan linked to your organization, such as Office, SharePoint, and Azure.
- Vanilla or Custom VM images: Use a vanilla VM image provided by Microsoft or personalize your hosted machine group by providing your own Windows image directly from your Azure Compute Gallery.

## Licensing requirements

To use hosted machine group, you need the following licensing option:

Use your existing **Power Automate Premium** plan (formerly, Power Automate per user plan with attended RPA), or **Power Automate Process** plan (formerly, Power Automate per flow plan) and the **Power Automate hosted RPA add-on**.

You need to assign to your environment as many add-ons as the number of hosted bots you want 
