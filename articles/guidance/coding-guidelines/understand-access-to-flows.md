---
title: Understand flow ownership and access
description: Learn about the different ownership models for Power Automate flows and how to manage access to your cloud flows.
#customer intent: As a Power Automate flow owner, I want to understand the different ownership models for Power Automate flows so that I can maintain stability, security, and compliance.
author: manuelap-msft
ms.subservice: guidance
ms.topic: best-practice
ms.date: 05/13/2025
ms.author: rachaudh
ms.reviewer: pankajsharma2087
contributors:
  - manuelap-msft
search.audienceType:
  - admin
  - flowmaker
---

# Understand flow ownership and access

Power Automate flows can be owned by either a service principal name (SPN) or a user account. The ownership model you choose can significantly affect the stability, security, and compliance of your flows. This article provides an overview of the different ownership models available for Power Automate flows and best practices for managing access to your cloud flows.

## Ownership of flows (service principal vs user)

It's important to carefully consider whether to use a service principal name or a user account as the owner of your Power Automate flows. Each ownership model has its advantages.

Advantages of SPN ownership include:

- **Consistency and stability**: Because SPNs aren't tied to individual users, your flows continue to run smoothly even if employees leave the company.

- **Enhanced security**: Using an SPN allows for stricter control over permissions. SPNs can be granted only the necessary access, reducing the risk of unauthorized actions.

- **Scalability**: SPNs are better suited for managing automated tasks across large environments, especially in scenarios that involve multiple flows or environments.

- **Compliance**: SPNs provide a clearer audit trail of actions taken by the flow, independent of specific users.

- **Reduced disruptions**: Because SPNs are unaffected by user account changes, such as employees leaving the organization, flows have a lower risk of disruptions.

- **Centralized management**: SPNs allow for centralized management of flow permissions and access, making it easier to maintain and audit security policies.

Advantages of user account ownership include:

- **Ease of setup**: Users can create and own flows with minimal setup, making it easier for them to develop and manage their own flows.

- **Human interaction**: If the flow involves tasks that require human approval, decision-making, or interaction, a user account might be more appropriate.

- **Personalized context**: Flows that are owned by users can run in the context of each user, using their permissions and settings.

### Ownership best practices

For critical or long-running flows, use a service principal name to ensure that the flow stays stable and independent of specific users.

For user-specific or interactive flows, use a user account when the flow needs the specific context of a user or involves user interaction.

## Co-ownership of flows

To share a cloud flow, add a co-owner. Co-owners of a cloud flow can perform the following actions:

- View the flow run history.
- Manage the properties of the flow; for example, start or stop the flow, add owners, or update credentials for a connection.
- Edit the flow; for example, add or remove an action or condition.
- Add or remove other owners, including guest users, but not the flow's creator.
- Delete the flow.

Only add co-owners as needed for flow collaboration. In most cases, if a flow needs to be shared, share it with run-only permissions, which restrict users from viewing the flow run history or making any changes. Sharing a flow also lets the owner specify whether it uses the connections of the user who invokes the flow or the built-in connections of the user or account that created the flow.

:::image type="content" source="media/run-only-users.png" alt-text="Screenshot of a flow in Power Automate that was shared with run-only permissions." lightbox="media/run-only-users.png":::

Learn more in [Share a cloud flow](/power-automate/create-team-flows).

## Use security roles for appropriate access

Some users can access flows based on their security roles on workflow tables or their role as environment admins. Generally, users with full access to workflow tables can edit any flow and view any run history. Environment admins always have full access to edit workflows and can view all the data that flows through them.
