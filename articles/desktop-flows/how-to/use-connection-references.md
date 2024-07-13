---
title: Use connection references
description: Learn how to use connection references in desktop flow actions.
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

In desktop flows, apart from the standand set of actions that comprise the action's library, you can also use some of the most popular [cloud connectors](../actions-reference/cloudconnectors.md). A connector is a proxy or a wrapper around an API that allows the underlying service to talk to Microsoft Power Automate, Microsoft Power Apps, and Azure Logic Apps. It provides a way for users to connect their accounts and use a set of prebuilt actions and triggers to build their apps and workflows. 

## Connections
Cloud Connectors require [connections](https://learn.microsoft.com/power-automate/add-manage-connections). In Power Automate, a connection refers to the authenticated link between Power Automate and an external service. This connection allows Power Automate to access and perform actions on data from various services, such as Office 365, SharePoint, SQL Server, Twitter, and many others. Each connection is specific to a user and requires authentication to ensure secure access to data and services. This is typically done using OAuth, API keys, or other authentication methods provided by the external service.

## Connection references
Desktop flows utilize [connection references](https://learn.microsoft.com/power-apps/maker/data-platform/create-connection-reference). In Power Automate, a connection reference is an abstraction layer that points to a specific connection used by actions within your flows. Instead of hardcoding connections directly into each action, connection references allow for a more modular and reusable approach, enabling easier management and sharing of flows, especially within Power Platform solutions.

## Key concepts of connection references

- **Abstraction**: A connection reference abstracts the connection details from the actions, allowing you to manage connections separately from the logic of the flow.

- **Reusability**: Connection references can be reused across multiple flows and environments, simplifying the process of updating connections if credentials or endpoints change.

- **Portability**: Using connection references makes it easier to move flows between different environments (e.g., development, testing, production) because the connection reference remains consistent, even if the actual connection details differ between environments.

- **Simplified Management**: By centralizing connection details, it becomes easier to update or replace connections without needing to modify each individual action that uses the connection.

> [!NOTE]
> Power Automate offers a few places to create 