---
title: "Monitor and manage background workflow processes | MicrosoftDocs"
description: "To monitor and manage background workflow processes, you must locate the process, evaluate the status, and perform any actions necessary to address problems."
ms.date: 01/28/2022
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: "article"
author: "Mattp123"
ms.assetid: a987a803-4674-4eb0-87de-caefa003b1eb
caps.latest.revision: 12
ms.author: "angieandrews"
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Monitor and manage background workflow processes


To monitor and manage processes, you must locate the process, evaluate the status, and perform any actions necessary to address problems.  
  
<a name="BKMK_MonitorAsyncWorkflows"></a>   
## Monitoring background workflows  
Background workflows generate System Job rows to track their status. You can access information about these system jobs in several places within the application:  
  
- **[Settings](/powerapps/maker/model-driven-apps/advanced-navigation#settings)** > **System Jobs**  

  This will include all types of system jobs. You will need to filter rows to those where **System Job Type** is **Workflow**.  
  
- **From the background workflow process**  

  Open the background workflow definition and go to the **Process Session** tab. This will show only the system jobs for this background workflow.  
  
- **From the row**  

  You can edit the table form so that the navigation will include the **Background Processes** relationship. This will show all the system jobs that have been started in the context of the row.  
  
> [!NOTE]
> If an asynchronous system job (workflow) fails several times consecutively, the system starts to postpone execution of that job for longer and longer time intervals so that the administrator or app maker can investigate and resolve the issue. Once the job starts succeeding again, it will resume executing normally.  
  
<a name="BKMK_ActionsOnRunningWorkflows"></a>   
### Actions on running background workflows  
While a background workflow is running, you have options to **Cancel**, **Pause**, or **Postpone** the workflow. If you have previously paused a workflow, you can **Resume** it.  
  
<a name="BKMK_StatusOfWorkflowProcesses"></a>   
## Status of background workflow processes  
When you view a list of background workflow processes, any individual process can have one of the following **State** and **Status Reason** values:  
  
|State|Status Reason|  
|-----------|-------------------|  
|Ready|Waiting for Resources|  
|Suspended|Waiting|  
|Locked|In Progress<br /><br /> Pausing<br /><br /> Canceling|  
|Completed|Succeeded<br /><br /> Failed<br /><br /> Canceled|  

## Deleting process log rows

If your organization uses background workflows or business process flows that run frequently, the amount of process log rows can become large enough to cause performance issues as well as consume significant amounts of storage. To delete process log rows not removed sufficiently by one of the standard bulk row deletion jobs, you can use the bulk delete system jobs feature to create a custom bulk row deletion job.

1. Go to **Settings** > **Data Management** > **Bulk Row Deletion**.
2. From the **Bulk Row Deletion** area, select **New**. 
3. On the **Bulk Deletion Wizard** start page, select **Next**.
4. In the **Look for** list, select **System Jobs**.
5. The following conditions are used to create a bulk row deletion job to delete process log rows: 
   - **System Job Type Equals Workflow.** This targets background workflow rows. 
   - **Status Equals Completed.** Only completed workflows are valid to run the job against.
   - **Status Reason Equals Succeeded.** Delete successful, canceled, and failed jobs.
   - **Completed On Older than X Days 30.** Use the Completed On column to only delete background workflow process log rows that are older than 30 days.

   ![Screenshot showing settings to create a bulk row deletion job.](media/custom-bulk-record-deletion.png)
 
6. Select **Next**.
7. Set the frequency that your bulk delete job will run. You can schedule your job to run at set intervals or create a one-time bulk deletion job [Using the Immediately option](#using-the-immediately-option). In this example, a recurring job is set to run on May 21, 2018, and every 30 days thereafter. 

   ![Screenshot showing bulk row deletion options.](media/custom-bulk-record-delete-options.png)

### Using the Immediately option

Notice that you have the option of performing an immediate synchronous bulk delete of the rows by selecting the **Immediately** option. This delete is performed with direct SQL Server execution rather than passing each row through the delete event pipeline, which can reduce the impact to system performance. This is a good option if you want to quickly clean up the extra background workflow rows instead of the bulk delete job waiting in the asynchronous queue for processing. 

The **Immediately** option is enabled when the following conditions are true: 
- Bulk delete job is for the System Jobs table.
- The search criteria has the condition System Job Type Equals Workflow. 
- The user creating the bulk delete job has global depth for the delete privilege on the AsyncOperation table. The System Administrator security role has this privilege.  

The synchronous bulk delete will only delete AsyncOperation rows in the completed state. A maximum of 1 million rows are processed for each invocation. You will need to execute the job multiple times if your environment has more than 1 million rows to remove.  

## Troubleshoot issues

### Workflow run failure after change in owner

When a workflow owner user is deactivated, no longer has permissions to run workflows, or is changed by an administrator, runs that were previously started and are still in **Waiting** state will fail to run as they belong to the previous owner. In this situation, it is recommended to **Cancel** the waiting runs that belong to the previous owner. If you have runs that cannot be cancelled and need to be updated to the new owner, (contact support)[/power-platform/admin/get-help-support] for assistance.

## Next step   
[Best practices for background workflow processes](best-practices-workflow-processes.md) <br />



[!INCLUDE[footer-include](includes/footer-banner.md)]
