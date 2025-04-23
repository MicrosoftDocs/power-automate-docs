---
title: Use Power Automate within the EU Data Boundary
description: Learn how to use Power Automate within the EU Data Boundary.
suite: flow
author: radioblazer
ms.author: matow
ms.reviewer: angieandrews
ms.topic: conceptual
ms.date: 02/10/2025
search.audienceType: 
  - admin
---

# Use Power Automate within the EU Data Boundary 

The [EU Data Boundary](https://learn.microsoft.com/privacy/eudb/eu-data-boundary-learn) is a geographically defined boundary within which Microsoft has committed to store and process Customer Data and personal data for Microsoft online services including Power Automate. 

Power Automate temporarily transfers some pseudonymized personal data from the EU for certain Power Automate cloud flows created before November 2024. Prior to this date, cloud flows created outside of solutions were created in per-user resource groups with resource group names containing the user's object ID being globally replicated. Customers can ensure that pseudonymized personal data resides within the EU Data Boundary for these flows through the use of a migration tool available to Power Platform administrators. This document details the use of this tool.

## Prerequisites 
* [Power Platform administrator access](https://learn.microsoft.com/power-platform/admin/use-service-admin-role-manage-tenant) for the environments you wish to check or migrate 
* Permissions to run PowerShell as an administrator
* Install and use the [Power Platform Administrator PowerShell module](https://learn.microsoft.com/power-platform/admin/powerapps-powershell) for access to the Get-AdminFlow,  Start-EUDBMigration, Cancel-EUDBMigration, and Get-EUDBMigrationStatus PowerShell cmdlets. 

## Plan for migration
To identity which flows need to be migrated and from which environments, run the [Get-AdminFlow cmdlet](https://learn.microsoft.com/powershell/module/microsoft.powerapps.administration.powershell/get-adminflow) with the flag **IncludeEUDBNonCompliantFlows**. This command will list all the flows in need of migration from the environments that you have Power Platform administrator permissions.

List flows from across all environments: 
<pre>
Get-AdminFlow -IncludeEUDBNonCompliantFlows $true
</pre>

List flows from a specific environment:

<pre>
Get-AdminFlow -EnvironmentName 00aa00aa-bb11-cc22-dd33-44ee44ee44ee -IncludeEUDBNonCompliantFlows $true
</pre>

## Perform the migration
Once you have identified which environments have flows that need to be migrated, you can proceed to migrate them either individually or environment-by-environment using the [Start-EUDBMigration cmdlet](https://learn.microsoft.com/en-us/powershell/module/microsoft.powerapps.administration.powershell/start-eudbmigration). After starting the migration, save the **Operation ID** that is returned. You can use this with the [Get-EUDBMigrationStatus](https://learn.microsoft.com/powershell/module/microsoft.powerapps.administration.powershell/get-eudbmigrationstatus) cmdlet to check whether the migration has completed or is still in progress. 

During migration: 
* Users will briefly be unable to access, turn on or off, or save cloud flows while they are being migrated, with error **Flow '[...]' is currently undergoing system maintenance. Please try the operation later.**
* New runs of instant (manually triggered) cloud flows will not be able to be started.
* Automated and scheduled cloud flows will continue to run uninterrupted.

 For instant flows that are frequently run, it's recommended to migrate them individually during off-hours. When performed on the environment level, migration occurs on a rolling basis during off-hours to minimize disruption, based on the Power Platform region of the environment. Environments with thousands of cloud flows may take up to two weeks to completely migrate. Migration does not require any action from flow owners, or cause any change to flow definitions or connections. 

Example: Starting the migration of all the non-compliant flows in the environment 00aa00aa-bb11-cc22-dd33-44ee44ee44ee

<pre>
Start-EUDBMigration -EnvironmentName 00aa00aa-bb11-cc22-dd33-44ee44ee44ee
</pre>

Example: Starting the migration for several specific flows: 

<pre>
Start-EUDBMigration -EnvironmentName 00aa00aa-bb11-cc22-dd33-44ee44ee44ee -FlowNames 00001111-aaaa-2222-bbbb-3333cccc4444,11112222-bbbb-3333-cccc-4444dddd5555,22223333-cccc-4444-dddd-5555eeee6666
</pre>


