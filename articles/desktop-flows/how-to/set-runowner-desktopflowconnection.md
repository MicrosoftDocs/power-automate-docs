---
title: Set a run owner on a desktop flow connection (preview)
description: Learn how to set a run owner on a desktop flow connection using a service principal identity in Power Automate (preview).
author: iriverain
ms.topic: article
ms.date: 03/17/2025
ms.author: iriverain
ms.reviewer: iriverain
ms.subservice: desktop-flow
search.audienceType:
  - flowmaker
  - enduser
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:01/24/2025
---

# Set a run owner on a desktop flow connection (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

When a connection is shared, the recipient can execute scripts, retrieve script IDs, and CloudConnector IDs, potentially performing unauthorized actions on behalf of the connection owner. This reason is why desktop flow connection sharing wasn't available.

To enable Application Lifecycle Management (ALM) with a pipeline owned by a service principal, a new "run owner" role is included in the desktop flow connection. This new role separates the connection owner from the run owner. Sharing a desktop flow connection with a service principal (also known as pipeline SPN) is only possible if the run owner is another service principal (also known as run owner SPN).

> [!IMPORTANT]
>
> - This is a preview feature.
> - Preview features aren’t meant for production use and might have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - This feature is gradually rolling out across regions and might not be available in your region.
> - A run owner of a desktop flow is the user whose permissions are checked during the flow execution.
> - Connections created using the Power Automate portal use the connection's creator (the user who creates the connection) as the run owner.

To run a flow, a user needs:

- To have the "Environment Maker" role at minimum (defined in the Power Automate admin center).
- To have access to Dataverse tables used by the flow, including:
  - The machine or machine group (or hosted machine group, if applicable)
  - The Desktop Flow script
  - Credentials (if any on the connection)
  - Any dependency inside the desktop flow script (such as cloud connector, credential, etc.)
  - Work queues (if used by the flow)

Users can now explicitly select a Microsoft Entra Identity as the run owner.

Only connections with an explicitly selected run owner can be shared with other users. In this case, recipients of desktop flow connection sharing are limited to service principal users.

## Restrictions

### Run owner identity restrictions

- The explicit run owner needs to be of type Service Principal.
- The service principal needs to be registered in the same tenant as the connection creator.
- Connections with an explicit run owner only support certificate-based authentication.

### Product restrictions

- Connections with an explicit run owner can't be used to run a desktop flow with non-embedded cloud flows.
- "Connect with sign-in for attended runs" connections aren't supported.

> [!NOTE]
> Some desktop flow features aren't supported until general availability:
> - Updates on connections credentials
> - [Machine Group password rotation](/power-automate/desktop-flows/manage-machine-groups#change-machine-groups-password)

### Connection restrictions

- An explicit run owner identity can be updated on a connection but it can't be removed. You need to create a new connection, without the run owner identity, if you want to remove the run owner identity on the connection.

## Prerequisite

Have a service principal user already set up in Microsoft Entra with certificate-based authentication.

## How to set up the service principal identity used as run owner

> [!IMPORTANT]
> In this article, replace all squared brackets `[...]` in URLs and input/output data with values specific to your scenario.

### Register the service principal identity as an environment application user

1. Add the service principal user as an application user on your environment. Learn more in [Manage Application User](/power-platform/admin/manage-application-users).

1. Add the "Environment Maker" role to the application user. Learn more in [Manage Roles for an Application User](/power-platform/admin/manage-application-users#manage-roles-for-an-application-user)

### Share Dataverse tables

The run owner needs to have access to all the Dataverse tables used by the flow during execution.

| Table  |  Link  |
|-------|---------------|
| Machine | [Share a machine](/power-automate/desktop-flows/manage-machines#share-a-machine) |
| Machine Group | [Share a machine group](/power-automate/desktop-flows/manage-machine-groups#share-a-machine-group) |
| Hosted Machine Group components | [Share hosted machine group components](/power-automate/desktop-flows/hosted-machine-groups)|
| Desktop Flow script | [Share a desktop flow](/power-automate/desktop-flows/how-to/share-export-desktop-flows)|
| Credential | [Share a credential](/power-automate/desktop-flows/create-azurekeyvault-credential#share-a-credential) |
| Work Queue | [Share a work queue](/power-automate/desktop-flows/work-queues-manage#share-a-work-queue)|

## Create a connection with a run owner

### Request an access token

First, request an access token to interact with the Power Platform API. Learn more in [Request an access token](/power-platform/admin/programmability-authentication-v2#step-5-request-an-access-token).

### Send a request to create a connection with run owner

To create a connection, send an `HTTP PUT` request to the Power Apps API to create the connection, using the access token you obtained earlier.

```HTTP
PUT https://[ENVIRONMENT_ID_URL].environment.api.powerplatform.com/connectivity/connectors/shared_uiflow/connections/[CONNECTION_ID]?api-version=1
Content-Type: application/json
Host: [ENVIRONMENT_ID_URL].environment.api.powerplatform.com
Accept: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJu...
```

| Placeholder  |  Description  | Example |
|-------|---------------|------|
| ENVIRONMENT_ID_URL | The environment ID, with all separators removed, and the last two characters separated by a period. | 00aa00aa-bb11-cc22-dd33-44ee44ee44ee -> 00aa00aabb11cc22dd3344ee44ee44ee |
| CONNECTION_ID | The connection ID used to create the connection. It needs to be a valid GUID. You can use the `New-Guid` PowerShell command to create a GUID. | aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb |

The body content changes according to the type of machine credentials used.

If you use a credential, it needs to be shared with the service principal identity before creating the connection. Learn more in [Share a credential](/power-automate/desktop-flows/create-azurekeyvault-credential#share-a-credential)

Placeholders defined for the request body:

| Placeholder  |  Description  | Example |
|-------|---------------|------|
| ENVIRONMENT_ID | The environment ID | 00aa00aa-bb11-cc22-dd33-44ee44ee44ee |
| DISPLAY_NAME | The connection display name in the Power Automate portal | InvoiceAppConnection |
| CREDENTIAL_ID | The credential ID. Learn more in [Get the credential ID](#get-the-credential-id) | bbbbbbbb-1111-2222-3333-cccccccccccc |
| ENVIRONMENT_VARIABLE_USERNAME | The name of the environment variable that contains the machine account name. Learn more in [Get an environment variable name](#get-an-environment-variable-name) | new_ContosoLogin |
| ENVIRONMENT_VARIABLE_PASSWORD | The name of the environment variable that contains the password for the account. Learn more in [Get an environment variable name](#get-an-environment-variable-name) | new_ContosoPassword |
| GROUP_ID | The group ID you want to create the connection for. Learn more in [Get the group ID of the machine or group](#get-the-group-id-of-the-machine-or-group) | dd4cac14-0b49-475d-b274-3ad41a4e82a7 |
| APP_ID | The application ID (or client ID) of your service principal identity that is used as run owner.| 00001111-aaaa-2222-bbbb-3333cccc4444 |
| PFX | The base64 encoded string of your service principal personal information exchange (PFX) certificate file. Learn more in [Get the base64 encoding of your certificate](#get-the-base64-encoding-of-your-service-principal-certificate) | MIIKdQIBA...ICB9A= |
| PASSWORD | The password of the service principal certificate. Can be left empty if null | |

#### Connection without credentials

```json
{
    "properties":
    {
        "environment":
        {
            "id": "/providers/Microsoft.PowerApps/environments/[ENVIRONMENT_ID]",
            "name":"[ENVIRONMENT_ID]"
        },
        "displayName": "[DISPLAY_NAME]",
        "connectionParametersSet":
        {
            "name":"azureRelayRunOwner",
            "values":
            {
                "username":{"value":"[MACHINE_ACCOUNT]"},
                "password":{"value":"[MACHINE_PASSWORD]"},
                "targetId":{"value":"[GROUP_ID]"},
                "tokenRunOwnerCert:clientId":{"value":"[APP_ID]"},
                "tokenRunOwnerCert:clientCertificateSecret":
                {
                    "value":
                    {
                        "pfx":"[PFX]",
                        "password":"[PASSWORD]"
                    }
                }
            }
        }
    }
}
```

#### Connection with Azure Key Vault password-based authentication credentials

```json
{
    "properties":
    {
        "environment":
        {
            "id": "/providers/Microsoft.PowerApps/environments/[ENVIRONMENT_ID]",
            "name":"[ENVIRONMENT_ID]"
        },
        "displayName": "[DISPLAY_NAME]",
        "credentialId": "[CREDENTIAL_ID]",
        "connectionParametersSet":
        {
            "name":"azureRelayRunOwner",
            "values":
            {
                "username":{"value":"@environmentVariables(\"[ENVIRONMENT_VARIABLE_USERNAME]\")"},
                "password":{"value":"@environmentVariables(\"[ENVIRONMENT_VARIABLE_PASSWORD]\")"},
                "targetId":{"value":"[GROUP_ID]"},
                "tokenRunOwnerCert:clientId":{"value":"[APP_ID]"},
                "tokenRunOwnerCert:clientCertificateSecret":
                {
                    "value":
                    {
                        "pfx":"[PFX]",
                        "password":"[PASSWORD]"
                    }
                }
            }
        }
    }
}
```

#### Connection with Azure Key Vault certificate-based authentication credentials

```json
{
    "properties":
    {
        "environment":
        {
            "id": "/providers/Microsoft.PowerApps/environments/[ENVIRONMENT_ID]",
            "name":"[ENVIRONMENT_ID]"
        },
        "displayName": "[DISPLAY_NAME]",
        "credentialId": "[CREDENTIAL_ID]",
        "connectionParametersSet":
        {
            "name":"azureRelayRunOwner",
            "values":
            {
                "username":{"value":"@environmentVariables(\"[ENVIRONMENT_VARIABLE_USERNAME]\")"},
                "password":{"value":"none"},
                "targetId":{"value":"[GROUP_ID]"},
                "tokenRunOwnerCert:clientId":{"value":"[APP_ID]"},
                "tokenRunOwnerCert:clientCertificateSecret":
                {
                    "value":
                    {
                        "pfx":"[PFX]",
                        "password":"[PASSWORD]"
                    }
                }
            }
        }
    }
}
```

#### Connection with Cyber Ark authentication credentials

```json
{
    "properties":
    {
        "environment":
        {
            "id": "/providers/Microsoft.PowerApps/environments/[ENVIRONMENT_ID]",
            "name":"[ENVIRONMENT_ID]"
        },
        "displayName": "[DISPLAY_NAME]",
        "credentialId": "[CREDENTIAL_ID]",
        "connectionParametersSet":
        {
            "name":"azureRelayRunOwner",
            "values":
            {
                "username":{"value":"@environmentVariables(\"[ENVIRONMENT_VARIABLE_USERNAME]\")"},
                "password":{"value":"none"},
                "targetId":{"value":"[GROUP_ID]"},
                "tokenRunOwnerCert:clientId":{"value":"[APP_ID]"},
                "tokenRunOwnerCert:clientCertificateSecret":
                {
                    "value":
                    {
                        "pfx":"[PFX]",
                        "password":"[PASSWORD]"
                    }
                }
            }
        }
    }
}
```

### Connection creation response

Once the request is completed, you can see the newly created connection in the Power Automate portal. You can also use the connection for desktop flow executions if all necessary permissions are provided. Learn more in [Share Dataverse tables](#share-dataverse-tables).

Response format:

```json
{
  "name": "[CONNECTION_ID]",
  "id": "/providers/Microsoft.PowerApps/apis/shared_uiflow/connections/[CONNECTION_ID]",
  "type": "Microsoft.PowerApps/apis/connections",
  "properties": {
    "statuses": [
      {
        "status": "[CONNECTION_STATUS]"
      }
    ],
  }
}  
```

The response contains:

- `CONNECTION_ID`: ID of your new connection
- `CONNECTION_STATUS`: the creation status

> [!IMPORTANT]
> Check that the connection status received is `Connected`. You can receive a valid response (201 Created) with an invalid connection status.
If there's an error creating the connection, the response shows the error details.

Error response:

```json
{
  "error": {
    "code": "ApiHubsRequestFailed",
    "message": "Aggregated detailed message",
    "details": [
      {
        "code": "ErrorCode",
        "message": "Error message",
        "details": [
          {
            "code": "Response Code",
            "message": "Error message"
          }
        ]
      }
    ]
  }
}
```

## Update a connection with a run owner

You can update an existing connection with new parameters (display name, credentials, run owner identity) using the same PUT request as for the [Create Connection request](#create-a-connection-with-a-run-owner). Keep the same connection ID as the existing connection in the request URL.

> [!IMPORTANT]
> Removing a run owner on an existing identity isn't allowed. If you want to block the usage of a service principal, you can deactivate it in your Dataverse organization. Learn more in [Deactivate an application user](/power-platform/admin/manage-application-users#activate-or-deactivate-an-application-user)

## Delete a connection with a run owner

You can delete the connection using the **Delete** button in the Connection page of the Power Automate portal.

### Appendix

### Get the group ID of the machine or group

To be able to create the connection, get the group ID associated with the machine or machine group.

- If it's a group, go to **Monitor** > **Machines** > **Machine groups** and select the group. You can then get the group ID from the URL.
- If it's a machine, go to **Data** > **Tables** > **All** > **Flow Machine Group**. Search for your machine in the list and display the column **Flow Machine Group**. It's the group ID associated with your machine.

### Get the base64 encoding of your service principal certificate

You can use PowerShell to get the base64 encoding of your service principal certificate:

```powershell
$filePath = "C:\path\to\your\certificate.pfx"
$bytes = [System.IO.File]::ReadAllBytes($filePath)
$base64String = [System.Convert]::ToBase64String($bytes)
$base64String
```

### Get the credential ID

To get the credential ID:

1. Go to **Data** > **Tables** > **All** > **Credential**.
1. Search for your credential in the list and display the column **Credential**. It's the credential ID associated with your credential.

### Get an environment variable name

To get an environment variable name:

1. In the **Credential** page, select your credential and select the **View dependencies** button
1. Select **See in Solution**.
1. In the solution page, search for the environment variables used by your credential and look at the **Name** column. The column value is the name of your environment variable.
