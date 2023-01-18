---
title: Create an environment variable with SAP connection parameters (preview)
description: Define an environment variable in Power Apps that contains all of your SAP system information, then reuse it in your SAP flow actions
author: jongilman88
contributors:
- EllenWehrle
- galitskyd
- microsoft-dustin
- ryanb58
- scottwoodallmsft
- Wrighttyler
ms.author: jongilman
ms.reviewer: ellenwehrle
ms.subservice: power-automate-connections
ms.topic: how-to
ms.date: 11/01/2022

--- 
# Create an environment variable with SAP connection parameters (preview)

[This article is prerelease documentation and is subject to change.]

SAP has multiple connection parameters, and manually entering the parameters into each Power Automate cloud flow action can be time-consuming. The preview SAP Integration solution available for [download](https://github.com/jongilman88/PowerPlatformSAPIntegration) includes an environment variable JSON string template for entering all of your SAP system information. Once your environment variable is defined, you can reuse it in your SAP actions without having to reenter it.

## Define the environment variable

1. Sign in to [Power Apps](https://make.powerapps.com) to [create an environment variable in a solution](/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution).

1. Select **Solutions** in the left navigation panel.

1. Open the **SAP Integration** solution.

1. On the command bar, select **New** > **More** > **Environment variable**.

1. Complete the fields in the Environment variable panel.

    - **Display name**: Enter a display name for the environment variable.
    - **Name**: This name is automatically generated as you enter the display name, but you can change it.
    - **Data Type**: Select **Data source** 
    - **Connector**: Select **SAP ERP** Once selected, additional fields will appear.

   :::image type="content" source="media/env-refs/saperp-datasource-variable.png" alt-text="The environment variable panel in Power Apps.":::

1. Complete the relevant fields for your SAP system. Refer to the [SAP property guidance](#sap-property-guidance) below for additional information. You can also refer to the info bubbles for the available fields.

### SAP property guidance

| Property  |Description |
|-|-|
| Application Server Host        | The hostname of the SAP application Server. Used when the "Application Server" Connection Type is selected. |
| Application Server Service     | The service name or port number of the specific SAP application server to connect to (Optional if Connection Type Application Server). |
| Client  | The SAP client ID to connect to the SAP system. The SAP backends' client (or 'Mandant') into which to log in. It's a number ranging from 000 to 999. |
| Logon Group  | The logon group for the SAP system, from which the message server selects an application server (Only available if connection type is Message Server. |
| Connection Type   | The type of logon to the SAP system. The allowed values are either Application Server Logon (Type A) or Message Server (Type B, also known as Group Logon).|
| Message Server Host  | The hostname of the SAP system's message server (central instance) also known as R3 system name (Mandatory if connection type Message Server).  |
| Message Server Service | The service name (as defined in etc/services) or the port number under which the message server is listening for load-balancing requests (Mandatory if connection type is Message Server and system ID isn't present). |
| SNC Certificate  | The secure network connector (SNC) X.509 certificate in Base64 encoded form, without the begin or end certificate tags. |
| SNC My Name  | The installed SNC solution usually knows its own SNC name. For solutions supporting multiple identities, you may need to specify the identity to be used for this destination/server (optional). |
| SNC Library Path  | The name or path of the SNC library to be used. With the on-premises data gateway, the path can be an absolute or relative to the NCo library.  |
| SNC Partner Name  | The backends' SNC name (Required when type of logon is Application Server). |
| SNC QoP | The quality of service to be used for SNC communication of this destination/server. The allowed values are Authentication, Integrity, Privacy, Default, and Maximum. |
| Snc SSO  | SNC SSO specifies whether to use SNC identity or credentials provided on the RFC level.  |
| System ID  | The SAP system's three-letter system ID (Mandatory if connection type Message Server and message server service isn't present).  |
| System Number  | The SAP system's system number. It's a number ranging from 00 to 99 (Mandatory if connection type Application Server).   |
| Use SNC | When selected, the connections will be secured with SNC. |

## Reuse the environment variable in a flow

Environment variables are available in a flow's dynamic content selector. Go into an SAP Integration cloud flow to select the environment variables to reuse in [SAP actions](/connectors/sap/#actions).

1. [Edit a solution-aware cloud flow.](/power-automate/edit-solution-aware-flow)
1. In a flow action, select **Add dynamic content** to open the dynamic content selector. All environment variables that you have access to are listed.
1. Select the desired environment variable.
1. Select **Save**.

 :::image type="content" source="media/env-refs/header-dynamic-content.png" alt-text="The header's dynamic content selector list in a solution-aware cloud flow.":::

Learn more: [Use environment variables in Power Automate solution cloud flows](/power-apps/maker/data-platform/environmentvariables#use-environment-variables-in-power-automate-solution-cloud-flows)

> [!IMPORTANT]
>
> Any time an environment variable is updated in a cloud flow, the updated values are not automatically used the next time the flow runs. The updated flow must be **deactivated and reactivated** for the updated values to take effect.

### See also

- [Set up SAP integration with Power Platform (preview)](set-up-prepare.md)
- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
