---
title: Support for customer-managed keys
description: Learn about support for customer-managed keys in Power Automate.
suite: flow
author: v-aangie
contributors:
  - samathur
  - ChrisGarty
  - v-aangie
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 07/23/2024
ms.author: samathur
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Support for customer-managed keys

All customer data stored in Power Platform is encrypted at rest using Microsoft-managed keys (MMKs) by default. With customer-managed keys (CMKs), customers can bring their own encryption keys to protect Power Automate data. This allows customers to have an extra protective layer to manage their Power Platform assets. With this feature, you can rotate or swap encryption keys on demand. It also prevents Microsoft’s access to your customer data, if you choose to revoke key access to Microsoft services at any time.

> [!IMPORTANT]
> - *Before applying the enterprise policy, ensure no flows were created in this environment.*
> - If you apply enterprise policy on an environment with existing flows, those flows and their data would continue to be encrypted with Microsoft-managed keys.
> - Currently, customer-managed keys aren't leveraged to encrypt non-OAuth connections. Such non-Microsoft Entra based connections will continue to be encrypted at rest using Microsoft-managed keys.
> - Create a support ticket if you plan to protect more than 25 environments in your tenant using CMK. The default limit of CMK enabled Power Automate environments per tenant is 25 and this can be extended by engaging the Support team.  

Applying an encryption key is a gesture performed by Power Platform admins and is invisible to users. Users can create, save, and execute Power Automate workflows exactly the same way as if the data was encrypted by Microsoft-managed keys.

To learn more about the customer-managed key, and the step-by-step instructions to enable customer-managed keys, go to [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key). This enables you to leverage the single enterprise policy created on the environment to secure Power Automate workflows.

With CMKs, your workflows and all associated at-rest data are stored and executed on a dedicated infrastructure, partitioned by the environment. This includes your workflow definitions, both cloud and desktop flows, and workflow execution history with detailed inputs and outputs.  

### Power Automate CMK application warning messages

As of April 30, 2024, customer-managed key (CMK) support for Power Automate cloud flows is now enabled. Enablement is restricted to environments without flows present and processing for environments when flows are present in the environment results in warnings. This doesn't impact CMK application for other platform components.

If there are existing flows in the environment being enabled for CMK, a warning message similar to "Power Automate flows are still encrypted with the Microsoft Managed Key" displays. In some experiences, a failed status might display. To review the Power Automate warning, go to the Enterprise Policy experience.

### Power Automate hosted RPA (preview)

The hosted machine group capability of the [Power Automate hosted RPA](../desktop-flows/hosted-rpa-overview) solution now supports customer-managed keys (CMK). After applying CMK, you must reprovision any existing hosted machine groups using the “Reprovision group” button on the machine group details page. Once reprovisioned, the VM disks for the hosted machine group bots will be encrypted with the CMK.

> [!NOTE]
> Customer-managed key (CMK) for the hosted machine capability is currently not available




## Known limitations

When an environment is enabled for customer-managed keys, then Power Automate data can't be sent to the analytics pipeline for [tenant-wide reporting in Power Platform admin center](/power-platform/admin/power-automate-analytics-reports), [Data Export to Data Lake](/power-platform/admin/self-service-analytics-schema-definition#power-automate-folder-structure), or [Application Insights](/power-platform/admin/app-insights-cloud-flow).

## Related information

- [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key)
