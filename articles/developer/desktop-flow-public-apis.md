---
title: Work with desktop flows using code | Microsoft Docs
description: Developer guide to integrate desktop flows capabilities within their applications.
author: benabbon
ms.topic: article
ms.date: 06/16/2022
ms.author: nabena
search.app: 
  - Flow
search.audienceType: 
  - developer
---
# Work with desktop flows using code

Developers can add [desktop flows](/power-automate/desktop-flows/introduction) functionality to their applications, including programmatically triggering and canceling desktop flows. These capabilities are offered as part of the Microsoft Dataverse platform.

## Prerequisites

1. Knowledge of [Dataverse Web API](/power-apps/developer/data-platform/webapi/perform-operations-web-api), [authentication with Dataverse](/power-apps/developer/data-platform/authentication) and [using OAuth with Dataverse](/power-apps/developer/data-platform/authenticate-oauth).
1. Knowledge of Dataverse environment and organization notions, and [how to retrieve the organization URL](/power-apps/developer/data-platform/webapi/discover-url-organization-web-api) manually or programmatically.
1. Knowledge of [desktop flows notions](/power-automate/desktop-flows/run-pad-flow) and of what [connections are and how to create them](/power-automate/desktop-flows/install#setup-desktop-flows-connections-and-machine-credentials).

> [!NOTE]
> In this article, you must replace all squared brackets [...] in URLs and input/output data with values specific to your scenario.

## List available desktop flows

All desktop flows scripts are in Dataverse as part of the [workflow entity](/power-apps/developer/data-platform/reference/entities/workflow).

Filter the list of workflows based on the category to identify desktop flows.

### Request to get desktop flows

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/workflows?$filter=category+eq+6&$select=name,workflowid&$orderby=name HTTP/1.1  
```

### Response to the request to get desktop flows

```json
{
    "@odata.context": "https://[Organization URI]/api/data/v9.2/$metadata#workflows(name,workflowid)",
    "value": [
        {
            "@odata.etag": "W1069462",
            "name": "Desktop flow 1",
            "workflowid": "f091ffab-58bb-4630-a115-659453d56f59",
        },
        {
            "@odata.etag": "W1028555",
            "name": "Desktop flow 2",
            "workflowid": "eafba1a2-e8d4-4efa-b549-11d4dfd9a3d1",
        }
    ]
}
```

## Get the schema for desktop flows

If you need to retrieve the flow schema for inputs and/or outputs, you can use the clientData field for the target workflow.

### Request schema for desktop flows

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/workflows([Workflow Id])/clientdata/$value HTTP/1.1  
```

### Response to the request to get the desktop flows schema

```json
{
    "clientversion": "2.19.00170.22097",
    "properties": {
        "definition": {
            "dependencies": [],
            "isvalid": true,
            "name": "Desktop Flow 1",
            "package": "UEsDBBQAAAAIAIqZlF...",
            "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#"
        },
        "inputs": {
            "schema": {
                "properties": {
                    "Input1": {
                        "default": "",
                        "description": "",
                        "format": null,
                        "title": "Input 1",
                        "type": "string",
                        "value": "0"
                    },
                    "Input2": {
                        "default": "",
                        "description": "",
                        "format": null,
                        "title": "Input2",
                        "type": "string",
                        "value": ""
                    }
                },
                "type": "object"
            }
        },
        "outputs": {
            "schema": {
                "properties": {
                    "Output1": {
                        "default": "",
                        "description": "",
                        "format": null,
                        "title": "Output",
                        "type": "string",
                        "value": null
                    }
                },
                "type": "object"
            }
        }
    },
    "schemaversion": "ROBIN_20211012",
    "targets": {
        "schema": {
            "properties": {},
            "type": "object"
        }
    }
}
```

## Get the status of a desktop flow run

Dataverse stores all desktop flow runs in the [flowsession entity](/power-apps/developer/data-platform/reference/entities/flowsession).

### Request the status of a desktop flow run

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/flowsessions([Flow session ID])?$select=statuscode,statecode,startedon,completedon HTTP/1.1  
```

### Response for the status of a desktop flow run

```json
{
    "@odata.context": "https://[Organization URI]/api/data/v9.2/$metadata#flowsessions(statuscode,statecode,startedon,completedon)/$entity",
    "@odata.etag": "W1276122",
    "statuscode": 8,
    "statecode": 0,
    "startedon": "2022-06-16T12:54:40Z",
    "completedon": "2022-06-16T12:57:46Z",
}
```

## Get desktop flow outputs

If the desktop flow has outputs, you can query the outputs field to retrieve them.

### Request for desktop flow outputs

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/flowsessions([Flow session ID])/outputs/$value HTTP/1.1  
```

### Response to the request for desktop flow outputs

```json
{
    "Output1": "My output value"
}
```

## Trigger a desktop flow run (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

By using Dataverse, you can add the functionality of triggering a desktop flow through your application. To do this, you need to use the [RunDesktopFlow action](/dynamics365/customer-engagement/web-api/rundesktopflow).

To call the action, you'll need the following information.

- The `ID` of the desktop flow that you want to run. You can get this ID via the API as the [List available desktop flows](#list-available-desktop-flows) section outlines earlier in this article.
  
  >[!TIP]
  > Alternatively, you can retrieve the ID manually from the desktop flow details URL in Power Automate. The URL format is: `https://flow.microsoft.com/manage/environments/[Environment ID]/uiflows/[Desktop Flow ID]/details`.
  >
  > Refer to [Manage desktop flows](/power-automate/desktop-flows/manage) for more information.

- The `name` of the desktop flow connection (target machine/machine group) to use to run your flow. The name can be retrieved from the URL of the same connection page in Power Automate. The URL format is:  
`https://flow.microsoft.com/manage/environments/[Environment ID]/connections?apiName=shared_uiflow&connectionName=[Connection Name]`.
  
  > [!NOTE]
  > See [Setup desktop flows connections and machine credentials](../desktop-flows/install.md#setup-desktop-flows-connections-and-machine-credentials) for more information.

### Request to trigger a desktop flow

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

POST https://[Organization URI]/api/data/v9.2/workflows([Workflow ID])/Microsoft.Dynamics.CRM.RunDesktopFlow HTTP/1.1  
{
    "runMode": "attended",
    "runPriority": "normal",
    "connectionName": "[Connection Name]",
    "timeout": 7200,
    "inputs": "{\"Input1\":\"Value\", \"Input2\":\"Value\"}"
}
```

### Response from request to trigger a desktop flow

```json
{
    "@odata.context": "https://[Organization URI]/api/data/v9.2/$metadata#Microsoft.Dynamics.CRM.RunDesktopFlowResponse",
    "flowsessionId": "d9687093-d0c0-ec11-983e-0022480b428a"
}
```

### Errors

When an error occurs, the response has a different format that matches Dataverse error messages. The http error code and the message should provide enough information to understand the issue.

```http
HTTP/1.1 403 Forbidden

{
    "error": {
        "code": "0x80040220",
        "message": " Principal user (Id=526..., type=8) is missing prvReadworkflow privilege (Id=88...*)”
    }
}
```

[!INCLUDE[footer-include](../includes/footer-banner.md)]
