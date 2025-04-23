---
title: Manage security for Power Automate
description: Manage security for Power Automate through built-in Dataverse roles.
ms.topic: conceptual
ms.date: 02/27/2024
ms.author: cgarty
ms.reviewer: ndoelman
contributors:
author: HeatherOrt
search.audienceType: 
  - flowmaker
  - enduser
---
# Manage security for Power Automate

In order to manage security for Power Automate, it's important to understand the security concepts and terminology of [Microsoft Dataverse](/power-apps/maker/data-platform/data-platform-intro), which is the underlying data platform for Power Platform components. Microsoft Dataverse has a strong security model that uses security roles, teams, and business units to control access to tables, fields, and records using permission and row-level access control. Learn more: [Dataverse security roles and privileges](/power-platform/admin/security-roles-privileges).

This article explains the built-in security roles that are available for Power Automate Desktop flows.

> [!NOTE]
> **Dataverse data and configurations are environment-based**.
> Environments can be used to segregate data, security settings, customizations and resources by department, project, data residency and data privacy requirements, or organization. For example, you might have one environment for your sales team, another for your marketing team, and a third for your customer service team. This allows you to control access to resources and data at a granular level, and ensures that each team has access only to the resources they need.

## Dataverse access prerequisites

To access an environment, a user must meet the following criteria:

1. Be enabled for sign-in in Microsoft Entra ID.
2. Have a valid license that has a Microsoft Power Platform or Dynamics 365 recognized service plan.
3. Be a member of the environment's Microsoft Entra group (if one has been associated with the environment).
4. Have at least one Dataverse security role assigned directly to them or to a group team they're a member of.

If you have difficulties connecting to Dataverse, review this troubleshooting page for [Common user access issues.](/power-platform/admin/troubleshooting-user-needs-read-write-access-organization)

## Dataverse security-related features

The following components are related to key security configurations in Dataverse.

- **Security role**: A security role is a collection of privileges that define the level of access that a user or team has to resources in Dataverse. Security roles are used to control access to tables, columns, and other resources in Dataverse.
- **Business unit**: A business unit is a logical container for users, teams, and other resources in Dataverse. Business units are used to define security boundaries and to control access to resources in Dataverse.
- **Team**: A team is a group of users in Dataverse that share a common set of privileges. Teams 's used to simplify security management and to control access to resources in Dataverse.
- **User**: A user is an individual who has access to Dataverse. Users are assigned security roles and are members of one or more business units.
- **Privilege**: A privilege is a permission that controls access to tables, columns, and other resources in Dataverse. Privileges are used to define the level of access that a user or team has to a particular resource in Dataverse.
- **Access level**: An access level is a combination of privileges that define the level of access that a user or team has to a particular resource in Dataverse. Access levels are used to simplify security management and to control access to resources in Dataverse.
- **Sharing**: Sharing is the process of granting access to a row or other resource in Dataverse to another user or team. Sharing is used to provide temporary or ad-hoc access to resources in Dataverse.
- **Record-level security**: Record-level security is the process of controlling access to individual rows (records) in Dataverse. Record-level security is used to ensure that users can only access the rows that they're authorized to view or modify.
- **Field-level security**: Field-level security is the process of controlling access to individual columns in Dataverse. Field-level security is used to ensure that users can only view or modify the columns that they're authorized to access.

Overall, these concepts and terminology are used to define the security model in Dataverse, and are used to control access to resources in a granular and flexible way. By understanding these concepts and terminology, you can better manage security in Dataverse and ensure that your users have the appropriate level of access to resources.

### Dataverse privileges

The following table provides details about each specific table privilege:

| **Privilege** | **Description** |
|-------------------------|-------------------------|
| **Create** | Required to make a new row. Which rows can be created depends on the access level of the permission defined in your security role. |
| **Read** | Required to open a row to view the contents. Which rows can be read depends on the access level of the permission defined in your security role. |
| **Write** | Required to make changes to a row. Which rows can be changed depends on the access level of the permission defined in your security role. |
| **Delete** | Required to permanently remove a row. Which rows can be deleted depends on the access level of the permission defined in your security role. |
| **Append** | Required to associate the current row with another row. For example, a note can be attached to an opportunity if the user has append rights on the note. The rows that can be appended depend on the access level of the permission defined in your security role. In case of many-to-many relationships, you must have append privilege for both tables being associated or disassociated. |
| **Append to** | Required to associate a row with the current row. For example, if a user has append To rights on an opportunity, the user can add a note to the opportunity. The records that can be appended to depend on the access level of the permission defined in your security role. |
| **Assign** | Required to give ownership of a row to another user. Which rows can be assigned depends on the access level of the permission defined in your security role. |
| **Share** | Required to give access to a row to another user while keeping your own access. Which rows can be shared depends on the access level of the permission defined in your security role. |

For each specific privilege, there's a drop-down menu that allows you to define the access level. Access levels determine how deep or high in the business unit hierarchy the user can perform the specified privilege in the organization.

The following table lists the levels of access in the table, starting with the level that gives users the most access. Organization-owned tables, miscellaneous privileges, and privacy-related privileges will only have **Organization** or **None** types.

| **Type** | **Description** |
|-------------------------|-------------------------|
| **Organization** | This access level gives a user access to all rows in the organization, regardless of the business unit hierarchical level that the environment or the user belongs to. Users who have organization access automatically have the other types of access as well. Because this access level gives access to information throughout the organization, it should be restricted to match the organization's data security plan. This level of access is typically reserved for managers with authority over the organization. |
| **Parent**: Child Business Unit | This access level allows a user to access rows in their business unit and all business units below it. Users with this access level automatically have business unit and user access. Since this access level provides access to information across the business unit and its subordinates, it should be restricted to align with the organization's data security plan. This level of access is typically reserved for managers with authority over the business units. |
| **Business Unit** | This access level gives a user access to rows in the user's business unit. Users who have business unit access automatically have user access. Because this access level gives access to information throughout the business unit, it should be restricted to match the organization's data security plan. This level of access is reserved for managers with authority over the business unit. |
| **User** | This access level gives a user access to rows that the user owns, objects that are shared with the organization, objects that are shared with the user, and objects that are shared with a team that the user is a member of. This is the typical level of access for sales and service representatives. |
| **None** | No access is allowed. |

Privileges with their access levels are combined to create security roles, which are used to control access to resources in Dataverse. Security roles are assigned to users and teams to define their level of access to resources in Dataverse.

For example, you might create a security role that allows users to create, read, and update Desktop flows, but not delete them. You might also create a security role that allows users to access all tables and fields in Dataverse, or a security role that allows users to access only tables and fields that are owned by their team.

Overall, privileges are a key component of the security model in Dataverse, and are used to control access to resources in a granular and flexible way.

> [!NOTE]
>
> To run a desktop flow, you need these minimum privileges:
> - Basic Append, AppendTo, Create and Write privileges on the `flowsession` table.
> - Basic Append, AppendTo, Create and Write privileges on the `workflowbinary` table.
> - Basic Read privilege on the `workflow` table.
> - Basic Read privilege on the `desktopflowbinary` table.

## Power Automate specific security roles

Following security roles are available out-of-the-box with Power Automate.

### Environment maker

The environment maker role in Dataverse is a built-in security role that lets users create and manage their resources associated with an environment. This includes apps, connections, custom APIs, gateways, cloud flows, and desktop flows, as long as the user has the appropriate license for the intended product area.
:::image type="content" source="media/desktop-flows-security-roles/environment-maker.png" alt-text="Screenshot of the permissions for the Environment Maker role." lightbox="media/desktop-flows-security-roles/environment-maker.png":::

### Desktop flows machine configuration admin

This role is typically assigned to CoE or IT admins that manage VM images and virtual networks. Users with this role have full privileges on the VM image and VNet specific tables, which are used for hosted machine scenarios. In particular, this allows users with this role to add VM images, image versions and share/unshare VM images to be used for created hosted machine scenarios in their environment.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-machine-configuration-admin.png" alt-text="Screenshot of the permissions for the Desktop Flow Machine Configuration Admin role." lightbox="media/desktop-flows-security-roles/desktop-flows-machine-configuration-admin.png":::

### Desktop Flows Machine Owner

This role allows users to manage machines and machine groups they own, including creating, editing, sharing, and deleting machines and machine groups.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-machine-owner.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine Owner role." lightbox="media/desktop-flows-security-roles/desktop-flows-machine-owner.png":::

### Desktop flows machine user

This role allows users to run Desktop flows but not configure machines. A CoE might assign this role to other users in the environment, so that they can use machines created and shared by the CoE, but not edit or share them.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-machine-user.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine User role." lightbox="media/desktop-flows-security-roles/desktop-flows-machine-user.png":::

### Desktop flows machine user can share

This role extends the **desktop flows machine user** role and allows users to share machines that have been shared with them.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-machine-user-can-share.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine User Can Share role." lightbox="media/desktop-flows-security-roles/desktop-flows-machine-user-can-share.png":::

### Desktop flows runtime application user

This role is used by Power Automate cloud services when interacting with the Dataverse environment.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-runtime-application-user.png" alt-text="Screenshot of the permissions for the Desktop Flows Runtime Application User role." lightbox="media/desktop-flows-security-roles/desktop-flows-runtime-application-user.png":::

### Desktop flows machine application user

This role is used by Power Automate cloud services when interacting with the Dataverse environment.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-machine-application-user.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine Application User role." lightbox="media/desktop-flows-security-roles/desktop-flows-machine-application-user.png":::

> [!NOTE]
> The desktop flows runtime application user and desktop flows machine application user roles are used by the Power Automate cloud services when interacting with the Dataverse environment. Modifying privileges and configuration for these roles may break desktop flow features.

### More resources

- [Security in Microsoft Dataverse](/power-platform/admin/wp-security)
- [Security concepts in Microsoft Dataverse](/power-platform/admin/wp-security-cds)
- [Security roles in Microsoft Dataverse](/power-platform/admin/security-roles-privileges)