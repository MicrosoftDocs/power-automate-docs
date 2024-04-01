---
title: Cloud Connectors in Power Automate for desktop 
description: Learn about the available Cloud Connector operations in Power Automate for desktop.
author: jpapadimitriou
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 04/01/2024
ms.author: dipapa
ms.reviewer: 
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Cloud Connectors as Power Automate for desktop actions

[Cloud Connectors available for Power Automate](/connectors/connector-reference/connector-reference-powerautomate-connectors) are gradually introduced for desktop flows as well. 

## Prerequisites and limitations

- You need an Attended RPA license.
- Specific endpoints must be included in the allowlist for desktop flows containing cloud connector actions to work properly. More information: [Desktop flow services required for runtime](../../ip-address-configuration.md#desktop-flows-services-required-for-runtime)
- For **Office 365 Outlook** actions, if you're using an EWS application access policy, ensure that the allowed user-agents for successful desktop flow execution: PowerAutomateLocal/*, PowerAutomateCloud/.* More information: [Common errors](/connectors/office365/#common-errors)
- Dynamic output schema isn't fully supported for cloud connector actions in desktop flows. Refrain from using variables in the respective dropdown fields (Site address/ List name/ Select file etc.) while configuring a cloud connector action.
- To enable attended or unattended runs (cloud-initiated runs), make sure that your desktop flow uses the Power Automate v2 schema and all connection references are marked as embedded.
- Connection reference embedding is only available for co-owners. Users (run-only) can execute flows shared with them only via Power Automate for desktop's console by using their own connections.
- Desktop flows with embedded connection references don't currently support ALM capabilities.

## Embedding connection references on a desktop flow (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

Through connection reference embedding you can provide access to other co-owners to your connection references and their underlying resources, only in the scope of the respective shared desktop flow.

- [!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

To embed a connection reference to a flow, you have access to as a co-owner:

- Select the respective desktop flow in the portal to go to its details.
- In the **Connection references** section, select **Manage.**

:::image type="content" source="media/cloudconnectors/manage_connection_references_button.png" alt-text="Screenshot of the Manage Connections button" border="false":::

- In the **Connection references** screen you see all of the connection references used in a respective flow. 
- Set the **Embed in desktop flow** toggle to **Yes** to enable it.

:::image type="content" source="media/cloudconnectors/embed_a_connection_reference_to_a_flow.png" alt-text="Screenshot of the Manage Connections menu" border="false" lightbox="media/cloudconnectors/embed_a_connection_reference_to_a_flow.png":::

- After you confirm your selection, the connection reference is embedded in the desktop flow.

> [!NOTE]
> You can only embed or remove connection references that you own. Connection references added by other co-owners can only be managed by them.

>[!IMPORTANT]
> To enable attended or unattended runs (cloud-initiated runs), make sure that your desktop flow uses the Power Automate v2 schema and all connection references are marked as embedded.

## Bring your own connection

All co-owners and run-only users are required to bring your own connection (BYOC) during console executions for connection references that aren't embedded.

:::image type="content" source="media/cloudconnectors/bring_your_own_connection.png" alt-text="Screenshot of the bring your own connection dialog for console runs" border="false":::

>[!NOTE]
> BYOC is available for both co-owners and run-only makers. BYOC is only available for console initiated flow executions.

## List of Cloud Connectors

Here's a list of in Cloud Connectors in Power Automate for desktop currently available:

- [SharePoint](/connectors/sharepointonline)
- [Excel Online (Business)](/connectors/excelonline)
- [Microsoft Forms](/connectors/microsoftforms)
- [Microsoft Teams](/connectors/teams)
- [Office 365 Outlook (preview)](/connectors/office365)
- [OneDrive](/connectors/onedrive)
- [OneDrive for work or school](/connectors/onedriveforbusiness)
- [OneNote (Business)](/connectors/onenote)
- [RSS](/connectors/rss)
- [Word Online (Business)](/connectors/wordonlinebusiness)

