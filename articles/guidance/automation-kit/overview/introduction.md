---
title: Overview of the Automation Kit | Microsoft Docs
description: Overview of the Automation Center of Excellence Kit.
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

# Overview of the Automation Kit

![Automation Kit Logo](../media/automation-kit.svg)

The Automation Kit is set of tools to accelerate the use and support of Power Automate for desktop for automation projects. The kit provides tools that help you manage automation projects and monitor them to estimate money saved and return on investment (ROI).

The Automation Kit conforms to the stages defined in [HEAT (Holistic Enterprise Automation Techniques)](../../heat/overview.md).

The kit is especially useful to an Automation Center of Excellence (CoE) team, a team of experts who support automation within your organization. They have good knowledge on Power Automate for desktop, set up and maintain the Automation Kit, and maintain the configuration data such as departments, process categories, goals, and more.

## Automation Kit components

The Automation Kit supports an automation CoE with the following components.

1. Automation Project: A canvas app that supports requesting automation projects and submitting them for approval.
1. Automation Center: A model-driven app for creating and maintaining automation assets such as master data records, mapping resources and environments, and assigning roles to employees.
1. Automation Solution Manager: <!--??? -->
1. Cloud flows that sync data from satellite environments in near real time to the main environment using Dataverse tables.
1. A Power BI dashboard to provide insights and monitor your automation assets.

The components of the kit are contained in the following two solutions.

- Main solution, deployed in the main environment
- Satellite solution, deployed in each satellite environment

A satellite environment is where the automation projects are developed, tested, and then deployed to production. The production satellite is configured to monitor and meter solutions and solution artifacts for an automation project. 

The data from the metered solutions syncs to the main environment in near real time for monitoring on a dashboard.

<!-- > [!div class="nextstepaction"]
> [Next step: Core components for Power Automate RPA SAP GUI automation](core-components.md) -->
