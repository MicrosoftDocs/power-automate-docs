---
title: Cloud Connectors in Power Automate for desktop 
description: Learn about the available Cloud Connector operations in Power Automate for desktop.
author: jpapadimitriou
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/01/2025
ms.author: iomavrid
ms.reviewer: 
contributors:
  - DanaMartens
  - dipapa
search.audienceType: 
  - flowmaker
  - enduser
---

# Cloud Connectors as Power Automate for desktop actions

[Cloud Connectors available for Power Automate](/connectors/connector-reference/connector-reference-powerautomate-connectors) are now available for desktop flows as well.

## Prerequisites and limitations

- You need an Attended RPA license.
- Specific endpoints must be included in the allowlist for desktop flows containing cloud connector actions to work properly. More information: [Desktop flow services required for runtime](../../ip-address-configuration.md#allow-machines--users-on-your-network-to-access-power-automate-desktop-services)
- For **Office 365 Outlook** actions, if you're using an EWS application access policy, ensure that the following user-agents are allowed (on top of the user agents listed [here](/connectors/office365/#common-errors)) for successful desktop flow execution: PowerAutomateLocal/*, PowerAutomateCloud/*
- Sharing desktop flows with cloud connector actions is currently supported with certain requirements. Learn more in [Share desktop flows that contain connector actions](../how-to/share-desktop-flows-that-contain-connector-actions.md). Learn about connector actions and their association with connections and connection references in [Use connector actions](../how-to/use-connector-actions.md).
- To enable attended or unattended runs (cloud-initiated runs), make sure your desktop flow uses the [Power Automate v2 schema](../schema.md) and all connection references are marked as embedded, in case your flow is shared.
- The use of embedded connection references is only available for co-owners. Users (run-only) can run flows shared with them only via Power Automate for desktop's console using their own connections.
- The [Microsoft Dataverse](/connectors/commondataserviceforapps) connector supports the option *Current* in the *Environment* parameter of its operations in desktop flows. This option allows dynamic resolution based on the environment. This connector also has the following limitations:
  - The following actions are currently supported in desktop flows:
    - [Add a new row to selected environment](/connectors/commondataserviceforapps/#add-a-new-row-to-selected-environment)
    - [Delete a row from selected environment](/connectors/commondataserviceforapps/#delete-a-row-from-selected-environment)
    - [Download a file or an image from selected environment](/connectors/commondataserviceforapps/#download-a-file-or-an-image-from-selected-environment)
    - [Get a row by ID from selected environment](/connectors/commondataserviceforapps/#get-a-row-by-id-from-selected-environment)
    - [List rows from selected environment](/connectors/commondataserviceforapps/#list-rows-from-selected-environment)
    - [Perform a bound action in selected environment](/connectors/commondataserviceforapps/#perform-a-bound-action-in-selected-environment)
    - [Perform an unbound action in selected environment](/connectors/commondataserviceforapps/#perform-an-unbound-action-in-selected-environment)
    - [Relate rows in selected environment](/connectors/commondataserviceforapps/#relate-rows-in-selected-environment)
    - [Unrelate rows in selected environment](/connectors/commondataserviceforapps/#unrelate-rows-in-selected-environment)
    - [Update a row in selected environment](/connectors/commondataserviceforapps/#update-a-row-in-selected-environment)
    - [Upload a file or an image to selected environment](/connectors/commondataserviceforapps/#upload-a-file-or-an-image-to-selected-environment)

## Use files in cloud connector actions

To pass a file as an input to a cloud connector action, you must first convert it to binary data, using the [Convert file to binary data](file.md#convertfiletobinaryaction) action.

Cloud connector actions that create or retrieve files actually produce binary data representing the respective files. To access the actual file, make sure to use the [Convert binary data to file](file.md#convertbinarytofileaction) action first.

## Embed connection references on a desktop flow

With connection reference embedding, you can give other co-owners access to your connection references and their underlying resources. You do this process only in the scope of the respective shared desktop flow.

To embed a connection reference to a flow that you can access as an owner or co-owner:

- Select the desktop flow in Power Automate (make.powerautomate.com), and then select **Details**.
- In the **Connection references** section, select **Manage.**

    :::image type="content" source="media/cloudconnectors/manage_connection_references_button.png" alt-text="Screenshot of the Manage Connections button" border="false":::

- In the **Connection references** screen, all of the connection references used in the flow are displayed.
- Set the **Embedded in desktop flow** option to **Yes** to enable it.

    :::image type="content" source="media/cloudconnectors/embed_a_connection_reference_to_a_flow.png" alt-text="Screenshot of the Manage Connections menu" border="false" lightbox="media/cloudconnectors/embed_a_connection_reference_to_a_flow.png":::

After you confirm your selection, the connection reference is embedded in the desktop flow.

> [!NOTE]
> You can only embed or remove connection references that you own. Connection references added by other co-owners can only be managed by them.

> [!IMPORTANT]
> To enable attended or unattended runs (cloud-initiated runs), make sure that your desktop flow uses the Power Automate v2 schema and all connection references are marked as embedded, in case your flow is shared.

## Bring your own connection in console runs

If you're a co-owner, you need to bring your own connection (BYOC) in console runs for connection references that aren't embedded. If you're a run-only user, you need to bring your own connection, even if the connection references are embedded.

:::image type="content" source="media/cloudconnectors/bring_your_own_connection.png" alt-text="Screenshot of the bring your own connection dialog for console runs" border="false":::

> [!NOTE]
> The BYOC window is generally displayed during console initiated flow runs to owners, co-owners and run-only makers.

> [!IMPORTANT]
> The BYOC window is suppressed and isn't displayed if:
>  * Only user-owned connections exist for each connector used in the flow, and/or
>  * Embedded connections are also owned by the user running the flow, and
>  * All available connections for each connector correspond to the same email account, and
>  * Valid connections are available for all connectors.

## List of cloud connectors

These cloud connectors are added by default to desktop flows in Power Automate for desktop and are always visible in the actions pane:

- [Microsoft Dataverse](/connectors/commondataserviceforapps)
- [SharePoint](/connectors/sharepointonline)
- [Excel Online (Business)](/connectors/excelonlinebusiness)
- [Microsoft Forms](/connectors/microsoftforms)
- [Microsoft Teams](/connectors/teams)
- [Office 365 Outlook](/connectors/office365)
- [OneDrive](/connectors/onedrive)
- [OneDrive for work or school](/connectors/onedriveforbusiness)
- [OneNote (Business)](/connectors/onenote)
- [RSS](/connectors/rss)
- [Word Online (Business)](/connectors/wordonlinebusiness)

You can add the rest of the (non-custom) Power Automate cloud connectors to a desktop flow through the [Assets library](../assets-library.md#connectors-tab).

> [!NOTE]
> Future updates and additions to non-custom Power Automate connectors and their operations automatically appear in Power Automate for desktop.

### Known limitations

- Create a connection for a connector in desktop flows through the sign-in dialog. If an error occurs, create the connection through the corresponding [portal page](../../add-manage-connections.md#add-a-connection).

    :::image type="content" source="media/cloudconnectors/connector-banner-warning-to-create-connection-in-portal.png" alt-text="Screenshot of the sign in dialog in connector actions including a banner message" border="false":::

- Not all connection types are supported to be created through Power Automate for desktop. For these connectors, create a connection through the corresponding [portal page](../../add-manage-connections.md#add-a-connection).

    :::image type="content" source="media/cloudconnectors/connector-banner-prompt-to-create-connection-in-portal.png" alt-text="Screenshot of the connector actions including a banner message that prompts to create a connection through the portal" border="false":::

- To create a connection in Power Automate for desktop, install WebView2 on your machine.
