---
title: AWS | Microsoft Docs
description: AWS Actions Reference
author: mariosleon
ms.service: flow
ms.topic: article
ms.date: 09/30/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# AWS

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../../includes/cc-beta-prerelease-disclaimer.md)]

Connect to Amazon web services and automate a variety of tasks

|<!-- --> |
|-----|
|[Start EC2 instance](#startec2instance)|
|[Stop EC2 instance](#stopec2instance)|
|[Reboot EC2 instance](#rebootec2instance)|
|[Get available EC2 instances](#getavailableec2instances)|
|[Describe instances](#describeec2instance)|
|[Create snapshot](#createsnapshot)|
|[Describe snapshots](#describesnapshots)|
|[Delete snapshot](#deletesnapshot)|
|[Create volume](#createvolumeaction)|
|[Attach volume](#attachvolume)|
|[Detach volume](#detachvolume)|
|[Describe volumes](#describevolumes)|
|[Delete volume](#deletevolume)|
|[Create EC2 session](#createec2sessionaction)|
|[End EC2 session](#endec2session)|

## EC2
Connect to Amazon EC2 and manage instances, EBS volumes and EBS snapshots
## Instances
Start, stop, reboot and get information for an EC2 instance
### <a name="startec2instance"></a> Start EC2 instance
Start EC2 instance(s)

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Instance IDs|No|List of Text values||The instance IDs to start|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|StartingEc2Instances|List of Instance state changes|The returned information for the started instances|


##### <a name="startec2instance_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Insufficient capacity|Indicates that there isn't enough capacity to fulfill the request|
|Invalid instance ID|Indicates that either the specified instance ID is malformed, or that the specified instance doesn't exist|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="stopec2instance"></a> Stop EC2 instance
Stop EC2 instance(s)

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Instance IDs|No|List of Text values||The instance IDs to stop|
|Force stop|N/A|Boolean value|False|Specifies whether to force the instances to stop. The instances don't have an opportunity to flush file system caches or file system metadata|
|Hibernation: |N/A|Boolean value|False|Specifies whether to hibernate the instance, if it was enabled for hibernation at launch. If the instance can't hibernate successfully, a normal shutdown occurs|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|StoppingEc2Instances|List of Instance state changes|The returned information for the stopped instances|


##### <a name="stopec2instance_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Unsupported operation|Indicates that an unsupported operation was requested. For example, an instance that is instance store-backed can't be stopped|
|Invalid instance ID|Indicates that either the specified instance ID is malformed, or that the specified instance doesn't exist|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="rebootec2instance"></a> Reboot EC2 instance
Reboot EC2 instance(s)

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Instance IDs|No|List of Text values||The instance IDs to reboot|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="rebootec2instance_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Unsupported operation|Indicates that an unsupported operation was requested. For example, an instance that is instance store-backed can't be stopped|
|Invalid instance ID|Indicates that either the specified instance ID is malformed, or that the specified instance doesn't exist|
|Incorrect state for the request|Indicates that the resource is in an incorrect state for the request. This can occur if there is an attempt to attach a volume that is still being created (ensure that the volume is 'available') or detach a volume that isn't attached|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="getavailableec2instances"></a> Get available EC2 instances
Get information for the relevant EC2 instances

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Availability zone|Yes|Text value||Specifies the availability zone,  a region code followed by a letter identifier|
|Instance state|N/A|Pending, All, Unknown, Running, Shutting down, Terminated, Stopping, Stopped|All|The state of the instance (pending, running, shutting down, terminated, stopping, stopped)|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Ec2InstancesInfo|List of EC2 instances info|The list of the EC2 instances|


##### <a name="getavailableec2instances_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="describeec2instance"></a> Describe instances
Returns all the information for the specified EC2 instance(s)

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Instance IDs|Yes|List of Text values||The instance IDs be describe|
|Availability zone|Yes|Text value||Specifies the availability zone, a region code followed by a letter identifier|
|Instance state|N/A|Pending, All, Unknown, Running, Shutting down, Terminated, Stopping, Stopped|All|The current state of the instance|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Ec2Instances|List of EC2 instances|The retrieved instance(s) with all the relevant information|


##### <a name="describeec2instance_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Invalid instance ID|Indicates that either the specified instance ID is malformed, or that the specified instance doesn't exist|
|Amazon service request failed|Indicates that the request to AWS failed|

## Snapshots
Create or delete an EBS snapshot and get related information
### <a name="createsnapshot"></a> Create snapshot
Create a snapshot of an EBS volume and stores it in Amazon S3

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Volume ID|No|Text value||The ID of the EBS volume|
|Name|Yes|Text value||The name of the snapshot|
|Description|Yes|Text value||A description for the snapshot|
|Purpose|Yes|Text value||The purpose of the snapshot|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Snapshot|EBS snapshot|The created snapshot|


##### <a name="createsnapshot_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Resource's limit is exceeded|Indicates that the limit for the specified resource is reached|
|Invalid volume|Indicates that either the volume ID isn't valid, or the specified volume doesn't exist 
or the volume isn't in the same availability zone as the specified instance|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="describesnapshots"></a> Describe snapshots
Describes the specified EBS snapshots available

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Describe snapshots mode|N/A|All snapshots, Snapshots by ID, Snapshots by owner ID, Snapshots by restorable user ID, Snapshots by custom filter|All snapshots|Specifies whether to get all snapshots of the defined region or filter snapshots by their ID, owner or user by which they are restorable|
|Snapshot IDs|Yes|List of Text values||The snapshot IDs to describe|
|Owner IDs|Yes|List of Text values||The owner IDs who own the snapshots|
|Restorable by user IDs|Yes|List of Text values||The IDs of the AWS accounts that can create volumes from the snapshot|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|EBSSnapshots|List of EBS snapshots|The retrieved snapshot(s) with all the relevant information|


##### <a name="describesnapshots_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Invalid snapshot ID|Indicates that either the specified snapshot ID is invalid, or that the specified snapshot doesn't exist|
|Invalid user ID|Indicates that the specified user or owner isn't valid|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="deletesnapshot"></a> Delete snapshot
Delete the specified snapshot

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Snapshot ID|No|Text value||The ID of the EBS snapshot to delete|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="deletesnapshot_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|The resource is in use|Indicates that the operation can't be completed because the resource is in use|
|Invalid snapshot ID|Indicates that either the specified snapshot ID is invalid, or that the specified snapshot doesn't exist|
|Amazon service request failed|Indicates that the request to AWS failed|

## Volumes
Create, attach, detach or delete an EBS volume and get related information
### <a name="createvolumeaction"></a> Create volume
Create an EBS volume

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Name|Yes|Text value||The desired name for the volume|
|Purpose|Yes|Text value||The purpose of the volume, if any|
|Availability zone|No|Text value||Specifies the availability zone, a region code followed by a letter identifier|
|From snapshot|N/A|Boolean value|False|Specifies whether to create the volume from a specified snapshot|
|Snapshot ID|No|Text value||The snapshot from to create the volume from|
|Volume size|No|Text value||The size of the volume in GBs|
|Size|Yes|Text value||The size must be equal to or larger than the snapshot size|
|Encrypted|N/A|Boolean value|False|Specifies whether to encrypt the volume|
|Volume type|N/A|Gp2, Standard, Io1, Sc1, St1|Gp2|The type of the volume|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Volume|EBS volume|The created volume|


##### <a name="createvolumeaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Invalid parameter|Indicates that a parameter specified in the request isn't valid, unsupported, or can't be used|
|Invalid zone|Indicates that the specified availability zone doesn't exist, or isn't available to use|
|Resource's limit is exceeded|Indicates that the limit for the specified resource is reached|
|Volume type isn't supported in the specified zone|Indicates that the specified availability zone doesn't support provisioned IOPS SSD volumes|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="attachvolume"></a> Attach volume
Attach an EBS volume to an EC2 instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Volume ID|No|Text value||The ID of the EBS volume|
|Instance ID|No|Text value||The ID of the instance|
|Device name|No|Text value||The name of the device|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="attachvolume_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Incorrect state for the request|Indicates that the resource is in an incorrect state for the request. This can occur if there is an attempt to attach a volume that is still being created (ensure that the volume is 'available') or detach a volume that isn't attached|
|Invalid parameter|Indicates that a parameter specified in the request isn't valid, unsupported, or can't be used|
|The resource is in use|Indicates that the operation can't be completed because the resource is in use|
|Invalid volume|Indicates that either the volume ID isn't valid, or the specified volume doesn't exist 
or the volume isn't in the same qvailability zone as the specified instance|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="detachvolume"></a> Detach volume
Detach an EBS volume from an EC2 instance

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Volume ID|No|Text value||The ID of the EBS volume|
|Instance ID|Yes|Text value||The ID of the instance|
|Device name|Yes|Text value||The name of the device|
|Force detachment|N/A|Boolean value|False|Specifies whether to force detachment, if the previous detachment attempt didn't occur cleanly|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="detachvolume_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Invalid parameter|Indicates that a parameter specified in the request isn't valid, unsupported, or can't be used|
|Incorrect state for the request|Indicates that the resource is in an incorrect state for the request. This can occur if there is an attempt to attach a volume that is still being created (ensure that the volume is 'available') or detach a volume that isn't attached|
|Invalid attempt to detach|Indicates an attempt to detach a volume from an instance to which it isn't attached|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="describevolumes"></a> Describe volumes
Describe the specified EBS volumes

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Describe volumes mode|N/A|All volumes, Volumes of the specified instance, Volumes with the specified IDs|All volumes|Specifies whether to describe all volumes, volumes specified by ID or volumes of an instance|
|Volume IDs|No|List of Text values||The volume IDs to describe|
|Instance ID|No|Text value||The ID of the instance that the volume is attached to|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|EBSVolumes|List of EBS volumes|The retrieved EBS volumes with all the relevant information|


##### <a name="describevolumes_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Invalid parameter|Indicates that a parameter specified in the request isn't valid, unsupported, or can't be used|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="deletevolume"></a> Delete volume
Delete the specified EBS volume

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|
|Volume ID|No|Text value||The ID of the EBS volume to delete|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="deletevolume_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Authentication failed|Indicates that the provided credentials couldn't be validated|
|Unauthorized operation|Indicates that an unauthorized operation was requested|
|Invalid parameter|Indicates that a parameter specified in the request isn't valid, unsupported, or can't be used|
|Incorrect state for the request|Indicates that the resource is in an incorrect state for the request. This can occur if there is an attempt to attach a volume that is still being created (ensure that the volume is 'available') or detach a volume that isn't attached|
|The resource is in use|Indicates that the operation can't be completed because the resource is in use|
|Amazon service request failed|Indicates that the request to AWS failed|

### <a name="createec2sessionaction"></a> Create EC2 session
Create an EC2 client to automate EC2 web services

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Access keys|N/A|Boolean value|False|Specifies whether to use access key ID  and secret access key in order to create the EC2 session|
|Access key ID|No|Text value||The AWS access key ID|
|Secret|No|Text value||The AWS secret access key|
|Region endpoint|No|Text value||The region constant to use that determines the endpoint to use|
|Profile name|Yes|Text value|default|The name of the profile to use |
|Profile location|Yes|Text value||The location of the credentials file that contains the profile to use|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|Ec2Client|EC2 client|The EC2 client|


##### <a name="createec2sessionaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Profile doesn't exist|Indicates that the specified profile doesn't exist|
|Invalid profile|Indicates that the specified profile isn't correctly configured|
|Create session failed|Indicates that the creation of EC2 client failed|

### <a name="endec2session"></a> End EC2 session
Dispose an open EC2 client

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|EC2 client|No|EC2 client||The EC2 client|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="endec2session_onerror"></a> Exceptions
- This action doesn't include any exceptions

