---
title: Flows are now stored in Dataverse and use the rich Web API
description: Flows are now stored in Dataverse and use the rich Web API.
author: msftman
ms.reviewer: deonhe
ms.date: 11/30/2021
ms.subservice: cloud-flow
ms.topic: article
ms.prod: 

ms.technology: 
ms.author: deonhe
audience: Power user
---

# Power Automate Web API

Going forward, all flows will be stored in Dataverse and leverage [the rich Web API](/powerapps/developer/common-data-service/webapi/perform-operations-web-api).

This content covers the management of flows included on the **Solutions** tab in Power Automate. Currently, flows under **My Flows** are not supported by these APIs.

## Compose HTTP requests

To get started creating requests, you'll need to first construct the URL. The format for the base URL of the Power Automate Web API is: `https://{Organization ID}.{Regional Subdomain}.dynamics.com/api/data/v9.1/`. The two parameters are:

- The **Organization ID** is a unique name for the environment that stores your flows.

- The **Regional Subdomain** depends on the location of your environment.

To get these two parameters.

1. Go to the [Power Platform admin center](https://admin.powerplatform.microsoft.com/).
1. Select the environment you use to build your flows.

 ![Environment for your flows.](media/web-api/power-platform-admin-center.png "Environment for your flows")

1. Copy the organization id and region subdomain from the environment URL.

 ![Organization id and region.](media/web-api/power-platform-admin-center-environment-URL.png "Organization id and region.")

You can also programmatically get the list of instances that are available to you via the [Get Instances](/rest/api/admin.services.crm.dynamics.com/instances/getinstances) method in the online management API.

Each request to the Web API must have the `Accept` and `Content-type` headers set to `application/json`.

Finally, populate the `Authorization` header with an Azure AD Bearer token. You can [learn](/powerapps/developer/common-data-service/authenticate-oauth) how to acquire an Azure AD Bearer token for Dataverse. For example, this request:

```http
GET https://org00000000.crm0.dynamics.com/api/data/v9.1/workflows
Accept: application/json
Authorization: Bearer ey...
```

The response contains the list of flows from within that environment:

```http
{
	"@odata.context": "https://org00000000.crm0.dynamics.com/api/data/v9.1/$metadata#workflows",
	"value": [{
		"@odata.etag": "W/\"12116760\"",
		"category": 5,
		"statecode": 0,
		"workflowidunique": "00000000-0000-0000-0000-000000000001",
		"workflowid" : "00000000-0000-0000-0000-000000000002",
		"createdon": "2018-11-15T19:45:51Z",
		"_ownerid_value": "00000000-0000-0000-0000-000000000003",
		"modifiedon": "2018-11-15T19:45:51Z",
		"ismanaged": false,
		"name": "Sample flow",
		"_modifiedby_value": "00000000-0000-0000-0000-000000000003",
		"_createdby_value": "00000000-0000-0000-0000-000000000003",
		"type": 1,
		"description": "This flow updates some data in Dataverse.",
		"clientdata": "{\"properties\":{\"connectionReferences\":{\"shared_commondataservice\":{\"source\":\"NotSpecified\",\"id\":\"/providers/Microsoft.PowerApps/apis/shared_commondataservice\",\"tier\":\"NotSpecified\"}},\"definition\":{...}},\"schemaVersion\":\"1.0.0.0\"}"
	}]
}
```

## List flows

As shown earlier, you can get the list of workflows by calling `GET` on `workflows`. Each workflow has many properties, but the most relevant are:

| Property name     | Description                                              |
| ----------------- | -------------------------------------------------------- |
| category          | The category of the flow. Here are the different categories. <br>0 - Classic Dataverse workflows.<br>1 - Classic Dataverse dialogs. <br>2 - Business rules. <br>3 - Classic Dataverse actions. <br>4 - Business process flows. <br>5 - Automated, instant or scheduled flows.<br>6 - Desktop flows. |
| statecode         | The status of the flow. The status can be **0** - off or **1** - on.|
| workflowidunique  | The unique identifier for this installation of the flow. |
| workflowid        | The unique identifier for a cloud flow across all imports. |
| createdon         | The date when the flow was created. |
| _ownerid_value    | The unique identifier of the user or team who owns the flow. This is an id from the systemusers table in Dataverse. |
| modifiedon        | The last time the flow was updated. |
| ismanaged         | Indicates if the flow was installed via a managed solution. |
| name              | The display name that you have given the flow. |
| _modifiedby_value | The last user who updated the flow. This is an id from the systemusers table in Dataverse. |
| _createdby_value  | The user who created the flow. This is an id from the systemusers table in Dataverse. |
| type              | Indicates if the flow is a running flow, or a template that can be used to create additional flows. 1 - flow, 2 - activation or 3 - template. |
| description       | The user-provided description of the flow. |
| clientdata        | A string-encoded JSON of an object that contains the connectionReferences and the definition of the flow. |

The [documentation for the Dataverse workflow](/powerapps/developer/data-platform/reference/entities/workflow) has additional information about properties/fields and their usage.

You can also request specific properties, filter the list of flows, and much more, as described in the [Dataverse API documentation for querying data](/powerapps/developer/common-data-service/webapi/query-data-web-api). For example, this query returns only the automated, instant, or scheduled flows that are currently on:

```http
GET https://org00000000.crm0.dynamics.com/api/data/v9.1/workflows?$filter=category eq 5 and statecode eq 1
Accept: application/json
Authorization: Bearer ey...
```

## Create a cloud flow

Call `POST` on the `workflows` collection to create a cloud flow. The required properties for automated, instant, and scheduled flows are: category, name, type, primaryentity, and clientdata. Use `none` for the primaryentity for these types of flows.

You can also provide a description and statecode.

```http
POST https://org00000000.crm0.dynamics.com/api/data/v9.1/workflows
Accept: application/json
Authorization: Bearer ey...
Content-type: application/json
{
		"category": 5,
		"statecode": 0,
		"name": "Sample flow name",
		"type": 1,
		"description": "This flow reads some data from Dataverse.",
		"primaryentity":"none",
		"clientdata": "{\"properties\":{\"connectionReferences\":{\"shared_commondataservice\":{\"connectionName\":\"shared-commondataser-00000000-0000-0000-0000-000000000004\",\"source\":\"Invoker\",\"id\":\"/providers/Microsoft.Power Apps/apis/shared_commondataservice\"}},\"definition\":{\"$schema\": \"https:\/\/schema.management.azure.com\/providers\/Microsoft.Logic\/schemas\/2016-06-01\/workflowdefinition.json#\",\"contentVersion\": \"1.0.0.0\",\"parameters\": {\"$connections\": {\"defaultValue\": {},\"type\": \"Object\"},\"$authentication\": {\"defaultValue\": {},\"type\": \"SecureObject\"}},\"triggers\": {\"Recurrence\": {\"recurrence\": {\"frequency\": \"Minute\",\"interval\": 1},\"type\": \"Recurrence\"}},\"actions\": {\"List_records\": {\"runAfter\": {},\"metadata\": {\"flowSystemMetadata\": {\"swaggerOperationId\": \"GetItems_V2\"}},\"type\": \"ApiConnection\",\"inputs\": {\"host\": {\"api\": {\"runtimeUrl\": \"https:\/\/firstrelease-001.azure-apim.net\/apim\/commondataservice\"},\"connection\": {\"name\": \"@parameters('$connections')['shared_commondataservice']['connectionId']\"}},\"method\": \"get\",\"path\": \"\/v2\/datasets\/@{encodeURIComponent(encodeURIComponent('default.cds'))}\/tables\/@{encodeURIComponent(encodeURIComponent('accounts'))}\/items\",\"queries\": {\"$top\": 1},\"authentication\": \"@parameters('$authentication')\"}}},\"outputs\": {}}},\"schemaVersion\":\"1.0.0.0\"}"
}
```

The most important section is the `clientdata`, which contains the connectionReferences that the flow uses, and the [definition](/azure/logic-apps/logic-apps-workflow-definition-language) of the flow. The connectionReferences are the mappings to each connection that the flow uses.

There are three properties:

| Property name  | Description                                                 |
| -------------- | ----------------------------------------------------------- |
| connectionName | Identifies the connection. You can see the connectionName by going to the **Connections** page and then copying it from the URL of the connection. |
| source         | Either `Embedded` or `Invoker`. `Invoker` is only valid for instant flows (those where a user selects a button to run the flow), and indicates that the end user will provide the connection. In this case the connectionName is only used at design time. If the connection is `Embedded`, that means the connectionName you specify is always used. |
| id             | The identifier of the connector. The id always starts with `/providers/Microsoft.PowerApps/apis/` and then has the connector name, which you can copy from the URL of the connection or by selecting the connector from the **Connectors** page. |

Once you execute the `POST` request, you'll receive the `OData-EntityId` header, which will contain the `workflowid` for your new flow.

## Update a cloud flow

You can call `PATCH` on the workflow to update, turn on, or turn off a cloud flow. Use the `workflowid` property to make these calls. For example, you can update the description and the owner of the flow with the following call:

```http
PATCH https://org00000000.crm0.dynamics.com/api/data/v9.1/workflows(00000000-0000-0000-0000-000000000002)
Accept: application/json
Authorization: Bearer ey...
Content-type: application/json
{
	"description" : "This flow will ensure consistency across systems.",
	"ownerid@odata.bind": "systemusers(00000000-0000-0000-0000-000000000005)"
}
```

> [!NOTE]
> The syntax for changing the owner uses the `odata.bind` format. This means instead of patching the \_ownerid_value field directly, you append `@odata.bind` to the property name and then wrap the ID with `systemusers()`.

In another example, you can turn a cloud flow on with this call:

```http
PATCH https://org00000000.crm0.dynamics.com/api/data/v9.1/workflows(00000000-0000-0000-0000-000000000002)
Accept: application/json
Authorization: Bearer ey...
Content-type: application/json
{
	"statecode" : 1
}
```

### Delete a cloud flow

Delete a cloud flow with a simple `DELETE` call:

```http
DELETE https://org00000000.crm0.dynamics.com/api/data/v9.1/workflows(00000000-0000-0000-0000-000000000002)
Accept: application/json
Authorization: Bearer ey...
```

> [!NOTE]
> You cannot delete a cloud flow that's turned on. You must first turn off the flow (see **Updating a cloud flow** previously) or else you will see the error: `Cannot delete an active workflow definition.`

## Get all users with whom a cloud flow is shared

Listing the users with access uses a *function* in Dataverse. This function takes a single parameter of `Target`:

```http
GET https://org00000000.crm0.dynamics.com/api/data/v9.1/RetrieveSharedPrincipalsAndAccess(Target=@tid)?@tid={'@odata.id':'workflows(00000000-0000-0000-0000-000000000002)'}
Accept: application/json
Authorization: Bearer ey...
```

The `Target` parameter is a JSON-like string with a single property called `@odata.id`. Replace the workflow ID in the previous example. It returns:

```http
{
    "@odata.context": "https://org00000000.crm0.dynamics.com/api/data/v9.1/$metadata#Microsoft.Dynamics.CRM.RetrieveSharedPrincipalsAndAccessResponse",
    "PrincipalAccesses": [
        {
            "AccessMask": "ReadAccess",
            "Principal": {
                "@odata.type": "#Microsoft.Dynamics.CRM.systemuser",
                "ownerid": "00000000-0000-0000-0000-000000000005"
            }
        }
    ]
}
```

## Share or unshare a cloud flow

You can share a cloud flow using the `GrantAccess` action.

```http
POST https://org00000000.crm0.dynamics.com/api/data/v9.1/GrantAccess
Accept: application/json
Authorization: Bearer ey...
Content-type: application/json
{
	"Target" : {
		"@odata.type": "Microsoft.Dynamics.CRM.workflow",
		"workflowid" : "00000000-0000-0000-0000-000000000002"
	},
	"PrincipalAccess": {
		"Principal": {
			"@odata.type" : "Microsoft.Dynamics.CRM.systemuser",
			"ownerid" : "00000000-0000-0000-0000-000000000005"
		},
		"AccessMask": "ReadAccess"
	}
}
```

The `AccessMask` parameter is a field with the following values for different permission levels:

| Name         | Description                                          |
| ------------ | ---------------------------------------------------- |
| None         | No access.                                           |
| ReadAccess   | The right to read the flow.                          |
| WriteAccess  | The right to update the flow.                        |
| DeleteAccess | The right to delete the flow.                        |
| ShareAccess  | The right to share the flow.                         |
| AssignAccess | The right to change the owner of the flow.           |

You can combine permissions with a comma; for example, provide the ability to both read and update a cloud flow by passing `ReadAccess,WriteAccess`.

You can *unshare* a cloud flow with the `RevokeAccess` action. Here's an example:

```http
POST https://org00000000.crm0.dynamics.com/api/data/v9.1/RevokeAccess
Accept: application/json
Authorization: Bearer ey...
Content-type: application/json
{
	"Target" : {
		"@odata.type": "Microsoft.Dynamics.CRM.workflow",
		"workflowid" : "00000000-0000-0000-0000-000000000002"
	},
	"Revokee": {
		"@odata.type" : "Microsoft.Dynamics.CRM.systemuser",
		"ownerid" : "00000000-0000-0000-0000-000000000005"
	}
}
```

`RevokeAccess` removes all permissions granted in the `AccessMask`.

## Export flows

Use the `ExportSolution` action to export flows to a .zip file. First, add the flows that you want to a [solution](https://flow.microsoft.com/blog/solutions-in-microsoft-flow/).

Once your flow is in a solution, call the following action:

```http
POST https://org00000000.crm0.dynamics.com/api/data/v9.1/ExportSolution
Accept: application/json
Authorization: Bearer ey...
Content-type: application/json
{
	"SolutionName" : "Awesome solution 1",
	"Managed": false
}
```

`ExportSolution` returns a base 64-encoded string in the `ExportSoutionFile` property.

```http
{
    "@odata.context": "https://org00000000.crm0.dynamics.com/api/data/v9.1/$metadata#Microsoft.Dynamics.CRM.ExportSolutionResponse",
    "ExportSolutionFile": "UEsDBBQAAgAI..."
}
```

You can then save this file into source control and/or use whatever version management or distribution system you want.

## Import flows

Call the `ImportSolution` action to import a solution.

| Property name                    | Description                               |
| -------------------------------- | ----------------------------------------- |
| OverwriteUnmanagedCustomizations | If there are existing instances of these flows in Dataverse, this flag needs to be set to `true` to import them. Otherwise they will not be overwritten. |
| PublishWorkflows                 | Indicates if classic Dataverse workflows will be activated on import. This setting doesn't apply to other types of flows. |
| ImportJobId                      | Provides a new, unique GUID to track the import job. |
| CustomizationFile                | A base 64-encoded zip file that contains the solution. |

```http
POST https://org00000000.crm0.dynamics.com/api/data/v9.1/ImportSolution
Accept: application/json
Authorization: Bearer ey...
Content-type: application/json
{
	"OverwriteUnmanagedCustomizations": false,
	"PublishWorkflows" : true,
	"ImportJobId" : "00000000-0000-0000-0000-000000000006",
    "CustomizationFile" : "UEsDBBQAAgAI..."
}
```

Since import is a long-running operation, the response to the ImportSolution action will be a `204 No content`. To track the progress, call a `GET` on the `importjobs` object, providing the `ImportJobId` that you included in the original `ImportSolution` action.

```http
GET https://org00000000.crm0.dynamics.com/api/data/v9.1/importjobs(00000000-0000-0000-0000-000000000006)
Accept: application/json
Authorization: Bearer ey...
```

This call returns the status of the import operation, including `progress` (the percentage of completion), `startedon`, and `completedon` (if import finished).

Once import has completed successfully, you will need to set up the connections for the flow, since the `connectionNames` will likely be different in the destination environment (if the connections exist at all). If you are setting up new connections in the destination environment, then the owner of the flows must create them in the Power Automate designer. If the connections are already set up in the new environment, then you can `PATCH` the `clientData` of the flow with the names of the connections.


[!INCLUDE[footer-include](includes/footer-banner.md)]
