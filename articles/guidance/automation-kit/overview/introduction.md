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

![Automation Kit Logo](../media/automation-kit.svg)

The automation kit is a concept and set of tools to accelerate the use and support of Power Automate for desktop for automation projects, by calculating estimated money saved and ROI for each automation project.

This automation kit consists of stages that relate to [HEAT (Holistic Enterprise Automation Techniques)](https://docs.microsoft.com/power-platform/guidance/automation-coe/heat).

The automation kit supports HEAT with the following functional components.

- [Overview of the Automation Center of Excellence kit](#overview-of-the-automation-center-of-excellence-kit)
  - [Introduction](#introduction)
  - [Functional description](#functional-description)
    - [Automation CoE](#automation-coe)
    - [Automation projects](#automation-projects)
    - [Application Lifecycle Management (ALM)](./application-lifecycle-management.md)
    - [Main environment / Satellite environments](environments.md#main-environment--satellite-environments)
    - [Organization structure](#organization-structure)
    - [App roles](./app-roles.md)
  - [Technical description](technical-description.md)
    - [Automation CoE technical description](technical-description.md#automation-technical-description)
    - [Solutions](technical-description.md#solutions)
    - [Power BI dashboard](technical-description.md#power-bi-dashboard)

### Automation CoE

This is a team of experts who support automation, like Robotic Process Automation (RPA), within your organization. They have good knowledge on Power Automate for desktop, set up and maintain the automation kit, and maintain the configuration data such as departments, process categories, goals, and more.

### Automation projects

Employees can submit an idea for an automation project. A business owner is given when an employee submits an automation project. This business owner must approve the automation project before development begins.

There are several fields that the employee must submit they request an automation project. Many of these fields are used to calculate the following items.

- The complexity score
- The money saved

Every automation project maps to a solution and ever solution maps to an environment. It is up to the automation project admins to use the Automation Center Model driven app to map these resources.

The main Power BI dashboard contains a scatter plot of all saved or submitted automation projects. The plot is useful to decide which automation projects are good candidates to develop.

### Organization structure

After automation projects receive approval, they are mapped to environments. After the solution is created or imported into the satellite environment, a CoE admin maps the solution to an automation project.

Data syncs from a satellite environment to the main environment using realtime trigger flows inside of the satellite. Only solutions that have been mapped (metered through the solution manager app) will sync data back to the main satellite environment.


<!-- todo: move to the readme/release notes section. Release Notes (What is new)
===========================


<!-- > [!div class="nextstepaction"]
> [Next step: Core components for Power Automate RPA SAP GUI automation](core-components.md) -->
