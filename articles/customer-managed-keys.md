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

## Considerations before applying CMK policy

- Applying the CMK enterprise policy automatically protects the cloud flows and their data with CMK. Some flows might continue to be protected by MMKs. Admins can identify these flows using PowerShell commands [link to section].  
- Creation and update of flows are blocked during migration. Run History isn't carried forward. You can request it through a support ticket [link to section] up to 30 days after migration.
- Currently, CMKs aren't leveraged to encrypt non-OAuth connections. These non-Microsoft Entra based connections continue to be encrypted at rest using MMKs.
- To enable incoming and outgoing network traffic from CMK protected infrastructure, update your firewall configuration [link to section].  
- If you plan to protect more than 25 environments in your tenant using CMK, create a support ticket. The default limit of CMK enabled Power Automate environments per tenant is 25. This number can be extended by engaging the Support team.

Applying an encryption key is a gesture performed by Power Platform admins and is invisible to users. Users can create, save, and execute Power Automate workflows exactly the same way as if MMKs encrypted the data.

Learn more about the customer-managed key, and the step-by-step instructions to enable customer-managed keys in [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key). This feature enables you to leverage the single enterprise policy created on the environment to secure Power Automate workflows.

With CMKs, your workflows and all associated at-rest data are stored and executed on a dedicated infrastructure partitioned by the environment. This includes your workflow definitions, both cloud and desktop flows, and workflow execution history with detailed inputs and outputs.  

### Power Automate CMK application warning messages

If certain flows continue to be protected by Microsoft Managed Keys post CMK application, warnings surface in the Policy and Environment Management experiences. A message *"Power Automate flows are still protected with the Microsoft Managed Key"* displays.  

:::image type="content" source="media/customer-managed-keys/warning.png" alt-text="Screenshot of the warning message in Power Platform admin center.":::

You can leverage the PowerShell commands [link to section] to identify such flows and protect them with CMKs.

### Power Automate hosted robotic process automation (RPA) (preview)

The hosted machine group capability of the [Introduction to the Power Automate hosted RPA](desktop-flows/hosted-rpa-overview.md) solution supports CMKs. After applying CMKs, you must reprovision existing hosted machine groups by selecting **Reprovision group** on the machine group details page. Once reprovisioned, the VM disks for the hosted machine group bots are encrypted with the CMK.

> [!NOTE]
> CMK for the hosted machine capability is currently not available.

## Protect flows that continue to be protected by Microsoft Managed Keys

The following categories of flows continue to be protected by MMK after applying the Enteprise policy. Follow the instructions to protect the flows by CMK.

|Category  |Approach to protect with CMK  |
|---------|---------|
|Power App v1 trigger flows that aren't in a solution     | **Option 1 (Recommended)**</br>Update the flow to use V2 trigger before applying CMK.</br></br>**Option 2**</br>Post CMK application, use **Save as** to create a copy of the flow.  Update calling Power Apps to use the new copy of the flow.   |
|HTTP trigger flows and Teams trigger flows     | Post enterprise policy application, use **Save as** to create a copy of the flow. Update calling system to use the URL of the new flow.</br></br>This category of flows isn't automatically protected as a new flow URL is created in the CMK protected infrastructure. Customers might be leveraging the URL in their invoking systems.   |
|Parents of flows that can't be automatically migrated     | If a flow can't be migrated, then any dependent flows are also not migrated to ensure there’s no business disruption. |

## Update Firewall configuration

Power Automate allows you to build flows that can make HTTP calls. After applying CMK, outbound HTTP actions from Power Automate originate from a different IP range than before. If the firewall was previously configured to allow flow HTTP actions, it's likely that the configuration needs to be updated to allow for the new IP range.

- If you're using Azure Firewall, apply the service tag “PowerPlatformPlex” directly to the config for the correct IP range to be configured automatically. See Azure service tags.
- If you're using a different firewall, look up and enable inbound traffic from the IP range for “PowerPlatformPlex” referenced in Download Azure IP Ranges and Service Tags.

If this isn't in place, you might get the error, *Http request failed as there is an error: 'No connection could be made because the target machine actively refused it'*.

## PowerShell commands





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

The scenarios where a cloud flow is invoked through the Copilot Skills trigger leveraging the invoking Copilot user's connection as opposed to an embedded connection isn't supported for CMK protected cloud flows. Learn more about using flows as plugins from Copilot in [Run flows from Copilot for Microsoft 365](flow-plugins-m365.md#run-flows-from-microsoft-365-copilot).

## Related information

[Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key)
