---
title: Use the SAP ECC connector
description: Learn how to extract data from your SAP system and invoke RFC and BAPI functions using an on-premises data gateway.
author: donums
contributors:
  - donums
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 06/09/2023
ms.custom: bap-template
ms.author: derahonuorah
ms.reviewer: angieandrews
---

# Use the SAP ERP connector

The SAP ERP connector, in beta, enables users to extract data from their SAP system and allows you to invoke RFC and BAPI functions using on-premises data gateway. This SAP RFC connector is supported by Power Platform Dataflows within Supply Chain Center. 

<!--add links and screenshots from doc-->

## Prerequisites

Enabling SAP ERP connector requires several pre-requisites to be completed. All pre-requisites must be completed on the same machine where extraction will be made and has admin permissions with access to the target SAP instance.

Ensure the windows machine (64-bit OS) is updated and has access to the target SAP machine 

Ensure SAP credentials have requisite permission to run the desired RFC(s) or BAPI(s) 

SAP S-User credentials to be able to download the SAP .NET Connector installer 

## Setup the connector

The following installers must exist in desktop or virtual machine before using the connector: 

1. Go to SAP Connector for Microsoft .NET to download and install the NCo 3.0 for 64bit 

    1. Do not install NCo 3.1 as this version is not yet supported  

    1. Access to the download requires a valid S-user. You may need to reach out to your SAP team 

    1. You must choose the 64-bit version, the 32-bit version will not work 

    1. During installation, in the Optional setup steps window, make sure to select the Install assemblies to GAC option 

1. Install the SAP RFC Reader (V0.1.02232.26) which is an ADO.NET provider found here. 

    1. .NET Framework 4.7.2 or greater is required 

    1. Supported by Windows 10, Windows 11, Windows Server 2012 R2, Windows Server 2016, Windows Server 2019, Windows Server 2022 

Install the Power Query On prem Data gateway here. To learn more about the gateway requirements or for support, go to [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

## Connection Settings: Connecting to SAP RFC 

To instantiate your dataflow connection to SAP ERP connector you will need to create a connection string. With the following parameters: 

|               Name               |          Key         |            Required            |   Type  |                                                                               Description                                                                              |
|:--------------------------------:|:--------------------:|:------------------------------:|:-------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------:|
| AS Host                          | AppServerHost        | Application Server             | String  | The hostname of the SAP Application Server                                                                                                                             |
| Client                           | Client               | Application and Message Server | Integer | The SAP client ID to connect to the SAP system                                                                                                                         |
| AS System Number                 | SystemNumber         | Application Server             | Integer | The SAP System’s System Number. It is a number ranging from 00 to 99                                                                                                   |
| Message Server                   | MessageServerHost    | Message Server                 | String  | Hostname of the SAP System’s Message server                                                                                                                            |
| Message Server Service Name/Port | MessageServerService | Message Server                 | String  | Service Name or the Port Number under which the Message Server is listening for load balancing requests                                                                |
| System ID                        | SystemID             | Message Server                 | String  | SAP systems three-letter system ID                                                                                                                                     |
| Logon Group                      | LogonGroup           | Message Server                 | String  | The Logon Group for the SAP system from which the Message Server shall select and Application Server                                                                   |
| Logon Type                       | LogonType            | Application and Message Server | String  | The type of logon to the SAP system, either application server logon (type A) or Group Logon (Type B aka Message Server). Values can be “ApplicationServer” or “Group” |

Setup SAP system connection string - This connector supports SAP authentication only currently. Constructing the script is dependent on connection type and is outlined below:  

### Application Server

1. Connection string template: {"AppServerHost":"<application server>","Client":"<client id>","SystemNumber":"<system number","LogonType":"ApplicationServer"} 

1. You will want to replace everything in <> with your application server system settings eg for a server sap.contoso.com with system number 00 and client id 100 it would be {"AppServerHost":"sap.contoso.com","Client":"100","SystemNumber":"00","LogonType":"ApplicationServer"} 

### Message Server

1. Connection string template: {"MessageServerHost": "<message server>", "MessageServerService":"<message server service name/port>", "LogonType": "Group", "SystemID": "<system id>", "Client": "<client id>", "LogonGroup":"<logon group>"} 

1. You will want to replace everything in <> with your message server system settings noting that you may or may not require both MessageServerService and SystemID eg for a server 10.0.0.1 with messge server port 3333 and client id 800 and logon group COTO it would be {"MessageServerHost": "10.0.0.1", "MessageServerService":"3333", "LogonType": "Group", "Client": "800", "LogonGroup":"COTO"} 

Although Data gateway is not marked as a requirement in connection settings, identifying the Data Gateway will be required for connecting to the SAP ERP connector.  

## Enable function parsing 

After connections the RFC will show up as a function with the parameter metadata and an optional “Enable Function Parsing” option. Fill in the parameters and click Invoke to get the data. Users should rely on their SAP produced documentation or custom documentation for RFC parameters.  

The function parsing mode for the connector understands contracts of two widely used RFCs: RFC_READ_TABLE and /SAPDS/RFC_READ_TABLE2. They will take this interpretation and parse out the output in an easy to read format instead of requiring the user to do so in M script. Function parsing can be enabled not only for the above mentioned RFCs but also for RFCs with the same contract such as BBP_RFC_READ_TABLE or /BODS/RFC_READ_TABLE2 including custom RFCS deployed by the customer to the SAP system. 

## Authentication 

The SAP ERP connector only supports basic SAP Authentication. Because the connector is designed to be used by multiple users of an app, the connections are not shared. Rather, each user will authenticate with the SAP system.  

## Known issues and limitations 

The following are some of the known issues and limitations of the SAP ERP Connector: 

The connector supports only RFCs and BAPIs 

The connector does not support receiving messages from SAP Server 

Transactional RFCs (tRFCs) are not supported. 

The gateway has a 2-MB payload limit for write operations and an 8-MB compressed data response limit for read operations 

## FAQ

### The SAP ERP Beta connector is labeled as 3rd Party, is this connector not created or managed by Microsoft? 

The connector was created by Microsoft and is managed by Microsoft. As a beta connector it will hold a “3rd party” label until it becomes generally available.  

### I am getting the following error when attempting to connect “The given data source kind is not supported Data source kind SAPERP”, how do I address?  

As a custom connector we default save the connection in your [System Drive]\Windows\ServiceProfiles\PBIEqwService\Documents\Power BI Desktop\Custom Connectors folder, if this folder does not exist or if gateway is configured to use a different custom connector folder you will see the above error. To remediate the user will need to copy the SAPERP.mez connector file from [System Drive]\Windows\ServiceProfiles\PBIEqwService\Documents\Power BI Desktop\Custom Connectors and copy in to the folder that you configured in your gateway.  

<!--get screenshot-->

### Do I always need to identify a Data gateway in connection settings? 

As part of connection setting you must identify a Data gateway in order to successfully connect through the SAP ERP connector 

### My connection continues to fail, what can I do to remediate? 

Make sure to check that installers described above are up to date and current. Reinstalling drivers may solve your connection issues.  

## SAP template
<!--Heather re-named from Process Advisor ONLY documentation-->

### Connecting to SAP ERP through process mining templates 

Use process mining templates for Procure to Pay or Accounts Payable to visualize the financial processes that sit in your SAP Instance 

Once you select a template and select to connect to SAP through the RFC connector you will need to fill out the following information: 

#### Application server

- Process Name: give a name to your process so you can easily identify your analysis 
- Server Name: identify the name of the server you are looking to connect to 
- Client ID: identify the client ID  
- System Number: identify the system number  
- Process Description (optional) 

#### Message server 

- Process Name: give a name to your process so you can easily identify your analysis 
- Server 
- System ID 
- Client ID 
- logonggroup 
- (Optional) Process Description

You will also be able to scope the data extracted by defining your data range: 

- Start and End time of the data extracted 
- Client code 
- Company codes 

The template MQuery Logic will define and extract data from SAP. If the data is not complete or you are interested in making changes to the logic, navigate to the process details page and select SetUp and reparse RFC. 

### See also

