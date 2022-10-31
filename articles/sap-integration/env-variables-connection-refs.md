---
title: Create an environment variable with SAP connection parameters (preview)
description: Create an environment variable in Power Apps that contains all of your SAP system information.
author: EllenWehrle
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 10/31/2022
ms.author: ellenwehrle
ms.reviewer: 
  - jongilman
  - dgalitsky
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - administrator
  - enduser

--- 
# Create an environment variable with SAP connection parameters (preview)

[This article is pre-release documentation and is subject to change.]

SAP has multiple connection parameters, and manually entering the parameters into each Power Automate cloud flow action can be time consuming. The preview SAP Integration solution available for [download](https://github.com/jongilman88/PowerPlatformSAPIntegration) includes an environment variable JSON string template for entering all of your SAP system information. Once your environment variable is defined, you can reuse it in your SAP actions without having to reenter it again.

## Define the environment variable

1. Sign in to [Power Apps](https://make.powerapps.com) to [create an environment variable in a solution](/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution).
1. Select **Solutions** in the left navigation panel.
1. Open the **SAP Integration** solution.
1. On the command bar, select **New** > **More** > **Environment variable**.
1. Complete the fields in the Environment variable panel.
    - **Display name**. Enter a display name for the environment variable.
    - **Name**. This name is automatically generated as you enter the display name, but you can change it.
    - **Data Type**. Select **Text** (_don't_ select JSON). Once selected, the value fields will appear.
        - **Default Value**. Offers a environment variable template.
        - **Current Value**. Update the JSON blob with SAP system's SAP properties. Not all properties are necessary—your SAP environment will determine which ones are applicable. Refer to the SAP property guidance.

 :::image type="content" source="media/env-refs/env-var-panel.png" alt-text="The environment panel in Power Apps.":::

### SAP property guidance

| Property  |Description |
|-|-|
| AppServerHost        | The hostname of the SAP application Server. |
| AppServerService     | The service name or port number of the specific SAP application server to connect to (Optional if connection type (Logon) is A - Application Server). |
| Client  | The SAP client ID to connect to the SAP system. The SAP backends' client (or 'Mandant') into which to log in. It's a number ranging from 000 to 999. |
| LogonGroup  | The logon group for the SAP system, from which the message server selects an application server (Only available if connection type (Logon) is B - Message Server (Group)). |
| LogonType   | The type of logon to the SAP system. The allowed values are either Application Server Logon (Type A) or Group Logon (Type B, also known as Message Server).|
| MessageServerHost  | The hostname of the SAP system's message server (central instance) also known as R3 system name (Mandatory if connection type (Logon) is B - Message Server (Group)).  |
| MessageServerService | The service name (as defined in etc/services) or the port number under which the message server is listening for load-balancing requests (Mandatory if connection type (Logon) is B - Message Server (Group) and system ID isn't present). |
| SncCertificate  | The X.509 certificate in Base64 encoded form, without the begin or end certificate tags. |
| SncMyName  | The installed SNC solution usually knows its own SNC name. For solutions supporting multiple identities, you may need to specify the identity to be used for this destination/server (optional). |
| SncLibraryPath  | The name or path of the SNC library to be used. With the on-premises data gateway, the path can be an absolute or relative to the NCo library.  |
| SncPartnerName  | The backends' SNC name (Required when type of logon is Application Server). |
| SncQop | The quality of service to be used for SNC communication of this destination/server. The allowed values are Authentication, Integrity, Privacy, Default, and Maximum. |
| SncSso  | The SNC SSO specifies whether to use SNC identity or credentials provided on RFC level.  |
| SystemId  | The SAP system's three-letter system ID (Mandatory if connection type (Logon) is B - Message Server (Group) and message server service isn't present).  |
| SystemNumber  | The SAP system's system number. It's a number ranging from 00 to 99 (Mandatory if connection type (Logon) is A - Application Server).   |
| UseSnc | When selected, the connections will be secured with SNC. The allowed value is Yes.|

## Reuse the environment variable in a flow

Environment variables are available in a flow's dynamic content selector. Go into a SAP Integration cloud flow to select the environment variables to reuse in [SAP actions](/connectors/sap/#actions).

1. Open a flow in the SAP Integration solution.
1. In a flow action, click on **Add dynamic content** to open the dynamic content selector. All environment variables that you have access to are listed.
1. Select the desired environment variable.
1. Click **Save**.

 :::image type="content" source="media/env-refs/header-dynamic-content.png" alt-text="The header's dynamic content selector list in a solution-aware cloud flow.":::

For more information:

- [Edit a solution-aware cloud flow](/power-automate/edit-solution-aware-flow)

- [Use environment variables in Power Automate solution cloud flows](/power-apps/maker/data-platform/environmentvariables#use-environment-variables-in-power-automate-solution-cloud-flows)


> [!IMPORTANT]
>
> If an environment variable is updated after it has been used in a flow, the updated values won't be used the next time the flow runs. **The flow must be edited or resaved** for the updated values in the environment variable to take effect.

### See also

- [Set up SAP integration with Power Platform (preview)](set-up-prepare.md)
- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
