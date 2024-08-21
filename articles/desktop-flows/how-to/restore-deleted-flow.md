---
title: Restore a deleted desktop flow
description: Learn how to restore deleted desktop flows.
author: PetrosFeleskouras
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 08/21/2024
ms.author: pefelesk
ms.reviewer: 
contributors:
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - admin
---
# Restore deleted desktop flows

This article provides solutions and workarounds to fully or partially recover a deleted desktop flow. 

## Fully restore a deleted desktop flow

### Restore with solutions

The prerequisite is that the deleted desktop flow is part of a solution that has been exported locally.

To restore the flow, re-import the solution that contains the deleted flow. Learn how to [import a solution](../import-flow-solution.md). 

### Restore with an environment backup

To restore the deleted flow using a Power Platform environment backup, follow the steps below: 

1. Create a new Power Platform environment. 
1. Restore a backup of the deleted flow’s existing environment to the new target environment. Learn how to [restore environments](..//power-platform/admin/backup-restore-environments.md). 
1. In the new environment, create a new solution and add your desktop flow. 
1. Export the solution locally. 
1. Go back to the initial environment with the missing flow and import the solution. 

## Partially restore a deleted desktop flow

> [!IMPORTANT]
> - Only the flow actions can be retrieved with this workaround. Any other flow dependencies like UI elements, images, connection references, etc. cannot be retrieved.

### Restore from local flow run data

The prerequisite is that the flow was deleted from the Power Automate portal (not from the Power Automate console) and it has run at least once locally from the Power Automate console.

To recover the actions of the deleted flow, follow the steps below: 

1. Open “%localappdata%\Microsoft\Power Automate Desktop\Console\Workspace\<deleted desktop flow id>\<random string>\script.robin” with notepad 
1. Copy the lines right under text “@SENSITIVE” 
  - If the script is segregated into Subflows, then you would need to copy each subflow one by one.
    - For example, the actions of the “Main” subflow can be found under “@SENSITIVE” and prior to “FUNCTION <subflow_name_1>”. The actions of the next subflow can be found within the lines under “FUNCTION <subflow_name_1>” (included) and “END FUNCTION” (included), and so on. 
1. Create a new flow  
1. Paste the lines of the main subflow in the main workspace (right-click on the main workspace > Paste) 
1. Paste the lines of each subflow in the Subflows section of the Designer (right-click on Subflows > Paste) 

### Restore from environment audit logs 

The prerequisite is that auditing is enabled both in the environment, and in the **Process** Dataverse table. 

To check if auditing is enabled:
1. Go to [Power Platform Admin Center](http://aka.ms/ppac) > Environments > *your_environment_name* > Settings > Audit and logs 
1. Open **Audit settings** and ensure **Start Auditing** is enabled 
1. **Entity and field audit settings** > filter for **All** tables > Search for the **Process** table > Properties > Advanced options > In the **For this table** section ensure **Audit changes to its data** is enabled 

To recover the actions of the deleted flow, follow the steps below: 
1. Go to [Power Platform Admin Center](http://aka.ms/ppac) > Environments > *your_environment_name* > Settings > Audit and logs > Audit summary view
1. Search for a **Delete** event in the **Process** entity and open the record. 
1. Copy the **Definition** field to a text editor and replace all the **\r\n** characters with new lines (create a new line by pressing **Enter** for each set of \r\n characters) and follow the same steps as described in Restore from local run data starting from step #2. 
