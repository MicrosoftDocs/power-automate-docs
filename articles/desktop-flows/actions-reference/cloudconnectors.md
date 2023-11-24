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
- Sharing desktop flows with cloud connector actions is not currently supported. Co-owners won't be able to run such desktop flows unless they overwrite the connection references with their own. **Users** with read access are unable to run such flows.


## List of Cloud Connectors currently available in Power Automate for desktop
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

