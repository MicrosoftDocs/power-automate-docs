---
title: Create desktop flow connections
description: See how to create connections to trigger desktop flows from cloud flows.
author: georgiostrantzas
ms.subservice: desktop-flow
ms.topic: article
ms.date: 11/07/2022
ms.author: pefelesk
ms.reviewer: gtrantzas
contributors:
search.app: 
  - Flow 
search.audienceType: 
  - flowmaker
  - enduser
---

# Create desktop flow connections

> [!IMPORTANT]
> Before using a machine to run desktop flows from the cloud, ensure that the machine is secured and the machine's admins are trusted.

Before using the **Run desktop flow** action in your cloud flow to trigger a desktop flow, you need to create a connection to your machine. To create a connection:

1. Sign in to [Power Automate](https://powerautomate.microsoft.com), select **Connections**,  and then select **New connection**.

    :::image type="content" source="media/desktop-flows-setup/new-connection.png" alt-text="Screenshot of the option to create a new connection.":::

1. Search for **Desktop flows**, and then select the appropriate result.

1. Provide the machine (or on-premises data gateway) information and device credentials:

   - **Connect**: Select if you want to connect to a machine, a machine group or an on-premises data gateway.

      To connect to a machine or a machine group, select **Directly to machine**, and choose the appropriate machine or machine group in  **Machine or machine group**.

      :::image type="content" source="media/desktop-flows-setup/choose-machine.png" alt-text="Screenshot of the Directly to machine option in the Connect field.":::

      To connect to a gateway, select **Using an on-premises data gateway**, and choose the respective gateway in  **Choose a gateway**.

      :::image type="content" source="media/desktop-flows-setup/choose-gateway.png" alt-text="Screenshot of the Choose a gateway field.":::

   - **Domain and Username**: Provide your device account. To use a local account, populate the name of the user (for example, **MACHINENAME\\User** or **local\\User**) or an Active Directory account, such as **DOMAIN\\User**.

   - **Password**: Your account’s password.

      :::image type="content" source="media/desktop-flows-setup/credentials-screen.png" alt-text="Screenshot that shows where to enter the credentials for the connection.":::

1. Select **Create** to create the connection.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
