---
title: Create an environment variable with SAP connection parameters (preview)
description: Learn about the environment variable configuration for SAP connection parameter, and review the connection references in flows.
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
---

# Create an environment variable with SAP connection parameters (preview)

[This article is pre-release documentation and is subject to change.]

SAP has several different connection parameters, and it's cumbersome to have to enter these parameters into each Power Automate cloud flow action. You can now create an environment variable in Power Apps that contains all of the SAP system information. Once the environment variable is defined, you can use the environment variable in your SAP actions without having to reenter all the system information again.

1. Sign in to [Power Apps](<https://go.microsoft.com/fwlink/p/?linkid=2208506>)
1. [Create an environment variable in a solution](/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution). 

## Review connection references in flows

Once you've imported the SAP Integration solution into Power Apps and create environment variables with SAP connection parameters, you'll need to sign in to Power Automate to review your connectors in the cloud flows. 

If you see a warning symbol in the connector that means the environment variables didn't map to the connection.
You'll need to add **user** and **system** level connection references manually.

The following steps will walk you through this process:

1. Sign in to [Power Automate](<https://go.microsoft.com/fwlink/p/?linkid=2208508>).
1. In the left navigation panel, select **Solutions**.
1. Select the  **SAP Integration** solution.
1. In the left navigation panel, select **Cloud flows**.
1. Select a flow.
1. Go to the command bar and select **Edit**. You'll be able to see the flow.
1. Select the connectors in the flow with the warning sign to add your user- and system-level connection references.


Requested user-level connection reference data
    ![]()

Requested system-level connection reference data

### See also

- [Overview of SAP integration with Power Platform (preview)](overview.md)
- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [Set up SAP integration with Power Platform (preview)](set-up-prepare.md)
