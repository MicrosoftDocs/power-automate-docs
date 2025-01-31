---
title: Understand access to flows
description: Learn how to understand access to flows
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 01/31/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Understand access to flows

## Ownership of flows (service principal vs user) 

When managing Power Automate flows, the choice between using a Service Principal Name (SPN) or a user account as the flow owner is important. SPNs aren't tied to individual users, ensuring that flows can continue running smoothly even if personnel changes happen. This setup reduces the risk of disruptions and allows for stricter control over permissions, as SPNs can be granted only the necessary access.

### Service Principal Name (SPN) ownership

Advantages of Service Principal Name (SPN) ownership:

- **Consistency**: SPNs aren't tied to individual users, ensuring that flows continue to run smoothly even if there are personnel changes. This configuration provides a stable and consistent ownership model.
- **Security**: Using an SPN enhances security by allowing for stricter control over permissions. SPNs can be granted only the necessary access, reducing the risk of unauthorized actions.
- **Scalability**: SPNs are better suited for managing automated tasks across large environments, especially in scenarios involving multiple flows or environments.
- **Compliance**: Using SPNs can help maintain compliance, as they provide a clearer audit trail of actions taken by the flow, independent of specific users.
- **Reduced disruptions**: Since SPNs aren't affected by user account changes (such as employees leaving the organization), there's a lower risk of disruptions to the flow operations.
- **Centralized management**: SPNs allow for centralized management of flow permissions and access, making it easier to maintain and audit security policies.

### User account ownership

Advantages of user account ownership:

- **Ease of setup**: Users can create and own flows with minimal setup, making it easier for users to develop and manage their own flows.
- **Human interaction**: If the flow involves tasks that require human approval, decision-making, or interaction, using a user account might be more appropriate.
- **Personalized context**: Flows owned by users can run in the context of that user, utilizing their permissions and settings

## Best Practices

For critical or long-running flows, use a Service Principal Name (SPN) to ensure the flow remains stable and independent of specific users.

For user-specific or interactive flows, use a user account when the flow needs the specific context of a user or involves user interaction.

## Co-Ownership of Flows

Adding a [co-owner](/power-automate/create-team-flows) to a cloud flow is the most common way to share a cloud flow. Any owner of a cloud flow can perform these actions:

- View the run history.
- Manage the properties of the flow (for example, start or stop the flow, add owners, or update credentials for a connection).
- Edit the definition of the flow (for example, add or remove an action or condition).
- Add or remove other owners (but not the flow's creator), including guest users.
- Delete the flow.

Only add co-owners for flow collaborations as needed. In most cases, if flow needs to be shared, share the flow with run-only permissions, which restricts the users from viewing the flow run history or making any changes to the flows. Sharing flows also allows the owner to specify whether the flow uses the connections of the user invoking the flow or the inbuilt connections of the user or account creating the flow. 

:::image type="content" source="media/run-only-users.png" alt-text="A screenshot of sharing the flow with run-only permissions":::

Learn more: [Share a cloud flow](/power-automate/create-team-flows)

## Configuring security roles for appropriate access

In addition to assigning users as co-owners, certain users can access flows based on their security roles on Workflow tables or their role as environment admins.

Generally, users with full access to Workflow tables can edit any flow and view any run history. Likewise, environment admins always have full access to edit workflows and view all the data that flows through them.