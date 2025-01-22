---
title: Set a run owner on a Desktop Flow connection
description: Set a Service Principal identity as a run owner on a Desktop Flow connection by sending an HTTP PUT request to the Power Platform Service
author: iriverain
ms.topic: article
ms.date: 02/19/2024
ms.author: iriverain
ms.reviewer: iriverain
ms.subservice: desktop-flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Set a run owner on a Desktop Flow connection

> [!NOTE]
> This feature is only enabled for Public Preview.
A run owner of a Desktop Flow is the user whose permissions are checked during the flow execution.

To run a flow, a user needs:
- To have the "Environment Maker" role at minimum (defined in the Power Automate Admin Center).
- To have access to Dataverse entities used by the flow, including:
    - The machine or machine group (or hosted machine group, if applicable)
    - The Desktop Flow script
    - Credentials (if any on the connection)
    - Any dependency inside the desktop flow script (such as cloud connector, credential, etc.)
    - Work queues (if any used by the flow)

Connections created using the Power Automate Portal use the connection's creator (the user who creates the connection) as the run owner.

Users can now explicitly select a Microsoft Entra Identity as the run owner.

Only connections with an explicitly selected run owner can be shared with other users. In this case, recipients of Desktop Flows connection sharing are limited to Service Principal users.

## Restrictions

### Run owner identity restrictions
1. The explicit run owner needs to be of type Service Principal
2. The Service Principal needs to be registered in the same tenant as the connection creator
3. Connections with an explicit run owner only support certificate-based authentication

### Product restrictions
1. Connections with an explicit run owner can't be used to run desktop flow with non-embedded cloud flows.
2. "Connect with sign-in for attended runs" connections aren't supported.

> [!NOTE]
> The feature is available in Public Preview only. Some Desktop Flows features aren't supported until general availability:
> - Updates on connections credentials
> - [Machine Group password rotation](/power-automate/desktop-flows/manage-machine-groups#change-machine-groups-password)
### Connection restrictions
1. An explicit run owner identity can be update on a connection but it can't be removed. You need to create a new connection, without the run owner identity, if you want to remove the run owner identity on the connection.

## Prerequisite

Have a Service Principal User already setup in Microsoft Entra with a certificate based authentication.

## How to set up the Service Principal identity used as run owner

> [!IMPORTANT]
> In this article, you must replace all squared brackets [...] in URLs and input/output data with values specific to your scenario.
### Register the Service Principal identity as an environment application user

1. Add the Service Principal user as an application user on your environment: [Manage Application User](/power-platform/admin/manage-application-users)

2. Add the role "Environment Maker" to the application user: [Manage Roles for an Application User](/power-platform/admin/manage-application-users#manage-roles-for-an-application-user)

### Share Dataverse entities

| Entity  |  Link  |
|-------|---------------|
| Machine | [Share a machine](/power-automate/desktop-flows/manage-machines#share-a-machine) |
| Machine Group | [Share a machine group](/power-automate/desktop-flows/manage-machine-groups#share-a-machine-group) |
| Hosted Machine Group components | [Share hosted machine group components](/power-automate/desktop-flows/hosted-machine-groups)|
| Desktop Flow script | [Share a desktop flow](/power-automate/desktop-flows/how-to/share-export-desktop-flows)|
| Credential | [Share a credential](/power-automate/desktop-flows/create-azurekeyvault-credential#share-a-credential) |
| Work Queue | [Share a work queue](/power-automate/desktop-flows/work-queues-manage#share-a-work-queue)|

## Create a connection with a run owner

### Request an access token

First, request an access token to interact with the Power Platform API. More information: [Request an access token](/power-platform/admin/programmability-authentication-v2#step-5-request-an-access-token).

### Send a request to create a connection with run owner

To create a connection, send an `HTTP PUT` to the Power Apps API to create the connection, using the access token that you obtained earlier.

```HTTP
PUT https://[ENVIRONMENT_ID_URL].environment.api.powerplatform.com/connectivity/connectors/shared_uiflow/connections/[CONNECTION_ID]?api-version=1
Content-Type: application/json
Host: [ENVIRONMENT_ID_URL].environment.api.powerplatform.com
Accept: application/json
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJu...
```

| Placeholder  |  Description  | Example |
|-------|---------------|------|
| ENVIRONMENT_ID_URL | The environment ID, with all separators removed, and the last two characters separated by a period | 37520647-dbdf-49fa-ba01-6134c14680c4 -> 37520647dbdf49faba016134c14680.c4 |
| CONNECTION_ID | The connection ID used to create the connection. It needs to be a valid GUID. You can use the `New-Guid` PowerShell command to get this GUID. | a8a85e2f-1dec-44ce-8814-a37c34234317 |

The body content changes according to the type of machine credentials used.

If you use a credential, it needs to be shared to the Service Principal identity before creating the connection. More information: [Share a credential](/power-automate/desktop-flows/create-azurekeyvault-credential#share-a-credential)

Placeholders defined for the request body:

| Placeholder  |  Description  | Example |
|-------|---------------|------|
| ENVIRONMENT_ID | The environment ID | 37520647-dbdf-49fa-ba01-6134c14680c4 |
| DISPLAY_NAME | The connection display name in the Power Automate Portal | InvoiceAppConnection |
| CREDENTIAL_ID | The credential ID. More information: [Get the credential ID](#get-the-credential-id) | 81164aed-6905-445e-a190-d9c2a576f6c8 |
| ENVIRONMENT_VARIABLE_USERNAME | The name of the environment variable that contains the machine account name. More information: [Get an environment variable name](#get-an-environment-variable-name) | new_ContosoLogin |
| ENVIRONMENT_VARIABLE_PASSWORD | The name of the environment variable that contains password for the account. More information: [Get an environment variable name](#get-an-environment-variable-name) | new_ContosoPassword |
| GROUP_ID | The group ID you want to create the connection for. More information: [Get the group ID of the machine or group](#get-the-group-id-of-the-machine-or-group) | dd4cac14-0b49-475d-b274-3ad41a4e82a7 |
| APP_ID | The application Id (or client ID) of your Service Principal Identity that is used as run owner | 73ba3759-88a8-4107-b58c-fe71d1a4d171 |
| PFX | The base64 encoded string of your Service Principal Personal Information Exchange (PFX) certificate file. More information: [Get the base64 encoding of your certificate](#get-the-base64-encoding-of-your-service-principal-certificate) | MIIKdQIBA...ICB9A= |
| PASSWORD | The password of the Service Principal certificate. Can be left empty if null | |

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

#### Connection with Azure Key vault Password-based authentication credentials

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

#### Connection with Azure Key vault Certificate-based authentication credentials

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

### Connection Creation Response

Once the request is completed, you can see the newly created connection in the Power Automate Portal.
You can also use the connection for Desktop Flow executions if all necessary permissions are provided. See: [Share Dataverse entities](#share-dataverse-entities) 

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
- the `CONNECTION_ID`: ID of your new connection
- the `CONNECTION_STATUS`: the creation status.

> [!IMPORTANT]
> Check that the connection status received is `Connected`. You can receive a valid response (201 Created) with an invalid connection status.
If there's an error at the connection creation, the error details will appear in the response.

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

You can update an existing connection with new parameters (display name, credentials, run owner identity) using the same PUT request as for the Create Connection request (#create-a-connection-with-a-run-owner). Keep the same connection ID as the existing connection in the request URL.

> [!IMPORTANT]
> Removing a run owner on an existing identity isn't allowed. If you want to block the usage of a service principal, you can deactivate it in your Dataverse organization: [Deactivate an application user](/power-platform/admin/manage-application-users#activate-or-deactivate-an-application-user)
## Delete a connection with a run owner

You can delete the connection using the Delete button in the Connection page of the Power Automate Portal.

### Appendix

### Get the group ID of the machine or group

To be able to create the connection, get the group ID associated with the machine or machine group.

- If it's a group, you can go to **Monitor** > **Machines** > **Machine groups** and select the group. You can then get the group ID from the URL.
- If it's a machine, go to **Data** > **Tables** > **All** > **Flow Machine Group**. Search for your machine in the list and display the column **Flow Machine Group**, it's the group ID associated with your machine.

### Get the base64 encoding of your Service Principal certificate

You can use PowerShell to get it:

```powershell
$filePath = "C:\path\to\your\certificate.pfx"
$bytes = [System.IO.File]::ReadAllBytes($filePath)
$base64String = [System.Convert]::ToBase64String($bytes)
$base64String
```

### Get the credential ID

Go to **Data** > **Tables** > **All** > **Credential**. Search for your credential in the list and display the column **Credential**, it's the credential ID associated with your credential.

### Get an environment variable name

In the **Credential** page, select your credential and select the **View dependencies** button, then select **See in Solution**.
In the solution page, search for the environment variables used by your credential and look at the **Name** column.
The column value is the name of your environment variable.