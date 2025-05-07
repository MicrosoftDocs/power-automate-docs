---
title: Create automation-related queries with Fabric
description: Learn how to query automation-related Dataverse data in Microsoft Fabric
ms.topic: how-to
ms.date: 12/19/2024
ms.author: appapaio
ms.reviewer: dmartens
contributors:
author: rpapostolis
ms.collection: conceptual
search.audienceType: 
  - admin
  - coe
  - flowmaker
  - enduser
---

# Create automation-related queries with Fabric

> [!NOTE]
>
> **Disclaimer:** The scenarios, query examples, and data used in this tutorial are fictional, may include errors, inefficiencies, and are intended solely for demonstration purposes.

## List of automation-related tables

The following table lists automation-related tables frequently used for reporting and observability.

| Display name | Object name       |   Purpose                                             |
|--------------------|------------------|-------------------------------------------------------|
| [Flow Log](/power-apps/developer/data-platform/reference/entities/flowlog) | flowlog  | Contains a wide variety of logs, such as custom logs, [desktop flow action logs V2](/power-automate/desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version), [machine run queue logs](/power-automate/desktop-flows/monitor-run-details#view-queue-events), unattended self-heal requests/responses, and work queue processing logs etc. The data is stored in a [Dataverse elastic table](/power-apps/maker/data-platform/create-edit-elastic-tables), and depending on the log type, can be configured with its own [time-to-live (TTL)](/power-apps/developer/data-platform/elastic-tables#expire-data-by-using-time-to-live) setting in the [Organization table](/power-apps/developer/data-platform/reference/entities/organization#writable-columnsattributes) ([FlowLogsTtlInMinutes](/power-apps/developer/data-platform/reference/entities/organization#BKMK_FlowLogsTtlInMinutes) and [DesktopFlowQueueLogsTtlInMinutes](/power-apps/developer/data-platform/reference/entities/organization#BKMK_DesktopFlowQueueLogsTtlInMinutes)), which defines when records should be automatically deleted from the table. |
| [Flow Machine](/power-apps/developer/data-platform/reference/entities/flowmachine) | flowmachine  | Contains machine and hosted machine-related info. |
| [Flow Machine Group](/power-apps/developer/data-platform/reference/entities/flowmachinegroup) | flowmachinegroup | Contains machine group and hosted machine group-related info.  |
| [Flow Run](/power-apps/developer/data-platform/reference/entities/flowrun) | flowrun  | Contains cloud flow run-related data such start, end, duration, parent flow context etc. |
| [Flow Session](/power-apps/developer/data-platform/reference/entities/flowsession) | flowsession | Contains desktop flow run-related data such as start, durations, status, machine, robot account, parent flow context etc.     |
| [Process](/power-apps/developer/data-platform/reference/entities/workflow) | workflow         | Contains desktop flows and solution-based cloud flows (along with other workflow types). |
| [User](/power-apps/developer/data-platform/reference/entities/systemuser)   | systemuser | Represents the Dataverse user. |
| [Work Queue](/power-apps/developer/data-platform/reference/entities/workqueue) | workqueue  | Represents an instance of a workflow execution.  |
| [Work Queue Item](/power-apps/developer/data-platform/reference/entities/workqueueitem)  | workqueueitem  | Contains information about each run of a workflow.|

### Simplified table relationship diagram

The image shows only the relevant table relations for automation.

:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/automation-related-table-relations.png" alt-text="Screenshot of an entity relationship drawing showing automation-related table relations." lightbox="media/advanced-automation-related-data-analytics-fabric/automation-related-table-relations.png":::

### Create your first query in Fabric

Follow these steps to create a sample SQL query on the SQL Analytical Endpoint in Fabric for the `contoso_westus_accounts_payable` Lakehouse.
  
1. Open your web browser, go to the Microsoft Fabric portal (https://powerbi.com), and sign in with your credentials.  
1. Select the workspace where your Lakehouse is located, then select the desired SQL Analytical Endpoint (a subnode of your Lakehouse).  
1. In the SQL Analytical Endpoint, select **New SQL query** to open the SQL query editor.  
1. In the SQL query editor, enter your SQL query and select **Run**. The following example query retrieves all desktop flow runs (flow sessions) associated with a specific desktop flow and a machine ID that failed within the last seven days.

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
            flowsession  
        WHERE   
            regardingobjectid = '[specific_flow_id]' -- Replace with the actual flow ID  
            AND machineid = '[specific_machine_guid]'  -- Replace with the actual machine ID  
            AND statuscode = 8 -- 'Failed' sessions  
            AND createdon >= DATEADD(day, -7, GETDATE())  
        ORDER BY   
            createdon DESC;  
     ```  

1. Here's a list of available status reasons (statuscode) for the `Flow Sessions` (desktop flow runs) table.

      | Status reason     | Value |  
      |-----------|-------|  
      | Paused    | 1     |  
      | Running   | 2     |  
      | Waiting   | 3     |  
      | Succeeded | 4     |  
      | Skipped   | 5     |  
      | Suspended | 6     |  
      | Canceled | 7     |  
      | Failed    | 8     |  
      | Faulted   | 9     |  
      | TimedOut  | 10    |  
      | Aborted   | 11    |  
      | Ignored   | 12    |

1. Review the query results to ensure they meet your needs.

    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/basic-sql-flowsession-query.png" alt-text="Screenshot of a SQL query being executed in a database management tool." lightbox="media/advanced-automation-related-data-analytics-fabric/basic-sql-flowsession-query.png":::

1. (Optional) Open a Live-query with results in Excel by highlighting the SQL query and selecting **Open in Excel** in the query output section. This generates and downloads an Excel file with a Live-query to the SQL Analytics endpoint for further analysis.

    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/open-query-in-excel.png" alt-text="Screenshot of a SQL query being executed in a database query panel in Fabric." lightbox="media/advanced-automation-related-data-analytics-fabric/open-query-in-excel.png":::

1. (Optional) To store the SQL query for future use, select **Save Query**.  
  
### Basic flow queries

#### Retrieve cloud flows with their owner info

This query returns all cloud flows with their owner information.

> [!NOTE]
> Only cloud flows that are part of a Dataverse solution are available in Fabric.

```sql
    SELECT   
        w.name AS 'Cloud flow',  
        w.workflowid AS 'Cloud flow Id',  
        w.createdon AS 'Created on',
        w.modifiedon AS 'Last modified on',
        w.clientdata AS 'Script',  
        w.ownerid AS 'Owner Id',  
        s.fullname AS 'Owner name',  
        s.internalemailaddress AS 'Owner email'
    FROM   
        workflow w  
    JOIN   
        systemuser s ON w.ownerid = s.systemuserid  
    WHERE   
        w.category = 5;  -- Only consider solution-cloud flows (category 5)  
```

#### Retrieve desktop flows with their owner info

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

### Performance-related query example

This query retrieves the minimum, mean (average), maximum, and standard deviation of runtimes for desktop flow runs (Flow Sessions) of a specified desktop flow, with the runtimes converted from milliseconds rounded up to the nearest full second. The query groups the results by machine IDs and includes details such as machine names, management types, maximum hosted machine counts, session capacity, and the last heartbeat date from the Machine Group and Machine tables.

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

:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/performance-related-query-results.png" alt-text="Screenshot of a SQL query being executed in Fabric with a results window." lightbox="media/advanced-automation-related-data-analytics-fabric/performance-related-query-results.png":::

### Machine and licensing capacity-related query

This query identifies machine and licensing-related capacity issues for a specific desktop flow to help in optimizing resource allocation and addressing performance constraints.

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

### Governance-related query examples for desktop flows

#### Find scripts that include plain text passwords in connections

This query finds all desktop flows that use (OLEDB) database connection strings that are configured to use a plaintext password.

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
        AND (LOWER(w.definition) LIKE '%;password=%');
```

#### Potential SQL injection risk

The query detects desktop flows that contain scripts potentially vulnerable to SQL injection by searching for the use of `database.executesqlstatement.execute` within the flow definitions. Consider a scenario where, instead of directly writing the SQL code in the [Execute SQL statement action](/power-automate/desktop-flows/actions-reference/database#executesqlstatement), the script uses a Power Automate desktop input variable (for example, *%LetsDeleteAllGeneralLedgerEntriesFromDB%*) provided to the script during runtime.

:::image type="content" source="media/advanced-automation-related-data-analytics-fabric/execute-sql-statmenet-risk.png" alt-text="Screenshot of an 'Execute SQL statement' configuration dialog in Power Automate desktop." lightbox="media/advanced-automation-related-data-analytics-fabric/execute-sql-statmenet-risk.png":::

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
        AND LOWER(w.definition) LIKE '%database.executesqlstatement.execute%';
    
```

#### Advance API request usage

This query retrieves desktop flows that utilize advanced API request methods, such as `curl`, `Invoke-RestMethod`, and other `requests`, to identify connectivity to external web services or services.

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

#### Web endpoints and URL shortcuts usage

This query detects desktop flows containing scripts that reference URL shorteners to assess potential risks of restricted URL usage.

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

#### Missing error handling in scripts

This query searches for desktop flows that lack any error handling mechanisms, such as on `block error` or `on error`, to ensure robustness and reliability in script execution.

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

### Governance-related query examples for V2 action logs

> [!NOTE]
>
> Before you continue with this section, ensure that [**Desktop Flow Logs V2**](/power-automate/desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version) has been enabled in your environment and that you have existing desktop flow runs.

#### Desktop flow runs with restricted URL access

This query finds web service invocations (Invoke Web Service action) within a specific desktop flow over the past three weeks. This result is useful for identifying and analyzing potentially suspicious endpoints or restricted API calls.

```sql
    SELECT   
        JSON_VALUE(f.data, '$.name') AS ActionName,  
        f.data AS 'Action log',  
        f.parentobjectid AS 'Parent object id',  
        f.createdon AS 'Log created on',
        w.name AS 'Desktop flow',  
        w.workflowid AS 'Desktop flow Id',  
        w.createdon AS 'Created on',  
        w.modifiedon AS 'Last modified on',  
        w.definition AS 'Script',  
        w.ownerid AS 'Owner Id',  
        s.fullname AS 'Owner name',  
        s.internalemailaddress AS 'Owner email'  
    FROM  
        [flowlog] f  
    JOIN  flowsession fs ON f.parentobjectid = fs.flowsessionid         
    JOIN  workflow w ON fs.regardingobjectid = w.workflowid  
    JOIN  systemuser s ON w.ownerid = s.systemuserid  
    WHERE   
        w.workflowid = '[specific_flow_id]' -- Replace with the actual flow ID
        AND f.createdon >= DATEADD(day, -21, GETDATE())
        AND JSON_VALUE(f.data, '$.name') = 'Invoke web service'  
        AND (  
            f.data LIKE '%contoso-default.crm.dynamics.com/api%'  
            OR f.data LIKE '%api.second-restricted-url.net%'  
            OR f.data LIKE '%api.third-restricted-url.de%'  
            OR f.data LIKE '%api.phishing-example.com%'  
        );
```

#### Desktop flow runs with cryptographic code

This query scans desktop flow runs for PowerShell script actions that included cryptographic code over the past seven days.

```sql
    -- Queries actions logs named 'Run PowerShell script' that contain code that that uses cryptographic libraries 
    -- and terms such as "AES", "RSA", "encryption", or "decryption," which may indicate risky operations
    SELECT top(1)
        JSON_VALUE(data, '$.name') AS ActionName,
        JSON_VALUE(data, '$.inputs') AS Inputs,
        JSON_VALUE(data, '$.outputs') AS Outputs
    FROM 
        [flowlog]
    WHERE
        JSON_VALUE(data, '$.name') = 'Run PowerShell script'
        AND createdon >= DATEADD(day, -7, GETDATE())
        AND (
            JSON_VALUE(data, '$.inputs') LIKE '%AES%'
            OR JSON_VALUE(data, '$.inputs') LIKE '%RSA%'
            OR JSON_VALUE(data, '$.inputs') LIKE '%encryption%'
            OR JSON_VALUE(data, '$.inputs') LIKE '%decryption%'
        )
    ORDER BY
        ActionName
    
```

#### Desktop flow runs with pro-code usage

This query is a bit more advanced. It identifies and counts distinct desktop flow runs (Flow Sessions) with pro-coding parts (such as VBScript, PowerShell, JavaScript, .NET, or Python) from the last seven days, and groups the results by desktop flow.

```sql
WITH ProCodingSessions AS (  
    SELECT   
        fs.flowsessionid,  
        f.data AS 'Action log',  
        f.parentobjectid AS 'Parent object id',  
        f.createdon AS 'Log created on',  
        w.name AS 'Desktop flow',  
        w.workflowid AS 'Desktop flow Id',  
        w.createdon AS 'Created on',  
        w.modifiedon AS 'Last modified on',  
        w.definition AS 'Script',  
        w.ownerid AS 'Owner Id',  
        s.fullname AS 'Owner name',  
        s.internalemailaddress AS 'Owner email'  
    FROM [flowlog] f  
    JOIN flowsession fs ON f.parentobjectid = fs.flowsessionid  
    JOIN workflow w ON fs.regardingobjectid = w.workflowid  
    JOIN systemuser s ON w.ownerid = s.systemuserid  
    WHERE f.createdon >= DATEADD(day, -7, GETDATE())  
    AND (  
        LOWER(w.definition) LIKE '%runvbscript%' OR  
        LOWER(w.definition) LIKE '%runpowershellscript%' OR  
        LOWER(w.definition) LIKE '%runjavascript%' OR  
        LOWER(w.definition) LIKE '%rundotnetscript%' OR  
        LOWER(w.definition) LIKE '%runpythonscript%'  
    )  
),  
FlowCounts AS (  
    SELECT  
        p.[Desktop flow],  
        p.[Desktop flow Id],  
        p.[Created on],  
        p.[Last modified on],  
        p.[Script],  
        p.[Owner Id],  
        p.[Owner name],  
        p.[Owner email],  
        COUNT(DISTINCT p.flowsessionid) AS ProCodingSessionCount  
    FROM ProCodingSessions p  
    GROUP BY  
        p.[Desktop flow],  
        p.[Desktop flow Id],  
        p.[Created on],  
        p.[Last modified on],  
        p.[Script],  
        p.[Owner Id],  
        p.[Owner name],  
        p.[Owner email]  
)  
SELECT  
    f.[Desktop flow],  
    f.[Desktop flow Id],  
    f.[Created on],  
    f.[Last modified on],  
    f.[Script],  
    f.[Owner Id],  
    f.[Owner name],  
    f.[Owner email],  
    f.ProCodingSessionCount AS 'Runs with pro-code' 
FROM FlowCounts f  
ORDER BY f.ProCodingSessionCount DESC;  

```

### Error and perfromance-related queries for V2 action logs

#### Top 10 failing desktop flow actions

This query returns the top 10 failing actions by number of errors over the past seven days.

```sql
    SELECT TOP(10)   
        JSON_VALUE(data, '$.name') AS ActionName,  
        SUM(CASE WHEN JSON_VALUE(data, '$.status') = 'Failed' THEN 1 ELSE 0 END) AS ErrorCount  
    FROM [flowlog]  
    WHERE createdon >= DATEADD(day, -7, GETDATE())  
    GROUP BY JSON_VALUE(data, '$.name')  
    HAVING SUM(CASE WHEN JSON_VALUE(data, '$.status') = 'Failed' THEN 1 ELSE 0 END) > 0  
    ORDER BY ErrorCount DESC;  
```

#### Top 10 error codes with count

```sql
    SELECT TOP(10)  
        JSON_VALUE(data, '$.errorCode') AS ErrorCode,  
        COUNT(*) AS OccurrenceCount  
    FROM [flowlog]  
    WHERE createdon >= DATEADD(day, -7, GETDATE())  
      AND JSON_VALUE(data, '$.status') = 'Failed'  
    GROUP BY JSON_VALUE(data, '$.errorCode')  
    ORDER BY OccurrenceCount DESC;  
    
```
