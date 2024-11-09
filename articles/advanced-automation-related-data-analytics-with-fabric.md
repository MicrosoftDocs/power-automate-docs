---
title: Automation-related data analytics with the Dataverse - Fabric integration
description: Learn how to configure Dataverse shortcuts in Microsoft Fabric to build advanced automation-related queries, reports, and alerts at scale. 
ms.topic: conceptual
ms.date: 11/06/2024
ms.author: appapaio
ms.reviewer: dmartens
contributors:
  - DanaMartens
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
  - flowmaker
  - enduser
---

# Automation-related data analytics with Fabric

Power Automate provides a comprehensive built-in monitoring and troubleshooting experience that allows organizations to manage their day-to-day operations, view trends, and access recommendations through features like the [Automation Center](/articles/automation-center-overview.md) and [Desktop Flow Activity](/articles/desktop-flows/desktop-flow-activity.md).

However, your organization may have more advanced or custom monitoring, reporting, and analysis needs that aren't covered within the product today. This is one of the key strengths of the Power Platform; through its native integrations with other low-code tooling and platforms, such as Power BI, Microsoft Fabric, as well as with Azure, organizations can develop highly sophisticated, scalable, and compliant analytics solutions using data from Power Automate and many other sources.

## Microsoft Fabric as your analytics platform

[Microsoft Fabric](/fabric/get-started/microsoft-fabric-overview) is an end-to-end analytics and data platform designed for enterprises that require a unified solution. It encompasses data movement, processing, ingestion, transformation, real-time event routing, and report building. It offers a unified suite of analytical services including Data Engineering, Data Science, Real-Time Analytics, Data Warehousing with advanced data governance and security control.

:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/fabric-toolset.png" alt-text="Screenshot of an entity relationship drawing showing automation-related table relations." lightbox="media/advanced-automation-related-data-analytics-fabric/fabric-toolset.png":::

## Dataverse direct link to Microsoft Fabric

The Link to Microsoft Fabric feature built into Power Platform makes all your Dynamics 365, Power Apps and Power Automate data available in [Microsoft OneLake](/fabric/onelake/onelake-overview), the built-in data lake for Microsoft Fabric. Key benefits of the Dataverse direct link:

- No need to export data, build extract, transform, load (ETL) pipelines, or use our partner integration tools.
- With shortcuts from Dataverse directly into OneLake, your data stays in Dataverse while authorized users get to work with data in Fabric.
- Link data from all Dynamics 365 apps, including Dynamics 365 Finance and Operations apps.
- Build Power Apps and automations to drive action from insights in OneLake.

## Get started

In the following guide, we'll walk you through the process of using Dataverse shortcuts within Microsoft Fabric to create powerful data analytics solutions. By the end of this guide, you'll have the foundational skills and architectural understanding needed to build sophisticated data queries, generate insightful reports, design interactive dashboards, and set up proactive alerts to seamlessly monitor your data at scale.

> [!NOTE]
>
> **Disclaimer:** The scenarios, code examples, and data used in this tutorial are fictional, may include errors and intended solely for demonstration purposes. They do not represent product or analysis recommendations.

## Prerequisites

Before you continue, ensure you meet the following prerequisites:

1. Have a basic understanding of data modeling, Power Automate, Dataverse, and the Fabric ecosystem.
2. Have access to a Dataverse environment (in the same region as your Fabric capacity) with a Power Automate premium license, (ideally) existing cloud, and desktop flow runs, and System Administrator role in this environment.
3. Ensure that you meet the [**prerequisites**](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric#prerequisites) before linking your Dataverse environment with Fabric.
4. Follow [**these steps**](/power-apps/maker/data-platform/azure-synapse-link-view-in-fabric#link-to-microsoft-fabric) to link your Dataverse environment with Microsoft Fabric. After the environment has been linked, you will see a Lakehouse, a semantic model, and an SQL analytics endpoint. These are prefixed with "dataverse," followed by your environment name and a unique environment suffix, such as ` dataverse_contosousap_cds2_workspace_unq111111111111111111111111`.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/fabric-workspace-with-lakehouse.png" alt-text="Screenshot of Fabric workspace showing a Dataverse-related lakehouse and other artifacts." lightbox="media/advanced-automation-related-data-analytics-fabric/fabric-workspace-with-lakehouse.png":::
5. (Optional) Select Lakehouse settings and rename your Lakehouse to a more meaningful name, such as "contoso_westus_accounts_payable," and provide a brief description. This will help others quickly identify the specific automations and data being processed in the Lakehouse.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/lakehouse-renaming.png" alt-text="Screenshot of Fabric workspace showing the settings panel for a lakehouse with description." lightbox="media/advanced-automation-related-data-analytics-fabric/lakehouse-renaming.png":::
6. (Optional) Link additional Dataverse environments within the same geographical region to Fabric to create cross-environment analytical solutions.
7. (Optional) If you plan to follow the advanced section for [Desktop flow action log-level analytics](#desktop-flow-action-log-level-analytics), ensure that [**Desktop Flow Logs V2**](/articles/desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version) has been enabled in that environment and you have existing desktop flow runs.

## List of tables are automation-related

The following table includes automation-related tables that are frequently used for reporting and observability use cases.

| Display name | Object name       |   Purpose                                             |
|--------------------|------------------|-------------------------------------------------------|
| [Process](/power-apps/developer/data-platform/reference/entities/workflow) | workflow         | Contains desktop flows and solution-based cloud flows (along with other workflow types). |
| [Flow Session](/power-apps/developer/data-platform/reference/entities/flowsession) | flowsession | Contains desktop flow run-related data such as start, durations, status, machine, robot account, parent flow context etc.     |
| [Flow Run](/power-apps/developer/data-platform/reference/entities/flowrun) | flowrun  | Contains cloud flow run-related data such start, end, duration, parent flow context etc. |
| [Flow Log](/power-apps/developer/data-platform/reference/entities/flowlog) | flowrun  | Contains cloud flow run-related data such start, end, duration, parent flow context etc. |
| [Flow Machine](/power-apps/developer/data-platform/reference/entities/flowmachine) | flowmachine  | Contains machine and hosted machine-related info. |
| [Flow Machine Group](/power-apps/developer/data-platform/reference/entities/flowmachinegroup) | flowmachinegroup | Contains machine group and hosted machine group-related info.  |
| [Work Queue](/power-apps/developer/data-platform/reference/entities/workqueue) | workqueue  | Represents an instance of a workflow execution.  |
| [Work Queue Item](/power-apps/developer/data-platform/reference/entities/workqueueitem)  | workqueueitem  | Contains information about each run of a workflow.|
| [User](/power-apps/developer/data-platform/reference/entities/systemuser)   | systemuser | Represents an instance of a workflow execution. |

### Simplified table relationship diagram

The image includes only relations to tables that are included above and automation-relevant.

:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/automation-related-table-relations.png" alt-text="Screenshot of an entity relationship drawing showing automation-related table relations." lightbox="media/advanced-automation-related-data-analytics-fabric/automation-related-table-relations.png":::

## Creating automation-related queries

Step-by-step instructions to create a sample SQL Query on the SQL Analytical Endpoint in Fabric for the `contoso_westus_accounts_payable` Lakehouse.
  
1. Launch your web browser and navigate to the Microsoft Fabric portal (https://powerbi.com) and log in with your credentials.  
2. Choose the workspace where your Lakehouse is located and click on the desired SQL Analytical Endpoint (a sub-node of your Lakehouse).  
3. Once in the SQL Analytical Endpoint, locate and click on the "New SQL query" button to open the SQL query editor interface.  
4. In the SQL query editor, enter your SQL query and click **Run**. The following example query retrieves all desktop flow runs (flow sessions) associated with a specific desktop flow and a machine Id that have failed within the last 7 days.

     ```sql  
        SELECT   
            flowsessionid,  
            statuscode,  
            startedon, 
            completedon,
            errorcode,  
            errormessage,  
            sessionusername,  
            runexecutionduration,  
            runduration,  
            runwaitduration,  
            context
        FROM   
            flowsessions  
        WHERE   
            regardingobjectid = '[specific_flow_id]' -- Replace with the actual flow ID  
            AND machineid = '[specific_machine_guid]'  -- Replace with the actual machine ID  
            AND statuscode = 8 -- 'Failed' sessions  
            AND createdon >= DATEADD(day, -7, GETDATE())  
        ORDER BY   
            createdon DESC;  
     ```  
  
5. Here's a list of available status reasons (statuscode) for the `Flow Sessions` (desktop flow runs) table.

      | Status reason     | Value |  
      |-----------|-------|  
      | Paused    | 1     |  
      | Running   | 2     |  
      | Waiting   | 3     |  
      | Succeeded | 4     |  
      | Skipped   | 5     |  
      | Suspended | 6     |  
      | Cancelled | 7     |  
      | Failed    | 8     |  
      | Faulted   | 9     |  
      | TimedOut  | 10    |  
      | Aborted   | 11    |  
      | Ignored   | 12    |

6. Review the query results to ensure they meet your requirements.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/basic-sql-flowsession-query.png" alt-text="Screenshot of an entity relationship drawing showing automation-related table relations." lightbox="media/advanced-automation-related-data-analytics-fabric/basic-sql-flowsession-query.png":::
7. (Optional) You can open a Live-query with results in Excel by highlighting the SQL query and selecting "Open in Excel" in the query output section. This will generate and download an Excel file with a Live-query to the SQL Analytics endpoint to further deep-dive on the results.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/open-query-in-excel.png" alt-text="Screenshot of an entity relationship drawing showing automation-related table relations." lightbox="media/advanced-automation-related-data-analytics-fabric/open-query-in-excel.png":::
8. (Optional) To store the SQL query for future use, click on the "Save Query" button.  
  
### Performance-related query example

This query retrieves the minimum, mean (average), maximum, and standard deviation of runtimes for desktop flow runs (Flow Sessions) of a specified desktop flow, with the runtimes converted from milliseconds rounded up to the nearest full second. The results are grouped by machine IDs and include additional details such as machine names, management types, maximum hosted machine counts, session capacity and the last heartbeat date etc. from the Machine Group and Machine tables.

```sql
    SELECT   
        f.machineid,  
        fm.name AS machine_name,  
        CASE   
            WHEN mg.managementtype = 0 THEN 'Regular Machine (Group)'  
            ELSE 'Hosted Machine (Group)'  
        END AS managementtype,  
        mg.maxmanagedmachinecount AS maxmanagedmachinecount,  
        fm.lastheartbeatdate AS last_heartbeat_date,  
        fm.sessioncapacity AS 'Max Parallel Sessions',    
        CEILING(MIN(f.runduration) / 1000.0) AS min_runtime,  
        CEILING(AVG(f.runduration) / 1000.0) AS mean_runtime,  
        CEILING(MAX(f.runduration) / 1000.0) AS max_runtime,  
        CEILING(STDEV(f.runduration) / 1000.0) AS stdev_runtime
    FROM   
        flowsession f  
    JOIN   
        flowmachinegroup mg ON f.machinegroupid = mg.flowmachinegroupid  
    JOIN   
        flowmachine fm ON f.machinegroupid = fm.flowmachinegroupid  
    WHERE   
        f.regardingobjectid = '[specific_flow_id]' -- Replace with the actual flow ID
    GROUP BY   
        f.machineid, fm.name, mg.managementtype, mg.maxmanagedmachinecount, fm.lastheartbeatdate, fm.sessioncapacity  
    ORDER BY   
        mean_runtime DESC;  
```

:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/performance-related-query-results.png" alt-text="Screenshot of an entity relationship drawing showing automation-related table relations." lightbox="media/advanced-automation-related-data-analytics-fabric/performance-related-query-results.png":::

### Capacity and bottleneck-related query


```sql
    SELECT   
        f.machineid,  
        fm.name AS machine_name,  
        CASE   
            WHEN mg.managementtype = 0 THEN 'Regular Machine (Group)'  
            ELSE 'Hosted Machine (Group)'  
        END AS managementtype,  
        mg.maxmanagedmachinecount AS maxmanagedmachinecount,  
        fm.lastheartbeatdate AS last_heartbeat_date,  
        fm.sessioncapacity AS 'Max Parallel Sessions',  
        fm.overcapacitysince,  
        CASE   
            WHEN fm.overcapacitysince IS NOT NULL THEN 'Over Capacity'  
            ELSE 'Within Capacity'  
        END AS capacity_status  
    FROM   
        flowsession f  
    JOIN   
        flowmachinegroup mg ON f.machinegroupid = mg.flowmachinegroupid  
    JOIN   
        flowmachine fm ON f.machinegroupid = fm.flowmachinegroupid
    WHERE   
        f.regardingobjectid = '[specific_flow_id]' -- Replace with the actual flow ID
    GROUP BY   
        f.machineid, fm.name, mg.managementtype, mg.maxmanagedmachinecount, fm.lastheartbeatdate, fm.sessioncapacity, fm.overcapacitysince  
    ORDER BY   
        capacity_status DESC, fm.lastheartbeatdate DESC;  

```

### Governance-related query examples

### Base desktop flow query with owner info

This query returns all desktop flows with their owner information.

```sql
    SELECT   
        w.name AS 'Desktop flow',  
        w.workflowid AS 'Desktop flow Id',  
        w.createdon AS 'Created on',
        w.modifiedon AS 'Last modified on',
        w.definition AS 'Script',  
        w.ownerid AS 'Owner Id',  
        s.fullname AS 'Owner name',  
        s.internalemailaddress AS 'Owner email'
    FROM   
        workflow w  
    JOIN   
        systemuser s ON w.ownerid = s.systemuserid  
    WHERE   
        w.category = 6;  -- Only consider desktop flows (category 6)  
```

### Find scripts that include the term `password` or `pwd`

This query finds all desktop flows that include the terms `password` or `pwd`.

```sql
    SELECT   
        w.name AS 'Desktop flow',  
        w.workflowid AS 'Desktop flow Id',  
        w.createdon AS 'Created on',  
        w.modifiedon AS 'Last modified on',  
        w.definition AS 'Script',  
        w.ownerid AS 'Owner Id',  
        s.fullname AS 'Owner name',  
        s.internalemailaddress AS 'Owner email'  
    FROM   
        workflow w  
    JOIN   
        systemuser s ON w.ownerid = s.systemuserid  
    WHERE   
        w.category = 6  
        AND w.definition IS NOT NULL  
        AND (LOWER(w.definition) LIKE '%password%' OR LOWER(w.definition) LIKE '%pwd%');
```

#### Data exfiltration risk

This query identifies desktop flows that incorporate scripting actions to access SAP's internal GUI scripting engine. This can present potential data loss risks because sensitive data accessed or manipulated by these scripts could be unintentionally or maliciously exposed.

```sql
    SELECT   
        workflowid AS 'Desktop flow Id',  
        name AS 'Desktop flow',  
        definition  AS 'Script'
    FROM   
        workflow  
    WHERE   
        (definition LIKE '%System.RunVBScript%'   
          OR definition LIKE '%System.RunPowershellScript%'   
          OR definition LIKE '%System.RunJavascript%'   
          OR definition LIKE '%System.RunDotNetScript%'   
          OR definition LIKE '%System.RunPythonScript%')  
        AND definition LIKE '%SapGuiAuto.GetScriptingEngine%'  
    ORDER BY   
        workflowid;  
```

### Potential SQL injection risk

```sql
    SELECT   
        w.name AS 'Desktop flow',  
        w.workflowid AS 'Desktop flow Id',  
        w.createdon AS 'Created on',  
        w.modifiedon AS 'Last modified on',  
        w.definition AS 'Script',  
        w.ownerid AS 'Owner Id',  
        s.fullname AS 'Owner name',  
        s.internalemailaddress AS 'Owner email'  
    FROM   
        workflow w  
    JOIN   
        systemuser s ON w.ownerid = s.systemuserid  
    WHERE   
        w.category = 6  
        AND w.definition IS NOT NULL  
        AND LOWER(w.definition) LIKE '%database.executesqlstatement%';
    
```

### Advance API request usage

```sql
    SELECT   
        w.name AS 'Desktop flow',  
        w.workflowid AS 'Desktop flow Id',  
        w.createdon AS 'Created on',  
        w.modifiedon AS 'Last modified on',  
        w.definition AS 'Script',  
        w.ownerid AS 'Owner Id',  
        s.fullname AS 'Owner name',  
        s.internalemailaddress AS 'Owner email'  
    FROM   
        workflow w  
    JOIN   
        systemuser s ON w.ownerid = s.systemuserid  
    WHERE   
        w.category = 6  
        AND w.definition IS NOT NULL  
        AND (
            LOWER(w.definition) LIKE '%curl%' OR 
            LOWER(w.definition) LIKE '%invoke-restmethod%' OR 
            LOWER(w.definition) LIKE '%invoke-webrequest%' OR 
            LOWER(w.definition) LIKE '%httpclient%' OR 
            LOWER(w.definition) LIKE '%requests.get%' OR 
            LOWER(w.definition) LIKE '%requests.post%' OR 
            LOWER(w.definition) LIKE '%fetch%' OR 
            LOWER(w.definition) LIKE '%axios%' OR 
            LOWER(w.definition) LIKE '%.ajax%'
        );
    
```

### Web endpoints and URL shortcuts usage

```sql
    SELECT   
        w.name AS 'Desktop flow',  
        w.workflowid AS 'Desktop flow Id',  
        w.createdon AS 'Created on',  
        w.modifiedon AS 'Last modified on',  
        w.definition AS 'Script',  
        w.ownerid AS 'Owner Id',  
        s.fullname AS 'Owner name',  
        s.internalemailaddress AS 'Owner email'  
    FROM   
        workflow w  
    JOIN   
        systemuser s ON w.ownerid = s.systemuserid  
    WHERE   
        w.category = 6  
        AND w.definition IS NOT NULL  
        AND (
            LOWER(w.definition) LIKE '%bit.ly%' OR 
            LOWER(w.definition) LIKE '%linkedin.com%' OR 
            LOWER(w.definition) LIKE '%aka.ms%' OR 
            LOWER(w.definition) LIKE '%tinyurl.com%' OR 
            LOWER(w.definition) LIKE '%goo.gl%' OR 
            LOWER(w.definition) LIKE '%t.co%' OR 
            LOWER(w.definition) LIKE '%fb.me%' OR 
            LOWER(w.definition) LIKE '%is.gd%' OR 
            LOWER(w.definition) LIKE '%buff.ly%'
        );
    
```

### Hardcode file path usage

```sql
    SELECT   
        w.name AS 'Desktop flow',  
        w.workflowid AS 'Desktop flow Id',  
        w.createdon AS 'Created on',  
        w.modifiedon AS 'Last modified on',  
        w.definition AS 'Script',  
        w.ownerid AS 'Owner Id',  
        s.fullname AS 'Owner name',  
        s.internalemailaddress AS 'Owner email'  
    FROM   
        workflow w  
    JOIN   
        systemuser s ON w.ownerid = s.systemuserid  
    WHERE   
        w.category = 6  
        AND w.definition IS NOT NULL  
        AND (
            LOWER(w.definition) LIKE '%c:\\%' OR 
            LOWER(w.definition) LIKE '%d:\\%' OR 
            LOWER(w.definition) LIKE '%e:\\%' OR 
            LOWER(w.definition) LIKE '%f:\\%' OR 
            LOWER(w.definition) LIKE '%g:\\%' OR 
            LOWER(w.definition) LIKE '%h:\\%' OR 
            LOWER(w.definition) LIKE '%i:\\%' OR 
            LOWER(w.definition) LIKE '%j:\\%' OR 
            LOWER(w.definition) LIKE '%k:\\%' OR 
            LOWER(w.definition) LIKE '%l:\\%' OR 
            LOWER(w.definition) LIKE '%m:\\%' OR 
            LOWER(w.definition) LIKE '%n:\\%' OR 
            LOWER(w.definition) LIKE '%o:\\%' OR 
            LOWER(w.definition) LIKE '%p:\\%' OR 
            LOWER(w.definition) LIKE '%q:\\%' OR 
            LOWER(w.definition) LIKE '%r:\\%' OR 
            LOWER(w.definition) LIKE '%s:\\%' OR 
            LOWER(w.definition) LIKE '%t:\\%' OR 
            LOWER(w.definition) LIKE '%u:\\%' OR 
            LOWER(w.definition) LIKE '%v:\\%' OR 
            LOWER(w.definition) LIKE '%w:\\%' OR 
            LOWER(w.definition) LIKE '%x:\\%' OR 
            LOWER(w.definition) LIKE '%y:\\%' OR 
            LOWER(w.definition) LIKE '%z:\\%' 
        );

```

### Missing error handling

```sql
    SELECT   
        w.name AS 'Desktop flow',  
        w.workflowid AS 'Desktop flow Id',  
        w.createdon AS 'Created on',  
        w.modifiedon AS 'Last modified on',  
        w.definition AS 'Script',  
        w.ownerid AS 'Owner Id',  
        s.fullname AS 'Owner name',  
        s.internalemailaddress AS 'Owner email'  
    FROM   
        workflow w  
    JOIN   
        systemuser s ON w.ownerid = s.systemuserid  
    WHERE   
        w.category = 6  
        AND w.definition IS NOT NULL  
        AND NOT (LOWER(w.definition) LIKE '%on block error%' OR LOWER(w.definition) LIKE '%on error%');
    
```

## Creating reports in Fabric

### Creating real-time alerts

## Persisting telemetry data in a Fabric Warehouse

### Creating a Dataflow Gen2 to ingest data to a warehouse

### Desktop flow action log-level analytics

> [!NOTE]
>
> Before you continue with this section, ensure that [**Desktop Flow Logs V2**](/articles/desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version) has been enabled in your environment and that you have existing desktop flow runs.

## Closing
