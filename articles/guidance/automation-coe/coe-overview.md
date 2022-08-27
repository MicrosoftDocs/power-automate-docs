---
title: Overview of the automation CoE setup guidance | Microsoft Docs
description: Overview of the automation CoE setup guidance.
suite: flow
documentationcenter: na
author: kathyos
manager: tapanm
editor: ''
ms.custom: guidance

ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: kathyos
ms.reviewer: deonhe
---

# CoE overview

Introduction
============

Microsoft Power Platform adoption best practices for Automation Centers of Excellence (CoE) provides proven guidance on how to establish, and then scale an Automation CoE in your organization. It consists of best practices, documentation, and tools.

By using these best practices, organizations can better align their business and technical strategies to ensure success. 

Automation CoE members, RPA developers, cloud architects, IT professionals, and business decision makers use this information to achieve their automation adoption goals.

These adoption best practices from Microsoft employees, partners, and customers are a set of tools, guidance, and narratives to help shape your technology, business, and people strategies to get the best business outcomes for your
automation rollout.

## Functional description

The Automation CoE toolkit is a concept and set of tools
to accelerate the usage and support of Power Automate Desktop for automation projects, by calculating estimated money saved and ROI for each automation project.

This Automation CoE Toolkit consists of stages relating to HEAT (Holistic
Enterprise Automation Techniques). The following blog post describes HEAT in
more detail: [https://flow.microsoft.com/nl-nl/blog/heat-holistic-
enterprise-automation-techniques-for-rpa-and-more/](https://flow.microsoft.com/nl-nl/blog/heat-holistic-%20enterprise-automation-techniques-for-rpa-and-more/).

The Automation CoE Toolkit supports HEAT with the following functional
components:

-   Automation CoE

-   Automation projects

-   Application Lifecycle Management (ALM)

-   Main environment / Satellite environments

-   Organization structure

-   App roles

-   Security roles

#### Automation CoE

This is a team of experts who support automation, like Robotic Process
Automation (RPA), within your organization. They have good knowledge on Power
Automate (Desktop), set up/maintain the Automation CoE tool kit, and maintain
the configuration data such as departments, process categories, goals, and more.

#### Automation projects

Employees can submit an idea for an automation project. A business owner is
provided when submitting an automation project. This business owner must approve
the automation project before it can be developed.

Several fields are required to submit an automation project. Many of these
fields are used to calculate:

-   The complexity score

-   The money saved

Every automation project is mapped to a solution, which is mapped to an
environment. It is up to the Automation Project Admins to map these resources
using the Automation Center Model driven app.

The main Power BI dashboard contains a scatter plot of all saved/submitted
automation projects. The plot is useful to decide which automation projects are
good candidates to develop.

#### Application Lifecycle Management (ALM)

Approved Automation Projects are developed in a development environment by one
or more developers. In the concept, one or more automation projects can be part
of the same solution (Automation Solution). More information about solutions can
be found here:

Solutions overview
(<https://docs.microsoft.com/en-us/powerapps/maker/data-platform/solutions-overview>).

Organizations have 3 ways to implement application lifecycle management (ALM):

1.  ALM based on manual actions.

2.  ALM based on automated actions.

3.  ALM based on a combination of (1) and (2).

Manual activities can include:

1.  Exporting the solution.

2.  Importing the solution.

3.  Storing the solution in a source control repository.

4.  Downloading the solution from a source control repository.

Azure DevOps and the Power Platform Build Tools for Azure DevOps
(<https://docs.microsoft.com/en-us/power-platform/alm/devops-build-tools>)
provide a great way to automate manual ALM activities and more. Together with
Power Automate, even a complete set of activities can be orchestrated.

Below, a few possible orchestrations are given:

1.  Example 1 - Clean start

    1.  Get an unmanaged solution from a source control repository.

    2.  Import the unmanaged solution in a development environment.

2.  Example 2 - Commit work

    1.  Export an unmanaged solution from a development environment.

    2.  Store the unmanaged solution in a source control repository.

3.  Example 3 - Create a production version

    1.  Commit work (see previous example)

    2.  Export the managed solution from a development environment.

    3.  Store the managed solution in a source control repository.

4.  Example 4 - Update a testing/production environment

    1.  Get a managed solution from your source control repository.

    2.  Import the managed solution in a testing/production environment.

For organizations who prefer to use GitHub instead of Azure DevOps, there is a
preview version of GitHub Actions for Microsoft Power Platform
(https://docs.microsoft.com/en-us/power-platform/alm/devops-github- actions)
which offers a subset of the Azure DevOps functionalities. [Power Platform Build
Tools webinar and live demo](https://www.youtube.com/watch?v=Qwue8fwetJA)

#### Main environment / Satellite environments

The concept consists of one main environment and can utilize multiple satellite
environments.

A satellite environment is where the automation projects will be developed,
tested and deployed to production. Where the production satellite is setup to
monitor and meter solutions and solution artifacts related to an automation
project. Once a solution is metered, the automation project is monitored based
on the runs (flow sessions) to determine the automation projects estimated money
saved and ROI.

The data from the metered solutions is synced to the main environment near real
time using Power Automate.

#### Organization structure

Automation Projects once approved are mapped to environments, once the solution
is created/imported in the satellite environment, a CoE Admin maps the Solution
to an automation project.

Data is synced from a satellite environment to the main environment using real
time trigger flows inside of the satellite. Only solutions that have been mapped
(metered through the Solution Manager app) will sync data back to main.

#### App roles

| **Role**                | **Description**                                                                                                                                                                                                                                                                                                                              |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Business Process Owner  | Process owners, responsible for approving automation project requests                                                                                                                                                                                                                                                                        |
| CoE Admin               | CoE administrators create/maintain most of the needed automation assets. Depending on your organization, creation/management of certain assets could be the responsibility of other teams. CoE administrators will then become the coordinators for those automation assets. CoE administrator’s setup/maintain the automation CoE tool kit. |
| CoE Owner               | The CoE Owner oversees setting up the Automation CoE and relevant updates/patches that follow                                                                                                                                                                                                                                                |
| Developer               | Makers that develop approved automation projects                                                                                                                                                                                                                                                                                             |
| InfoSec Admin           | Coming soon.                                                                                                                                                                                                                                                                                                                                 |
| IT Infrastructure Admin | Coming soon.                                                                                                                                                                                                                                                                                                                                 |
| Line of Business Admin  | Coming soon.                                                                                                                                                                                                                                                                                                                                 |
| Security Admin          | Coming soon.                                                                                                                                                                                                                                                                                                                                 |
| Tester                  | Coming soon.                                                                                                                                                                                                                                                                                                                                 |

Technical description
---------------------

#### Automation CoE

The automation CoE tool kit supports an automation CoE with:

1.  The canvas app "Automation Project" to support a way to request and submit
    automation projects for approval

2.  The model driven app "Automation Center" to support the creation/maintenance
    of automation assets like master data records, mapping resources,
    environments and assigning roles to employees.

3.  Near real time cloud flows which sync data from satellite environments to
    the main environment using Dataverse tables. Data is also stored locally (in
    the satellite environment) and synced with main near real time.

4.  Power BI dashboard to provide insights and monitor your automation assets.

#### Solutions

The automation CoE tool kit contains two (2) solutions:

-   Main solution

-   Satellite solution

The main solution is deployed in the main environment. The satellite solution is
deployed in a satellite environment. A template solution is meant to contain
useful assets for makers to utilize when developing an automation project.

#### Power BI dashboard

The setup package contains 1 Power BI dashboard:

Main:

The main dashboard connects to the main environment connecting to Dataverse
tables where data from all metered solution artifacts gets synced to.

<!-- todo: move to the readme/release notes section. Release Notes (What is new)
===========================

-   Allow bypass of naming convention for metering ([Read How to use Solution
    Manager](#features-3))

-   DLP Impact Analysis for Desktop Flows – Addition of new components to allow
    analysis of DLP impacts for Desktop flows ([Read DLP Impact
    Analysis](#dlp-impact-analysis-for-desktop-flows))

-   Introduction to RPA CLI for inventory syncing ([See Extend the Automation
    CoE](#how-can-the-rpa-cli-be-used-to-extend-the-automation-coe))

-   Power BI enhancements and fixes to ROI dashboard

-   Bug fixes, performance upgrades

-   Environment’s configuration setup not needed anymore, replaced by Sync flow. -->

Prerequisites 
==============

The following prerequisites are required to install and use the Automation CoE
Toolkit

-   An administrative account, which is called "**Automation CoE Admin**" or
    similar.

The Automation CoE requires access to your tenant's Power Platform environments,
and some Azure resources as well. (Key Vault, App registration).

Therefore, the account you’ve set up “**Automation CoE Admin**” needs the
following:

Roles
-----

-   Microsoft Power Platform service admin, or Dynamics 365 service admin

-   Account must be mail enabled

-   Azure contributor role (For Key Vault and App Registration)

Azure App Registration
----------------------

An Azure App Registration, this will be used for an application user for our
Dataverse Web API, in each of the satellite environments

Azure Key Vault
---------------

Azure Key Vault(s), used to store secrets for the above Azure App
Registration(s). Depending on your requirements. There might be one Key Vault
per satellite environment.

Example:

-   KV-Contoso-Dev

-   KV-Contoso-Test

-   KV-Contoso-Prod

The Automation CoE uses the new [Azure Key Vault secrets environment variable
types](https://docs.microsoft.com/en-us/powerapps/maker/data-platform/EnvironmentVariables#use-azure-key-vault-secrets-preview).

1.  Register the **Microsoft.PowerPlatform** resource provider in your Azure
    subscription. Follow these steps to verify and configure: [Resource
    providers and resource
    types](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-providers-and-types)

2.  Azure Key Vault must have **Get** secret access policy set for the Dataverse
    service principal. Select **Add Access Policy**.

![](media/6f33f896a226966002e2b775bb7f9aa7.png)

1.  In the **Secret permissions** dropdown select **Get**.

2.  Next to **Select principal**, select **None selected** and then search
    for **Dataverse**

3.  Select the Dataverse service principal with
    the **00000007-0000-0000-c000-000000000000** identity

4.  Select **Add**.

![](media/71f100649c194f9d55ade011a8066ce2.png)

1.  Click **Save**. Once added, the access policy should look like this.

![](media/6dc3945bd91634badee8003305c058d1.png)

License requirements
--------------------

-   Microsoft 365 license (E3, E5)

-   Power Automate per user with attended RPA license (non-trial)

-   Power Apps Per User license (non-trial)

-   Power BI Pro license
- 


<!-- todo: -->

<!-- > [!div class="nextstepaction"]
> [Next step: Core components for Power Automate RPA SAP GUI automation](core-components.md) -->
