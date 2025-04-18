---
title: Connect to SAP ERP from process mining (preview)
description: Learn how to extract data from your SAP system and invoke RFC and BAPI functions using an on-premises data gateway.
author: HeatherOrt
contributors:
  - HeatherOrt
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/27/2023
ms.custom: bap-template
ms.author: michalrosik
ms.reviewer: angieandrews
---

# Connect to SAP ERP from process mining (preview)

[!INCLUDE[cc-beta-prerelease-disclaimer](./includes/cc-beta-prerelease-disclaimer.md)]

The SAP ERP (enterprise resource planning) connector in beta enables you to extract data from your SAP system. It allows you to invoke remote function calls (RFC) and business application programming interface (BAPI) functions using an on-premises data gateway. This SAP RFC connector is supported by Power Platform dataflows within Microsoft Power Automate Process Mining.

> [!IMPORTANT]
> [!INCLUDE[cc_preview_features_definition](includes/cc-preview-features-definition.md)]

## Prerequisites

Enabling SAP ERP connector requires several prerequisites to be completed. All prerequisites must be completed on the same machine where extraction will be made. You must have admin permissions with access to the target SAP instance.

- Ensure the windows machine (64 bit OS) is updated and has access to the target SAP machine.
- Ensure SAP credentials have requisite permission to run the desired RFCs or BAPIs.
- Ensure there are SAP S-user credentials to be able to download the SAP .NET Connector installer.

## Set up the connector

The following installers must exist in the desktop or virtual machine before using the connector.

1. Go to [SAP Connector for Microsoft .NET](https://support.sap.com/en/product/connectors/msnet.html) to download and install the NCo 3.0 for 64 bit.

    - Don't install NCo 3.1, as this version is not yet supported.
    - Access to the download requires a valid S-user. You might need to contact your SAP team.
    - Choose the 64 bit version. The 32 bit version won't work.
    - During installation, in the optional setup steps screen, select **Install assemblies to GAC**.

1. Download and install [Microsoft SAP RFC Reader](https://download.microsoft.com/download/6/3/c/63c54361-0fbb-4078-844f-45a3d9c1ce5a/SapRfcReaderInstall.msi) (V0.1.02232.26).

    - .NET Framework 4.7.2 or greater is required.
    - This is supported by Windows 10, Windows 11, Windows Server 2012 R2, Windows Server 2016, Windows Server 2019, and Windows Server 2022.

1. Download and install the Power Query [On-premises data gateway installation](https://go.microsoft.com/fwlink/?LinkId=2116849&clcid=0x4090). To learn more about the gateway requirements or for support, go to [Install an on-premises data gateway](/data-integration/gateway/service-gateway-install).

## Connection settings for SAP ERP

To instantiate your dataflow connection to the SAP ERP connector, you need to create a connection string with the following parameters.

|  Name             |  Key         | Required       |   Type  |  Description     |
|-------------------|--------------|----------------|---------|------------------|
| AS host           | `AppServerHost`        | Application server             | String  | The hostname of the SAP application server.         |
| Client                           | `Client`               | Application and message server | Integer | The SAP client ID to connect to the SAP system.         |
| AS system number                 | `SystemNumber`         | Application server             | Integer | The SAP system’s system number. It's a number from 00 to 99.            |
| Message server                   | `MessageServerHost`    | Message server                 | String  | Hostname of the SAP system’s message server. |        
| Message server service name/port | `MessageServerService`    | Message server                 | String  | Service name or the port number under which the message server is listening for load balancing requests.    |
| System ID                        | `SystemID`             | Message server                 | String  | SAP system's three letter system ID.      |
| Logon group                      | `LogonGroup`           | Message server                 | String  | The logon group for the SAP system from which the message server selects an application server.                                                                   |
| Logon type                       | `LogonType`            | Application and message server | String  | The type of logon to the SAP system. It's either application server logon (type A), or group logon (Type B, also known as message server). Values can be `ApplicationServer` or `Group`. |

## Set up the SAP system connection string

This connector supports SAP authentication only currently. Constructing the script is dependent on connection type and is outlined in the following sections. 

### Application server

1. Connection string template: `{"AppServerHost":"<application server>","Client":"<client id>","SystemNumber":"<system number","LogonType":"ApplicationServer"}`.`

1. Replace everything in `<>` with your application server system settings. For example, for a server sap.contoso.com with system number 00 and client id 100: `{"AppServerHost":"sap.contoso.com","Client":"100","SystemNumber":"00","LogonType":"ApplicationServer"}`.

### Message server

Although **Data gateway** isn't marked as a requirement in connection settings, identifying the data gateway is required for connecting to the SAP ERP connector.

1. Connection string template: `{"MessageServerHost": "<message server>", "MessageServerService":"<message server service name/port>", "LogonType": "Group", "SystemID": "<system id>", "Client": "<client id>", "LogonGroup":"<logon group>"}`. 

1. Replace everything in `<>` with your message server system settings noting that you might or might not require both MessageServerService and SystemID. For example, for server 10.0.0.1 with message server port 3333 and client id 800 and logon group COTO: `{"MessageServerHost": "10.0.0.1", "MessageServerService":"3333", "LogonType": "Group", "Client": "800", "LogonGroup":"COTO"}`.`

## Enable function parsing

After connections, the RFC shows up as a function with the parameter metadata and an optional **Enable Function Parsing** option. Fill in the parameters and select **Invoke** to get the data. You should rely on your SAP produced documentation or custom documentation for RFC parameters.  

The function parsing mode for the connector understands contracts of two widely used RFCs: `RFC_READ_TABLE` and `/SAPDS/RFC_READ_TABLE2`. They'll take this interpretation and parse out the output in an easy to read format instead of requiring you to do so in M script. Function parsing can be enabled not only for the previously mentioned RFCs, but also for RFCs with the same contract such as `BBP_RFC_READ_TABLE` or `/BODS/RFC_READ_TABLE2`. This includes custom RFCS deployed by the customer to the SAP system.

## Authentication

The SAP ERP connector only supports basic SAP authentication. Because the connector is designed to be used by multiple users of an app, the connections aren't shared. Each user authenticates with the SAP system.

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

As a custom connector, by default we save the connection in your [System Drive]\Windows\ServiceProfiles\PBIEqwService\Documents\Power BI Desktop\Custom Connectors folder. If this folder doesn't exist, or if the gateway is configured to use a different custom connector folder, you get this error. To fix this, copy the **SAPERP.mez** connector file from [System Drive]\Windows\ServiceProfiles\PBIEqwService\Documents\Power BI Desktop\Custom Connectors and into the folder that you configured in your gateway.  

:::image type="content" source="media/process-mining-sap-erp/faq-mez.png" alt-text="<alt text>":::

### Do I always need to identify a data gateway in connection settings?

As part of connection setting you must identify a data gateway to successfully connect through the SAP ERP connector.

### My connection continues to fail, what can I do to remediate?

Make sure to check that installers described in this article are current. Reinstalling drivers might solve your connection issues.  


