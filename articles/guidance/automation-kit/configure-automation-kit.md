---
title: Configure Automation Kit | Microsoft Docs
description: Configure Automation Kit.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
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

# Configure Automation Kit

## Define configuration data

Follow these steps to configure the Automation Kit for your organization.

1. Sign in with your Automation CoE Admin account, and then navigate to the main environment.
1. Open the **Automation Center** app.

   You will use the automation center app to configure how the Automation Kit operates.

There are a few things we need to setup/configure when you first import the kit.

First, we are going to add an automation goal. Follow these steps to add an automation goal.

1. Inside the Automation Center, select the **Corporate Goals** tab.
1. Select **New**.
1. Fill in the required fields. Use the following sample data as a guide.

    | **Field**                | **Value**                       |
    |--------------------------|---------------------------------|
    | Goal Name                | Cost Savings through Automation |
    | Period From              | 11/1/2021                       |
    | Period To                | 11/1/2022                       |
    | Target Efficiency Gain % | 20                              |
    | Target Total Savings     | 50000                           |

1. Select **Save & Close**.

Follow the steps in the following three sections to complete the configuration of the Automation Kit.

1. [General configuration](#general-configuration) - Configuration that's related to resources and processes.
2. [ROI calculation](#roi-calculations) - Configuration that's used as a scoring metric to better determine the estimated ROI and complexity of an automation project.
3. [Console configuration](#console-configuration) - Info that pertains to the Automation Kit apps. This configuration is used to build a console where users can launch the related apps.

### General configuration

Select **"Automation Center"** in the bottom navigation bar, and then switch to **"Setup"**.

#### Environments

1. select a **Satellite Environment** on the **Environment** tab.
2. Change **Is Satellite Environment** to **Yes**.
3. Select **Save & Close**.
4. Repeat the previous three steps for all your **Satellite environments** (DEV, TEST, PROD, etc.).

   ![Screenshot of satellite environments](media/07a8a970def5d0e7a33b226305b05c7d.png)

#### Departments

1. Select **New** on the department tab.
2. Create as many departments as your organization needs. Here is a sample of the departments that an organization may need.

- Accounting
- Enterprise Integration
- Finance
- Human Resources
- Information Technology
- Logistics
- Operational Change Management
- Purchasing

#### Process categories

1. Select **New** on the process categories tab.
2. Create top level categories that will have child categories (subcategories).
    Here is a sample of the categories that an organization may need.

- Artificial Intelligence
- Claims
- Invoicing
- Legacy System

#### Process sub-categories

Define the sub categories that relate in some way.

1. Select **New Process Sub Category** and define the sub-categories as your organization needs. Here are some samples you can use as a guide.

1. Artificial Intelligence

    - Forms Processing
    - Forms Validation

1. Claims

    - Return
    - Warranty

1. Invoicing

    - Internal
    - External
    - Other

1. Legacy System

    - Complex
    - No API
    - Other

#### Roles (app roles)

These roles do not give access to anything, they're used as lookups for the fallback record, if needed.
S
1. Create the **Automation CoE Admin** account as the **CoE Owner**.

    | **Field**           | **Value**                 |
    |---------------------|---------------------------|
    | Display Name        | Anything (Auto CoE Owner) |
    | Type                | **CoE Owner**             |
    | User Principal Name | The email of the user     |

1. Create **CoE Admins** - At least 1 **CoE Admin** must be initialized to configure the **fallback**.

    | **Field**           | **Value**                 |
    |---------------------|---------------------------|
    | Display Name        | Anything (Auto CoE Admin) |
    | Type                | **CoE Admin**             |
    | User Principal Name | The email of the user     |

#### Base configuration - fallback

This table should only have 1 record defined. This record is used if any of the values that are needed to complete processing is null or not defined.

You must define 1 fallback record (see screenshot below for example).

![This screenshot display the base configuration sample.](media/b51358ec1c7aa89bbcdf017c3e76cc98.png)

## ROI calculations

On the **Setup** page you can find the ROI calculation configuration. These tables are used to calculate the complexity of each **Automation Project** (scores). Some values are also being used for the estimated ROI and savings.

### Processing frequency scores

The following table has a value and score for each record. Here are values that must be used. You can modify the scores as needed by your organization.

| **Value** | **Score** |
|-----------|-----------|
| Daily     | 12        |
| Hourly    | 18        |
| Monthly   | 3         |
| Quarterly | 1         |
| Weekly    | 5         |

### Average automation steps scores

This table is fully customizable based on your organization's needs and processes. This table is used to get the **Score** for the **Average Automation Steps** which is inputted by the user when a new **Automation Project** is requested. The follow table contains some examples, but you can modify them to suit the needs of your organization.

| **Range**     | **Value From** | **Value To** | **Score** |
|---------------|----------------|--------------|-----------|
| \>= 1, \< 5   | 1              | 5            | 1         |
| \>= 250       | 250            | 999999999    | 10        |
| \>= 5, \< 250 | 5              | 250          | 5         |

### Processing peaks scores

This table has a value and score for each record. Here are the values that should be used, you can modify the scores to suit your needs.

| **Value** | **Score** |
|-----------|-----------|
| daily     | 15        |
| hourly    | 20        |
| monthly   | 5         |
| quarterly | 2         |
| weekly    | 10        |

## Console configuration

These tables are used by the **Automation Console** app, as well as the **Project Approval** automation.

| **Name**           | **App Description**                                           | **AppID / App Link**                                        |
|--------------------|---------------------------------------------------------------|-------------------------------------------------------------|
| Automation Project | Create and manage your automation projects                    | [Follow these steps.](#how-to-get-canvas-app-urlid)       |
| Automation Center  | Manage and configure all aspects of your automation resources | [Follow these steps.](#how-to-get-model-driven-app-urlid) |

### How to get canvas app URL/ID

Perform the following steps in the [Maker Portal](https://make.powerapps.com/).

1. Select the **Apps** tab on the left navigation bar.
2. Select the **...** (more commands) on the app.
3. Select **Details**. <!--todo: what to do now?-->

   ![A screenshot that displays the details option.](media/dd98466696afb5756f04f76d3f87b5b1.png)

### How to get model driven app URL/ID

Inside the [Maker Portal](https://make.powerapps.com/)

1. Select **Apps** tab on the left navigation bar.
1. Select the **...** (more commands) on the app.
1. Select **Details**.

   ![A screenshot that displays steps 1, 2, and 3](media/89667581265544834f969251313d1015.png)

1. Copy the **AppID**.
1. Select the **Web Link**.

1. Select **Properties**.
1. Copy **Unified Interface URL**.
<!-- todo: -->

<!-- > [!div class="nextstepaction"]
> [Next step: Core components for Power Automate RPA SAP GUI automation](core-components.md) -->
