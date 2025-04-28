---
title: Use connector actions
description: Learn how to use connector actions in desktop flows.
author: jpapadimitriou

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/23/2024
ms.author: dipapa
ms.reviewer: 
contributors:
- jpapadimitriou
- DanaMartens
search.audienceType: 
  - flowmaker
  - enduser
---

# Use connector actions in desktop flows

In desktop flows, you can utilize not only the standard set of actions available in the action library but also some of the most popular [connectors](../actions-reference/cloudconnectors.md). These connectors act as proxies or wrappers around APIs, enabling the underlying services to communicate with Microsoft Power Automate, Microsoft Power Apps, and Azure Logic Apps. They allow users to link their accounts and use a collection of prebuilt actions and triggers to create their apps and workflows.

## Connections

Connectors require [connections](../../add-manage-connections.md). In Power Automate, a connection refers to the authenticated link between Power Automate and an external service. This connection allows Power Automate to access and perform actions on data from various services, such as Microsoft 365, SharePoint, SQL Server, and many others. Each connection is specific to a user and requires authentication to ensure secure access to data and services. This authentication is typically done using OAuth, API keys, or other authentication methods provided by the external service.

## Connection references

Desktop flows utilize [connection references](/power-apps/maker/data-platform/create-connection-reference). In Power Automate, a connection reference is an abstraction layer that points to a specific connection used by actions within your flows. Instead of hardcoding connections directly into each action, connection references allow for a more modular and reusable approach, enabling easier management and sharing of flows, especially within Power Platform solutions.

### Key concepts

The following are some key concepts of connection references:

- **Abstraction**: A connection reference abstracts the connection details from the actions, allowing you to manage connections separately from the logic of the flow.

- **Reusability**: Connection references can be reused across multiple flows and environments, simplifying the process of updating connections if credentials or endpoints change.

- **Portability**: Using connection references makes it easier to move flows between different environments (for example development, testing, production) because the connection reference remains consistent, even if the actual connection details are different between environments.

- **Simplified management**: By centralizing connection details, it becomes easier to update or replace connections without needing to modify each individual action that uses the connection.

## Use a connector action in desktop flows

In Power Automate for desktop, you can find some of the most popular connectors (for example, SharePoint, Office 365 Outlook, and OneDrive) in the standard library of actions. You can use their actions the same way every other action is utilized. Either double-click or drag and drop the desired action in the designer canvas.

If there are no compatible connection references available for the connector you want to use, a prompt appears for you to create a new connection reference.

:::image type="content" source="media/use-connector-actions/sign-in.png" alt-text="Screenshot of a connector action configuration if there are no compatible connection references" border="false":::

To select a connection reference, in the action configuration window, select the socket icon. Once you select it, all the available connection references compatible with the connector appear.

:::image type="content" source="media/use-connector-actions/viewing-availalble-connection-references.png" alt-text="Screenshot of the available connection references" border="false":::

To create a new connection reference, select the **Add new connection reference** button. You can use an existing connection that is compatible with the respective connector and create a new connection reference for it. Alternatively, you can create a new connection and include it in a new connection reference.

Once the connection reference is set up, you're all set. You can now access the underlying data and configure the respective action as desired.
