---
title: Introduction to the Power Automate Azure Virtual Desktop integration starter kit | Microsoft Docs
description: Overivew of the Power Automate Azure Virtual Desktop integration starter kit
services: ''
author: mariosleon
editor: ''
tags: ''
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 10/28/2021
ms.author: marleon
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - admin
---

# Introduction to the Power Automate Azure Virtual Desktop integration starter kit

The Microsoft Power Automate Azure Virtual Desktop (AVD) Integration Starter Kit
is a set of templates that are designed to help orchestrate and scale virtual
machines used to run desktop flows. The kit includes a Power App and multiple
flows to automate the scaling up and down of machines. The assets part of the
starter kit should be seen as a template from which you inherit your individual
solution or can serve as inspiration for implementing your own apps and flows.

You can download the latest version of the Power Automate AVD Starter Kit for the [Github repository](https://github.com/Azure/powerautomate-avd-starter-kit).

>[!IMPORTANT]
>Despite the fact that underlying features and components used to build the kit (such as
Dataverse, admin APIs, and connectors) are fully supported, the kit itself
represents sample implementations of these features. Our customers and community
can use and customize these features to implement admin and governance
capabilities in their organizations.
>
>If you face issues with:
>-   Using the kit: Report your issue at the Github repo [issues
    section](https://github.com/Azure/powerautomate-avd-starter-kit/issues).    Microsoft support won't help you with issues related to this kit, but they
    will help with related, underlying platform and feature issues.
>-   The core features in Microsoft Power Platform: Use your standard channel to
    contact Support.

## Getting started

After following the [instructions to install and configure the starter kit](avd-setup.md), start by launching the **AVD
integration configuration app** and creating a new scaling configuration.
