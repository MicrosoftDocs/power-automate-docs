---
title: Support for customer-managed keys
description: Learn about support for customer-managed keys in Power Automate.
suite: flow
author: samathur
contributors:
  - samathur
  - ChrisGarty
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.date: 05/21/2025
ms.author: samathur
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
ms.custom: sfi-image-nochange
---

# Support for customer-managed keys

All customer data stored in Power Platform is encrypted at rest using Microsoft-managed keys (MMKs) by default. With customer-managed keys (CMKs), customers can bring their own encryption keys to protect Power Automate data. This ability allows customers to have an extra protective layer to manage their Power Platform assets. With this feature, you can rotate or swap encryption keys on demand. It also prevents Microsoft’s access to your customer data, if you choose to revoke key access to Microsoft services at any time.

With CMKs, your workflows and all associated at-rest data are stored and executed on a dedicated infrastructure partitioned by the environment. This includes your workflow definitions, both cloud and desktop flows, and workflow execution history with detailed inputs and outputs.  

## Prerequisite considerations before protecting your flows with CMK

Consider the following scenarios when applying the CMK enterprise policy to your environment.

- When the CMK enterprise policy is applied, cloud flows and their data with CMK are automatically protected. Some flows might continue to be protected by MMKs. Admins can identify these flows using [PowerShell commands](#powershell-commands).  
- Creation and updates of flows are blocked during migration. Run history isn't carried forward. You can request it through a [support ticket](#get-run-history-by-support-ticket) up to 30 days after migration.
- Currently, CMKs aren't leveraged to encrypt non-OAuth connections. These non-Microsoft Entra based connections continue to be encrypted at rest using MMKs.
- To enable incoming and outgoing network traffic from CMK protected infrastructure, [update your firewall configuration](#update-firewall-configuration) to ensure your flows continue to work.
- If you plan to protect more than 25 environments in your tenant using CMK, create a support ticket. The default limit of CMK enabled Power Automate environments per tenant is 25. This number can be extended by engaging the Support team.

Applying an encryption key is a gesture performed by Power Platform admins and is invisible to users. Users can create, save, and execute Power Automate workflows exactly the same way as if MMKs encrypted the data.

The CMK feature enables you to leverage the single enterprise policy created on the environment to secure Power Automate workflows. Learn more about CMK and the step-by-step instructions to enable CMKs in [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key).

### Power Automate hosted robotic process automation (RPA)

The hosted machine group capability of the [Power Automate hosted RPA](desktop-flows/hosted-rpa-overview.md) solution supports CMKs. After applying CMKs, you must reprovision existing hosted machine groups by selecting **Reprovision group** on the machine group details page. Once reprovisioned, the VM disks for the hosted machine group bots are encrypted with the CMK.

> [!NOTE]
> CMK for the hosted machine capability isn't currently available.

## Update firewall configuration

Power Automate allows you to build flows that can make HTTP calls. After you apply CMK, outbound HTTP actions from Power Automate originate from a different IP range than before. If the firewall was previously configured to allow flow HTTP actions, it's likely that the configuration needs to be updated to allow for the new IP range.

- If you're using Azure Firewall, apply the service tag `PowerPlatformPlex` directly to the configuration for the correct IP range to be configured automatically. Learn more in [Virtual network service tags](/azure/virtual-network/service-tags-overview).
- If you're using a different firewall, look up and enable inbound traffic from the IP range for `PowerPlatformPlex` referenced in the download of [Azure IP Ranges and Service Tags - Public Cloud](https://www.microsoft.com/en-us/download/details.aspx?id=56519).

If this isn't in place, you might get the error, *Http request failed as there is an error: 'No connection could be made because the target machine actively refused it.'*

### Power Automate CMK application warning messages

If certain flows continue to be protected by MMKs post CMK application, warnings surface in the Policy and Environment Management experiences. A message *"Power Automate flows are still protected with the Microsoft Managed Key"* displays.  

:::image type="content" source="media/customer-managed-keys/warning.png" alt-text="Screenshot of the warning message in Power Platform admin center.":::

You can leverage [PowerShell commands](#powershell-commands) to identify such flows and protect them with CMKs.

## Protect flows that continue to be protected by MMK

The following categories of flows continue to be protected by MMK after applying the Enterprise policy. Follow the instructions to protect the flows by CMK.

|Category  |Approach to protect with CMK  |
|---------|---------|
|Power App v1 trigger flows that aren't in a solution     | **Option 1 (Recommended)**</br>Update the flow to use V2 trigger *before* applying CMK.</br></br>**Option 2**</br>*Post CMK application*, use **Save as** to create a copy of the flow. Update calling Power Apps to use the new copy of the flow.   |
|HTTP trigger flows and Teams trigger flows     | *Post enterprise policy application*, use **Save as** to create a copy of the flow. Update calling system to use the URL of the new flow.</br></br>This category of flows isn't automatically protected, as a new flow URL is created in the CMK protected infrastructure. Customers might be leveraging the URL in their invoking systems.   |
|Parents of flows that can't be automatically migrated     | If a flow can't be migrated, then dependent flows are also not migrated to ensure there’s no business disruption. |
|Flows using the List flows as Admin (v1) connector action     | Flows referencing this legacy action should either be deleted or updated to use the [List Flows as Admin (V2)](/connectors/flowmanagement/#list-flows-as-admin-(v2)) action.   |

## PowerShell commands

Admins can leverage PowerShell commands as part of pre-flight and post-flight validations.

### Retrieve flows that can't be automatically protected using CMK

You can use the following command to identify flows that continue to be protected by MMK post CMK Enterprise application.

`> Get-AdminFlowEncryptedByMicrosoftKey -EnvironmentName <Your Environment Id>  
-ListCannotMigrateToCustomerManagedKey`

|DisplayName  |FlowName  |EnvironmentName  |
|---------|---------|---------|
|Get Invoice HTTP     | flow-1   | environment-1    |
|Pay Invoice from App     | flow-2  | environment-2    |
|Reconcile Account   | flow-3    | environment-3    |

### Retrieve flows not protected by CMK in a given environment

You can leverage this command before and after executing the CMK Enterprise policy to identify all flows in the environment that are protected by MMK. Also, you can leverage this command to assess the progress of CMK application for flows in a given environment.

`> Get-AdminFlowEncryptedByMicrosoftKey -EnvironmentName <Your Environment Id>`

|DisplayName  |FlowName  |EnvironmentName  |
|---------|---------|---------|
|Get Invoice HTTP	| flow-4 | environment-4 |

Learn more in [Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key).

## Get run history from the flow Details page

The run history list on the flow **Details** page displays new runs only post-CMK application.

If you want to view input/output data, you can use the run history (**All Runs** view) to export flow run history to CSV. This history contains both new and existing flow runs including all the trigger/action inputs and outputs, with a limit of 100 records. This limitation is in line with existing behavior for the CSV export.

## Get run history by support ticket

We provide a summary view for all runs from both existing and new flow runs post CMK application. This view contains summary information such as run id, start time, duration, and fail/successs. It doesn't contain input/output data.

## Protect flows in environments that are already protected by CMK

For environments that are already protected by CMK, protecting flows using CMK can be requested by a Support Ticket.

## Limitation on non-solution cloud flows triggered by Power Apps

Non-solution cloud flows using the Power Apps trigger and are created in CMK-protected environments can't be referenced from an app. An error results when attempting to register the flow from Power Apps. Only solution cloud flows can be referenced from an app in CMK-protected environments. To avoid this situation, [flows should first be added into a Dataverse solution](/power-automate/create-flow-solution#add-an-existing-cloud-flow-into-a-solution) so they can be successfully referenced. To prevent this situation, the environment setting to [automatically create flows in Dataverse solutions](/power-apps/maker/canvas-apps/add-app-solution-default#enable-the-feature) should be enabled in CMK-protected environments. This setting ensures new flows are solution cloud flows.

## Related information

[Manage your customer-managed encryption key](/power-platform/admin/customer-managed-key)
