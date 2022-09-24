---
title: Create an environment variable with SAP connection parameters (preview)
description: Create an environment variable in Power Apps that contains all of your SAP system information.
author: EllenWehrle
ms.subservice: cloud-flow
ms.topic: article
ms.date: 09/19/2022
ms.author: ellenwehrle
ms.reviewer: ellenwehrle
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
1. On the command bar, select **New** > **More** > **Environment variable**
1. Complete the fields in the Environment variable panel.
    - **Display name**. Enter a name for the environment variable.
    - **Name**. This is automatically generated, but you can change it.
    - **Data Type**. Select **Text** (_do not_ select JSON).
      - Enter a JSON blob with a combination of SAP properties. Not all properties are necessary—your SAP environment will determine which ones are applicable. Refer to the SAP property guidance.

    :::image type="content" source="media/env-refs/env-var-panel.png" alt-text="The environment panel in Power Apps.":::

### SAP Property Guidance

| Property             | Description                                                                                                                                                                                                                                 |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| AppServerHost        | The hostname of the SAP Application Server.                                                                                                                                                                                                 |
| AppServerService     | The service name or port number of the specific SAP Application Server to connect to (Optional for connection type (Logon) A - Application Server).                                                                                         |
| Client               | The SAP client ID to connect to the SAP system. The SAP backends' client (or 'Mandant') into which to log in. It is a number ranging from 000 to 999.                                                                                       |
| LogonGroup           | The Logon Group for the SAP System, from which the Message Server shall select an Application Server (Only available if connection type (Logon) is B - Message Server (Group)).                                                             |
| LogonType            | The type of logon to the SAP System, either Application Server Logon (Type A) or Group Logon (Type B aka Message Server). Allowed values: ApplicationServer, Group                                                                          |
| MessageServerHost    | The hostname of the SAP System's Message Server (central instance) aka R3 System Name (Mandatory if connection type (Logon) is B - Message Server (Group)).                                                                                 |
| MessageServerService | The Service Name (as defined in etc/services) or the Port Number under which the Message Server is listening for load-balancing requests (Mandatory if connection type (Logon) is B - Message Server (Group) and System ID is not present). |
| SncCertificate       | X.509 certificate in Base64 encoded form, without the begin or end certificate tags.                                                                                                                                                        |
| SncMyName            | The installed SNC solution usually knows its own SNC name. Only for solutions supporting 'multiple identities', you may need to specify the identity to be used for this destination/server (optional).                                     |
| SncLibraryPath       | Name or path of the SNC library to be used. With the OnPremises Data Gateway, the path can be an absolute or relative to the NCo library.                                                                                                   |
| SncPartnerName       | The backends' SNC name (Required when Logon Type is Application Server).                                                                                                                                                                    |
| SncQop               | Quality of Service to be used for SNC communication of this destination/server. Allowed values: Authentication, Integrity, Privacy, Default, Maximum                                                                                        |
| SncSso               | The SNC SSO specifies whether to use SNC identity or credentials provided on RFC level.                                                                                                                                                     |
| SystemId             | The SAP system's three-letter system ID (Mandatory if connection type (Logon) is B - Message Server (Group) and Message Server Service is not present).                                                                                     |
| SystemNumber         | The SAP System's System Number. It is a number ranging from 00 to 99 (Mandatory if connection type (Logon) is A - Application Server).                                                                                                      |
| UseSnc               |                                                                                                                                                                                                                                             |

## Use the environment variable in a flow

Environment variables can be used in solution cloud flows since they are available in the dynamic content selector.

 For more information: [Use environment variables in Power Automate solution cloud flows](/power-apps/maker/data-platform/environmentvariables#use-environment-variables-in-power-automate-solution-cloud-flows)

### Known issue

If an environment variable is updated after it has been used in a flow, the updated values will not be used the next time the flow runs. The _flow must be edited or re-saved_ for the updated values in the environment variable to take effect.

### See also

- [Set up SAP integration with Power Platform (preview)](set-up-prepare.md)
- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
