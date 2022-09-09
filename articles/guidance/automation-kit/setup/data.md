---
title: Import initial Dataverse data and Power BI data analytics | Microsoft Docs
description: Import initial Dataverse data and Power BI data analytics.
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

## Import the desktop flow actions csv

Follow these steps to import all the desktop flow actions from the included csv file into the **Desktop Flow Action** table.

1. Open a browser, navigate to [Power Automate](https://flow.microsoft.com) and sign-in with your account.
2. Navigate to your environment where the solution is installed.
3. Select Solutions tab.
4. Find and select Automation CoE main or satellite solution.
5. Select the table, Desktop Flow Action.
6. Click the Import dropdown near the top.
7. Select Import data from Excel.
8. After the popup opens, select the **Upload** button, and then upload the included Excel file (autocoe_desktopflowactions.csv).
9. Wait for the **mapping status** to show as successful.
10. Select **Import**.
11. After the import completes, verify that the data was imported.

## Setup the Automation CoE Power BI dashboard

To launch the Power BI dashboard for the Automation Center of Excellence, you will need the environment URL for your main environment (the environment where **Automation CoE Main** is located).

1. To obtain the environment URL, sign into the Power Platform admin center > Environments > select the environment, and then note the **Environment URL**.

   ![A screenshot that displays the environment URL](../media/75b28eea02490822c3f1f84e4c7a6c9d.png)

1. Launch the Power BI template and then enter the environment URL.

   ![A screenshot that displays the location to enter the environment URL](../media/f529bbf7be8fd410f24577bb914f3585.png)

### Main dashboard

The main Power BI dashboard has the following sections.

1. **Home** - This screen provides an overview of key KPIs for the Automation CoE.

   ![A screenshot that displays the KPIs on the dashboard](../media/d1618d1e40e6ea8c255bdf4d76911648.png)

1. **Project Backlog** - Provides details of the ideas and projects submitted, status, and ranks based on estimated savings and complexity.

   ![A screenshot that displays the details of projects and their status](../media/911dbb5c5fc4547383038dff02f8897f.png)

1. **Business KPI** - Displays business details for savings realized, efficiency, hours saved, and other business metrics.

   ![A screenshot that displays the business metrics](../media/9deb2fb334049b3ddca9f4776fd8ad0b.png)

1. **Goals** - Outlines savings and efficiency goals for the organization, and the status by department and project.

   ![A screenshot that displays the project goals.](../media/0365178b76c51543398ee3b5b45bba5e.png)

1. **ROI** - Overall ROI for the Projects implemented.

   ![A screenshot that displays the savings and efficiency goals for the organization](../media/e04475e89e3136d5fc84873d06f5e429.png)

1. **ROI Financials** - Displays information regarding ROI *actual* vs *estimate* by year, quarter, and month.

   ![A screenshot that displays information regarding ROI actual vs estimate](../media/845e1b29d89ff2431f60e13656960524.png)

1. **Solutions** - Provides an overview of solutions in production, hours saved, error rates, and bot success KPIs.

   ![A screenshot that displays an overview of solutions](../media/da3524962ef85c40433f69a762c3ffbb.png)

1. **Machines** - Displays detailed information on machine utilization and activity.

   ![A screenshot that displays the utilization for the machines.](../media/b4b902a7319fe518600896a0ba5b83f4.png)

1. **Flow Overview** - Summarizes the number flows created, runs, status, and top 10 makers, machines, and flows.

   ![A screenshot that displays the summary of flow statistics](../media/288ff8ec71655f36b05136ccdd065f30.png)

1. **Flow Run Detail** - Detailed information on flow runs, durations, status, run modes, hosts, and errors.

   ![A screenshot that displays detailed information on flow runs](../media/93661c6e0fea9d4727cece5162fff3f5.png)

1. **Run Performance** - Shows a graphical display of run performance day over day.

   ![A screenshot that displays a graphical display of run performance day over day](../media/0b3612fa15b68b4f6cd4b6deb6de30ae.png)

1. **Control Chart** - Displays an overview of flow processing time averages and operational performance within control points.

   ![A screenshot that displays flow processing time averages and operational performance](../media/c81be1455a2a486a8f34d5fb5bac6789.png)

1. **Flow Exceptions** – Enables you to filter by date, exception rule, cloud flow name, desktop flow name, or host name.

   ![A screenshot that displays a filter by date and other metrics](../media/3fc477111732768db0bc79ce4850166e.png)

1. **Flow Exceptions Tree Diagram –** Displays and allows you to drill into specific flows organized by categories, including cloud flow name, desktop flow name, error code, error message, run mode, or host name.

   ![A screenshot that displays specific flows organized by categories](../media/931ae2e90c21bfd882edcbc8283a3503.png)

1. **Action Usage Analysis** – Just like the Power App but with added filters and an email owner button. <!--todo: I am not following this-->

   ![A screenshot that displays dlp policy items](../media/e252ea3e2eab49b430a7fe7f77e1cbf2.png)

1. **Action Decomposition Tree Analysis** – Tree like diagram that shows how each action module or flow relates in a tree-like diagram.

   ![A screenshot that displays the tree-like diagram](../media/3efabd0d706b63c2287f34fbf93a44b1.png)

1. **ROI Calculations** - Contains examples on how calculations related to ROI and efficiency are determined throughout the dashboards.

   ![A screenshot that displays ROI and efficiency calculations](../media/5821b46c21aaa93fe4b8627a11e49559.png)

Every detail page consists of the following items.

- Filters (Department, Project, Solution).
- High-level statistics.
- Useful visuals.

