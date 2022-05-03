---
title: Public APIs integration for Desktop Flow (Preview) | Microsoft Docs
description: add description.
author: benabbon
ms.topic: article
ms.date: 05/03/2022
ms.author: nabena
search.app: 
  - Flow
search.audienceType: 
  - developer
---
# Public APIs integration for desktop flows (preview)

As a developer, you can leverage [Desktop Flows](https://docs.microsoft.com/power-automate/desktop-flows/introduction) functionalities within your applications such as programatically triggering and cancelling a Desktop Flow.

Theses capabilities are offered as part of the Dataverse platform.

# Pre-requisites
1. Knowledge of [Dataverse Web API](https://docs.microsoft.com/power-apps/developer/data-platform/webapi/perform-operations-web-api), [Authentication with Dataverse](https://docs.microsoft.com/power-apps/developer/data-platform/authentication) and [Using OAuth with Dataverse](https://docs.microsoft.com/power-apps/developer/data-platform/authenticate-oauth)
2. Knowledge of Dataverse environment and organization notions, and how to retrieve the organization URL manually or programatically ([List environments](https://docs.microsoft.com/power-platform/admin/list-environments)]
3. Knowledge of Desktop Flows notions ([Run Desktop Flow](https://docs.microsoft.com/power-automate/desktop-flows/run-pad-flow))
4. Knowledge of what connections are and how to create them ([Setup desktop flows connections and machine credentials](https://docs.microsoft.com/power-automate/desktop-flows/install#setup-desktop-flows-connections-and-machine-credentials))

# List available Desktop Flows
Desktop Flow scripts are stored in Dataverse, as part of the [workflow entity](https://docs.microsoft.com/power-apps/developer/data-platform/reference/entities/workflow)
Listing the Desktop Flows is done through listing workflows and filtering on the category.
## Example
##### Request
```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/workflows?$filter=category+eq+6&$select=name,workflowid&$orderby=name HTTP/1.1  
```
##### Response
```json
{
    "@odata.context": "https://[Organization URI]/api/data/v9.2/$metadata#workflows(name,workflowid)",
    "value": [
        {
            "@odata.etag": "W/\"1069462\"",
            "name": "Desktop flow 1,
            "workflowid": "f091ffab-58bb-4630-a115-659453d56f59",
        },
        {
            "@odata.etag": "W/\"1028555\"",
            "name": "Desktop flow 2",
            "workflowid": "eafba1a2-e8d4-4efa-b549-11d4dfd9a3d1",
        }
    ]
}
```

### Desktop Flow Schema
If you need to retrieve the flow schema for inputs and/or outputs, you can leverage the clientData field for the target workflow.
##### Request
```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/workflows([Workflow Id])/clientdata/$value HTTP/1.1  
```
##### Response
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
# Retrieve status of a Desktop Flow run
Desktop Flow runs are stored in Dataverse, as part of the [flowsession entity](https://docs.microsoft.com/power-apps/developer/data-platform/reference/entities/flowsession)
## Example
##### Request
```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/flowsessions([Flow session ID])?$select=statuscode,statecode,startedon,completedon HTTP/1.1  
```
##### Response
```json
{
    "@odata.context": "https://[Organization URI]/api/data/v9.2/$metadata#flowsessions(statuscode,statecode,startedon,completedon)/$entity",
    "@odata.etag": "W/\"1276122\"",
    "statuscode": 8,
    "statecode": 0,
    "startedon": "2022-04-22T12:54:40Z",
    "completedon": "2022-04-22T12:57:46Z",
}
```
### Outputs
If the Desktop Flow has outputs, you can retrieve them by querying the outputs field.
##### Request
```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/flowsessions([Flow session ID])/outputs/$value HTTP/1.1  
```
##### Response
```json
{
    "Output1": "My output value"
}
```

# Trigger a Desktop Flow Run (Preview)
By leveraging Dataverse, you can add the functionaility of triggering a Desktop Flow through your application. To do this, you need to use the [RunDesktopFlow action](https://docs.microsoft.com/dynamics365/customer-engagement/web-api/rundesktopflow?view=dataverse-latest)

To do this, you'll need: 
- ID of the Desktop flow to run (Programatic retrieval detailled in the [listing](#list-available-desktop-flows) section above)
  - Alternatively, you can retrieve the ID manually from the Desktop Flow details URL in the Power Automate portal (More info on how to [manage Desktop Flows](https://docs.microsoft.com/power-automate/desktop-flows/manage)). The URL format is: 
`https://flow.microsoft.com/manage/environments/[Environment ID]/uiflows/[Desktop Flow ID]/details`
- Name of the Desktop Flow connection to use (i.e which machine/machine group to use). This can be retrieved from the URL of the said connection page in the Power Automate portal (More info on [Setup desktop flows connections and machine credentials](https://docs.microsoft.com/power-automate/desktop-flows/install#setup-desktop-flows-connections-and-machine-credentials)). The URL format is:  
`https://flow.microsoft.com/manage/environments/[Environment ID]/connections?apiName=shared_uiflow&connectionName=[Connection Name]`

## Example
##### Request
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
##### Response
```json
{
    "@odata.context": "https://[Organization URI]/api/data/v9.2/$metadata#Microsoft.Dynamics.CRM.RunDesktopFlowResponse",
    "flowsessionId": "d9687093-d0c0-ec11-983e-0022480b428a"
}
```
## Errors
When hitting an error, the response will have a different format matching Dataverse error messages. The http error code and the message should provide enough information to understand the issue. Example:
```http
HTTP/1.1 403 Forbidden

{
    "error": {
        "code": "0x80040220",
        "message": " Principal user (Id=526..., type=8) is missing prvReadworkflow privilege (Id=88...*)”
    }
}

```
