---
title: Use cloud connector actions
description: Learn how to use cloud connector actions in desktop flows.
author: jpapadimitriou

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/10/2024
ms.author: dipapa
ms.reviewer: 
contributors:
- jpapadimitriou
search.audienceType: 
  - flowmaker
  - enduser
---

# Using cloud connector actions in desktop flows

In desktop flows, apart from the standard set of actions that comprise the action's library, you can also use some of the most popular [cloud connectors](../actions-reference/cloudconnectors.md). A connector is a proxy or a wrapper around an API that allows the underlying service to talk to Microsoft Power Automate, Microsoft Power Apps, and Azure Logic Apps. It provides a way for users to connect their accounts and use a set of prebuilt actions and triggers to build their apps and workflows. 

## Connections
Cloud Connectors require [connections](https://learn.microsoft.com/power-automate/add-manage-connections). In Power Automate, a connection refers to the authenticated link between Power Automate and an external service. This connection allows Power Automate to access and perform actions on data from various services, such as Office 365, SharePoint, SQL Server, Twitter, and many others. Each connection is specific to a user and requires authentication to ensure secure access to data and services. This is typically done using OAuth, API keys, or other authentication methods provided by the external service.

## Connection references
Desktop flows utilize [connection references](https://learn.microsoft.com/power-apps/maker/data-platform/create-connection-reference). In Power Automate, a connection reference is an abstraction layer that points to a specific connection used by actions within your flows. Instead of hardcoding connections directly into each action, connection references allow for a more modular and reusable approach, enabling easier management and sharing of flows, especially within Power Platform solutions.

## Key concepts of connection references

- **Abstraction**: A connection reference abstracts the connection details from the actions, allowing you to manage connections separately from the logic of the flow.

- **Reusability**: Connection references can be reused across multiple flows and environments, simplifying the process of updating connections if credentials or endpoints change.

- **Portability**: Using connection references makes it easier to move flows between different environments (for example development, testing, production) because the connection reference remains consistent, even if the actual connection details differ between environments.

- **Simplified Management**: By centralizing connection details, it becomes easier to update or replace connections without needing to modify each individual action that uses the connection.

## Using a cloud connector action in desktop flows

In Power Automate for desktop can find some of the most popular cloud connectors (for example SharePoint, Office 365 Outlook, OneDrive for business etc.) in the standard library of actions. You can use their actions in the exact same manner every other action is utilized, either double click or drag-n-drop the desired action in the designer canvas.

> [!NOTE]
> In case there are no connection references present compatible with the respective connector you want to use, you will be first prompted to create a new connection reference.

:::image type="content" source="media/use-cloud-connector-actions/sign-in.png" alt-text="Screenshot of a cloud connector action configuration if there are no compatible connection references" border="false":::

To select a connection reference, in the action configuration window click on the socket icon. Once you click it, all the available connection references compatible with the connector appear.

:::image type="content" source="media/use-cloud-connector-actions/viewing-availalble-connection-references.png" alt-text="Screenshot of the available connection references" border="false":::

To create a new connection reference click on the **Add new connection reference button**. There you can either use an existing connection compatible with the respective connector and create a new connection reference to wrap-around it or create a new connection and include it in a new connection reference.

Once the connection reference is ready, you're good to go. You can now access underlying data and configure the respective action as pleased.