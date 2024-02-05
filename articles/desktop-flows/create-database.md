---
title: Create a Microsoft Dataverse database
description: Learn how to create a Microsoft Dataverse database in Power Automate.
author: mattp123
ms.topic: conceptual
ms.date: 01/05/2023
ms.author: matp
ms.reviewer: matp
contributors:
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
ms.subservice: desktop-flow
ms.service: power-automate
ms.custom: bap-template
---

# Create a Microsoft Dataverse database

All the flows you create in Power Automate for desktop are stored in a Microsoft Dataverse database. There are several ways to create a Dataverse database. Environment administrators can create them in the [Power Platform admin center and in Power Apps](/power-platform/admin/create-database) and in [Power Automate for desktop](#create-a-dataverse-database-in-power-automate-for-desktop). Non-admins can [create a Dataverse database in Teams](#create-a-dataverse-database-in-teams).

## Create a Dataverse database in Power Automate for desktop

Users with administrative rights on their device can create a Dataverse database in Power Automate for desktop.

If you're using a free work or school account, a database is created automatically the first time you sign in with your account after you install Power Automate.

If your account is a premium account, select **Create database** the first time you sign in to Power Automate to create a Microsoft Dataverse database.

## Create a Dataverse database in Teams

You can use the approvals workflow in Teams to automatically create a Dataverse database that Power Automate can use to store flows. You need to follow this process only once per tenant, and even non-admins can do it.

1. Sign in to [Microsoft Teams](https://teams.microsoft.com/).

1. Select **More added apps (...)**.

1. Search for and install the **Approvals** app.

    :::image type="content" source="media/create-database/microsoft-teams-approvals.png" alt-text="Screenshot of selecting the Approvals app in Microsoft Teams.":::

1. In the upper-right corner of the **Approvals** page, select **New approval request**.

   :::image type="content" source="media/create-database/microsoft-teams-new-approval-request-button.png" alt-text="Screenshot of the New approval request button in Teams.":::

1. Name your request; for example, `Test`.

1. Search for and select your username in the **Approvers** list.

   :::image type="content" source="media/create-database/microsoft-teams-new-approval-request.png" alt-text="Screenshot of entering an approver for a new approval request.":::

1. Select **Send**.

    Sending the approval request starts the creation of a Dataverse database. It may take a few minutes to complete. When it's done, you'll receive a notification in Teams that you have a request for approval.

   :::image type="content" source="media/create-database/microsoft-teams-requested-approval.png" alt-text="Screenshot of the sent request for approval.":::

1. Approve the request. Your Dataverse database is now added to the default environment.

1. Exit Power Automate for desktop from the system tray icon to restart it.

   :::image type="content" source="media/create-database/system-tray.png" alt-text="Screenshot of the Power Automate icon in the system tray.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
