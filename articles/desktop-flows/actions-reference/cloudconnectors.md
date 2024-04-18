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

- You need an Attended RPA (Robotic Process Automation) license.
- Specific endpoints must be included in the allowlist for desktop flows containing cloud connector actions to work properly. More information: [Desktop flow services required for runtime](../../ip-address-configuration.md#desktop-flows-services-required-for-runtime)
- For **Office 365 Outlook** actions, if you're using an EWS application access policy, ensure that the following user-agents are allowed (on top of the user agents listed [here](https://learn.microsoft.com/connectors/office365/#common-errors)) for successful desktop flow execution: PowerAutomateLocal/*, PowerAutomateCloud/*
- Dynamic output schema isn't fully supported for cloud connector actions in desktop flows. Refrain from using variables in the respective dropdown fields (Site address/ List name/ Select file etc.) while configuring a cloud connector action.
- Sharing desktop flows with cloud connector actions isn't currently supported. Co-owners aren't able to run such desktop flows unless they overwrite the connection references with their own. **Users** with read access are unable to run such flows.
- [Microsoft Dataverse (preview)](/connectors/commondataserviceforapps) has the following limitations:
  - The connector is currently available only for desktop flows under **public cloud**.
  - The following actions are currently supported in desktop flows
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
  - 


## List of Cloud Connectors currently available in Power Automate for desktop
- [Microsoft Dataverse (preview)](/connectors/commondataserviceforapps)
- [SharePoint](/connectors/sharepointonline)
- [Excel Online (Business)](/connectors/excelonline)
- [Microsoft Forms](/connectors/microsoftforms)
- [Microsoft Teams](/connectors/teams)
- [Office 365 Outlook (preview)](/connectors/office365)
- [OneDrive](/connectors/onedrive)
- [OneDrive for Business](/connectors/onedriveforbusiness)
- [OneNote (Business) (preview)](/connectors/onenote)
- [RSS](/connectors/rss)
- [Word Online (Business)](/connectors/wordonlinebusiness)

