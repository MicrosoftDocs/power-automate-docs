---
title: Support for customer-managed keys
description: Learn about support for customer-managed keys in Power Automate.
suite: flow
author: samathur
contributors:
  - samathur
  - ChrisGarty
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 10/08/2024
ms.author: samathur
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Support for customer-managed keys

All customer data stored in Power Platform is encrypted at rest using Microsoft-managed keys (MMKs) by default. With customer-managed keys (CMKs), customers can bring their own encryption keys to protect Power Automate data. This ability allows customers to have an extra protective layer to manage their Power Platform assets. With this feature, you can rotate or swap encryption keys on demand. It also prevents Microsoft’s access to your customer data, if you choose to revoke key access to Microsoft services at any time.

> [!IMPORTANT]
> - *Before applying the enterprise policy, ensure no flows were created in this environment.*
> - If you apply enterprise policy on an environment with existing flows, those flows and their data would continue to be encrypted with Microsoft-managed keys.
> - Currently, customer-managed keys aren't leveraged to encrypt non-OAuth connections. Such non-Microsoft Entra based connections will continue to be encrypted at rest using Microsoft-managed keys.
> - Create a support ticket if you plan to protect more than 25 environments in your tenant using CMK. The default limit of CMK enabled Power Automate environments per tenant is 25. This number can be extended by engaging the Support team.  

Applying an encryption key is a gesture performed by Power Platform admins and is invisible to users. Users can create, save, and execute Power Automate workflows exactly the same way as if Microsoft-managed keys encrypted the data.

Learn more about the customer-managed key, and the step-by-step instructions to enable customer-managed keys in [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key). This feature enables you to leverage the single enterprise policy created on the environment to secure Power Automate workflows.

With CMKs, your workflows and all associated at-rest data are stored and executed on a dedicated infrastructure partitioned by the environment. This includes your workflow definitions, both cloud and desktop flows, and workflow execution history with detailed inputs and outputs.  

### Power Automate CMK application warning messages

As of April 30, 2024, CMK support for Power Automate cloud flows is enabled. Enablement is restricted to environments without flows present and processing for environments when flows are present in the environment results in warnings. This doesn't impact customer-managed key application for other platform components.

If there are existing flows in the environment being enabled for customer-managed key, a warning message similar to "Power Automate flows are still encrypted with the Microsoft Managed Key" displays. In some experiences, a failed status might display. To review the Power Automate warning, go to the Enterprise Policy experience.

### Power Automate hosted robotic process automation (RPA) (preview)

The hosted machine group capability of the [Introduction to the Power Automate hosted RPA](desktop-flows/hosted-rpa-overview.md) solution supports customer-managed keys. After applying customer-managed keys, you must reprovision any existing hosted machine groups selecting **Reprovision group** on the machine group details page. Once reprovisioned, the VM disks for the hosted machine group bots are encrypted with the customer-managed key.

> [!NOTE]
> Customer-managed key for the hosted machine capability is currently not available.

## Known limitations

Limitations include limitations for features leveraging analytics pipeline and for non-solution cloud flows triggered by Power Apps, as described in this section.

### Limitations on features leveraging analytics pipeline

When an environment is enabled for customer-managed keys, then Power Automate data can't be sent to the analytics pipeline for a range of scenarios:

- [Tenant-wide reporting in Power Platform admin center](/power-platform/admin/power-automate-analytics-reports)
- [Data export to Data Lake](/power-platform/admin/self-service-analytics-schema-definition#power-automate-folder-structure)
- [Cloud flow run history](/power-automate/dataverse/cloud-flow-run-metadata) (for [automation center](/power-automate/automation-center-overview))
- [Power Automate mobile app](/power-automate/mobile/overview-mobile), [notifications page](/power-automate/mobile/notifications)
- Cloud flow activity page
- Flow failure e-mail
- Flow failure digest e-mail

### Limitation on non-solution cloud flows triggered by Power Apps

Non-solution cloud flows using the Power Apps trigger and are created in CMK-protected environments can't be referenced from an app. An error results when attempting to register the flow from Power Apps. Only solution cloud flows can be referenced from an app in CMK-protected environments. To avoid this situation, [flows should first be added into a Dataverse solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution) so they can be successfully referenced. To prevent this situation, the environment setting to [automatically create flows in Dataverse solutions](/power-apps/maker/canvas-apps/add-app-solution-default#enable-the-feature) should be enabled in CMK-protected environments. This setting ensures new flows are solution cloud flows.

### Limitation of invoking Copilot Skills trigger flows

The scenarios where a cloud flow is invoked through the Copilot Skills trigger leveraging the invoking Copilot user's connection as opposed to an embedded connection isn't supported for CMK protected cloud flows. Learn more about using flows as plugins from Copilot in [Run flows from Copilot for Microsoft 365](flow-plugins-m365.md#run-flows-from-microsoft-365-coplot).

## Related information

[Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key)
