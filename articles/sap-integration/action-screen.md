---
title: Configure complex APIs and verify the SAP integration (preview)
description: Learn about the different complex API action screens, the configuration parameters for the available action screens, and verify the SAP integration with Power Platform.
services: ''
suite: flow
documentationcenter: na
author: EllenWehrle
manager: jongilman
editor: ''
tags: ''
ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 09/19/2022
ms.author: ellenwehrle
ms.reviewer: ellenwehrle
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - administrator
  - enduser
contributors:
 - EllenWehrle
 - tapanm-msft
 - galitskyd
---

 

# Create an environment variable with SAP connection parameters (preview)

[This article is pre-release documentation and is subject to change.]

SAP has several different connection parameters, and it is cumbersome to have to enter these into each Power Automate cloud flow action. You can now create an environment variable in Power Apps that contains all of the SAP system information. Once the environment variable is defined, you can use the environment variable in your SAP actions without having to re-enter all the system information again.

1. Sign in to [Power Apps](<https://go.microsoft.com/fwlink/p/?linkid=2208506>)
1. [Create an environment variable in a solution](/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution). 

## Review connection references in flows

Once you have imported the SAP Integration solution into Power Apps and create environment variables with SAP connection parameters, you will need to sign in to Power Automate to review your connectors in the cloud flows. 

When you see the warning symbol in a connector, it means the environment variables did not map to the connection. You will need to to add user- and system-level connection references manually.

The following steps will walk you through this process:

1. Sign in to [Power Automate](<https://go.microsoft.com/fwlink/p/?linkid=2208508>).
1. In the left navigation panel, select **Solutions**.
1. Select the  **SAP Integration** solution.
1. In the left navigation panel, select **Cloud flows**.
1. Select a flow.
1. Go to the command bar and click **Edit**. You will be able to see the flow.
1. Select the connector in the flow to add your user- and system-level connection references.
    ![](media)

First, you will update your user connection references. Select if you will be authenticating through SAP or Windows and you will need to assign your on-premises data gateway to the connector.
    ![]()

Second, you will

### Access new screen

To access the function screen, select **Actions**:

SAP ERP > Call SAP Function
    ![Graphical user interface  application Description automatically generated](media/action-screen/image1.png)

### Select System

Click on the **System** field to see a dropdown appear with options to select.

![](media/action-screen/image3.png)

### Select API

Click on the **API** field to see a list of APIs that match the first three letters entered. Select the API

![](media/action-screen/image4.png)

### Load API

Once you have selected the API, the definition of the API should be queried and the required Input and Output parameters should be loaded by default.

### Select Parameter

When you select **Add New Parameter**, a display list of valid parameters for the API filters out parameters that have already been added to the table. Use the following logic for SAP API:

- Use the SAP function RFC\_GET\_FUNCTION\_INTERFACE
- Set parameter FUNCNAME = '**&lt;API/Procedure&gt;**'.
The valid parameters are returned in the PARAMS parameter.

    ![](media/action-screen/image6.png)

### Enter Value

Within the Value column, the user needs to have the ability to use expressions, static values, dynamic values, and the following data operations:

- Select
- Filter
- Compose

    ![](media/action-screen/image7.png)

### Completed State

The following example shows a state where a user has selected all the parameters needed to invoke the complex API:

![](media/action-screen/image8.png)

### See also

- [Set up SAP integration with Power Platform (preview)](set-up-prepare.md)
- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
