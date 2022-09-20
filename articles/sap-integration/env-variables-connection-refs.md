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

SAP has multiple connection parameters, and manually entering the parameters into each Power Automate cloud flow action can be time consuming. You can create an environment variable in Power Apps that contains all of the SAP system information. Once the environment variable is defined, you can reuse it in your SAP actions without having to reenter it again.

1. Sign in to [Power Apps](https://make.powerapps.com)

1. [Create an environment variable in a solution](/power-apps/maker/data-platform/environmentvariables#create-an-environment-variable-in-a-solution).
    :::image type="content" source="media/env-refs/env-var-panel.png" alt-text="The environment panel in Power Apps.":::

## Review connection references in flows

After you've imported the SAP integration solution into Power Apps and created environment variables with SAP connection parameters, you'll need to sign in to Power Automate to review your connectors in the cloud flows.

When you see the warning symbol in a connector, it means the environment variables didn't map to the connection. You'll need to add user and system connection references manually.

The following steps will walk you through this process:

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. In the left navigation pane, select **Solutions**.

    :::image type="content" source="media/env-refs/pauto-solutions.png" alt-text="Power Automate navigation panel with 'Solutions' selected." :::

1. Select the  **SAP Integration** solution in the list. You will now go to a page that displays all of the solution's components.

1. In the left navigation pane, select **Cloud flows**.

    :::image type="content" source="media/env-refs/solution-obj.png" alt-text="SAP Integration solution objects displayed. User selects, 'Cloud flows' to view the list of flows in the solution.":::

1. Select a flow from the list.

    :::image type="content" source="media/env-refs/cloud-flow-select.png" alt-text="Image shows selecting a cloud flow from the list of solution flows.":::

1. Go to the command bar and select **Edit**. You'll be able to see the flow.

    :::image type="content" source="media/env-refs/edit-flow.png" alt-text="Click the edit button to see the whole flow.":::

1. Select the connectors in the flow with the warning sign to add your user- and system-level connection references.

    :::image type="content" source="media/env-refs/flow-connect-warning.png" alt-text="Flow with connection warning.":::

### Enter system information

You'll be asked to enter user and system information.

- Requested user-level connection reference data
     :::image type="content" source="media/env-refs/user-auth.png" alt-text="Call SAP function box for user authentication.":::

- Requested system-level connection reference data
    :::image type="content" source="media/env-refs/system-auth.png" alt-text="Call SAP function box for system authentication.":::

### See also

- [Set up SAP integration with Power Platform (preview)](set-up-prepare.md)
- [Understand prebuilt solution available for integrating SAP with Power Platform (preview)](solutions.md)
- [Overview of SAP integration with Power Platform (preview)](overview.md)
