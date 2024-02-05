---
title: Azure actions reference
description: See all the available Azure actions.
author: mattp123

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/23/2022
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Azure actions

> [!IMPORTANT]
> You need an active Azure subscription to deploy Azure actions in your desktop flows.

Power Automate allows you to manage Azure virtual machines through the Azure group of actions. To implement Azure functionality in your desktop flows, create a new Azure session using the **Create session** action.

This action requires you to enter the **Client ID**, an authentication key for the specific application, and the respective password. Additionally, enter the **Tenant ID** that is the Microsoft Entra in which you've created the application.

Lastly, populate the appropriate **Subscription ID**. The subscription ID is a GUID that uniquely identifies your subscription to Azure services.

:::image type="content" source="media/azure/create-session-action.png" alt-text="Screenshot of the Create session action.":::

After creating the session and deploying all the needed Azure actions, use the **End session** action to terminate the Azure session.

:::image type="content" source="media/azure/end-session-action.png" alt-text="Screenshot of the End session action.":::

## <a name="getresourcegroups"></a> Get resource groups

Gets the resource groups based on the specified criteria.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Resource group name|Yes|[Text value](../variable-data-types.md#text-value)||The name of the resource group|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ResourceGroups|[List](../variable-data-types.md#list) of [Azure resource groups](../variable-data-types.md#azure)|The retrieved resource groups|

### <a name="getresourcegroups_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to get the resource groups with the specified criteria |Indicates that getting the resource groups with the specified criteria failed|

## <a name="createresourcegroup"></a> Create resource group

Creates a new resource group.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Resource group name|No|[Text value](../variable-data-types.md#text-value)||The name of the resource group|
|Location|No|[Text value](../variable-data-types.md#text-value)||The location where the new disk will be created|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ResourceGroup|[Azure resource group](../variable-data-types.md#azure)|The created resource group|

### <a name="createresourcegroup_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Resource group already exists|Indicates that the resource group already exists and can't be created|
|Failed to create resource group|Indicates that creating the resource group failed|

## <a name="deleteresourcegroup"></a> Delete resource group

Deletes the specified resource group and all the contained resources.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Resource group name|No|[Text value](../variable-data-types.md#text-value)||The name of the resource group|

### Variables produced

This action doesn't produce any variables.

### <a name="deleteresourcegroup_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to delete the resource group|Indicates that deleting the resource group failed|

## <a name="getdisksaction"></a> Get disks

Gets the disks based on the specified criteria.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Retrieve disks|N/A|All, With the specified resource group, With the specified name in all resource groups, With specific name in the specified resource group|All|Specify which disks to retrieve|
|Resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group where the disks reside|
|Disk name|No|[Text value](../variable-data-types.md#text-value)||The name of the disk|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Disks|[List](../variable-data-types.md#list) of [Azure managed disks](../variable-data-types.md#azure)|The retrieved disks with all the related information|

### <a name="getdisksaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Disk wasn't found|Indicates that the disk with the specified criteria doesn't exist|
|Resource group wasn't found|Indicates that the specified resource group wasn't found|
|Failed to get the disks with the specified criteria|Indicates that getting the disks with the specified criteria failed|

## <a name="attachdisk"></a> Attach disk

Attaches an existing disk to the virtual machine with the specified name and resource group.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client |No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Virtual machine name|No|[Text value](../variable-data-types.md#text-value)||The VM where the disk will be attached|
|VM resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the VM|
|Disk is managed|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether the disk to attach is managed|
|Disk name|No|[Text value](../variable-data-types.md#text-value)||The name of the disk to attach|
|Disk's resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the disk|
|Storage account |No|[Text value](../variable-data-types.md#text-value)||The storage account where VHD file is located|
|Container |No|[Text value](../variable-data-types.md#text-value)||The container that holds the VHD file|
|VHD file|No|[Text value](../variable-data-types.md#text-value)||The name of the VHD file|

### Variables produced

This action doesn't produce any variables.

### <a name="attachdisk_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|VM wasn't found|Indicates that the specified VM wasn't found|
|Disk wasn't found|Indicates that the disk with the specified criteria doesn't exist|
|Both unmanaged and managed disk can't exist together in a VM|Indicates that the attachment failed because both unmanaged and managed disk can't exist together in a VM|
|Failed to attach the disk|Indicates that the disk attachment failed|

## <a name="detachdisk"></a> Detach disk

Detaches the disk from the virtual machine with the specified name and resource group.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Virtual machine name|No|[Text value](../variable-data-types.md#text-value)||The VM from where the disk will be detached|
|Virtual machine's resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the VM|
|Disk name|No|[Text value](../variable-data-types.md#text-value)||The name of the disk to detach|
|Disk is managed|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specify whether the disk to detach is managed|

### Variables produced

This action doesn't produce any variables.

### <a name="detachdisk_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|VM wasn't found|Indicates that the specified VM wasn't found|
|Failed to detach because the disk isn't attached to the specified VM|Indicates that the detachment failed because the disk isn't attached to the specified VM|
|Failed to detach disk|Indicates that detaching the disk failed|

## <a name="createmanageddiskaction"></a> Create managed disk

Creates a managed disk with the specified settings.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Disk name|No|[Text value](../variable-data-types.md#text-value)||The name of the managed disk to create|
|Resource group option|N/A|Use existing, Create new|Use existing |Specify whether a new resource group will be created or an existing one will be used|
|Resource group name|No|[Text value](../variable-data-types.md#text-value)||The resource group of the disk|
|Location|No|[Text value](../variable-data-types.md#text-value)||The location where the new disk is created|
|Source type|N/A|None, Snapshot, Storage blob|None|Specifies whether to create an empty disk or use the snapshot of another disk  or use a blob in a storage account|
|Snapshot name|No|[Text value](../variable-data-types.md#text-value)||The managed snapshot to use as a source|
|Snapshot's resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the snapshot|
|Blob URL|No|[Text value](../variable-data-types.md#text-value)||The URL of the blob|
|Disk size in GB|No|[Numeric value](../variable-data-types.md#numeric-value)||Size of the disk in GB|
|Storage account type|N/A|Standard HDD, Premium SSD, Standard SSD, Ultra disk SSD|Standard HDD|The disk type|
|Storage account name|No|[Text value](../variable-data-types.md#text-value)||The name of the storage account where VHD file is stored|
|Availability zone|Yes|[Text value](../variable-data-types.md#text-value)||The availability zone for the managed disk|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ManagedDisk|[Azure managed disk](../variable-data-types.md#azure)|The created managed disk|

### <a name="createmanageddiskaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Resource group already exists|Indicates that the resource group already exists and can't be created|
|Resource group wasn't found|Indicates that the specified resource group wasn't found|
|The resource with the specified name already exists|Indicates that the resource with the specified name already exists|
|Snapshot wasn't found|Indicates that the specified snapshot wasn't found|
|Failed to create disk|Indicates that creating the disk failed|

## <a name="deletedisk"></a> Delete disk

Deletes the managed disk with the specified name and resource group.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Disk name|No|[Text value](../variable-data-types.md#text-value)||The name of the managed disk to delete|
|Resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the disk|

### Variables produced

This action doesn't produce any variables.

### <a name="deletedisk_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Disk wasn't found|Indicates that the disk with the specified criteria doesn't exist|
|Failed to delete the disk because it's attached to a VM|Indicates a problem deleting the disk because it's attached to a VM|
|Failed to delete disk|Indicates that deleting the disk failed|

## <a name="getsnapshotsaction"></a> Get snapshots

Gets the snapshots based on the specified criteria.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Retrieve snapshots|N/A|All, With the specified resource group, With the specified name in all resource groups, With specific name in the specified resource group|All|Specify which snapshots to retrieve|
|Resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group where the snapshots reside|
|Snapshot name|No|[Text value](../variable-data-types.md#text-value)||The name of the snapshot|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Snapshots|[List](../variable-data-types.md#list) of [Azure snapshots](../variable-data-types.md#azure)|The retrieved snapshots with all the related information|

### <a name="getsnapshotsaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Snapshot wasn't found|Indicates that the specified snapshot wasn't found|
|Resource group wasn't found|Indicates that the specified resource group wasn't found|
|Failed to get the snapshots with the specified criteria |Indicates that getting the snapshots with the specified criteria failed|

## <a name="createsnapshot"></a> Create snapshot

Creates a snapshot from the specified disk.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client |No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Snapshot name|No|[Text value](../variable-data-types.md#text-value)||The name of the snapshot to create|
|Resource group option|N/A|Use existing, Create new|Use existing |Specifies whether a new resource group will be created or an existing one will be used|
|Resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group where the snapshot will be created|
|Location|No|[Text value](../variable-data-types.md#text-value)||The location where the new disk will be created|
|Source disk|No|[Text value](../variable-data-types.md#text-value)||The name of the managed disk that will be used as source data|
|Source disk's resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the managed disk that will be used as source data|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Snapshot|[Azure snapshot](../variable-data-types.md#azure)|The created snapshot|

### <a name="createsnapshot_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Resource group already exists|Indicates that the resource group already exists and can't be created|
|Resource group wasn't found|Indicates that the specified resource group wasn't found|
|The resource with the specified name already exists|Indicates that the resource with the specified name already exists|
|Disk wasn't found|Indicates that the disk with the specified criteria doesn't exist|
|Failed to create snapshot|Indicates that creating the snapshot failed|

## <a name="deletesnapshot"></a> Delete snapshot

Deletes the snapshot with the specified name and resource group.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Snapshot name|No|[Text value](../variable-data-types.md#text-value)||The name of the snapshot to delete|
|Resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the snapshot|

### Variables produced

This action doesn't produce any variables.

### <a name="deletesnapshot_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Snapshot wasn't found|Indicates that the specified snapshot wasn't found|
|Failed to delete snapshot|Indicates that deleting the snapshot failed|

## <a name="getvirtualmachines"></a> Get virtual machines

Gets the basic information for the virtual machines.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Resource group|Yes|[Text value](../variable-data-types.md#text-value)||The resource group of the virtual machine|
|Status|N/A|Running, Deallocating, Deallocated, Starting, Stopped, Stopping, Unknown, Any|Any|The status of the virtual machine|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|VirtualMachinesInfo|[List](../variable-data-types.md#list) of [Azure virtual machine info](../variable-data-types.md#azure)|The retrieved virtual machines with basic information|

### <a name="getvirtualmachines_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Resource group wasn't found|Indicates that the specified resource group wasn't found|
|Failed to get the VMs with basic information|Indicates that getting the VMs with basic information failed|

## <a name="describevirtualmachineaction"></a> Describe virtual machine

Gets all the information for the virtual machine(s) based on the specified criteria.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Describe virtual machines|N/A|All, With the specified resource group, With the specified name in all resource groups, With specific name in the specified resource group|All|Specify which virtual machines to describe|
|Resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the virtual machine|
|Virtual machine name|No|[Text value](../variable-data-types.md#text-value)||The name of the virtual machine|
|Status|N/A|Running, Deallocating, Deallocated, Starting, Stopped, Stopping, Unknown, Any|Any|The status of the virtual machine|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|VirtualMachines|[List](../variable-data-types.md#list) of [Azure virtual machines](../variable-data-types.md#azure)|The retrieved virtual machines with all the related information|

### <a name="describevirtualmachineaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|VM wasn't found|Indicates that the specified VM wasn't found|
|Resource group wasn't found|Indicates that the specified resource group wasn't found|
|Failed to get basic information of the VM(s) |Indicates that getting basic information of the VM(s) failed|

## <a name="startvirtualmachine"></a> Start virtual machine

Starts the virtual machine.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Virtual machine name|No|[Text value](../variable-data-types.md#text-value)||The name of the virtual machine|
|Resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the virtual machine|

### Variables produced

This action doesn't produce any variables.

### <a name="startvirtualmachine_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|VM wasn't found|Indicates that the specified VM wasn't found|
|Failed to start the VM|Indicates that an error occurred while trying to start the VM|

## <a name="stopvirtualmachine"></a> Stop virtual machine

Stops the virtual machine and delocates the related hardware (CPU and memory) and network resources.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Virtual machine name|No|[Text value](../variable-data-types.md#text-value)||The name of the virtual machine|
|Resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the virtual machine|

### Variables produced

This action doesn't produce any variables.

### <a name="stopvirtualmachine_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|VM wasn't found|Indicates that the specified VM wasn't found|
|Failed to stop the VM|Indicates that an error occurred while trying to stop the VM|

## <a name="shutdownvirtualmachine"></a> Shut down virtual machine

Shuts down the operating system of a virtual machine.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Virtual machine name|No|[Text value](../variable-data-types.md#text-value)||The name of the virtual machine|
|Resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the virtual machine|

### Variables produced

This action doesn't produce any variables.

### <a name="shutdownvirtualmachine_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|VM wasn't found|Indicates that the specified VM wasn't found|
|Failed to shut down the VM|Indicates an error occurred while trying to shut down the VM|

## <a name="restartvirtualmachine"></a> Restart virtual machine

Restarts a virtual machine.

### Input parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|
|Virtual machine name|No|[Text value](../variable-data-types.md#text-value)||The name of the virtual machine|
|Resource group|No|[Text value](../variable-data-types.md#text-value)||The resource group of the virtual machine|

### Variables produced

This action doesn't produce any variables.

### <a name="restartvirtualmachine_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|VM wasn't found|Indicates that the specified VM wasn't found|
|Failed to restart the VM|Indicates that an error occurred while trying to restart the VM|

## <a name="createsessionaction"></a> Create session

Creates an Azure session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Client ID |No|[Text value](../variable-data-types.md#text-value)||The client ID of the application, also known as application ID, which identifies the application that is using the token|
|Client secret|No|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The secret for the client ID|
|Tenant ID|No|[Text value](../variable-data-types.md#text-value)||The directory ID of the Microsoft Entra|
|Subscription ID|Yes|[Text value](../variable-data-types.md#text-value)||The Azure subscription ID. If not provided, the default subscription will be used|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|AzureClient|[Azure client](../variable-data-types.md#azure)|The created Azure client |

### <a name="createsessionaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to create Azure client|Indicates that creating the Azure client failed|

## <a name="getsubscriptions"></a> Get subscriptions

Gets subscriptions that the current account can access.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client|No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|Subscriptions|[List](../variable-data-types.md#list) of [Azure subscriptions](../variable-data-types.md#azure)|The retrieved subscriptions with all the related information|

### <a name="getsubscriptions_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to get the subscriptions with the specified criteria|Indicates that getting the subscriptions with the specified criteria failed|

## <a name="endsession"></a> End session

Ends an Azure session.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Azure client |No|[Azure client](../variable-data-types.md#azure)||The client used to connect to Azure|

### Variables produced

This action doesn't produce any variables.

### <a name="endsession_onerror"></a> Exceptions

This action doesn't include any exceptions.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]