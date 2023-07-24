---
title: Connect to SAP ERP from process mining
description: Learn how to extract data from your SAP system and invoke RFC and BAPI functions using an on-premises data gateway.
author: donums
contributors:
  - donums
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 06/27/2023
ms.custom: bap-template
ms.author: heortaol
ms.reviewer: angieandrews
---

# Connect to SAP ERP from process mining

The SAP ERP (enterprise resource planning) connector in beta enables you to extract data from your SAP system. It allows you to invoke remote function calls (RFC) and business application programming interface (BAPI) functions using an on-premises data gateway. This SAP RFC connector is supported by Power Platform Dataflows within Microsoft Supply Chain Center.

<!--add links and screenshots from doc. Confirm desktop app vs capability. Add preview tags? Use heather's gh alias.-->

## Prerequisites

Enabling SAP ERP connector requires several prerequisites to be completed. All prerequisites must be completed on the same machine where extraction will be made. You must have admin permissions with access to the target SAP instance.

- Ensure the windows machine (64-bit OS) is updated and has access to the target SAP machine.
- Ensure SAP credentials have requisite permission to run the desired RFCs or BAPIs.
- Ensure there are SAP S-User credentials to be able to download the SAP .NET Connector installer.

## Set up the connector

The following installers must exist in desktop or virtual machine before using the connector.

1. Go to SAP Connector for Microsoft .NET to download and install the NCo 3.0 for 64 bit.

    - Don't install NCo 3.1, as this version is not yet supported.

    - Access to the download requires a valid S-user. You maight need to contact your SAP team.

    - You must choose the 64 bit version. The 32-bit version won't work.

    - During installation, in the Optional setup steps screen, select **Install assemblies to GAC**.

1. Download and install [Microsoft SAP RFC Reader](https://download.microsoft.com/download/6/3/c/63c54361-0fbb-4078-844f-45a3d9c1ce5a/SapRfcReaderInstall.msi) (V0.1.02232.26). 

    - .NET Framework 4.7.2 or greater is required.

    - Supported by Windows 10, Windows 11, Windows Server 2012 R2, Windows Server 2016, Windows Server 2019, Windows Server 2022.

1. Install the Power Query on-premises data gateway <!--Heather: Link doesn't open. Message: "A network change was detected." https://go.microsoft.com/fwlink/?LinkId=2116849&clcid=0x409-->. To learn more about the gateway requirements or for support, go to [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

## Connection settings for SAP ERP <!--or should it be RFC, as in the Word doc?-->

To instantiate <!--Can we use simpler terms?-->your dataflow connection to the SAP ERP connector, you need to create a connection string with the following parameters.

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

## Setup the SAP system connection string

This connector supports SAP authentication only currently. Constructing the script is dependent on connection type and is outlined in the following sections. 

### Application server

1. Connection string template: `{"AppServerHost":"<application server>","Client":"<client id>","SystemNumber":"<system number","LogonType":"ApplicationServer"}`.`

1. Replace everything in `<>` with your application server system settings. For example, for a server sap.contoso.com with system number 00 and client id 100: `{"AppServerHost":"sap.contoso.com","Client":"100","SystemNumber":"00","LogonType":"ApplicationServer"}`.

### Message server

Although **Data gateway** isn't marked as a requirement in connection settings, identifying the data gateway is required for connecting to the SAP ERP connector.

1. Connection string template: `{"MessageServerHost": "<message server>", "MessageServerService":"<message server service name/port>", "LogonType": "Group", "SystemID": "<system id>", "Client": "<client id>", "LogonGroup":"<logon group>"}`. 

1. Replace everything in `<>` with your message server system settings noting that you might or might not require both MessageServerService and SystemID. For example, for a server 10.0.0.1 with messge server port 3333 and client id 800 and logon group COTO: `{"MessageServerHost": "10.0.0.1", "MessageServerService":"3333", "LogonType": "Group", "Client": "800", "LogonGroup":"COTO"}`.`

## Enable function parsing

After connections, the RFC shows up as a function with the parameter metadata and an optional **Enable Function Parsing** option. Fill in the parameters and select **Invoke** to get the data. You should rely on your SAP produced documentation or custom documentation for RFC parameters.  

The function parsing mode for the connector understands contracts of two widely used RFCs: `RFC_READ_TABLE` and `/SAPDS/RFC_READ_TABLE2`. They'll take this interpretation and parse out the output in an easy to read format instead of requiring you to do so in M script. Function parsing can be enabled not only for the above mentioned RFCs, but also for RFCs with the same contract such as `BBP_RFC_READ_TABLE` or `/BODS/RFC_READ_TABLE2`, including custom RFCS deployed by the customer to the SAP system.

## Authentication

The SAP ERP connector only supports basic SAP Authentication. Because the connector is designed to be used by multiple users of an app, the connections aren't shared. Each user authenticates with the SAP system.  

## Known issues and limitations

The following are some of the known issues and limitations of the SAP ERP connector.

- The connector supports only RFCs and BAPIs.
- The connector doesn't support receiving messages from SAP Server.
- Transactional RFCs (tRFCs) aren't supported.
- The gateway has a 2 MB payload limit for write operations and an 8 MB compressed data response limit for read operations.

## FAQ

### The SAP ERP beta connector is labeled as third party. Is this connector not created or managed by Microsoft?

The connector was created by Microsoft and is managed by Microsoft. As a beta connector, it holds a third party label until it becomes generally available.

### I'm getting the following error when attempting to connect: “The given data source kind is not supported Data source kind SAPERP”. How do I address this?  

As a custom connector, by default we save the connection in your [System Drive]\Windows\ServiceProfiles\PBIEqwService\Documents\Power BI Desktop\Custom Connectors folder. If this folder doesn't exist, or if the gateway is configured to use a different custom connector folder, you will see the above error. To remediate, copy the SAPERP.mez connector file from [System Drive]\Windows\ServiceProfiles\PBIEqwService\Documents\Power BI Desktop\Custom Connectors and copy it into the folder that you configured in your gateway.  

<!--get screenshot-->

### Do I always need to identify a Data gateway in connection settings?

As part of connection setting you must identify a data gateway in order to successfully connect through the SAP ERP connector.

### My connection continues to fail, what can I do to remediate?

Make sure to check that installers described above are up to date and current. Reinstalling drivers may solve your connection issues.  

## SAP template

The following sections apply only to process mining.

### Connecting to SAP ERP through process mining templates

Use process mining templates for **Procure to Pay** or **Accounts Payable** to visualize the financial processes that sit in your SAP instance.

Once you select a template and select to connect to SAP through the RFC connector, fill out the following information.

#### Application server

- **Process Name:** Name your process so you can easily identify your analysis.
- **Server Name:** Identify the name of the server you're looking to connect to.
- **Client ID:** Identify the client ID.  
- **System Number:** Identify the system number.  
- **(Optional) Process Description**.

#### Message server

- **Process Name:** Name your process so you can easily identify your analysis.
- **Server**
- **System ID**
- **Client ID**
- **logonggroup**
- **(Optional) Process Description**

You can also scope the data extracted by defining your data range.

- Start and end time of the data extracted
- Client code
- Company codes

The **MQuery Logic** template defines and extracts data from SAP. If the data isn't complete, or you're interested in making changes to the logic, go to the process details page, select **SetUp** <!--Where is this?--> and reparse RFC.

### See also

<!--Are there any?-->