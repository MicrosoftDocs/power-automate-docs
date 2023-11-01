---
title: Approvals Kit instructor guide environment validation | Microsoft Learn
description: Approvals Kit instructor guide environment validation
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/10/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Environment Validation

In this section, learn how to verify that the environments set up are working as expected and ready for your workshop learners.

Setting up the necessary environments is a crucial part of preparing for any project. However, it's equally important to ensure that these environments are fully functional before moving forward. This section guides you through the process of validating your environment, with a particular focus on confirming that your custom connector is registered and running as expected. Additionally, it covers how to verify that your Business Approval Management application is running smoothly, and that your workshop users are loaded and ready for monitoring. By the end of this section, have the confidence to move forward with your workshop, knowing that your learner environments are fully functional and ready to go.

## Learning Environments

Use the following command to validate that user environments are imported and running as expected.

```pwsh
Invoke-ValidateEnvironments users.txt
```

The validation checks that are performed:

- Creator Kit installed

- Approvals Kit solution is installed

- Contoso Coffee solution is installed

- Approvals Kit configured as expected:

  - All Cloud flows are enabled.

  - The Approvals Kit custom connector is registered and can load Approval data

- The Business Approval Management application can be loaded and started ready to create first business approval workflow

## Loading Learners

Use the Approvals Kit manager Data Flow to load a list of learners and configured environment names into the workshop management application.

1. Install the Approvals Kit Workshop manager into an environment.

> NOTE: Ensure that the user account that the Check Environments has rights to query the learning environments.

> TODO: Add steps to load data

## Verifying Monitoring

Verify the monitoring dashboard to ready to provide feedback on learner progress perform the following checks.

1. The **Approvals Kit Manager** application can be started

1. The Power BI dashboard is available to show progress

   ![Screenshot of Approvals Kit Manager Dashboard](./media/approvals-kit-manager-dashboard.png)

1. The update **Check Environments** button starts the Cloud Flow and checks each environment

   ![Screenshot of Approvals Kit checking environments for progess updates](./media/approvals-kit-manager-update.png)

1. The **Workshop Users** page provides you with the status of loaded Workshop users

   ![Screenshot of Approvals Kit Manager Workshop users](./media/approvals-kit-manager-workshop-users.png)

## Summary

These steps should verify that the environments are ready and can be monitored as you run the workshop and after the workshop to track progress and completion rates.
