---
title: Respond to personal data deletion requests (Azure AD)
description: Learn about the resources available in Power Automate to help you meet your obligations to delete customers' personal data under various privacy laws and regulations for users who authenticate using Azure AD.
author: hamenon-ms
contributors:
  - hamenon-ms
  - v-aangie
ms.author: hamenon
ms.reviewer: angieandrews
ms.subservice: cloud-flow
ms.topic: conceptual
ms.date: 04/14/2023
---

# Respond to personal data deletion requests (Azure AD)

[!INCLUDE [gdpr-intro](~/../shared-content/shared/privacy-includes/gdpr-intro.md)]

[!INCLUDE [gdpr-dsr-delete-note](~/../shared-content/shared/privacy-includes/gdpr-dsr-delete-note.md)]

The right to erasure allows data subjects to request the removal of their personal data, including system-generated logs but not audit logs, from an organization's customer data. Also, when a user leaves your organization, an admin must determine whether to delete data and resources that the user created as part of their Power Automate flows. Other personal data is automatically deleted when the user's account is deleted from Azure Active Directory (Azure AD).

The following table shows which personal data is automatically deleted, and which data requires an administrator to manually review and delete, for users who authenticate using Azure Active Directory (Azure AD).

| Requires manual review and deletion | Automatically deleted when the user is deleted from Azure AD |
| ------ | ------ |
| Environment* | System-generated logs  |
| Environment permissions** | Run history|
| Flows | Activity Feed |
| Flow permissions | Gateway |
| User details | Gateway permissions |
| Connections* | |
| Connection permissions | |
| Custom connector* | |
| Custom connector permissions | |

*Each of these resources contains "Created By" and "Modified By" records that include personal data. For security reasons, these records are retained until the resource is deleted.

**For environments that include a Microsoft Dataverse database, environment permissions (that is, which users are assigned to the Environment Maker and Admin roles) are stored as records in Dataverse. [Learn more about executing data requests against Dataverse customer data](/power-platform/admin/common-data-service-gdpr-dsr-guide).

The following table summarizes where to find and delete a user's personal data in Power Automate.

- **Website access:** Sign in to the [Power Apps admin center](https://admin.powerapps.com/) or the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
- **PowerShell access:** [Power Apps Admin PowerShell cmdlets](/power-platform/admin/powerapps-powershell)

| Resources containing personal data | Website access | PowerShell access | Automated Deletion |
| ----- | ---- | ---- | ---- |
| System-generated logs | [Office 365 Service Trust Portal](https://servicetrust.microsoft.com/) | | |
| Environment | Power Automate admin center | Power Apps cmdlets | |
| Environment permissions* | Power Automate admin center | Power Apps cmdlets | |
| Run history | | | Deleted through 28-day retention policy |
| Activity feed | | | Deleted through 28-day retention policy |
| User jobs | | | |
| Flows | Power Automate maker portal** | | |
| Flow permissions | Power Automate maker portal | | |
| User details | | Power Apps cmdlets | |
| Connections | Power Automate maker portal | | |
| Connection permissions | Power Automate maker portal | | |
| Custom connector | Power Automate maker portal | | |
| Custom connector permissions | Power Automate maker portal | | |
| Approval history | Power Apps maker portal* | | |

*For environments that include a Microsoft Dataverse database, environment permissions and model-driven app permissions are stored as records in Dataverse. [Learn more about executing data requests against Dataverse customer data](/power-platform/admin/common-data-service-gdpr-dsr-guide).

**An admin can access these resources from the Power Automate maker portal only if the administrator has been assigned access from the Power Automate admin center.

## Execute data deletion requests

> [!IMPORTANT]
> To avoid data corruption, follow these steps in order.

1. [Reassign and copy the user's flows](#reassign-and-copy-the-users-flows)
1. [Delete the user's approval history](#delete-the-users-approval-history)
1. [Delete connections created by the user](#delete-connections-created-by-the-user)
1. [Delete the user's permissions to shared connections](#delete-the-users-permissions-to-shared-connections)
1. [Delete custom connectors created by the user](#delete-custom-connectors-created-by-the-user)
1. [Delete the user's permissions to shared custom connectors](#delete-the-users-permissions-to-shared-custom-connectors)
1. [Delete or reassign environments created by the user](#delete-or-reassign-environments-created-by-the-user)
1. [Delete gateway settings](#delete-gateway-settings)
1. [Delete the user's details](#delete-the-users-details)
1. [Delete the user from Azure AD](#delete-the-user-from-azure-ad)

### Reassign and copy the user's flows

If a departing user, or a user who has requested the deletion of personal data has created flows that are widely used in your organization, don't delete them. Copy them, assign the copies to new owners, and establish new connections. Copying the flows deletes personal identifier linkages to the departing user.

1. Sign in to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select the environment that contains the user's flows.
1. Select **Resources** > **Flows**, and then select a flow to reassign.
1. Select **Manage sharing**, and add yourself as an owner.
1. Select **Save**.
1. Sign in to [Power Automate](https://make.powerautomate.com/).
1. Select **My flows** > **Team flows**.
1. In the list of flows, select the flow menu (**&vellip;**) for the flow you want to copy, and then select **Save As**.
1. Establish any connections that are required, and then select **Continue**.
1. Enter a new name for the flow, and then select **Save**.
1. Turn on the copied flow.
1. Delete the original flow.
1. Select the flow menu (**&hellip;**), and then select **Delete**.
1. Select **Delete** again when prompted.

### Delete the user's approval history

 Approval responses include personal information in the form of approval assignments and comments.

1. Sign in to [Power Automate](https://make.powerautomate.com) or [PowerApps](https://make.powerapps.com/).
1. On the left navigation pane, select **Data**, and then select **Tables**.
1. Selct the **All** tab.
1. Find the **Approvals** table and select the vertical ellipsis (&vellip;).
1. Select **Edit** or **Edit in new tab**.

    Alternatively, can select **Edit data in Excel** to work in Excel to delete the records.

1. If the **Owner** column doesn't appear, select the **+**(**number**) **more** column heading > **Owner** > **Save**.
1. Select the **Owner** column heading, and then select **Filter by**.
1. Enter the name of the user whose data you want to delete, and then select **Delete records**.
1. Go back to main tables list mentioned in you found in step 3.
1. Open the **Approval Requests** table and the **Approval Response** table, and repeat the steps 4 through 8 for those tables.

To learn more, go to [Responding to Data Subject Rights (DSR) requests for Microsoft Dataverse customer data](/power-platform/admin/common-data-service-gdpr-dsr-guide).

### Delete connections created by the user

Connections include references to the user who created them. Users may delete their own connections, and admins may delete users' connections, using PowerShell cmdlets. [Learn more about Power Apps PowerShell cmdlets](/power-platform/admin/powerapps-powershell).

The following PowerShell script deletes connections created by the user who runs the script:

```PowerShell
Add-PowerAppsAccount

#Retrieves all connections for the calling user and deletes them
Get-AdminPowerAppConnection | Remove-Connection
```

The following PowerShell script deletes connections created by the specified userID:

```PowerShell
Add-PowerAppsAccount

$deleteDsrUserId = "{userID}"
#Retrieves all connections for the specified userID and deletes them 
Get-AdminPowerAppConnection -CreatedBy $deleteDsrUserId | Remove-AdminConnection 

```

### Delete the user's permissions to shared connections

Users may delete their own connection role assignments for shared connections, and admins may delete users' connection permissions, using PowerShell cmdlets. [Learn more about Power Apps PowerShell cmdlets](/power-platform/admin/powerapps-powershell).

The following PowerShell script deletes connection role assignments for the user who runs the script:

```PowerShell
Add-PowerAppsAccount

#Retrieves all connection role assignments for the calling user and deletes them
Get-ConnectionRoleAssignment | Remove-ConnectionRoleAssignment
```

The following PowerShell script deletes connection role assignments for the specified userID:

```PowerShell
Add-PowerAppsAccount

$deleteDsrUserId = "{userID}"
#Retrieves all shared connections for the specified userID and deletes their permissions 
Get-AdminConnectionRoleAssignment -PrincipalObjectId $deleteDsrUserId | Remove-AdminConnectionRoleAssignment  

```

> [!NOTE]
> Owner role assignments can't be deleted without deleting the connection resource first.

### Delete custom connectors created by the user

Custom connectors include references to the user who created them. Users may delete their own custom connectors, and admins may delete users' custom connectors, using PowerShell cmdlets. [Learn more about Power Apps PowerShell cmdlets](/power-platform/admin/powerapps-powershell).

The following PowerShell script deletes custom connectors created by the user who runs the script:

```PowerShell
Add-PowerAppsAccount

#Retrieves all custom connectors for the calling user and deletes them
Get-Connector -FilterNonCustomConnectors | Remove-Connector
```

The following PowerShell script deletes connection role assignments for the specified userID:

```PowerShell
Add-PowerAppsAccount

$deleteDsrUserId = "{userID}"
#Retrieves all custom connectors created by the specified userID and deletes them 
Get-AdminConnector -CreatedBy $deleteDsrUserId | Remove-AdminConnector  
```

### Delete the user's permissions to shared custom connectors

Users cam delete their own custom connector role assignments, and admins can delete users' custom connector role assignments, using PowerShell cmdlets. [Learn more about Power Apps PowerShell cmdlets](/power-platform/admin/powerapps-powershell).

The following PowerShell script deletes custom connector role assignments for the user who runs the script:

```PowerShell
Add-PowerAppsAccount

#Retrieves all connector role assignments for the calling user and deletes them
Get-ConnectorRoleAssignment | Remove-ConnectorRoleAssignment
```

The following PowerShell script deletes custom connector role assignments for the specified userID:

```PowerShell
Add-PowerAppsAccount

$deleteDsrUserId = "{userID}"
#Retrieves all custom connector role assignments for the specified userID and deletes them 
Get-AdminConnectorRoleAssignment -PrincipalObjectId $deleteDsrUserId | Remove-AdminConnectorRoleAssignment  

```

> [!NOTE]
> Owner role assignments can't be deleted without deleting the connection resource first.

### Delete or reassign environments created by the user

As an admin responding to a user's data deletion request, you have two choices for each environment the user created:

- If you determine that the environment isn't being used by anyone else in your organization, you can delete it.
- If you determine that the environment is still required, you can add yourself or another user in your organization as an Environment Admin.

> [!IMPORTANT]
> Deleting an environment permanently deletes all resources in it, including apps, flows, connections, etc. Always review the contents of an environment before deleting it.

#### Delete the user's permissions in all environments or give other users access to the user's environments

You can remove the user's role assignments in all environments in your organization. You can also grant admin access to an environment created by the user. [Learn more about managing environments](environments-overview-admin.md).

### Delete gateway settings

[Learn more about responding to data export requests for on-premises data gateways](/power-bi/service-gateway-onprem#tenant-level-administration).

### Delete the user's details

Before you perform this step, make sure that you've reassigned and deleted all the user's flows. If you don't, the PowerShell cmdlet returns an error.

```PowerShell
Add-PowerAppsAccount
Remove-AdminFlowUserDetails -UserId {userID}
```

### Delete the user from Azure AD

The final step is to delete the user's Azure AD account.

[!INCLUDE [gdpr-dsr-azure-note](~/../shared-content/shared/privacy-includes/gdpr-dsr-azure-note.md)]

#### Delete the user from an unmanaged tenant

If the user is a member of an unmanaged tenant, you can close the user's account from the [Work and School Privacy portal](/azure/active-directory/enterprise-users/users-close-account).

To determine if you're a user of a managed or unmanaged tenant, perform the following actions:

1. Open the following URL in a browser, making sure to replace your email address in the URL:[https://login.microsoftonline.com/common/userrealm/foobar@contoso.com?api-version=2.1](https://login.microsoftonline.com/common/userrealm/foobar@contoso.com?api-version=2.1).

1. If yo're a member of an **unmanaged tenant**, then you'll see an `"IsViral": true` in the response.

    ```
        {
    
         "Login": "foobar@unmanagedcontoso.com",
    
        "DomainName": "unmanagedcontoso.com",
    
        "IsViral": true,
        
        }
    ```

1. Otherwise, you belong to a managed tenant.

[!INCLUDE [footer-include](includes/footer-banner.md)]
