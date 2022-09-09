---
title: Overview of the Automation Center of Excellence kit | Microsoft Docs
description: Overview of the Automation Center of Excellence kit.
suite: flow
documentationcenter: na
author: grarchib
manager: marcsc
editor: ''
ms.custom: guidance

ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: grarchib
ms.reviewer: deonhe
---

# Overview of the Automation Center of Excellence kit

## Introduction

Microsoft Power Platform adoption best practices for Automation Centers of Excellence (CoE) provides proven guidance on how to establish, and then scale an Automation CoE in your organization. It consists of best practices, documentation, and tools.

By using these best practices, organizations can better align their business and technical strategies to ensure success.

Automation CoE members, RPA developers, cloud architects, IT professionals, and business decision makers use this information to achieve their automation adoption goals.

These adoption best practices from Microsoft employees, partners, and customers are a set of tools, guidance, and narratives to help shape your technology, business, and people strategies to get the best business outcomes for your automation rollout.

## Functional description

![Automation Kit Logo](media/automation-kit.svg)

The automation kit is a concept and set of tools to accelerate the use and support of Power Automate for desktop for automation projects, by calculating estimated money saved and ROI for each automation project.

This automation kit consists of stages that relate to [HEAT (Holistic Enterprise Automation Techniques)](../heat/overview.md).

The automation kit supports HEAT with the following functional components.

- [Overview of the Automation Center of Excellence kit](#overview-of-the-automation-center-of-excellence-kit)
  - [Introduction](#introduction)
  - [Functional description](#functional-description)
    - [Automation CoE](#automation-coe)
    - [Automation projects](#automation-projects)
    - [Application Lifecycle Management (ALM)](#application-lifecycle-management-alm)
    - [Main environment / Satellite environments](#main-environment--satellite-environments)
    - [Organization structure](#organization-structure)
    - [App roles](#app-roles)
  - [Technical description](#technical-description)
    - [Automation CoE technical description](#automation-coe-technical-description)
    - [Solutions](#solutions)
    - [Power BI dashboard](#power-bi-dashboard)

### Automation CoE

This is a team of experts who support automation, like Robotic Process Automation (RPA), within your organization. They have good knowledge on Power Automate for desktop, set up and maintain the automation kit, and maintain the configuration data such as departments, process categories, goals, and more.

### Automation projects

Employees can submit an idea for an automation project. A business owner is given when an employee submits an automation project. This business owner must approve the automation project before development begins.

There are several fields that the employee must submit they request an automation project. Many of these fields are used to calculate the following items.

- The complexity score
- The money saved

Every automation project maps to a solution and ever solution maps to an environment. It is up to the automation project admins to use the Automation Center Model driven app to map these resources.

The main Power BI dashboard contains a scatter plot of all saved or submitted automation projects. The plot is useful to decide which automation projects are good candidates to develop.

### Application Lifecycle Management (ALM)

One or more developers create approved automation projects in a development environment. One or more automation projects can be part of the same automation solution. More information about solutions can
be found here: [Solutions overview](/powerapps/maker/data-platform/solutions-overview).

Organizations can use any of the following three ways to implement application lifecycle management (ALM).

1. ALM based on manual actions.
1. ALM based on automated actions.
1. ALM based on a combination of manual actions and automated actions.

Manual activities can include the following.

1. Export the solution.
1. Import the solution.
1. Store the solution in a source control repository.
1. Download the solution from a source control repository.

Azure DevOps and the [Microsoft Power Platform Build Tools for Azure DevOps](/power-platform/alm/devops-build-tools) provide a great way to automate manual ALM activities and more. Together with Power Automate, you can orchestrated a complete set of activities.

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

For organizations that prefer to use GitHub instead of Azure DevOps, there is a preview version of [GitHub Actions for Microsoft Power Platform](/power-platform/alm/devops-github-actions) which offers a subset of the Azure DevOps functionalities. [Power Platform Build Tools webinar and live demo](https://www.youtube.com/watch?v=Qwue8fwetJA). <!--todo: the video quality is poor. unable to see anything. is it just my pc?-->

### Main environment / Satellite environments

The concept consists of one main environment and it can utilize multiple satellite environments.

A satellite environment is where the automation projects are developed, tested, and then deployed to production. Here, the production satellite is configured to monitor and meter solutions and solution artifacts that are related to an automation project. After a solution is metered, the automation project is monitored based on the runs (flow sessions) to determine the automation projects estimated money saved and ROI.

The data from the metered solutions syncs to the main environment in near realtime using Power Automate.

### Organization structure

After automation projects receive approval, they are mapped to environments. After the solution is created or imported into the satellite environment, a CoE admin maps the solution to an automation project.

Data syncs from a satellite environment to the main environment using realtime trigger flows inside of the satellite. Only solutions that have been mapped (metered through the solution manager app) will sync data back to the main satellite environment.

### App roles

| **Role**                | **Description**                                                                                                                                                                                                                                                                                                                              |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Process Owner  | Process owners, responsible for approving automation project requests                                                                                                                                                                                                                                                                        |
| CoE admin               | CoE admins create and maintain most of the automation assets. Depending on your organization, creation and management of certain assets could be the responsibility of other teams. CoE admins will then become the coordinators for those automation assets. CoE admins setup and maintain the automation kit. |
| CoE owner               | The CoE owner oversees setting up the automation CoE and relevant updates or patches that follow.                                                                                                                                                                                                                                                |
| Developer               | Makers who develop approved automation projects.                                                                                                                                                                                                                                                                                             |
| InfoSec admin           | Coming soon.                                                                                                                                                                                                                                                                                                                                 |
| IT infrastructure admin | Coming soon.                                                                                                                                                                                                                                                                                                                                 |
| Line of business admin  | Coming soon.                                                                                                                                                                                                                                                                                                                                 |
| Security admin          | Coming soon.                                                                                                                                                                                                                                                                                                                                 |
| Tester                  | Coming soon.                                                                                                                                                                                                                                                                                                                                 |

## Technical description

### Automation CoE technical description

The automation kit supports an automation CoE with the following artifacts.

1. The canvas app "Automation Project" to support a way to request and submit automation projects for approval.
1. The model driven app "Automation Center" to support the creation and maintenance of automation assets like master data records, mapping resources, environments and assigning roles to employees.
1. Near realtime cloud flows that sync data from satellite environments to the main environment using Dataverse tables. Data is also stored locally (in the satellite environment) and synced with main in near realtime.
1. Power BI dashboard to provide insights and monitor your automation assets.

### Solutions

The automation kit contains the following two solutions.

- Main solution.
- Satellite solution.

The main solution is deployed in the main environment. The satellite solution is deployed in a satellite environment. A template solution is meant to contain useful assets for makers to utilize when they're developing an automation project.

### Power BI dashboard

The setup package contains one (main) Power BI dashboard.

The main dashboard connects to the main environment connecting to Dataverse tables into which data from all metered solution artifacts gets synced.

<!-- todo: move to the readme/release notes section. Release Notes (What is new)
===========================

- Allow bypass of naming convention for metering ([Read How to use Solution
    Manager](#features-3))

- DLP Impact Analysis for Desktop Flows – Addition of new components to allow
    analysis of DLP impacts for Desktop flows ([Read DLP Impact
    Analysis](#dlp-impact-analysis-for-desktop-flows))

- Introduction to RPA CLI for inventory syncing ([See Extend the Automation
    CoE](#how-can-the-rpa-cli-be-used-to-extend-the-automation-kit))

- Power BI enhancements and fixes to ROI dashboard

- Bug fixes, performance upgrades

- Environment’s configuration setup not needed anymore, replaced by Sync flow. -->

<!-- > [!div class="nextstepaction"]
> [Next step: Core components for Power Automate RPA SAP GUI automation](core-components.md) -->
