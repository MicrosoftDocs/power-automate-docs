---
title: Tips for using Automation Kit for Power Platform with ALM | Microsoft Docs
description: Tips for using Automation Kit for Power Platform with ALM.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
editor: ''
ms.custom: guidance

ms.topic: best-practice
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: grarchib
ms.reviewer: angieandrews
---

# Tips for using Automation Kit for Power Platform with ALM

One or more developers create approved automation projects in a development environment. One or more automation projects can be part of the same automation solution. More information about solutions can be found here: [Solutions overview](/powerapps/maker/data-platform/solutions-overview).

Organizations can use any of the following three ways to implement application lifecycle management (ALM).

1. ALM based on manual actions.
1. ALM based on automated actions.
1. ALM based on a combination of manual actions and automated actions.

## Manual Actions

Manual activities can include the following.

1. Export the solution.
1. Import the solution.
1. Store the solution in a source control repository.
1. Download the solution from a source control repository.

## Automated Actions

Azure DevOps and the [Microsoft Power Platform Build Tools for Azure DevOps](/power-platform/alm/devops-build-tools) provide a great way to automate manual ALM activities and more. Together with Power Automate, you can orchestrate a complete set of activities.

Here are a few orchestrations for you to consider.

1. Example 1 - Clean start

    1. Get an unmanaged solution from a source control repository.

    1. Import the unmanaged solution into a development environment.

2. Example 2 - Commit work

    1. Export an unmanaged solution from a development environment.

    1. Store the unmanaged solution in a source control repository.

3. Example 3 - Create a production version

    1. Commit work (see the previous example)

    1. Export the managed solution from a development environment.

    1. Store the managed solution in a source control repository.

4. Example 4 - Update a testing or production environment

    1. Get a managed solution from your source control repository.

    1. Import the managed solution into a testing or production environment.

For organizations that prefer to use GitHub instead of Azure DevOps, there is a preview version of [GitHub Actions for Microsoft Power Platform](/power-platform/alm/devops-github-actions) which offers a subset of the Azure DevOps functionalities. [Power Platform Build Tools webinar and live demo](https://www.youtube.com/watch?v=Qwue8fwetJA).

The [ALM Accelerator for Power Platform](https://aka.ms/aa4pp) includes a set of prebuilt tools and templates to accelerate your ability to build and deploy automation solutions. 
