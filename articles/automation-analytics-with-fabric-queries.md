---
title: Building custom Power BI reports for data insights in Fabric
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

## Building custom Power BI reports for data insights in Fabric


> [!NOTE]
>
> **Disclaimer:** The scenarios, query examples, and data used in this tutorial are fictional, may include errors, inefficiencies and are intended solely for demonstration purposes.

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
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/basic-sql-flowsession-query.png" alt-text="Screenshot of a SQL query being executed in a database management tool." lightbox="media/advanced-automation-related-data-analytics-fabric/basic-sql-flowsession-query.png":::
7. (Optional) You can open a Live-query with results in Excel by highlighting the SQL query and selecting "Open in Excel" in the query output section. This will generate and download an Excel file with a Live-query to the SQL Analytics endpoint to further deep-dive on the results.
    :::image type="content" source="media/advanced-automation-related-data-analytics-fabric/open-query-in-excel.png" alt-text="Screenshot of a SQL query being executed in a database query panel in Farbic." lightbox="media/advanced-automation-related-data-analytics-fabric/open-query-in-excel.png":::
8. (Optional) To store the SQL query for future use, click on the "Save Query" button.  
  
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

This query finds all desktop flows that use (OLEDB) DB connection strings that have been configured to use a plaintext password.

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

#### Potential sensitive data loss or exfiltration risk

This query detects desktop flows that include scripting actions leveraging SAP's internal GUI scripting engine. If this is unexpected, it may pose risks of data loss or exfiltration, as sensitive information could be accessed or manipulated by these scripts and unintentionally or maliciously altered or exposed.

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

#### Potential SQL injection risk

This query detects desktop flows that contain scripts potentially vulnerable to SQL injection by searching for the use of `database.executesqlstatement.execute` within the flow definitions. Consider a scenario where, instead of directly writing the SQL code in the [Execute SQL statement action](./desktop-flows/actions-reference/database#executesqlstatement), the script is configured to use a Power Automate desktop input variable (e.g., *%LetsDeleteAllGeneralLedgerEntriesFromDB%*) that is provided to the script during runtime. This could pose a significant SQL injection risk.

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
> Before you continue with this section, ensure that [**Desktop Flow Logs V2**](./desktop-flows/configure-desktop-flow-logs#configure-desktop-flow-action-log-version) has been enabled in your environment and that you have existing desktop flow runs.

#### Desktop flow runs with restricted URL access

This query finds web service invocations (Invoke Web Service action) within a specific desktop flow over the past three weeks. This is particularly useful for identifying and analyzing potentially suspicious endpoints or restricted API calls.

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

#### Desktop flow runs with cryprtographic code

This query scans desktop flow runs for PowerShell script actions that included cryptographic code over the past 7 days.

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

This query is a bit more advanced. It identifies and counts the number of distinct desktop flow runs (Flow Sessions) that include pro-coding parts (such as VBScript, PowerShell, JavaScript, .NET, or Python) within the last 7 days, and then groups the results bydesktop flow.

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

This query returns the top 10 failing actions by number of errors over the past 7 days.

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

## What's next

> [!div class="nextstepaction"]
> [Building custom Power BI reports for data insights in Fabric](automation-analytics-with-fabric-reports.md)

## Learn more

- [Automation-centric data analytics with Fabric](automation-analytics-with-fabric-introduction.md)
- [Building custom Power BI reports for data insights in Fabric](automation-analytics-with-fabric-reports.md)
- [Designing an automation-centric Fabric warehouse](automation-analytics-with-fabric-warehouse.md)
- [Setting up real-time alerts with Reflex for proactive monitoring](automation-analytics-with-fabric-alerts.md)