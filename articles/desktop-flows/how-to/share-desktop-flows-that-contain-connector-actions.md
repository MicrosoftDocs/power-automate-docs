---
title: Share desktop flows that contain connector actions
description: Learn how to share desktop flows that contain connector actions.
author: jpapadimitriou
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 07/01/2025
ms.author: dipapa
ms.reviewer: 
contributors:
- jpapadimitriou
- DanaMartens
- yiannismavridis
search.audienceType: 
  - flowmaker
  - enduser
---

# Share desktop flows that contain connector actions

Sharing a desktop flow that uses connectors follows the same principles as any other desktop flow. However, there are a few more steps required due to the connection references in the desktop flows.

> [!NOTE]
> Connectors require [connections](../../add-manage-connections.md). In Power Automate, a connection refers to the authenticated link between Power Automate and an external service. This connection allows Power Automate to access and perform actions on data from various services, such as Office 365, SharePoint, SQL Server, and many others. Each connection is specific to a user and requires authentication to ensure secure access to data and services. This is typically done using OAuth, API keys, or other authentication methods provided by the external service.

> [!IMPORTANT]
> Sharing a desktop flow does not automatically provide access to the underlying connections utilized.

You can share a desktop flow that uses connections with:

- users (run-only level access)
- co-owners

## Run a shared desktop flow that contains connector actions as a user

Makers with user access on a shared desktop flow must always bring their own connections when they run the flow. They can only perform attended console initiated runs.

Once you run a shared desktop flow that contains connector actions through the console, a prompt appears for you to provide a valid connection to be used. This prompt will be suppressed and not appear, if there's only one available valid connection per connector (or more connections corresponding to the same email account).

:::image type="content" source="media/share-desktop-flows-that-contain-connector-actions/bring-your-own-connection.png" alt-text="Screenshot of the dialog for you to add a connection." border="false":::

If there are compatible existing connections available, the first one is selected by default.

## Run a shared desktop flow that contains connector actions as a co-owner

Co-owners have the ability to modify shared desktop flows in addition to running them. Co-owners have the ability to *embed* the connection references (and as a result their underlying connections) to the desktop flows they have access to. By embedding a connection reference to a desktop flow, you allow other co-owners to have access to the underlying data provided by it, for both modifying as well as running the desktop flow.

> [!NOTE]
> You can only embed or remove connection references that you own from a desktop flow. Connection references added by other co-owners can only be managed by them.

> [!IMPORTANT]
> Embedded connection references are only available to other co-owners in the scope of the shared desktop flow.

### Cloud initiated runs

To successfully invoke a desktop flow containing connector actions from a cloud flow, it must meet the following two requirements:

- The desktop flow must use the [Power Automate v2 schema](../schema.md).
- All of its connection references must be marked as embedded, if you are a co-owner of the flow.

To embed a connection reference to a flow that you have access to as a co-owner:

1. Select the desktop flow in [Power Automate](https://make.powerautomate.com) and then select **Details**.
1. In the **Connection references** section, select **Manage.**

    :::image type="content" source="media/share-desktop-flows-that-contain-connector-actions/manage_connection_references_button.png" alt-text="Screenshot of the Manage Connections button." border="false":::

    In the **Connection references** screen, all of the connection references used in a flow are displayed.
1. Set the **Embedded in desktop flow** option to **Yes** to enable it.

    :::image type="content" source="media/share-desktop-flows-that-contain-connector-actions/embed_a_connection_reference_to_a_flow.png" alt-text="Screenshot of the Manage Connections menu." border="false":::

1. After you confirm your selection, the connection reference is embedded in the desktop flow.

#### Known limitations

##### Required connection references not automatically included when importing desktop flows

When importing a desktop flow with embedded connection references in a solution, the required connection references aren't automatically included. To work around this current limitation, explicitly include the required connection references in the solution alongside the desktop flow.

### Console runs

Similar to the user use-case, when you run a shared desktop flow with connector actions through the console, a prompt appears for you to provide a valid connection to be used. This prompt will be suppressed and not appear, if there's only one available valid connection per connector (or more connections corresponding to the same email account).
