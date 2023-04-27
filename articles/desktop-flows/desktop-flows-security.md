---
title: Manage security for Power Automate
description: Manage security for Power Automate through built-in Dataverse roles.

ms.topic: conceptual
ms.date: 04/24/2023
ms.author: appapaio
ms.reviewer: ndoelman
contributors:
author: appapaio
search.audienceType: 
  - flowmaker
  - enduser
---

# Manage security for Power Automate

In order to manage security for Power Automate, it's important to understand the security concepts and terminology of [Microsoft Dataverse](https://learn.microsoft.com/power-apps/maker/data-platform/data-platform-intro), which is the underlying data platform for Power Platform components. Dataverse has a strong security model that uses security roles, teams, and business units to control access to tables, fields, and records using permission and row-level access control. Learn more about [**Dataverse security roles and privileges**](/power-platform/admin/security-roles-privileges).

In this article, we'll review the built-in security roles that ship for Power Automate Desktop flows.

> [!NOTE]
> **Dataverse data and configurations are environment-based**.
> Environments can be used to segregate data, security settings, customizations and resources by department, project, data residency and data privacy requirements, or organization. For example, you might have one environment for your sales team, another for your marketing team, and a third for your customer service team. This allows you to control access to resources and data at a granular level, and ensures that each team has access only to the resources they need.

## Dataverse access prerequisites

To access an environment, a user must meet the following criteria:

1. Be enabled for sign-in in Azure Active Directory (Azure AD).
2. Have a valid license that has a Microsoft Power Platform or Dynamics 365 recognized service plan.
3. Be a member of the environment's Azure AD group (if one has been associated with the environment).
4. Have at least one Dataverse security role assigned directly to them or to a group team they're a member of.

If you have difficulties connecting to Dataverse, review this troubleshooting page for [Common user access issues.](/power-platform/admin/troubleshooting-user-needs-read-write-access-organization)

## Dataverse security-related features

The following components are related to key security configurations in Dataverse.

1. **Security Role**: A security role is a collection of privileges that define the level of access that a user or team has to resources in Dataverse. Security roles are used to control access to tables, fields, and other resources in Dataverse.
2. **Business Unit**: A business unit is a logical container for users, teams, and other resources in Dataverse. Business units are used to define security boundaries and to control access to resources in Dataverse.
3. **Team**: A team is a group of users in Dataverse that share a common set of privileges. Teams 's used to simplify security management and to control access to resources in Dataverse.
4. **User**: A user is an individual who has access to Dataverse. Users are assigned security roles and are members of one or more business units.
5. **Privilege**: A privilege is a permission that controls access to tables, fields, and other resources in Dataverse. Privileges are used to define the level of access that a user or team has to a particular resource in Dataverse.
6. **Access Level**: An access level is a combination of privileges that define the level of access that a user or team has to a particular resource in Dataverse. Access levels are used to simplify security management and to control access to resources in Dataverse.
7. **Sharing**: Sharing is the process of granting access to a record or other resource in Dataverse to another user or team. Sharing is used to provide temporary or ad-hoc access to resources in Dataverse.
8. **Record-level Security**: Record-level security is the process of controlling access to individual records in Dataverse. Record-level security is used to ensure that users can only access the records that they're authorized to view or modify.
9. **Field-level Security**: Field-level security is the process of controlling access to individual fields in Dataverse. Field-level security is used to ensure that users can only view or modify the fields that they're authorized to access.

Overall, these concepts and terminology are used to define the security model in Dataverse, and are used to control access to resources in a granular and flexible way. By understanding these concepts and terminology, you can better manage security in Dataverse and ensure that your users have the appropriate level of access to resources.

### Dataverse privileges

The following table provides details about each specific table privilege:

| **Privilege** | **Description** |
|-------------------------|-------------------------|
| **Create** | Required to make a new record. Which records can be created depends on the access level of the permission defined in your security role. |
| **Read** | Required to open a record to view the contents. Which records can be read depends on the access level of the permission defined in your security role. |
| **Write** | Required to make changes to a record. Which records can be changed depends on the access level of the permission defined in your security role. |
| **Delete** | Required to permanently remove a record. Which records can be deleted depends on the access level of the permission defined in your security role. |
| **Append** | Required to associate the current record with another record. For example, a note can be attached to an opportunity if the user has Append rights on the note. The records that can be appended depend on the access level of the permission defined in your security role. In case of many-to-many relationships, you must have Append privilege for both tables being associated or disassociated. |
| **Append to** | Required to associate a record with the current record. For example, if a user has Append To rights on an opportunity, the user can add a note to the opportunity. The records that can be appended to depend on the access level of the permission defined in your security role. |
| **Assign** | Required to give ownership of a record to another user. Which records can be assigned depends on the access level of the permission defined in your security role. |
| **Share** | Required to give access to a record to another user while keeping your own access. Which records can be shared depends on the access level of the permission defined in your security role. |

For each specific privilege, there's a drop-down menu that allows you to define the access level. Access levels determine how deep or high in the business unit hierarchy the user can perform the specified privilege in the organization.

The following table lists the levels of access in the table, starting with the level that gives users the most access. Organization-owned tables, miscellaneous privileges, and privacy-related privileges will only have **Organization** or **None** types.

| **Type** | **Description** |
|-------------------------|-------------------------|
| **Organization** | This access level gives a user access to all records in the organization, regardless of the business unit hierarchical level that the environment or the user belongs to. Users who have organization access automatically have the other types of access as well. Because this access level gives access to information throughout the organization, it should be restricted to match the organization's data security plan. This level of access is typically reserved for managers with authority over the organization. |
| **Parent**: Child Business Unit | This access level allows a user to access records in their business unit and all business units below it. Users with this access level automatically have business unit and user access. Since this access level provides access to information across the business unit and its subordinates, it should be restricted to align with the organization's data security plan. This level of access is typically reserved for managers with authority over the business units. |
| **Business Unit** | This access level gives a user access to records in the user's business unit. Users who have business unit access automatically have user access. Because this access level gives access to information throughout the business unit, it should be restricted to match the organization's data security plan. This level of access is reserved for managers with authority over the business unit. |
| **User** | This access level gives a user access to records that the user owns, objects that are shared with the organization, objects that are shared with the user, and objects that are shared with a team that the user is a member of. This is the typical level of access for sales and service representatives. |
| **None** | No access is allowed. |

Privileges with their access levels are combined to create security roles, which are used to control access to resources in Dataverse. Security roles are assigned to users and teams to define their level of access to resources in Dataverse.

For example, you might create a security role that allows users to create, read, and update Desktop flows, but not delete them. You might also create a security role that allows users to access all tables and fields in Dataverse, or a security role that allows users to access only tables and fields that are owned by their team.

Overall, privileges are a key component of the security model in Dataverse, and are used to control access to resources in a granular and flexible way.

## Power Automate specific security roles

Following security roles are available out-of-the-box with Power Automate.

### Environment maker

The Environment Maker role in Dataverse is a built-in security role that lets users create and manage their resources associated with an environment. This includes apps, connections, custom APIs, gateways, cloud flows, and desktop flows, as long as the user has the appropriate license for the intended product area.
:::image type="content" source="media/desktop-flows-security-roles/environment-maker.png" alt-text="Screenshot of the permissions for the Environment Maker role.":::

Environment maker usage references:

- [Hosted machines](/articles/desktop-flows/hosted-machines#environment-maker-role)
- [Hosted machine groups](/articles/desktop-flows/hosted-machine-groups#environment-maker-role)

### Desktop Flows Machine Configuration Admin

This role is typically assigned to CoE or IT admins that manage VM images and virtual networks. Users with this role have full privileges on the VM image and VNet specific tables, which are used for hosted machine scenarios. In particular, this allows users with this role to add VM images, image versions and share/unshare VM images to be used for created hosted machine scenarios in their environment. You can find more information about sharing pre-provisioned VM Images in [Create hosted machine groups.](/articles/desktop-flows/hosted-machine-groups#create-hosted-machine-groups)
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-machine-configuration-admin.png" alt-text="Screenshot of the permissions for the Desktop Flow Machine Configuration Admin role.":::

### Desktop Flows Machine Owner

This role allows users to manage machines and machine groups they own, including creating, editing, sharing and deleting machines and machine groups.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-machine-owner.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine Owner role.":::

### Desktop Flows Machine User

This role allows users to run Desktop flows but not configure machines. A CoE may assign this role to other users in the environment, so that they can use machines created and shared by the CoE, but not edit or share them.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-machine-user.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine User role.":::

### Desktop Flows Machine User Can Share

This role extends the **Desktop Flows Machine User** and allows users to share machines that have been shared with them.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-machine-user-can-share.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine User Can Share role.":::

### Desktop Flows Module Developer

This role allows users to create, edit, and delete custom Power Automate Desktop actions.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-module-developer.png" alt-text="Screenshot of the permissions for the Desktop Flows Module Developer role.":::

### Desktop Flows Runtime Application User

Users with this role can run flows that are deployed to the Power Automate Desktop runtime, but can't create, edit, or delete flows. This role is typically assigned to users who need to run Power Automate Desktop flows on a runtime level, but don't need to create or manage flows.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-runtime-application-user.png" alt-text="Screenshot of the permissions for the Desktop Flows Runtime Application User role.":::

### Desktop Flows Machine Application User

This role is used by Power Automate cloud services when interacting with the Dataverse environment.
:::image type="content" source="media/desktop-flows-security-roles/desktop-flows-machine-application-user.png" alt-text="Screenshot of the permissions for the Desktop Flows Machine Application User role.":::

> [!NOTE]
> The Desktop Flows Machine Application User and Desktop Flows Machine Application User roles are used by the Power Automate cloud services when interacting with the Dataverse environment. Modifying privileges and configuration for these roles may break Desktop Flow features.

### More resources

- [Security in Microsoft Dataverse](/power-platform/admin/wp-security)
- [Security concepts in Microsoft Dataverse](/power-platform/admin/wp-security-cds)
- [Security roles in Microsoft Dataverse](/power-platform/admin/security-roles-privileges)
