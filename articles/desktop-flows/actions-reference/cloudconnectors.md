---
title: Cloud Connectors in Power Automate for desktop 
description: Learn about the available Cloud Connector operations in Power Automate for desktop.
author: jpapadimitriou
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 10/14/2024
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

> [!IMPORTANT]
> There are some known connector action issues in older versions of Power Automate for Desktop (versions older than v2.44). If you're using Power Automate for desktop version 2.43 or earlier, you might experience issues where connector actions don't load correctly in desktop flows such as:
> - connector actions missing from the designer's action panel
> - "unknown action" errors in desktop flows linked to connector actions
> - incorrect console initiated executions (local runs) due to cloud connector actions  
>
> To resolve this issue, update Power Automate for desktop to the latest available version.
>
> For patched versions of previous releases, refer to the following list:
> - [2.43](https://go.microsoft.com/fwlink/?linkid=2272572)
> - [2.42](https://go.microsoft.com/fwlink/?linkid=2272571)  
> - [2.41](https://go.microsoft.com/fwlink/?linkid=2272390)  
> - [2.40](https://go.microsoft.com/fwlink/?linkid=2272389)  
> - [2.39](https://go.microsoft.com/fwlink/?linkid=2272570)
> - [2.38](https://go.microsoft.com/fwlink/?linkid=2272859)  

[Cloud Connectors available for Power Automate](/connectors/connector-reference/connector-reference-powerautomate-connectors) are gradually introduced for desktop flows as well.

## Prerequisites and limitations

- You need an Attended RPA license.
- Specific endpoints must be included in the allowlist for desktop flows containing cloud connector actions to work properly. More information: [Desktop flow services required for runtime](../../ip-address-configuration.md#services-required-for-desktop-flows-runtime)
- For **Office 365 Outlook** actions, if you're using an EWS application access policy, ensure that the following user-agents are allowed (on top of the user agents listed [here](/connectors/office365/#common-errors)) for successful desktop flow execution: PowerAutomateLocal/*, PowerAutomateCloud/*
- Dynamic output schema isn't fully supported for cloud connector actions in desktop flows. Refrain from using variables in the respective dropdown fields (Site address/ List name/ Select file etc.) while configuring a cloud connector action.
- Sharing desktop flows with cloud connector actions is currently supported with certain requirements. Learn more in [Share desktop flows that contain connector actions](../how-to/share-desktop-flows-that-contain-connector-actions.md). Learn about connector actions and their association with connections and connection references in [Use connector actions](../how-to/use-connector-actions.md).
- To enable attended or unattended runs (cloud-initiated runs), make sure your desktop flow uses the [Power Automate v2 schema](../schema.md) and all connection references are marked as embedded.
- Connection reference embedding is only available for co-owners. Users (run-only) can execute flows shared with them only via Power Automate for desktop's console using their own connections.
- Desktop flows with embedded connection references don't currently support application lifecycle management (ALM) capabilities.
- [Microsoft Dataverse](/connectors/commondataserviceforapps) has the following limitations:
  - The connector is currently available only for desktop flows in the public cloud.
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
- A few connector actions introduced in version 2.49 (both installer and Microsoft Store versions) might fail with the following error during designer, console, and cloud-initiated runs:

  `Operation 'HttpRequest' not found in connector '/providers/Microsoft.PowerApps/apis/shared_sharepointonline'.`

  The affected connector actions include:

  - SharePoint:
    - Grant access to an item or a folder
    - Send an HTTP Request to SharePoint
  - Teams:
    - Send a Microsoft Graph HTTP Request
  - Office 365 Outlook:
    - Send an HTTP Request

  This issue will be fixed in version 2.50.
  
## Use files in cloud connector actions

To pass a file as an input to a cloud connector action, you must first convert it to binary data, using the [Convert file to binary data](file.md#convertfiletobinaryaction) action.

Cloud connector actions that create or retrieve files actually produce binary data representing the respective files. To access the actual file, make sure to use the [Convert binary data to file](file.md#convertbinarytofileaction) action first.

## Embed connection references on a desktop flow (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../../includes/cc-beta-prerelease-disclaimer.md)]

With connection reference embedding, you can provide other co-owners access to your connection references and their underlying resources. You do this process only in the scope of the respective shared desktop flow.

[!INCLUDE [cc-preview-features-definition](../../includes/cc-preview-features-definition.md)]

To embed a connection reference to a flow, you have access to as a co-owner:

- Select the desktop flow in Power Automate (make.powerautomate.com), and then select **Details**.
- In the **Connection references** section, select **Manage.**

:::image type="content" source="media/cloudconnectors/manage_connection_references_button.png" alt-text="Screenshot of the Manage Connections button" border="false":::

- In the **Connection references** screen all of the connection references used in a flow are displayed.
- Set the **Embed in desktop flow** option to **Yes** to enable it.

:::image type="content" source="media/cloudconnectors/embed_a_connection_reference_to_a_flow.png" alt-text="Screenshot of the Manage Connections menu" border="false" lightbox="media/cloudconnectors/embed_a_connection_reference_to_a_flow.png":::

After you confirm your selection, the connection reference is embedded in the desktop flow.

> [!NOTE]
> You can only embed or remove connection references that you own. Connection references added by other co-owners can only be managed by them.

> [!IMPORTANT]
> To enable attended or unattended runs (cloud-initiated runs), make sure that your desktop flow uses the Power Automate v2 schema and all connection references are marked as embedded.

## Bring your own connection

All co-owners and run-only users are required to bring your own connection (BYOC) during console executions for connection references that aren't embedded.

:::image type="content" source="media/cloudconnectors/bring_your_own_connection.png" alt-text="Screenshot of the bring your own connection dialog for console runs" border="false":::

> [!NOTE]
> BYOC is available for both co-owners and run-only makers. BYOC is only available for console initiated flow executions.

## List of cloud connectors

The following is a list of cloud connectors in Power Automate for desktop that are currently available and permanently visible in the actions pane:

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

More cloud connectors (preview) are available to be added in a desktop flow through the Assets library:

- [Azure Container Instance](/connectors/aci)
- [Adobe Acrobat Sign](/connectors/adobesign)
- [Azure Resource Manager](/connectors/arm)
- [Asana](/connectors/asana)
- [Microsoft Entra ID](/connectors/azuread)
- [Azure Data Factory](/connectors/azuredatafactory)
- [Azure Monitor Logs](/connectors/azuremonitorlogs)
- [Azure VM](/connectors/azurevm)
- [Box](/connectors/box)
- [Content Conversion](/connectors/conversionservice)
- [Dynamics 365 Customer Insights](/connectors/customerinsights)
- [Power Query Dataflows](/connectors/dataflows)
- [Docusign](/connectors/docusign)
- [Dropbox](/connectors/dropbox)
- [Fin & Ops Apps (Dynamics 365)](/connectors/dynamicsax)
- [Dynamics 365 Business Central](/connectors/dynamicssmbsaas)
- [Excel Online (OneDrive)](/connectors/excelonline)
- [Power Automate Management](/connectors/flowmanagement)
- [GitHub](/connectors/github)
- [Google Calendar](/connectors/googlecalendar)
- [Google Drive](/connectors/googledrive)
- [Google Sheets](/connectors/googlesheet)
- [Google Tasks](/connectors/googletasks)
- [Azure Data Explorer](/connectors/kusto)
- [Microsoft 365 message center](/connectors/m365messagecenter)
- [Microsoft Bookings](/connectors/microsoftbookings)
- [Power Automate for Admins](/connectors/microsoftflowforadmins)
- [Dynamics 365 Customer Voice](/connectors/microsoftformspro)
- [MSN Weather](/connectors/msnweather)
- [Office 365 Groups](/connectors/office365groups)
- [Office 365 Groups Mail](/connectors/office365groupsmail)
- [Office 365 Users](/connectors/office365users)
- [Outlook.com](/connectors/outlook)
- [Planner](/connectors/planner)
- [Power Apps for Admins](/connectors/powerappsforadmins)
- [Power Apps for Makers](/connectors/powerappsforappmakers)
- [Power BI](/connectors/powerbi)
- [Power Platform for Admins](/connectors/powerplatformforadmins)
- [Project Online](/connectors/projectonline)
- [Project Roadmap](/connectors/projectroadmap)
- [Salesforce](/connectors/salesforce)
- [Shifts for Microsoft Teams](/connectors/shifts)
- [Smartsheet](/connectors/smartsheet)
- [Microsoft To-Do (Business)](/connectors/todo)
- [Trello](/connectors/trello)
- [X ](/connectors/twitter)
- [Azure DevOps](/connectors/visualstudioteamservices)
- [Webex](/connectors/webex)
- [Viva Engage](/connectors/yammer)

### Known limitations

- Creating a connection for a connector in desktop flows is supported through the sign-in dialog. If an error occurs during this process, you can create a connection through the corresponding [portal page](https://go.microsoft.com/fwlink/?linkid=2286334).

    :::image type="content" source="media/cloudconnectors/connector-banner-warning-to-create-connection-in-portal.png" alt-text="Screenshot of the sign in dialog in connector actions including a banner message" border="false":::
