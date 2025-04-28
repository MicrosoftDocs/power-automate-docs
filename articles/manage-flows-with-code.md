---
title: Work with cloud flows using code
description: Learn how to work with cloud flows using code using the Dataverse SDK for .NET and Web API.
author: ChrisGarty
contributors:
  - ChrisGarty
  - v-aangie
  - JimDaly
ms.reviewer: angieandrews
ms.date: 10/29/2024
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: conceptual
ms.author: cgarty
audience: Power user
---

# Work with cloud flows using code

All flows are stored in Dataverse and you can use either the Dataverse SDK for .NET or Web API to manage them.

This article covers the management of flows included on the **Solutions** tab in Power Automate. Currently, managing flows under **My Flows** aren't supported with code.

## Interact with Dataverse APIs

Dataverse provides equivalent capabilities using either the Dataverse SDK for .NET or Web API.

### Which method should I use?

The best method depends on the project technology and the skills you have.

#### [SDK for .NET](#tab/sdk)

If your project uses .NET, we recommend using the SDK. The SDK simplifies your development experience by providing a typed object model and methods to authenticate.

More information: [Use the Organization service](/power-apps/developer/data-platform/org-service/overview)

#### [Web API](#tab/webapi)

You can use any programming language or technology that supports sending HTTP requests, including .NET.

More information: [Use the Microsoft Dataverse Web API](/power-apps/developer/data-platform/webapi/overview)

---

### How to connect?

How to connect depends on whether you're using the Dataverse SDK for .NET or Web API.

#### [SDK for .NET](#tab/sdk)

With the SDK, you need to connect with a client application to get access to an [IOrganizationService](xref:Microsoft.Xrm.Sdk.IOrganizationService) instance. `IOrganizationService` is an interface that provides methods you can use to interact with Dataverse.

More information:

- [Quickstart: Execute an Organization service request (C#)](/power-apps/developer/data-platform/org-service/quick-start-org-service-console-app)
- [Use the Organization service](/power-apps/developer/data-platform/org-service/overview)
- [IOrganizationService Interface](/power-apps/developer/data-platform/org-service/iorganizationservice-interface)

#### [Web API](#tab/webapi)

With the Web API, you need to use OAuth to authenticate to the Web API endpoint. See [View developer resources](/power-apps/developer/data-platform/view-download-developer-resources) to get the specific organization URI you should use.

Your base URL should look something like this:  

`https://<your org>.<region domain>.dynamics.com/api/data/v9.2`

More information:

- [Quick Start: Web API sample (C#)](/power-apps/developer/data-platform/webapi/quick-start-console-app-csharp)
- [Compose HTTP requests and handle errors](/power-apps/developer/data-platform/webapi/compose-http-requests-handle-errors)
- [Use OAuth authentication with Microsoft Dataverse](/power-apps/developer/data-platform/authenticate-oauth)

---

## Workflow table

Cloud flows are stored in the [Process (Workflow) table](/power-apps/developer/data-platform/reference/entities/workflow) that is represented in the Web API as the [workflow EntityType](xref:Microsoft.Dynamics.CRM.workflow)

The following table describes important columns in the workflow table:

|Logical Name|Type|Description|
|----|----|----|
|`category`|Choice|The category of the flow. Here are the different categories. <br>`0` - Classic Dataverse workflows.<br>`1` - Classic Dataverse dialogs. <br>`2` - Business rules. <br>`3` - Classic Dataverse actions. <br>`4` - Business process flows. <br>`5` - Modern Flow (Automated, instant or scheduled flows).<br>`6` - Desktop flows. |
|`clientdata`|String|A string-encoded JSON of the flow definition and its connectionReferences. |
|`createdby`|Lookup|The user who created the flow.|
|`createdon`|DateTime|The date when the flow was created.|
|`description`|String|The user-provided description of the flow.|
|`ismanaged`|Bool|Indicates if the flow was installed via a managed solution.|
|`modifiedby`|Lookup|The last user who updated the flow.|
|`modifiedon`|DateTime|The last time the flow was updated.|
|`name`|String|The display name that you gave the flow. |
|`ownerid`|Lookup|The user or team who owns the flow.|
|`statecode`|Choice|The status of the flow. The status can be:  <br>`0` - Draft (Off)  <br>`1` - Activated (On)<br>`2` - Suspended.|
|`type`|Choice|Indicates if the flow is a running flow, or a template that can be used to create more flows.  <br>`1` - Definition,  <br>`2` - Activation <br>`3` - Template.|
|`workflowid`|Guid|The unique identifier for a cloud flow across all imports.|
|`workflowidunique`|Guid|The unique identifier for this installation of the flow.|

> [!NOTE]
> With Web API, Lookup values are [single-valued navigation properties](/power-apps/developer/data-platform/webapi/web-api-navigation-properties#single-valued-navigation-properties) that can be expanded to get details from the related record.
>
> Lookup columns also have corresponding GUID [lookup properties](/power-apps/developer/data-platform/webapi/web-api-properties#lookup-properties) that can be used in queries. Lookup properties have this naming convention: `_<logical name>_value`. For the workflow entitytype in Web API you can reference these lookup properties: `_createdby_value`, `_modifiedby_value`, and `_ownerid_value`.

## List flows

To retrieve a list of cloud flows, you can query the workflow table. The following query returns the first automated, instant, or scheduled flow that is currently 'on':

#### [SDK for .NET](#tab/sdk)

This static `OutputFirstActiveFlow` method requires an authenticated client that implements the <xref:Microsoft.Xrm.Sdk.IOrganizationService>. It uses the [IOrganizationService.RetrieveMultiple](xref:Microsoft.Xrm.Sdk.IOrganizationService.RetrieveMultiple%2A) method.

```csharp
/// <summary>
/// Outputs the first active flow
/// </summary>
/// <param name="service">Authenticated client implementing the IOrganizationService interface</param>
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
                     5) }, // Cloud Flow
            {  new ConditionExpression(
                     "statecode",
                     ConditionOperator.Equal,
                     1) } // Active
         }
         },
         TopCount = 1 // Limit to one record
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

To retrieve more records, remove the [TopCount](xref:Microsoft.Xrm.Sdk.Query.QueryExpression.TopCount) limit.

**Output**

```console
category: Modern Flow
createdby: SYSTEM
createdon: 5/20/2020 9:37 PM
description:
ismanaged: Unmanaged
modifiedby: Kiana Anderson
modifiedon: 5/6/2023 3:37 AM
name: When an account is updated -> Create a new record
ownerid: Monica Thomson
statecode: Activated
type: Definition
workflowid: d9e875bf-1c9b-ea11-a811-000d3a122b89
workflowidunique: c17af45c-10a1-43ca-b816-d9cc352718cf
```

More information:
- [Build queries with QueryExpression](/power-apps/developer/data-platform/org-service/build-queries-with-queryexpression)
- [Access formatted values](/power-apps/developer/data-platform/org-service/entity-operations-query-data#access-formatted-values)

#### [Web API](#tab/webapi)

This query uses `$filter` to limit the results:

- `category eq 5` limits the results to only automated, instant, or scheduled flows
- `statecode eq 1` limits the results only the flows that are 'on'

Also, `$top=1` limits the number of flows returned to one.

**Request**

```http
GET [Organization URI]/api/data/v9.2/workflows?$filter=category eq 5 and statecode eq 1
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
    "@odata.context": "[Organization URI]/api/data/v9.2/$metadata#workflows(category,_createdby_value,createdon,description,ismanaged,_modifiedby_value,modifiedon,name,_ownerid_value,statecode,type,workflowid,workflowidunique)",
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
            "_modifiedby_value@OData.Community.Display.V1.FormattedValue": "Kiana Anderson",
            "_modifiedby_value@Microsoft.Dynamics.CRM.lookuplogicalname": "systemuser",
            "_modifiedby_value": "4026be43-6b69-e111-8f65-78e7d1620f5e",
            "modifiedon@OData.Community.Display.V1.FormattedValue": "5/6/2023 3:37 AM",
            "modifiedon": "2023-05-06T10:37:01Z",
            "name": "When an account is updated -> Create a new activity",
            "_ownerid_value@OData.Community.Display.V1.FormattedValue": "Monica Thomson",
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
/// <summary>
/// Creates a cloud flow
/// </summary>
/// <param name="service">Authenticated client implementing the IOrganizationService interface</param>
/// <returns>The workflowid</returns>
public static Guid CreateCloudFlow(IOrganizationService service)
{
   var workflow = new Entity("workflow")
   {
         Attributes = {
            {"category", new OptionSetValue(5) }, // Cloud flow
            {"name", "Sample flow name"},
            {"type", new OptionSetValue(1) }, //Definition
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
POST [Organization URI]/api/data/v9.2/workflows HTTP/1.1
Content-Type: application/json

{
      "category": 5,
      "name": "Sample flow name",
      "type": 1,
      "description": "This flow reads some data from Dataverse.",
      "primaryentity":"none",
      "clientdata": "{\"properties\": {\"connectionReferences\": {\"shared_commondataserviceforapps\": {\"runtimeSource\": \"embedded\",\"connection\": {},\"api\": { \"name\": \"shared_commondataserviceforapps\" }}},\"definition\": {\"$schema\": \"https:\/\/schema.management.azure.com\/providers\/Microsoft.Logic\/schemas\/2016-06-01\/workflowdefinition.json#\",\"contentVersion\": \"1.0.0.0\",\"parameters\": {\"$connections\": { \"defaultValue\": {}, \"type\": \"Object\" },\"$authentication\": { \"defaultValue\": {}, \"type\": \"SecureObject\" }},\"triggers\": {\"manual\": {\"metadata\": {},\"type\": \"Request\",\"kind\": \"Button\",\"inputs\": { \"schema\": { \"type\": \"object\", \"properties\": {}, \"required\": [] }}}},\"actions\": {\"List_rows\": {\"runAfter\": {},\"metadata\": {},\"type\": \"OpenApiConnection\",\"inputs\": { \"host\": { \"apiId\": \"\/providers\/Microsoft.PowerApps\/apis\/shared_commondataserviceforapps\", \"connectionName\": \"shared_commondataserviceforapps\", \"operationId\": \"ListRecords\" }, \"parameters\": { \"entityName\": \"accounts\", \"$select\": \"name\", \"$top\": 1 }, \"authentication\": \"@parameters('$authentication')\"}}}}},\"schemaVersion\": \"1.0.0.0\"}"
}
```

**Response**

```http
HTTP/1.1 204 No Content
OData-Version: 4.0
OData-EntityId: [Organization URI]/api/data/v9.2/workflows(00aa00aa-bb11-cc22-dd33-44ee44ee44ee)
```

> [!NOTE]
> The `OData-EntityId` response header is a URL that refers to the workflow record created. The Guid value used as the key is the `workflowid` for the flow.

More information: [Create a table row using the Web API](/power-apps/developer/data-platform/webapi/create-entity-web-api)

---

The `statecode` of all flows created this way are set to `0` (Draft or 'Off'). The flow needs to be enabled before it can be used.

The most important property is the `clientdata`, which contains the `connectionReferences` that the flow uses, and the [definition](/azure/logic-apps/logic-apps-workflow-definition-language) of the flow. The `connectionReferences` are the mappings to each connection that the flow uses.

```json
{
  "properties": {
    "connectionReferences": {
      "shared_commondataserviceforapps": {
        "runtimeSource": "embedded",
        "connection": {},
        "api": { 
         "name": "shared_commondataserviceforapps" 
         }
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
          "metadata": {},
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
          "metadata": {},
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

## Update a cloud flow

To update a flow, set only the properties you want to change.

#### [SDK for .NET](#tab/sdk)

This static method requires an authenticated client that implements the <xref:Microsoft.Xrm.Sdk.IOrganizationService>. It uses the [IOrganizationService.Update](xref:Microsoft.Xrm.Sdk.IOrganizationService.Update%2A) method to update a flow description and set the owner.

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
            {"ownerid", new EntityReference("systemuser",systemuserid)},
            {"statecode", new OptionSetValue(1) } //Turn on the flow.
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
PATCH [Organization URI]/api/data/v9.2/workflows(7598c284-01ee-ed11-8849-000d3a993550)
Content-Type: application/json
OData-MaxVersion: 4.0  
OData-Version: 4.0
If-Match: * 

{
   "description" : "This flow will ensure consistency across systems.",
   "ownerid@odata.bind": "systemusers(8061643d-ebf7-e811-a974-000d3a1e1c9a)",
   "statecode" : 1
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

The following examples show how to delete the workflow record that represents a cloud flow.

#### [SDK for .NET](#tab/sdk)

The static `DeleteCloudFlow` method deletes a workflow record.

```csharp
/// <summary>
/// Deletes a workflow
/// </summary>
/// <param name="service">Authenticated client implementing the IOrganizationService interface</param>
/// <param name="workflowId">The id of the cloud flow to delete.</param>
public static void DeleteCloudFlow(IOrganizationService service, Guid workflowId) { 

service.Delete(entityName:"workflow",id: workflowId);

}
```

More information: [Delete a record using the SDK](/power-apps/developer/data-platform/org-service/entity-operations-update-delete?tabs=late#delete)

#### [Web API](#tab/webapi)

Send a `DELETE` request to the `workflows` resource identified by the primary key.

**Request**

```http
DELETE [Organization Uri]/api/data/v9.2/workflows(ac1a3664-b704-ee11-8f6e-000d3a9933c9)
OData-MaxVersion: 4.0
OData-Version: 4.0
If-None-Match: null
Accept: application/json
```

**Response**

```http
HTTP/1.1 204 NoContent
OData-Version: 4.0
```

More information: [Delete a record using the Web API](/power-apps/developer/data-platform/webapi/update-delete-entities-using-web-api#basic-delete)

---

## Get all users with whom a cloud flow is shared

Use the `RetrieveSharedPrincipalsAndAccess` message to get a list of all the users that a cloud flow is shared with.

With the SDK, use the [RetrieveSharedPrincipalsAndAccessRequest Class](xref:Microsoft.Crm.Sdk.Messages.RetrieveSharedPrincipalsAndAccessRequest), and with the Web API use the [RetrieveSharedPrincipalsAndAccess Function](xref:Microsoft.Dynamics.CRM.RetrieveSharedPrincipalsAndAccess).

More information: [Get principals with access to a record](/power-apps/developer/data-platform/security-access-coding#get-principals-with-access-to-a-record)

## Share or unshare a cloud flow

Share a cloud flow like any other Dataverse record using the `GrantAccess` message. With the SDK, use the [GrantAccessRequest Class](xref:Microsoft.Crm.Sdk.Messages.GrantAccessRequest) and with the Web API use the [GrantAccess Action](xref:Microsoft.Dynamics.CRM.GrantAccess). More information: [GrantAccess example](/power-apps/developer/data-platform/security-sharing-assigning#grantaccess-example)

If you want to change the access rights you grant when you share a record, use the `ModifyAccess` message. With the SDK, use the [ModifyAccessRequest Class](xref:Microsoft.Crm.Sdk.Messages.ModifyAccessRequest) and with the Web API use the [ModifyAccess Action](xref:Microsoft.Dynamics.CRM.ModifyAccess). More information: [ModifyAccess example](/power-apps/developer/data-platform/security-sharing-assigning#modifyaccess-example)

To unshare a record, use the `RevokeAccess` message. With the SDK, use the [RevokeAccessRequest Class](xref:Microsoft.Crm.Sdk.Messages.RevokeAccessRequest) and with the Web API use the [RevokeAccess Action](xref:Microsoft.Dynamics.CRM.RevokeAccess). More information: [Revoking access](/power-apps/developer/data-platform/security-sharing-assigning#revoking-access)

## Export flows

When a flow is part of a solution, you can export it by exporting the solution that contains the flow using the `ExportSolution` message.

#### [SDK for .NET](#tab/sdk)

The following static `ExportSolution` example method uses the [ExportSolutionRequest](xref:Microsoft.Crm.Sdk.Messages.ExportSolutionRequest) to retrieve a `byte[]` containing the ZIP file of the unmanaged solution with the specified [UniqueName](/power-apps/developer/data-platform/reference/entities/solution#BKMK_UniqueName).

```csharp
/// <summary>
/// Exports an unmanaged solution
/// </summary>
/// <param name="service">Authenticated client implementing the IOrganizationService interface</param>
/// <param name="solutionUniqueName">The uniquename of the solution.</param>
/// <returns></returns>
public static byte[] ExportSolution(
   IOrganizationService service, 
   string solutionUniqueName) 
{
   ExportSolutionRequest request = new() { 
         SolutionName = solutionUniqueName,
         Managed = false
   };

   var response = (ExportSolutionResponse)service.Execute(request);

   return response.ExportSolutionFile;
}
```

#### [Web API](#tab/webapi)

Use the [ExportSolution Action](xref:Microsoft.Dynamics.CRM.ExportSolution) to download the solution using the solution [UniqueName](/power-apps/developer/data-platform/reference/entities/solution#BKMK_UniqueName) to identify it. The [ExportSolutionResponse](xref:Microsoft.Dynamics.CRM.ExportSolutionResponse) returned has a `ExportSolutionFile` property that is a base64 encoded string. You can then save this file into source control and/or use whatever version management or distribution system you want.

**Request**

```http
POST [Organization Uri]/api/data/v9.2/ExportSolution
OData-MaxVersion: 4.0
OData-Version: 4.0
If-None-Match: null
Accept: application/json
Content-Type: application/json; charset=utf-8
Content-Length: 472

{
  "SolutionName": "FlowContainer",
  "Managed": false
}
```

**Response**

```http
HTTP/1.1 200 OK
OData-Version: 4.0

{
  "@odata.context": "[Organization Uri]/api/data/v9.2/$metadata#Microsoft.Dynamics.CRM.ExportSolutionResponse",
  "ExportSolutionFile": "UEsDBBQAA...<truncated for brevity>"
}
```

---

## Import flows

When you have a solution ZIP file, you can import it using the `ImportSolution` message.

When you import flows, you should set the following parameters:

| Property name                    | Description                               |
| -------------------------------- | ----------------------------------------- |
| `OverwriteUnmanagedCustomizations` | If there are existing instances of these flows in Dataverse, this flag needs to be set to `true` to import them. Otherwise they aren't overwritten. |
| `PublishWorkflows`| Indicates if classic Dataverse workflows are activated on import. This setting doesn't apply to other types of flows. |
| `CustomizationFile`| A base 64-encoded zip file that contains the solution. |

#### [SDK for .NET](#tab/sdk)

The static `ImportSolution` sample method shows how to import a solution file using the [ImportSolutionRequest Class](xref:Microsoft.Crm.Sdk.Messages.ImportSolutionRequest)

```csharp
/// <summary>
/// Imports a solution.
/// </summary>
/// <param name="service">Authenticated client implementing the IOrganizationService interface</param>
/// <param name="solutionFile">The byte[] data representing a solution file. </param>
public static void ImportSolution(
   IOrganizationService service, 
   byte[] solutionFile) {

   ImportSolutionRequest request = new() { 
         OverwriteUnmanagedCustomizations = true,
         CustomizationFile = solutionFile
   };

   service.Execute(request);
}
```

#### [Web API](#tab/webapi)

The following example uses the [ImportSolution Action](xref:Microsoft.Dynamics.CRM.ImportSolution) to import a solution. The `CustomizationFile` contains the base64 encoded string that represents the bytes of the solution file.

**Request**

```http
POST [Organization Uri]/api/data/v9.2/ImportSolution
OData-MaxVersion: 4.0
OData-Version: 4.0
If-None-Match: null
Accept: application/json
Content-Type: application/json; charset=utf-8
Content-Length: 4344

{
  "OverwriteUnmanagedCustomizations": true,
  "CustomizationFile": "UEsDBBQAAgAIA...<truncated for brevity>"
}
```

**Response**

```http
HTTP/1.1 204 NoContent
OData-Version: 4.0
```

---

## FAQ

### What about the API at api.flow.microsoft.com?

The API at **api.flow.microsoft.com** isn't supported. Customers should instead use the Dataverse Web APIs for Power Automate documented previously in this article.

Alternatively, customers can use the management connectors: [Power Automate Management](/connectors/flowmanagement/) or [Power Automate for Admins](/connectors/microsoftflowforadmins/).

Customers can use the unsupported APIs at `api.flow.microsoft.com` at their own risk. These APIs are subject to change, so breaking changes could occur.

## Related information

[Entity class operations using the Organization service](/power-apps/developer/data-platform/org-service/entity-operations)  
[Perform operations using the Web API](/power-apps/developer/data-platform/webapi/perform-operations-web-api)  
[Sharing and assigning](/power-apps/developer/data-platform/security-sharing-assigning)  
[Verifying access in code](/power-apps/developer/data-platform/security-access-coding)  
[Work with solutions using the Dataverse SDK](/power-platform/alm/solution-api)
