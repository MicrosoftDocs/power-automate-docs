---
title: Manage flows with code
description: Learn how to manage flows with code using the Dataverse SDK for .NET and Web API.
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
  - JimDaly
ms.reviewer: angieandrews
ms.date: 05/08/2023
ms.subservice: cloud-flow
ms.topic: conceptual
ms.author: cgarty
ms.prod: 
ms.technology: 
audience: Power user
---

# Manage flows with code

All flows are stored in Dataverse and you can use either the Dataverse SDK for .NET or Web API to manage them.

This article covers the management of flows included on the **Solutions** tab in Power Automate. Currently, managing flows under **My Flows** aren't supported with code.

## Interact with Dataverse APIs

Dataverse provides equivalent capabilities using either the Dataverse SDK for .NET or Web API.

### Which method should I use?

|SDK for .NET |Web API |
|---------|---------|
|When you are writing code using .NET.<br /><br />Provides an opinionated programming model with strong types.|With any programming language that supports HTTP requests<br /><br />Use tools like [Postman](https://www.postman.com/) to send requests.|

### How to connect?

How to connect depends on whether you are using the Dataverse SDK for .NET or Web API.

#### [SDK for .NET](#tab/sdk)

With the SDK you need to connect with a client application to get access to an [IOrganizationService](xref:Microsoft.Xrm.Sdk.IOrganizationService) instance. `IOrganizationService` is an interface that provides methods you can use to interact with Dataverse.

More information:

- [Quickstart: Execute an Organization service request (C#)](/power-apps/developer/data-platform/org-service/quick-start-org-service-console-app)
- [Use the Organization service](/power-apps/developer/data-platform/org-service/overview)
- [IOrganizationService Interface](/power-apps/developer/data-platform/org-service/iorganizationservice-interface)


#### [Web API](#tab/webapi)

With the Web API you need to use OAuth to authenticate to the Web API endpoint. See [View developer resources](/power-apps/developer/data-platform/view-download-developer-resources) to get the specific organization URI you should use.

Your base URL should look something like this:  

`https://<your org>.<region domain>.dynamics.com/api/data/v9.2`

More information:

- [Set up a Postman environment](/power-apps/developer/data-platform/webapi/setup-postman-environment)
- [Quick Start: Web API sample (C#)](/power-apps/developer/data-platform/webapi/quick-start-console-app-csharp)
- [Compose HTTP requests and handle errors](/power-apps/developer/data-platform/webapi/compose-http-requests-handle-errors)
- [Use OAuth authentication with Microsoft Dataverse](/power-apps/developer/data-platform/authenticate-oauth)

---

## Workflow table

Cloud flows are stored in the [Process (Workflow) table](/power-apps/developer/data-platform/reference/entities/workflow) which is represented in the Web API as the [workflow EntityType](xref:Microsoft.Dynamics.CRM.workflow)

The following table describes important columns in the workflow table:

|Logical Name|Type|Description|
|----|----|----|
|`category`|Choice|The category of the flow. Here are the different categories. <br>0 - Classic Dataverse workflows.<br>1 - Classic Dataverse dialogs. <br>2 - Business rules. <br>3 - Classic Dataverse actions. <br>4 - Business process flows. <br>5 - Modern Flow (Automated, instant or scheduled flows).<br>6 - Desktop flows. |
|`clientdata`|String|A string-encoded JSON of the flow definition and its connectionReferences. |
|`createdby`|Lookup|The user who created the flow.|
|`createdon`|DateTime|The date when the flow was created.|
|`description`|String|The user-provided description of the flow.|
|`ismanaged`|Bool|Indicates if the flow was installed via a managed solution.|
|`modifiedby`|Lookup|The last user who updated the flow.|
|`modifiedon`|DateTime|The last time the flow was updated.|
|`name`|String|The display name that you have given the flow. |
|`ownerid`|Lookup|The user or team who owns the flow.|
|`statecode`|Choice|The status of the flow. The status can be:  <br>0 - Draft (Off)  <br>1 - Activated (On)<br>2 - Suspended.|
|`type`|Choice|Indicates if the flow is a running flow, or a template that can be used to create more flows.  <br>1 - Definition,  <br>2 - Activation <br>3 - Template.|
|`workflowid`|Guid|The unique identifier for a cloud flow across all imports.|
|`workflowidunique`|Guid|The unique identifier for this installation of the flow.|

> [!NOTE]
> With Web API, Lookup values are single-valued navigation properties that can be expanded to get details from the related record.
>
> Lookup columns also have corresponding GUID [lookup properties](/power-apps/developer/data-platform/webapi/web-api-properties#lookup-properties) that can be used in queries. Lookup properties have this naming convention: `_<logical name>_value`. For the workflow entitytype in Web API you can reference these lookup properties: `_createdby_value`, `_modifiedby_value`, and `_ownerid_value`.


## List flows

To retrieve a list of cloud flows, you can query the workflow table. The following query will return the first automated, instant, or scheduled flow that is currently on:

#### [SDK for .NET](#tab/sdk)

This static method requires an authenticated client that implements the <xref:Microsoft.Xrm.Sdk.IOrganizationService>. It uses the [IOrganizationService.Create](xref:Microsoft.Xrm.Sdk.IOrganizationService.RetrieveMultiple%2A) method.


```csharp
public static void OutputFirstActiveFlow(IOrganizationService service)
{
    var query = new QueryExpression("workflow")
    {
        ColumnSet = new ColumnSet("category",
                                    "createdby",
                                    "createdon",
                                    "description",
                                    "ismanaged",
                                    "modifiedby",
                                    "modifiedon",
                                    "name",
                                    "ownerid",
                                    "statecode",
                                    "type",
                                    "workflowid",
                                    "workflowidunique"),
        Criteria = new FilterExpression(LogicalOperator.And)
        {
            Conditions = {
                    {  new ConditionExpression(
                        "category",
                            ConditionOperator.Equal,
                            5) },
                    {  new ConditionExpression(
                            "statecode",
                            ConditionOperator.Equal,
                            1) }
                }
        },
        TopCount = 1
    };

    EntityCollection workflows = service.RetrieveMultiple(query);

    Entity workflow = workflows.Entities.FirstOrDefault();

    Console.WriteLine($"category: {workflow.FormattedValues["category"]}");
    Console.WriteLine($"createdby: {workflow.FormattedValues["createdby"]}");
    Console.WriteLine($"createdon: {workflow.FormattedValues["createdon"]}");
    // Description may be null
    Console.WriteLine($"description: {workflow.GetAttributeValue<string>("description")}");
    Console.WriteLine($"ismanaged: {workflow.FormattedValues["ismanaged"]}");
    Console.WriteLine($"modifiedby: {workflow.FormattedValues["modifiedby"]}");
    Console.WriteLine($"modifiedon: {workflow.FormattedValues["modifiedon"]}");
    Console.WriteLine($"name: {workflow["name"]}");
    Console.WriteLine($"ownerid: {workflow.FormattedValues["ownerid"]}");
    Console.WriteLine($"statecode: {workflow.FormattedValues["statecode"]}");
    Console.WriteLine($"type: {workflow.FormattedValues["type"]}");
    Console.WriteLine($"workflowid: {workflow["workflowid"]}");
    Console.WriteLine($"workflowidunique: {workflow["workflowidunique"]}");

}
```

**Output**

```console
category: Modern Flow
createdby: SYSTEM
createdon: 5/20/2020 9:37 PM
description:
ismanaged: Unmanaged
modifiedby: Jim Daly
modifiedon: 5/6/2023 3:37 AM
name: When an account is updated -> Create a new record
ownerid: Peter Hecke
statecode: Activated
type: Definition
workflowid: d9e875bf-1c9b-ea11-a811-000d3a122b89
workflowidunique: c17af45c-10a1-43ca-b816-d9cc352718cf
```

More information: [/power-apps/developer/data-platform/org-service/build-queries-with-queryexpression](/power-apps/developer/data-platform/org-service/build-queries-with-queryexpression)

#### [Web API](#tab/webapi)

This query uses `$filter` to limit the results:

- `category eq 5` limits the results to only automated, instant, or scheduled flows.
- `statecode eq 1` limits the results only the flows that are 'on'.

Also, `$top=1` limits the number of flows returned to one.

**Request**

```http
GET https://crmue.api.crm.dynamics.com/api/data/v9.2/workflows?$filter=category eq 5 and statecode eq 1
&$select=
category,
_createdby_value,
createdon,
description,
ismanaged,
_modifiedby_value,
modifiedon,
name,
_ownerid_value,
statecode,
type,
workflowid,
workflowidunique
&$top=1
Accept: application/json  
OData-MaxVersion: 4.0  
OData-Version: 4.0
Prefer: odata.include-annotations="*"
```

> [!NOTE]
> Because the `Prefer: odata.include-annotations="*"` request header is included, the response includes many useful annotations such as `@OData.Community.Display.V1.FormattedValue` and `@Microsoft.Dynamics.CRM.lookuplogicalname` that provides additional details in the response.

**Response**

```http
HTTP/1.1 200 OK
Content-Type: application/json; odata.metadata=minimal
OData-Version: 4.0
Preference-Applied: odata.include-annotations="*"

{
    "@odata.context": "https://crmue.api.crm.dynamics.com/api/data/v9.2/$metadata#workflows(category,_createdby_value,createdon,description,ismanaged,_modifiedby_value,modifiedon,name,_ownerid_value,statecode,type,workflowid,workflowidunique)",
    "@Microsoft.Dynamics.CRM.totalrecordcount": -1,
    "@Microsoft.Dynamics.CRM.totalrecordcountlimitexceeded": false,
    "@Microsoft.Dynamics.CRM.globalmetadataversion": "84271433",
    "value": [
        {
            "@odata.etag": "W/\"84172786\"",
            "category@OData.Community.Display.V1.FormattedValue": "Modern Flow",
            "category": 5,
            "_createdby_value@OData.Community.Display.V1.FormattedValue": "SYSTEM",
            "_createdby_value@Microsoft.Dynamics.CRM.lookuplogicalname": "systemuser",
            "_createdby_value": "549445d7-7f9e-442b-82b1-ce9734394e1a",
            "createdon@OData.Community.Display.V1.FormattedValue": "5/20/2020 9:37 PM",
            "createdon": "2020-05-21T04:37:23Z",
            "description": null,
            "ismanaged@OData.Community.Display.V1.FormattedValue": "Unmanaged",
            "ismanaged": false,
            "_modifiedby_value@OData.Community.Display.V1.FormattedValue": "Jim Daly",
            "_modifiedby_value@Microsoft.Dynamics.CRM.lookuplogicalname": "systemuser",
            "_modifiedby_value": "4026be43-6b69-e111-8f65-78e7d1620f5e",
            "modifiedon@OData.Community.Display.V1.FormattedValue": "5/6/2023 3:37 AM",
            "modifiedon": "2023-05-06T10:37:01Z",
            "name": "When an account is updated -> Create a new activity",
            "_ownerid_value@OData.Community.Display.V1.FormattedValue": "Peter Hecke",
            "_ownerid_value@Microsoft.Dynamics.CRM.associatednavigationproperty": "ownerid",
            "_ownerid_value@Microsoft.Dynamics.CRM.lookuplogicalname": "systemuser",
            "_ownerid_value": "8061643d-ebf7-e811-a974-000d3a1e1c9a",
            "statecode@OData.Community.Display.V1.FormattedValue": "Activated",
            "statecode": 1,
            "type@OData.Community.Display.V1.FormattedValue": "Definition",
            "type": 1,
            "workflowid": "d9e875bf-1c9b-ea11-a811-000d3a122b89",
            "workflowidunique": "c17af45c-10a1-43ca-b816-d9cc352718cf"
        }
    ]
}
```

More information: [Query data using the Web API](/power-apps/developer/data-platform/webapi/query-data-web-api)

---

## Create a cloud flow

The required properties for automated, instant, and scheduled flows are: `category`, `name`, `type`, `primaryentity`, and `clientdata`. Use `none` for the `primaryentity` for these types of flows.

#### [SDK for .NET](#tab/sdk)

This static method requires an authenticated client that implements the <xref:Microsoft.Xrm.Sdk.IOrganizationService>. It uses the [IOrganizationService.Create](xref:Microsoft.Xrm.Sdk.IOrganizationService.Create%2A) method.

```csharp
public static Guid CreateCloudFlow(IOrganizationService service) {

   var workflow = new Entity("workflow") { 
         Attributes = {
            {"category", new OptionSetValue(5) },
            {"statecode", new OptionSetValue(0)},
            {"name", "Sample flow name"},
            {"type", new OptionSetValue(1) },
            {"description", "This flow reads some data from Dataverse." },
            {"primaryentity", "none" },
            {"clientdata", "{\"properties\":{\"connectionReferences\":{\"shared_commondataserviceforapps\":{\"impersonation\":{},\"runtimeSource\":\"embedded\",\"connection\":{\"name\":\"shared-commondataser-114efb88-a991-40c7-b75f-2693-b1ca6a0c\",\"connectionReferenceLogicalName\":\"crdcb_sharedcommondataserviceforapps_109ea\"},\"api\":{\"name\":\"shared_commondataserviceforapps\"}}},\"definition\":{\"$schema\":\"https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#\",\"contentVersion\":\"1.0.0.0\",\"parameters\":{\"$connections\":{\"defaultValue\":{},\"type\":\"Object\"},\"$authentication\":{\"defaultValue\":{},\"type\":\"SecureObject\"}},\"triggers\":{\"manual\":{\"metadata\":{\"operationMetadataId\":\"76f87a86-89b3-48b4-92a2-1b74539894a6\"},\"type\":\"Request\",\"kind\":\"Button\",\"inputs\":{\"schema\":{\"type\":\"object\",\"properties\":{},\"required\":[]}}}},\"actions\":{\"List_rows\":{\"runAfter\":{},\"metadata\":{\"operationMetadataId\":\"9725b30f-4a8e-4695-b6fd-9a4985808809\"},\"type\":\"OpenApiConnection\",\"inputs\":{\"host\":{\"apiId\":\"/providers/Microsoft.PowerApps/apis/shared_commondataserviceforapps\",\"connectionName\":\"shared_commondataserviceforapps\",\"operationId\":\"ListRecords\"},\"parameters\":{\"entityName\":\"accounts\",\"$select\":\"name\",\"$top\":1},\"authentication\":\"@parameters('$authentication')\"}}}}},\"schemaVersion\":\"1.0.0.0\"}" }
         }
   };

   return service.Create(workflow);

}
```

More information: [Create table rows using the Organization Service](/power-apps/developer/data-platform/org-service/entity-operations-create)


#### [Web API](#tab/webapi)

Send a `POST` request to the `workflows` resource.

**Request**

```http
POST https://crmue.api.crm.dynamics.com/api/data/v9.2/workflows HTTP/1.1
Content-Type: application/json

{
      "category": 5,
      "statecode": 0,
      "name": "Sample flow name",
      "type": 1,
      "description": "This flow reads some data from Dataverse.",
      "primaryentity":"none",
      "clientdata": "{\"properties\":{\"connectionReferences\":{\"shared_commondataserviceforapps\":{\"impersonation\":{},\"runtimeSource\":\"embedded\",\"connection\":{\"name\":\"shared-commondataser-114efb88-a991-40c7-b75f-2693-b1ca6a0c\",\"connectionReferenceLogicalName\":\"crdcb_sharedcommondataserviceforapps_109ea\"},\"api\":{\"name\":\"shared_commondataserviceforapps\"}}},\"definition\":{\"$schema\":\"https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#\",\"contentVersion\":\"1.0.0.0\",\"parameters\":{\"$connections\":{\"defaultValue\":{},\"type\":\"Object\"},\"$authentication\":{\"defaultValue\":{},\"type\":\"SecureObject\"}},\"triggers\":{\"manual\":{\"metadata\":{\"operationMetadataId\":\"76f87a86-89b3-48b4-92a2-1b74539894a6\"},\"type\":\"Request\",\"kind\":\"Button\",\"inputs\":{\"schema\":{\"type\":\"object\",\"properties\":{},\"required\":[]}}}},\"actions\":{\"List_rows\":{\"runAfter\":{},\"metadata\":{\"operationMetadataId\":\"9725b30f-4a8e-4695-b6fd-9a4985808809\"},\"type\":\"OpenApiConnection\",\"inputs\":{\"host\":{\"apiId\":\"/providers/Microsoft.PowerApps/apis/shared_commondataserviceforapps\",\"connectionName\":\"shared_commondataserviceforapps\",\"operationId\":\"ListRecords\"},\"parameters\":{\"entityName\":\"accounts\",\"$select\":\"name\",\"$top\":1},\"authentication\":\"@parameters('$authentication')\"}}}}},\"schemaVersion\":\"1.0.0.0\"}"
}
```

**Response**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
OData-EntityId: https://crmue.api.crm.dynamics.com/api/data/v9.2/workflows(7b177b96-f9ed-ed11-8849-000d3a993550)
```

> [!NOTE]
> The `OData-EntityId` response header is a URL that refers to the workflow record created. The Guid value used as the key is the `workflowid` for the flow.

More information: [Create a table row using the Web API](/power-apps/developer/data-platform/webapi/create-entity-web-api)

---

The most important section is the `clientdata`, which contains the connectionReferences that the flow uses, and the [definition](/azure/logic-apps/logic-apps-workflow-definition-language) of the flow. The connectionReferences are the mappings to each connection that the flow uses.

```json
{
  "properties": {
    "connectionReferences": {
      "shared_commondataserviceforapps": {
        "impersonation": {},
        "runtimeSource": "embedded",
        "connection": {
          "name": "shared-commondataser-114efb88-a991-40c7-b75f-2693-b1ca6a0c",
          "connectionReferenceLogicalName": "crdcb_sharedcommondataserviceforapps_109ea"
        },
        "api": { "name": "shared_commondataserviceforapps" }
      }
    },
    "definition": {
      "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
      "contentVersion": "1.0.0.0",
      "parameters": {
        "$connections": { "defaultValue": {}, "type": "Object" },
        "$authentication": { "defaultValue": {}, "type": "SecureObject" }
      },
      "triggers": {
        "manual": {
          "metadata": {
            "operationMetadataId": "76f87a86-89b3-48b4-92a2-1b74539894a6"
          },
          "type": "Request",
          "kind": "Button",
          "inputs": {
            "schema": { "type": "object", "properties": {}, "required": [] }
          }
        }
      },
      "actions": {
        "List_rows": {
          "runAfter": {},
          "metadata": {
            "operationMetadataId": "9725b30f-4a8e-4695-b6fd-9a4985808809"
          },
          "type": "OpenApiConnection",
          "inputs": {
            "host": {
              "apiId": "/providers/Microsoft.PowerApps/apis/shared_commondataserviceforapps",
              "connectionName": "shared_commondataserviceforapps",
              "operationId": "ListRecords"
            },
            "parameters": {
              "entityName": "accounts",
              "$select": "name",
              "$top": 1
            },
            "authentication": "@parameters('$authentication')"
          }
        }
      }
    }
  },
  "schemaVersion": "1.0.0.0"
}
```
<!-- This is out of date -->
There are three properties:

| Property name  | Description                                                 |
| -------------- | ----------------------------------------------------------- |
| connectionName | Identifies the connection. You can see the connectionName by going to the **Connections** page and then copying it from the URL of the connection. |
| source         | Either `Embedded` or `Invoker`. `Invoker` is only valid for instant flows (where a user selects a button to run the flow), and indicates that the end user will provide the connection. In this case, the connectionName is only used at design time. If the connection is `Embedded`, that means the connectionName you specify is always used. |
| id             | The identifier of the connector. The id always starts with `/providers/Microsoft.PowerApps/apis/` and then has the connector name, which you can copy from the URL of the connection or by selecting the connector from the **Connectors** page. |

## Update a cloud flow

To update a flow, set only the properties you will change.

#### [SDK for .NET](#tab/sdk)

This static method requires an authenticated client that implements the <xref:Microsoft.Xrm.Sdk.IOrganizationService>. It uses the [IOrganizationService.Create](xref:Microsoft.Xrm.Sdk.IOrganizationService.Update%2A) method.

```csharp
/// <summary>
/// Updates a cloud flow
/// </summary>
/// <param name="service">Authenticated client implementing the IOrganizationService interface</param>
/// <param name="workflowid">The ID of the flow to update.</param>
/// <param name="systemuserid">The id of the user to assign the flow to.</param>
public static void UpdateCloudFlow(IOrganizationService service, Guid workflowid, Guid systemuserid) {

   var workflow = new Entity("workflow",workflowid)
   {
         Attributes = {

            {"description", "This flow will ensure consistency across systems." },
            {"ownerid", new EntityReference("systemuser",systemuserid)}
         }
   };

   service.Update(workflow);
}
```

More information: [Update and delete table rows using the Organization Service > Basic update](/power-apps/developer/data-platform/org-service/entity-operations-update-delete#basic-update)

#### [Web API](#tab/webapi)

Send a `PATCH` request to the `workflows` resource with the properties you want to change.

**Request**

```http
PATCH https://crmue.api.crm.dynamics.com/api/data/v9.2/workflows(7598c284-01ee-ed11-8849-000d3a993550) HTTP/1.1
Content-Type: application/json
OData-MaxVersion: 4.0  
OData-Version: 4.0
If-Match: * 

{
   "description" : "This flow will ensure consistency across systems.",
   "ownerid@odata.bind": "systemusers(8061643d-ebf7-e811-a974-000d3a1e1c9a)"
}
```

> [!NOTE]
> To change a lookup value you must use the `@odata.bind` annotation and include a reference to the record using the pattern `<resource name>(<id>)`.

**Response**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
```

More information: [Update and delete table rows using the Web API > Basic update](/power-apps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-update)

---

## Delete a cloud flow

You can't delete a cloud flow that's turned on. You must first turn off the flow or else you'll see this error: `Cannot delete an active workflow definition.` To learn more, go to [Update a cloud flow](#update-a-cloud-flow) in this article.


#### [SDK for .NET](#tab/sdk)

```csharp

```

#### [Web API](#tab/webapi)

**Request**

```http

```

**Response**

```http

```

---

## Get all users with whom a cloud flow is shared

#### [SDK for .NET](#tab/sdk)

```csharp

```

#### [Web API](#tab/webapi)

**Request**

```http

```

**Response**

```http

```

---

## Share or unshare a cloud flow

#### [SDK for .NET](#tab/sdk)

```csharp

```

#### [Web API](#tab/webapi)

**Request**

```http

```

**Response**

```http

```

---

## Export flows

#### [SDK for .NET](#tab/sdk)

```csharp

```

#### [Web API](#tab/webapi)

**Request**

```http

```

**Response**

```http

```

---

## Import flows

#### [SDK for .NET](#tab/sdk)

```csharp

```

#### [Web API](#tab/webapi)

**Request**

```http

```

**Response**

```http

```

---

### See also