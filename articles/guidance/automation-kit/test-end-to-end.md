---
title: Overview of the Automation Kit test case guidance | Microsoft Docs
description: Overview of the Automation Kit test case guidance.
suite: flow
documentationcenter: na
author: Grant-Archibald-MS
editor: ''
ms.custom: guidance
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/18/2022
ms.author: grarchib
ms.reviewer: angieandrews
---

# Project end-to-end scenario

The following test cases are full end-to-end processes.

1. Create an automation project request.
1. The request is approved or rejected. Approvals are sent to the business process owner or fallback if no business process owner is selected.
1. Project admin maps the automation project to a new or existing environment.
1. The maker creates a solution and develops the automation project.
1. When the solution is deployed to prod (manually until ALM Automation actions are available) the automation admin maps the solution to project by metering the solution and its artifacts.
1. After metering is turned on for the solution, the flow / process can be triggered, and data will sync back to main in near real time.
1. Verify in the main solution that the flow sessions are being synced.
1. Use Power BI to verify that the data calculations are correct.

## User roles definition

Refer to the following table to see what roles and permissions are needed for each step.

| **Name**                | **Security roles**                                               |
|-------------------------|------------------------------------------------------------------|
| Maker                   | Automation project contributor, basic user, environment maker    |
| Approver/business owner | Automation project viewer                                        |
| CoE admin               | Power Platform admin (or system admin for all environments used) |

## Order materials and services (example 1)

### Request automation project (maker)

1. Sign in to [Power Automate](https://make.powerautomate.com) and then change to your main environment.
1. Launch the [Automation Project](https://github.com/microsoft/automation-coe/wiki/How-to-use-Automation-Project) app from either of the following apps.
   - **Automation Console** app
   - **Automation Project** app

1. Create a new automation project request by selecting the **+** or selecting the **New Project** tab.
1. Fill in the details as the following table indicates.

| **Question**           | **Value**                                     |
|------------------------|-----------------------------------------------|
| Project Name           | Order materials and services                  |
| Process Challenges     | Complex, No API                               |
| Department             | ANY                                           |
| Improvement Driver     | ANY                                           |
| Processing Time        | 85                                            |
| Process Category       | ANY                                           |
| Processing Frequency   | Daily                                         |
| Processing Peaks       | monthly                                       |
| Process Sub Category   | ANY                                           |
| Volume Per Process     | 5                                             |
| Business Owner         | Business Approver or leave blank for Fallback |
| ROI                    |                                               |
| Automation Steps       | 14                                            |
| Number Of FTEs Needed  | 2                                             |
| Rework Time in Minutes | 35                                            |
| AVG Error Rate %       | 15                                            |
| Hourly Cost Per FTE    | 50                                            |
| Working Hours Per Day  | 8                                             |
| Working Days Per Year  | 200                                           |
| FTEs Needed for Rework | 1                                             |
| Automation Goal        | ANY                                           |
| Maintenance Overhead % | 10                                            |
| Development Costs      | 1200                                          |

1. Select **Save**.
   After the save operation completes, the dashboard displays a list of flow runs and then calculates the ROI potential and complexity score, based on the information provided.

1. Select the **Refresh** button within the app until the ROI and score show up. These should show up in a few seconds.

1. Now, select the project record for approval, and then select the **Submit Project** button.

Now that the request has been submitted, it can be approved or rejected by the business owner, or if none was provided, the fallback approver is used.

If this is the first time an approval is being used within this environment, it'll take around 5 minutes for the approval solutions to initialize. This is only a one-time event, and you can avoid it by following the steps laid out in the setup steps.

### Approve automation project request (approver)

1. Sign in as an approver in the main environment.
1. Open the approval from one of the following locations.

    - Microsoft Teams (preferred)
    - Power Automate actions tab
    - Outlook email

1. Approve the request.

### Map the automation project to an environment (dev)

1. Sign in as a CoE admin in the main environment.
1. Open the automation center app.
1. Select the automation project that was just approved.
1. Select the **Related** tab > **Environments**.
1. Map the record to an environment (dev).

   >[!IMPORTANT]
   >Perform step five only after the automation project is deployed to the test environment.

1. Map the automation project to the test environment.

   >[!IMPORTANT]
   >Perform step six only after the automation project has been deployed to the production environment.

1. Map the automation project to the production environment.

### Create / Export solution (DEV/TEST)

1. Sign in as a maker into the satellite environment.
1. Go to the DEV environment and create a solution.
1. If the department publisher does not exist, create one for the department to use.
1. Create a desktop flow.
1. Create a cloud flow that will trigger the desktop flow. Name the cloud flow using the following [naming convention](./use-automation-kit.md#rename-a-cloud-flow-to-match-naming-convention): [CloudFlowName]_[AutomationProjectNumber]_[3digits].

    | CloudFlowName           | Your meaningful name for your process                                                                                                                                                                                                                                                   |
    |-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
    | AutomationProjectNumber | Displayed in the automation project app                                                                                                                                                                                                                                                 |
    | 3digits                 | The last 3 digits can be used for advanced use cases and are typically 001 if you only have one solution per automation project. If you have multiple solutions for a single project, you could increase that number by 1 for each additional solution to distinguish them. |

   >[!NOTE]
   >The renaming process can also be done easier inside the [Automation Solution Manager](./use-automation-kit.md#rename-a-cloud-flow-to-match-naming-convention) app.

The cloud flow should trigger the desktop flow based on the frequency defined in the automation request.

1. Test by running the cloud or desktop flows.
1. Deploy to test (manual).

### Automation project gets mapped to the test environment

1. Maker exports manually and deploys to test.
1. Automation project gets mapped to the TEST environment manually by the CoE admin.
1. Maker does basic functional testing.

### Automation project gets mapped to PROD app

Perform the following steps as a CoE admin in the satellite environment (PROD).

CoE admin maps the solution to automation project by metering the solution and its artifacts.

1. Open the **Automation Solution Manager** app.
1. Select the solution for your automation project and meter by selecting the **+"** icon.
1. Once metered, meter the artifact (the trigger cloud flow).
1. Go to the metered artifact (cloud flow), and then trigger it. (This will sync a flow session to main).
1. Wait for run to complete.

### Verify data sync to main

Perform the following steps as a CoE admin in the main environment.

1. Open the **Automation Center** app.
1. Open the flow **Sessions** tab.
1. Filter on newest complete time if needed, and then verify that the run we triggered is there.

Next, we can validate the ROI calculations using **Power BI and the Excel ROI calculator.**

1. Take the same information you entered into the automation project app, enter it into the Excel ROI calculator.
1. Compare Power BI with the results from the Excel ROI calculator.
