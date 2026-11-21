---
title: Work with desktop flows using code
description: Developer guide to integrate desktop flows capabilities within their applications.
author: benabbon
ms.topic: how-to
ms.date: 08/28/2026
ms.author: nabena
ms.reviewer: cyanderson
ms.service: power-automate
ms.subservice: developer
---
# Work with desktop flows using code

Developers can add [desktop flows](/power-automate/desktop-flows/introduction) functionality to their applications, including programmatically triggering and canceling desktop flows. The Microsoft Dataverse platform offers these capabilities.

## Prerequisites

1. Knowledge of [Dataverse Web API](/power-apps/developer/data-platform/webapi/perform-operations-web-api), [authentication with Dataverse](/power-apps/developer/data-platform/authentication), and [using OAuth with Dataverse](/power-apps/developer/data-platform/authenticate-oauth).
1. Knowledge of Dataverse environment and organization concepts, and [how to retrieve the organization URL](/power-apps/developer/data-platform/webapi/discover-url-organization-web-api) manually or programmatically.
1. Knowledge of [desktop flows concepts](/power-automate/desktop-flows/run-pad-flow) and of what [connections are and how to create them](/power-automate/desktop-flows/install#setup-desktop-flows-connections-and-machine-credentials).

> [!IMPORTANT]
> In this article, replace all square brackets [...] in URLs and input/output data with values specific to your scenario.

## List available desktop flows

Dataverse stores all desktop flow scripts as part of the [workflow entity](/power-apps/developer/data-platform/reference/entities/workflow).

Filter the list of workflows based on the category to identify desktop flows.

### Request to get desktop flows

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/workflows?$filter=category+eq+6&$select=name,workflowid&$orderby=name HTTP/1.1  
```

> [!NOTE]
> By default, this request returns only published desktop flows. To include unpublished (Draft) desktop flows in the response, add the `MSCRM.IncludeUnpublished` request header with the value `true`.

### Request to get desktop flows including unpublished (Draft) flows

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json
MSCRM.IncludeUnpublished: true

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

If you need to retrieve the flow schema for inputs or outputs, use the `clientData` field for the target workflow.

### Request inputs schema for desktop flows

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/workflows([Workflow Id])/inputs/$value HTTP/1.1  
```

### Response to the request to get the desktop flows inputs schema

```json
{
    "schema": {
        "properties": {
            "inputText": {
                "default": "",
                "description": "",
                "format": null,
                "title": "inputText",
                "type": "string",
                "value": ""
            },
            "inputInteger": {
                "default": "",
                "description": "",
                "format": null,
                "title": "inputInteger",
                "type": "number",
                "value": "0"
            }
        },
        "type": "object"
    }
}
```

### Request outputs schema for desktop flows

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

GET https://[Organization URI]/api/data/v9.2/workflows([Workflow Id])/outputs/$value HTTP/1.1  
```

### Response to the request to get the desktop flows outputs schema

```json
{
    "schema": {
        "properties": {
            "outputText": {
                "default": "",
                "description": "",
                "format": null,
                "title": "outputText",
                "type": "string",
                "value": null
            },
            "outputInteger": {
                "default": "",
                "description": "",
                "format": null,
                "title": "outputInteger",
                "type": "number",
                "value": null
            }
        },
        "type": "object"
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

If the desktop flow has outputs, query the `outputs` field to retrieve them.

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

## Trigger a desktop flow run

By using Dataverse, you can add the functionality of triggering a desktop flow through your application. To implement this functionality, use the [RunDesktopFlow action](/dynamics365/customer-engagement/web-api/rundesktopflow).

To call the action, you need the following information.

- The `ID` of the desktop flow that you want to run. Get this ID via the API as the [List available desktop flows](#list-available-desktop-flows) section outlines earlier in this article.
  
  >[!TIP]
  > Alternatively, retrieve the ID manually from the desktop flow details URL in Power Automate. The URL format is: `https://make.powerautomate.com/manage/environments/[Environment ID]/uiflows/[Desktop Flow ID]/details`.
  >
  > For more information, see [Manage desktop flows](/power-automate/desktop-flows/manage).

- The `name` of the desktop flow connection (targeting a machine or machine group) to use to run your flow. Retrieve the name from the URL of the same connection page in Power Automate. The URL format is:  
`https://make.powerautomate.com/manage/environments/[Environment ID]/connections?apiName=shared_uiflow&connectionName=[Connection Name]`.
  
  > [!NOTE]
  > For more information, see [Create desktop flow connections](../desktop-flows/desktop-flow-connections.md).

  >[!TIP]
  > Alternatively, use a connection reference's logical name as the input of the connection instead of the connection name (usage example described in the following section). The connection references are stored in the Dataverse table `connectionreference` and you can list them programmatically in the same way as desktop flows detailed in the [List available desktop flows](#list-available-desktop-flows) section.
  >
  > For more information, see [Use a connection reference in a solution](/power-apps/maker/data-platform/create-connection-reference) and [connectionreference table/entity reference](/power-apps/developer/data-platform/reference/entities/connectionreference).
  
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

### Request to trigger a desktop flow with a connection reference

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

POST https://[Organization URI]/api/data/v9.2/workflows([Workflow ID])/Microsoft.Dynamics.CRM.RunDesktopFlow HTTP/1.1  
{
    "runMode": "attended",
    "runPriority": "normal",
    "connectionName": "[Connection Reference Logical Name]",
    "connectionType": 2,
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

You can view the script inputs in the run details page on the Power Automate portal (in Preview).

> [!WARNING]
> When using the API, be aware of these limitations:
>
> - Trigger a desktop flow run by using an account with **User** privileges. To cancel the run or query the status, you need **Owner** privileges.
>
> - Dataverse impersonation isn't supported.
>
> - The input field content size is limited to 2 MB.

### Receive notification on script completion

An optional parameter "callbackUrl" is available in the body of the [RunDesktopFlow action](/dynamics365/customer-engagement/web-api/rundesktopflow).
You can use it if you want to be notified of your script completion.
A POST request will be sent to the provided URL when the script is complete.

#### Request received by the callback endpoint

```http
User-Agent: EnterpriseConnectors/1.0
Content-type: application/json; charset=utf-8
x-ms-workflow-id: [Workflow ID]
x-ms-run-id: [Flow session ID]

POST [yourCallbackURL]  
```

```json
{
    "statuscode": 4,
    "statecode": 0,
    "startedon": "2022-09-05T08:04:11Z",
    "completedon": "2022-09-05T08:04:41Z",
    "flowsessionid": "d9687093-d0c0-ec11-983e-0022480b428a"
}
```

If no callback URL parameter is provided, the flow session status should be polled from Dataverse (refers to [Get the status of a desktop flow run](#get-the-status-of-a-desktop-flow-run)).

>[!NOTE]
>
> - You can still use the status polling as a fallback mechanism even if you provide a callback URL parameter.
> - Your callback endpoint operation should be idempotent.
> - The POST request will be retried three times with one second interval if your endpoint responds with a Server Error response (code 500 and above) or a "Request Timeout" response (code 408).

Requirements for the callback URL parameter

- Your server must have the current [TLS and cipher suites](/power-platform/admin/server-cipher-tls-requirements).
- Only the HTTPS protocol is allowed.
- Access to localhost (loopback) isn't permitted.
- IP addresses can't be used. You must use a named web address that requires DNS name resolution.
- Your server must allow connections from [Power Platform and Dynamics 365 services IP address values specified under the AzureCloud service tag](/power-platform/admin/online-requirements#ip-addresses-required).

>[!TIP]
> As the callback call isn't authenticated, some precautions should be taken
>
> - Check the flow session Id validity when the callback notification is received. Dataverse is the source of truth.
> - Implement a rate limit strategy on your server side.
> - Try to limit the callback URL sharing between several organizations.

## Cancel a desktop flow run

Similar to the [Trigger](#trigger-a-desktop-flow-run) functionality, you can also cancel a queued or running desktop flow. To cancel a desktop flow, use the [CancelDesktopFlowRun action](/dynamics365/customer-engagement/web-api/canceldesktopflowrun).

### Request to cancel a desktop flow run

```http
Authorization: Bearer eyJ0eXAiOi...
Accept: application/json

POST https://[Organization URI]/api/data/v9.2/flowsessions(d9687093-d0c0-ec11-983e-0022480b428a)/Microsoft.Dynamics.CRM.CancelDesktopFlowRun HTTP/1.1  
```

### Response from a request to cancel a desktop flow

```json
HTTP/1.1 204 No Content
```

### Errors

When an error occurs, the response has a different format that matches Dataverse error messages. The HTTP error code and the message provide enough information to understand the issue.

```http
HTTP/1.1 403 Forbidden

{
    "error": {
        "code": "0x80040220",
        "message": " Principal user (Id=526..., type=8) is missing prvReadworkflow privilege (Id=88...*)”
    }
}
```

## Known limitations

- You can run up to 70 desktop flow runs per minute for each connection.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
