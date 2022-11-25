---
title: Create a Microsoft Dataverse database
description: See how to create a Microsoft Dataverse database.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 11/07/2022
ms.author: gtrantzas
ms.reviewer: marleon
contributors:
- PetrosFeleskouras
search.app: 
  - Flow 
search.audienceType: 
  - flowmaker
  - enduser
---

# Create a Microsoft Dataverse database

A Microsoft Dataverse database stores all flows created in Power Automate.

If you're an administrator or want to provide information to the administrator to create a Dataverse database, see [Add a Microsoft Dataverse database](/power-platform/admin/create-database).

## Create a Microsoft Dataverse database in Power Automate for desktop

Administrators can create a Microsoft Dataverse database in Power Automate for desktop.

If you're using a free work or school account, the provisioning will start automatically after signing in with your account. However, if your account is a premium account, select **Create database** to create a Microsoft Dataverse database.

:::image type="content" source="media/create-database/freeorg-create-db.png" alt-text="Screenshot of the setting up Dataverse screen.":::

## Add a Microsoft Dataverse database as a Microsoft Teams user

You can use the approvals experience in Teams to automatically add a Dataverse database that Power Automate can use to store flows. You need to follow this process only once per tenant, and even non-admins can perform it.

Follow the steps below to create an approval from the Approvals app in Teams:

1. Sign in to [Microsoft Teams](https://teams.microsoft.com/).

1. Select **More added apps (...)**.

1. Search for **Approvals**, and then select the appropriate app.

    :::image type="content" source="media/create-database/microsoft-teams-approvals.png" alt-text="Screenshot of the More added apps option in Microsoft Teams.":::

1. Select **New approval request** on the top right of the app.

   :::image type="content" source="media/create-database/microsoft-teams-new-approval-request-button.png" alt-text="Screenshot of the New approval request button.":::

1. Provide a name for your request.
   For example, **My first request**.

1. Populate your username in the **Approvers** list.

   :::image type="content" source="media/create-database/microsoft-teams-new-approval-request.png" alt-text="Screenshot of the fields to provide approvers.":::

1. Select **Send**. This step starts the process for adding a Dataverse database and may take a few minutes to complete. Once created, you'll receive a notification in Teams with a request for approval.

   :::image type="content" source="media/create-database/microsoft-teams-requested-approval.png" alt-text="Screenshot of the sent request for approval.":::

1. Approve the received request. Your Dataverse database is now added to the default environment.

1. Exit Power Automate for desktop from the system tray icon to restart it.

   :::image type="content" source="media/create-database/system-tray.png" alt-text="Screenshot of the Power Automate icon in the system tray.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
