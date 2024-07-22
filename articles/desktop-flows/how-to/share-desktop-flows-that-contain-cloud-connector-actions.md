---
title: Share desktop flows that contain cloud connector actions
description: Learn how to share desktpo flows that contain cloud connnector actions.
author: jpapadimitriou

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/15/2024
ms.author: dipapa
ms.reviewer: 
contributors:
- jpapadimitriou
search.audienceType: 
  - flowmaker
  - enduser
---

# Sharing desktop flows that contain cloud connector actions

Sharing a desktop flow that utilizes cloud connectors follows the same principles as every other desktop flow as shown [here](https://learn.microsoft.com/power-automate/desktop-flows/manage#share-desktop-flows) but with a couple of extra requisite steps due to the connection references present in the respective desktop flows. 

> [!NOTE]
> Cloud Connectors require [connections](https://learn.microsoft.com/power-automate/add-manage-connections). In Power Automate, a connection refers to the authenticated link between Power Automate and an external service. This connection allows Power Automate to access and perform actions on data from various services, such as Office 365, SharePoint, SQL Server, Twitter, and many others. Each connection is specific to a user and requires authentication to ensure secure access to data and services. This is typically done using OAuth, API keys, or other authentication methods provided by the external service.

> [!IMPORTANT]
> Sharing a desktop flow does not automatically provide access to the underlying connections utilized. 

You can share a desktop flow that uses connections with 
- **users** (run-only level access) and/or
- **co-owners**

## Executing a shared desktop flow that contains cloud connector actions as a user

- Makers with **user** access on a shared desktop flow must always bring their own connections during execution. 
- They can only perform attended, console initiated runs.

Once you execute a shared desktop flow that contains cloud connector actions through the console you will be prompted by the **bring your own connection** dialog to provide a valid connection to be used. 

:::image type="content" source="media/share-desktop-flows-that-contain-cloud-connector-actions/bring-your-own-connection.png" alt-text="Screenshot of the BYOC dialog" border="false":::

> [!NOTE]
> In case there are compatible existing connections available, the first one will be selected by default.

## Executing a shared desktop flow that contains cloud connector actions as a co-owner



**Co-onwers** can also modify shared desktop flows on top of executing them. Co-owners have the ability to **embed** (preview) the connection references (and as a result their underlying connections) to the desktop flows they have access to. By embedding a connection reference to a desktop flow (preview) you allow other co-owners to have access to the underlying data provided by it, for both modifying as well as executing the respective desktop flow. 

> [!NOTE]
> You can only embed or remove connection references that you own from a desktop flow. Connection references added by other co-owners can only be managed by them.

> [!IMPORTANT]
> Embedded connection references are only available to other co-owners in the scope of the respective shared desktop flow.

### Cloud initated runs

For a desktop flows containing cloud connector actions to be successfully invoked by a cloud flow, it must fulfill the following two requirements:
- The desktop flow must use the [Power Automate v2 schema](../schema.md) and 
- all of its connection references must be marked as embedded.

To embed a connection reference to a flow, you have access to as a co-owner:

- Select the desktop flow in Power Automate (make.powerautomate.com), and then select **Details**.
- In the **Connection references** section, select **Manage.**

:::image type="content" source="media/share-desktop-flows-that-contain-cloud-connector-actions/manage_connection_references_button.png" alt-text="Screenshot of the Manage Connections button" border="false":::

- In the **Connection references** screen all of the connection references used in a flow are displayed.
- Set the **Embed in desktop flow** option to **Yes** to enable it.

:::image type="content" source="media/share-desktop-flows-that-contain-cloud-connector-actions/embed_a_connection_reference_to_a_flow.png" alt-text="Screenshot of the Manage Connections menu" border="false" lightbox="media/cloudconnectors/embed_a_connection_reference_to_a_flow.png":::

After you confirm your selection, the connection reference is embedded in the desktop flow.

### Console runs

Just as in the user use-case, once you execute a shared desktop flow that contains cloud connector actions through the console you will be prompted by the **bring your own connection** dialog to provide a valid connection to be used. 