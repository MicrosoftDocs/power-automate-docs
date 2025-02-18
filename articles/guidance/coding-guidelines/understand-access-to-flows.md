---
title: Understand access to Power Automate flows
description: Discover the benefits of using service principal names (SPNs) for managing Power Automate flows and maintaining compliance.
#customer intent: As an admin, I want to understand the different ownership models for Power Automate flows so that I can maintain stability, security, and compliance.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 02/07/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Understand access to Power Automate flows

Understanding the different ownership models available to Power Automate flows is key to maintaining the stability, security, and compliance of your flows.

## Ownership of flows (service principal vs user)

The flow owner plays a vital role in managing, controlling, and maintaining Power Automate flows. It's important to carefully consider whether to use a service principal name (SPN) or a user account as the flow owner. SPNs aren't tied to individual users, reducing the risk of disruptions, and they enable stricter control over permissions.


### Service principal name (SPN) ownership

Advantages of SPN ownership include:

- **Consistency**: SPNs aren't tied to individual users, ensuring that flows continue to run smoothly even if there are personnel changes. This configuration provides a stable and consistent ownership model.
- **Security**: Using an SPN enhances security by allowing stricter control over permissions. SPNs can be granted only the necessary access, reducing the risk of unauthorized actions.
- **Scalability**: SPNs are better suited for managing automated tasks across large environments, especially in scenarios involving multiple flows or environments.
- **Compliance**: Using SPNs can help maintain compliance, as they provide a clearer audit trail of actions taken by the flow, independent of specific users.
- **Reduced disruptions**: Since SPNs are unaffected by user account changes (such as employees leaving the organization), there's a lower risk of disruptions to flow operations.
- **Centralized management**: SPNs allow for centralized management of flow permissions and access, making it easier to maintain and audit security policies.

### User account ownership

Advantages of user account ownership include:

- **Ease of setup**: Users can create and own flows with minimal setup, making it easier for users to develop and manage their own flows.
- **Human interaction**: If the flow involves tasks that require human approval, decision-making, or interaction, a user account might be more appropriate.
- **Personalized context**: Flows owned by users can run in the context of that user, using their permissions and settings.

## Best practices

For critical or long-running flows, use a service principal name to ensure the flow stays stable and independent of specific users.

For user-specific or interactive flows, use a user account when the flow needs the specific context of a user or involves user interaction.

## Co-ownership of flows

Add a [co-owner](/power-automate/create-team-flows) to a cloud flow to share it. An owner of a cloud flow can perform these actions:

- View the run history
- Manage the properties of the flow (for example, start or stop the flow, add owners, or update credentials for a connection)
- Edit the definition of the flow (for example, add or remove an action or condition)
- Add or remove other owners (but not the flow's creator), including guest users
- Delete the flow

Only add co-owners for flow collaborations as needed. In most cases, if a flow needs to be shared, share it with run-only permissions, which restrict users from viewing the flow run history or making any changes. Sharing flows also lets the owner specify whether the flow uses the connections of the user invoking the flow or the built-in connections of the user or account creating the flow.

:::image type="content" source="media/run-only-users.png" alt-text="Screenshot of sharing the flow with run-only permissions." lightbox="media/run-only-users.png":::

Learn more: [Share a cloud flow](/power-automate/create-team-flows)

## Configuring security roles for appropriate access

In addition to assigning users as co-owners, certain users can access flows based on their security roles on workflow tables or their role as environment admins.

Generally, users with full access to workflow tables can edit any flow and view any run history. Environment admins always have full access to edit workflows and can view all the data that flows through them.