---
title: Manage connections to Dataverse
description: Learn how to manage and maintain connections for the Microsoft Dataverse connector. 
suite: flow
author: radioblazer
ms.author: matow
ms.reviewer: angieandrews
ms.topic: conceptual
ms.date: 02/10/2025
search.audienceType: 
  - maker
---

# Manage connections for the Microsoft Dataverse connector

The Microsoft Dataverse connector supports user, guest, and service principal connections for its triggers and actions. This document provides an overview of how connections work with the connector and how to keep them up to date.

## Use connections in the current environment

When using Dataverse connector actions and triggers in the current environment, connections work differently than other connectors due to the connector's direct integration with Dataverse. A valid connection is required when saving or publishing the flow, but actions and triggers continue running even if the connection expires, as long as the related user is still enabled and has sufficient permissions in Dataverse. To stop a flow from executing Dataverse actions, either turn off the flow and [cancel all runs](/power-automate/how-tos-bulk-resubmit), or [revoke the user's permissions in Dataverse](/power-platform/admin/database-security). 

For instant flows, including flows run from Power Apps, the **Run only users** tile on the flow's detail page allows the flow owner to choose whether their connections or the user's connections are used when the flow runs. To save a flow with Dataverse connector set to use connections provided by users, the flow owner saving the flow must have the Dataverse privilege **Act on behalf of another user** (prvActOnBehalfOfAnotherUser), or the **Delegate** role, which includes this privilege.

Similarly, for flows with the **When a row is created, modified, or deleted** trigger, the **Run as** option allows the flow owner to run other actions in the flow using either the identity of the user who modified the row, or the owner of the row in Dataverse. To use one of these options, the flow owner saving the flow must have the Dataverse privilege **Act on behalf of another user** (prvActOnBehalfOfAnotherUser), or the **Delegate** role, which includes this privilege.

## Use connections across environments

When using Dataverse actions and triggers that have the **Environment** parameter to connect to environments outside of the current environment, the connection must remain active for the actions and triggers to continue running. Actions with the **Environment** parameter don't yet support using connections provided by other users, or the **Run as** option in the **When a row is created, modified, or deleted** trigger.

## Use service principal connections with the Dataverse connector

To use a service principal as the connection for actions or triggers in the Dataverse connector:

1. Create a service principal in Microsoft Entra ID.
1. Create a new client secret for the service principal, and make note of the secret.
1. [Create an application user in Dataverse and associate it to the service principal](/power-automate/service-principal-support#prerequisites). 
1. Grant the application user sufficient Dataverse permissions for the tables and operations it needs to access or modify.
1. Open a Dataverse action in the cloud flows designer, select **Add new connection**, and choose **Connect with service principal** instead of **Sign in**. 
1. Create a connection to this service principal from the cloud flow designer by providing a name, the service principal's application ID, client secret, and tenant ID.

<!-- Add screenshots-->

## Use guest users connections

Guest users must have a Power Automate license and Dataverse permissions assigned before their connections can be used with the Dataverse connector.