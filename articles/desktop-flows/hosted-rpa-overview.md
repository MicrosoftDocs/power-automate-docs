---
title: Introduction to the Power Automate Hosted RPA
description: Overview of the Power Automate Hosted RPA
services: ''
ms.author: kenseongtan
author: kenseongtan
editor: ''
tags: ''
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: overview
ms.date: 05/01/2024
ms.reviewer: matp
contributors:
- DanaMartens
search.audienceType: 
  - flowmaker
  - admin
---
# Introduction to the Power Automate hosted RPA

Microsoft Power Automate supports two hosted robotic process automation (RPA) scenarios that provide developers and Center of Excellence admins a simple way to set up and scale automations:

1. [**Hosted machines**](hosted-machines.md) enabling developers to build or test automation and business users to run automation.

2. [**Hosted machine groups**](hosted-machine-groups.md) can automatically scale workloads to optimize unattended automation in production, delivering improved business process continuity and governance at scale.

:::image type="content" source="media/hosted-rpa-overview/hosted-rpa-features.png" alt-text="Hosted RPA feature for end to end RPA lifecycle.":::

Using Microsoft hosted infrastructure running in Azure, Power Automate hosted RPA empowers you to run RPA quickly and at scale while freeing up resources and reducing costs.

Setting up RPA infrastructure manually is time consuming. It can take days to get machines for automation—from the initial machine request and creation to installation and assignment. Power Automate delivers a consistent setup experience and license for both individual hosted machines and hosted machine groups, making it faster and easier to set up and manage RPA for your organization. Instead of doing all the heavy lifting yourself, anyone with just a few basic parameters can build, test, and run a large-scale automation in minutes. Just give it a name, select the base image and account to be used, and you’re all set!

If you need more advanced automation for specific desktop applications, you can bring your own virtual machine (VM) image through our integration with Azure Compute Gallery. For common scenarios, a Windows image sufficient for web automation is provided by default.

## Hosted machines for attended and unattended automation

[Hosted machines](hosted-machines.md) give developers a quick and simple way to build, test, and run desktop flows without providing or setting up any physical machines.

When testing is complete, the desktop flow can be deployed on a single machine to support individual business users running in both attended and unattended mode. For unattended scenarios that are more robust, you start by building the desktop flow on a hosted machine. Then, it can be assigned to a machine group that distributes and scales the automation workload based on demand.

## Hosted machine groups for unattended automation at scale

### Automatically react to spikes in demand with scalable infrastructure

Planning for variability in RPA utilization is challenging and time-consuming, making it difficult to guarantee response times when speed is necessary. When additional capacity is needed, critical processes are slowed or put on hold waiting for support teams to set up and allocate more machines. In some cases, large pools of machines are allocated to support peak-load processes, resulting in low average machine utilization and higher costs.

[Hosted machine groups](hosted-machine-groups.md) solve this problem by automatically provisioning hosted bots when needed. Bots are virtual machines running in Azure that run your automation flows unattended and can scale to run simultaneously on multiple Windows VMs. When a desktop flow waits in the queue and no bot is available, a new bot is created automatically up to the maximum number of bots determined by the admin. There's no need to set up or register those machines and they can be easily reassigned to different workloads whenever you need them.

You don’t have to worry about whether you have enough machines to run your automations when demand spikes, or whether you underutilized machines adding cost without delivering value to your organization.

### Improve efficiency with dynamic load balancing

Hosted machine groups let you share resources among different automation scenarios. Multiple RPA processes with varying load levels are automatically scaled in and out based on real-time load. The number of bots allocated to the group are automatically assigned across different RPA processes, ensuring available machines are efficiently utilized.

For example, you can have 10 bot capacity shared between two groups—let’s say one for sales and one for finance. If finance requires additional processing capacity while sales workloads are light, the majority of the 10 bot capacity will be assigned to finance. When finance’s processing is complete or returns to normal levels, the bot machines assigned to finance are available again for sales or other hosted machine groups to run their workloads.

## Get started with hosted machines and groups

Learn more about [Hosted machines](hosted-machines.md) and [Hosted machine groups](hosted-machine-groups.md) and see [pricing for hosted process licenses](https://powerautomate.microsoft.com/pricing/).