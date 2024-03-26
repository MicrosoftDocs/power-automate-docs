---
title: Cloud Connectors in Power Automate for desktop 
description: Learn about the available Cloud Connector operations in Power Automate for desktop.
author: jpapadimitriou
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/03/2023
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
- For **Office 365 Outlook** actions, if you are using an EWS application access policy, ensure that the following user-agents are allowed (on top of the user agents listed [here](https://learn.microsoft.com/connectors/office365/#common-errors)) for successful desktop flow execution: PowerAutomateLocal/*, PowerAutomateCloud/*
- Dynamic output schema is not fully supported for cloud connector actions in desktop flows. Please refrain from using variables in the respective dropdown fields (Site address/ List name/ Select file etc.) while configuring a cloud connector action.
- To enable attended / unattended runs (cloud-initiated runs), make sure that your desktop flow uses Power Automate v2 schema and all connection references are marked as embedded (preview). 
- Connection reference embedding (preview) is only available for Co-owners. Users (run-only) can execute flows shared with them only via Power Automate for desktop's console by using their own connections.
- Desktop flows with embedded connection references (preview) do not currently support ALM capabilities. 


## Embedding connection references on a desktop flow (preview)
Through connection reference embedding (preview) you can provide access to other co-owners to your connection references and their underlying resources, only in the scope of the respective shared desktop flow. To embed a connection reference to a flow you have access to as a co-owner
- Click on the respective desktop flow in the portal to go to its details.
- In the **Connection references** section, click on **Manage (preview)**

:::image type="content" source="media/cloudconnectors/manage_connection_references_button.png" alt-text="Screenshot of the Manage Connections button" border="false":::

- In the **Connection references (preview)** screen you will see all of the connection references used in a respective flow. 
- Set the **Embed in desktop flow** toggle button to enabled.

:::image type="content" source="media/cloudconnectors/embed_a_connection_reference_to_a_flow.png" alt-text="Screenshot of the Manage Connections menu" border="false":::

- After you confirm your selection, the connection reference is now embedded in the desktop flow.

> [!NOTE]
> You can only embed/remove connection references that you own. Connection references added by other co-owners can only be managed by them. 

>[!IMPORTANT]
> To enable attended / unattended runs (cloud-initiated runs), make sure that your desktop flow uses Power Automate v2 schema and all connection references are marked as embedded (preview).

## Bring your own connection 
All co-owners and run-only users will be required to bring their own connections during console executions for connection references that are not embedded. 

:::image type="content" source="media/cloudconnectors/bring_your_own_connection.png" alt-text="Screenshot of the bring your own connection dialog for console runs" border="false":::

>[!NOTE]
> Bring Your Own Connection is available for both co-owners and run-only makers. BYOC is only available for Console initiated flow executions. 



## List of Cloud Connectors currently available in Power Automate for desktop
- [SharePoint](/connectors/sharepointonline)
- [Excel Online (Business)](/connectors/excelonline)
- [Microsoft Forms](/connectors/microsoftforms)
- [Microsoft Teams](/connectors/teams)
- [Office 365 Outlook (preview)](/connectors/office365)
- [OneDrive](/connectors/onedrive)
- [OneDrive for Business](/connectors/onedriveforbusiness)
- [OneNote (Business)](/connectors/onenote)
- [RSS](/connectors/rss)
- [Word Online (Business)](/connectors/wordonlinebusiness)

