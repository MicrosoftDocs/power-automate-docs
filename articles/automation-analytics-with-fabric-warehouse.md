---
title: Designing an automation-centric Fabric warehouse
description: Learn how to configure Dataverse shortcuts in Microsoft Fabric to build advanced automation-related queries, reports, and alerts at scale. 
ms.topic: conceptual
ms.date: 11/06/2024
ms.author: appapaio
ms.reviewer: 
contributors:
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
  - flowmaker
  - enduser
---

# Designing an automation-centric Fabric warehouse

There are many scenarios where you would want to store telemetry data for long-term analytics, apply advanced data transformations for an improved reporting performance, and to combine it with data from different environments, regions, and even across tenants. This is where Fabric warehouses shine, as they allow you to create custom tables with specific schemas and semantic models optimized for domain-specific analytics, such as the automation-centric examples in this guide. In this section of the guide we'll build a simple sample Fabric warehouse and transform and ingests data through a dataflow based on Dataflow Gen2.

## Creating the warehouse

> [!IMPORTANT]
> The warehouse scripts and tables provided below do not represent warehousing best practices. They are solely for demonstration purposes, illustrating what basic tables and field structures for automation telemetry might look like, and how to transform and ingest data using Fabric technology.

1. Sign-in to Fabric (https://powerbi.com)
2. Choose the workspace you used in the previous sections of this guide.
3. Select the **+ New item** button in the command bar and choose Warehouse from the side-panel and give your warehouse a name i.e. `Automation CoE Warehouse`
4. Once in the warehouse experience, select **New SQL query** in the command bar and paste the following SQL CREATE TABLE statements and then select **Run**.

### Create Date table for date-based intelligence

```sql
    CREATE TABLE Dates
    (
        [Date] [date]  NOT NULL,
        [DateAsText] [varchar](10)  NOT NULL,
        [Month] [int]  NOT NULL,
        [Day] [int]  NOT NULL,
        [Year] [smallint]  NOT NULL,
        [Quarter] [int]  NOT NULL,
        [DayName] [varchar](9)  NOT NULL,
        [DayInWeek] [int]  NOT NULL,
        [Week] [int]  NOT NULL,
        [MonthName] [varchar](9)  NOT NULL,
        [DaysInMonth] [int]  NOT NULL,
        [DayOfYear] [int]  NOT NULL
    )
    GO
        
```

### Create Flows table for desktop and cloud flows

```sql
  CREATE TABLE Flows
  (
      [statecode] [bigint]  NULL,
      [statuscode] [bigint]  NULL,
      [businessprocesstype] [bigint]  NULL,
      [category] [bigint]  NULL,
      [mode] [bigint]  NULL,
      [type] [bigint]  NULL,
      [uiflowtype] [bigint]  NULL,
      [createdby] [varchar](8000)  NULL,
      [modifiedby] [varchar](8000)  NULL,
      [owninguser] [varchar](8000)  NULL,
      [parentworkflowid] [varchar](8000)  NULL,
      [parentworkflowid_entitytype] [varchar](8000)  NULL,
      [ownerid] [varchar](8000)  NULL,
      [clientdata] [varchar](8000)  NULL,
      [connectionreferences] [varchar](8000)  NULL,
      [createdbyname] [varchar](8000)  NULL,
      [createdon] [datetime2](6)  NULL,
      [definition] [varchar](8000)  NULL,
      [dependencies] [varchar](8000)  NULL,
      [description] [varchar](8000)  NULL,
      [desktopflowmodules] [varchar](8000)  NULL,
      [inputs] [varchar](8000)  NULL,
      [modifiedbyname] [varchar](8000)  NULL,
      [modifiedon] [datetime2](6)  NULL,
      [name] [varchar](8000)  NULL,
      [outputs] [varchar](8000)  NULL,
      [resourceid] [varchar](8000)  NULL,
      [uniquename] [varchar](8000)  NULL,
      [workflowid] [varchar](8000)  NULL,
      [workflowidunique] [varchar](8000)  NULL,
      [TenantId] [varchar](8000)  NULL,
      [EnvironmentId] [varchar](8000)  NULL,
      [EnvironmentName] [varchar](8000)  NULL,
      [Region] [varchar](8000)  NULL,
      [isdesktopflow] [bit]  NULL,
      [Plaintext Password] [bigint]  NULL,
      [Hardcoded Email] [bigint]  NULL,
      [Hardcoded API Key] [bigint]  NULL,
      [Excessive Sleep] [bigint]  NULL,
      [Missing Error Handling] [bigint]  NULL,
      [Hardcoded File Path] [bigint]  NULL,
      [Web Endpoints and URL Shortcuts] [bigint]  NULL,
      [Advanced API Requests] [bigint]  NULL,
      [SQL Injection Risk] [bigint]  NULL,
      [Has .Net] [bigint]  NULL,
      [Has Python] [bigint]  NULL,
      [Has JavaScript] [bigint]  NULL,
      [Has PowerShell] [bigint]  NULL,
      [Has VBScript] [bigint]  NULL,
      [Has DOS Command] [bigint]  NULL,
      [Has curl Command] [bigint]  NULL,
      [Governance Score] [float]  NULL,
      [Risk Score] [float]  NULL,
      [Risk Classification] [varchar](8000)  NULL
  )
  GO
```

### Create CloudFlowRun table for cloud flow runs

```sql
    CREATE TABLE CloudFlowRuns
    (
        [createdby] [varchar](8000)  NULL,
        [workflow] [varchar](8000)  NULL,
        [ownerid] [varchar](8000)  NULL,
        [createdbyname] [varchar](8000)  NULL,
        [createdon] [datetime2](6)  NULL,
        [duration] [bigint]  NULL,
        [endtime] [datetime2](6)  NULL,
        [errorcode] [varchar](8000)  NULL,
        [errormessage] [varchar](8000)  NULL,
        [flowrunid] [varchar](8000)  NULL,
        [name] [varchar](8000)  NULL,
        [owneridname] [varchar](8000)  NULL,
        [parentrunid] [varchar](8000)  NULL,
        [PartitionId] [varchar](8000)  NULL,
        [resourceid] [varchar](8000)  NULL,
        [starttime] [datetime2](6)  NULL,
        [status] [varchar](8000)  NULL,
        [triggertype] [varchar](8000)  NULL,
        [ttlinseconds] [bigint]  NULL,
        [workflowid] [varchar](8000)  NULL,
        [workflowname] [varchar](8000)  NULL,
        [TenantId] [varchar](8000)  NULL,
        [EnvironmentId] [varchar](8000)  NULL,
        [EnvironmentName] [varchar](8000)  NULL,
        [Region] [varchar](8000)  NULL,
        [ReferenceDate] [date]  NULL
    )
    GO    

```

### Create DesktopFlowRun table for desktop flow runs

```sql
    CREATE TABLE DesktopFlowRuns
    (
        [statecode] [bigint]  NULL,
        [statuscode] [bigint]  NULL,
        [runmode] [bigint]  NULL,
        [runsessionmode] [bigint]  NULL,
        [triggertype] [bigint]  NULL,
        [createdby] [varchar](8000)  NULL,
        [machinegroupid] [varchar](8000)  NULL,
        [machinegroupid_entitytype] [varchar](8000)  NULL,
        [machineid] [varchar](8000)  NULL,
        [machineid_entitytype] [varchar](8000)  NULL,
        [modifiedby] [varchar](8000)  NULL,
        [owningbusinessunit] [varchar](8000)  NULL,
        [owningteam] [varchar](8000)  NULL,
        [owninguser] [varchar](8000)  NULL,
        [regardingobjectid] [varchar](8000)  NULL,
        [regardingobjectid_entitytype] [varchar](8000)  NULL,
        [ownerid] [varchar](8000)  NULL,
        [additionalcontext] [varchar](8000)  NULL,
        [completedon] [datetime2](6)  NULL,
        [connectionid] [varchar](8000)  NULL,
        [context.parentWorkflowId] [varchar](8000)  NULL,
        [context.parentWorkflowRunId] [varchar](8000)  NULL,
        [context.attendedMode] [varchar](8000)  NULL,
        [context.connectionType] [varchar](8000)  NULL,
        [context.parentWorkflowType] [varchar](8000)  NULL,
        [correlationid] [varchar](8000)  NULL,
        [createdbyname] [varchar](8000)  NULL,
        [createdon] [datetime2](6)  NULL,
        [errorcode] [varchar](8000)  NULL,
        [errordetails] [varchar](8000)  NULL,
        [errorinnererror] [varchar](8000)  NULL,
        [errormessage] [varchar](8000)  NULL,
        [flowsessionid] [varchar](8000)  NULL,
        [gateway] [varchar](8000)  NULL,
        [inputs] [varchar](8000)  NULL,
        [machinegroupidname] [varchar](8000)  NULL,
        [machineidname] [varchar](8000)  NULL,
        [machinepercentcpuusage] [real]  NULL,
        [machinepercentramusage] [real]  NULL,
        [machineramusage] [bigint]  NULL,
        [modifiedbyname] [varchar](8000)  NULL,
        [modifiedon] [datetime2](6)  NULL,
        [name] [varchar](8000)  NULL,
        [outputs] [varchar](8000)  NULL,
        [owneridname] [varchar](8000)  NULL,
        [owneridtype] [varchar](8000)  NULL,
        [owningbusinessunitname] [varchar](8000)  NULL,
        [parentcloudflowrunsequenceid] [varchar](8000)  NULL,
        [parentworkflowid] [varchar](8000)  NULL,
        [processversion] [varchar](8000)  NULL,
        [regardingobjectidname] [varchar](8000)  NULL,
        [regardingobjecttypecode] [varchar](8000)  NULL,
        [rundetails] [varchar](8000)  NULL,
        [runduration] [bigint]  NULL,
        [runexecutionduration] [bigint]  NULL,
        [runwaitduration] [bigint]  NULL,
        [sessionusername] [varchar](8000)  NULL,
        [sessionusersid] [varchar](8000)  NULL,
        [startedon] [datetime2](6)  NULL,
        [IsDelete] [bit]  NULL,
        [PartitionId] [varchar](8000)  NULL,
        [TenantId] [varchar](8000)  NULL,
        [EnvironmentId] [varchar](8000)  NULL,
        [EnvironmentName] [varchar](8000)  NULL,
        [Region] [varchar](8000)  NULL,
        [ReferenceDate] [date]  NULL
    )
    GO    
```

Your warehouse workspace should look similar to this now.
:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/automation-warehouse-table-creation-result.png" alt-text="Screenshot of a Fabric warehousing workspace with the list of tables that were created as part of this guide." lightbox="media/advanced-automation-related-data-analytics-fabric/automation-warehouse-table-creation-result.png":::

## Manage default semantic model

1. Ensure that you're in the Fabric warehousing workspace you used to generate the tables above and select the **Reporting** tab on top.
2. Select **Manage default semantic model** from the command bar, expand the tree node **dbo**, select all 4 tables and then **Confirm**.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/manage-default-semantic-model.png" alt-text="Screenshot of a Fabric manage default semantic model table selection experience." lightbox="media/advanced-automation-related-data-analytics-fabric/manage-default-semantic-model.png":::

## Create new semantic model

1. Next, select **New semantic model** to create a new model we'll be using for reporting in Power BI later in this guide.
2. Give your semantic model a name i.e. `Automation Telemetry Model`, select all 4 tables again from the list and then **Confirm**.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/manage-default-semantic-model.png" alt-text="Screenshot of a Fabric manage default semantic model table selection experience." lightbox="media/advanced-automation-related-data-analytics-fabric/new-semantic-model.png":::
3. Once the data modelling experiences opens, select the **Dates** table and click on the three dots '...' next to the table name and select **Mark as date table**.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/mark-as-date-table.png" alt-text="Screenshot of a Fabric manage default semantic model table selection experience." lightbox="media/advanced-automation-related-data-analytics-fabric/mark-as-date-table.png":::
4. Now, define the relationships by dragging and dropping related fields from their child tables to their parent based as outlined below.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/semantic-model-erd.png" alt-text="Screenshot of a Fabric manage default semantic model table selection experience." lightbox="media/advanced-automation-related-data-analytics-fabric/semantic-model-erd.png":::

    | Source table       | Source column         | Target table | Target column    | Details                   |  
    |--------------------|-----------------------|--------------|------------------|--------------------------------------------|  
    | CloudFlowRuns      | ReferenceDate         | Dates        | Date             | CloudFlowRuns.ReferenceDate --> Dates.Date |  
    | CloudFlowRuns      | workflowid            | Flows        | workflowid       | CloudFlowRuns.workflowid --> Flows.workflowid |  
    | DesktopFlowRuns    | ReferenceDate         | Dates        | Date             | DesktopFlowRuns.ReferenceDate --> Dates.Date |  
    | DesktopFlowRuns    | regardingobjectid     | Flows        | workflowid       | DesktopFlowRuns.regardingobjectid --> Flows.workflowid |  

    Here's the outcome of the semantic model relationships we just defined.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/automation-semantic-model-relationships.png" alt-text="Screenshot of a Fabric manage default semantic model table selection experience." lightbox="media/advanced-automation-related-data-analytics-fabric/automation-semantic-model-relationships.png":::

## What's next

> [!div class="nextstepaction"]
> [Building custom Power BI reports for data insights in Fabric](automation-analytics-with-fabric-reports.md)

## Learn more

- [Automation-centric data analytics with Fabric](automation-analytics-with-fabric-introduction.md)
- [Crafting automation-related queries with Fabric](automation-analytics-with-fabric-queries.md)
- [Building custom Power BI reports for data insights in Fabric](automation-analytics-with-fabric-reports.md)
- [Setting up real-time alerts with Reflex for proactive monitoring](automation-analytics-with-fabric-alerts.md)