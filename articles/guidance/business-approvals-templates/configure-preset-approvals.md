---
title: Configure preset approvals
description: Learn how to configure preset approvals for the business approvals kit.
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: how-to
ms.date: 11/15/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Configure preset approvals

The business approvals kit allows you to predefine approval workflows so that you don't need to set up each approver manually.

To configure preset approvals, you must set up:

- The Approvals Process
- The Application Data
- The Stage
- The Condition (Optional)
- The Node
- The Approver

## Define processes

First step of configuring preset approvals is to set up Processes. Processes are where all information related to the particular approval process is defined.

1. Go to [Power Apps](https://make.preview.powerapps.com/).
1. Select **Apps**, then choose **Business Approval Management**.

    > [!NOTE]
    > When you open the application for the first time, it prompts you to give consent to the Office 365 connector.

1. Switch to Approvals Designer on bottom left corner of the screen.
1. Select **Processes**.
1. Select **New (Process Designer)**.
1. Enter the **Name** of the process, the **Category** (optional), and the **Description** (optional).
1. In the **Default Approver,** start typing the name and select from list.
1. Select **Save**.

## Define application data

In a typical approval request, you often need to also submit information about the approval. For example amount, project category, department, accommodation, chart of account number, cost center code, etc.

The approvals kit allows you to use these types of data from Power Platform, other applications, and systems. Use data retrieved via connectors or manually enter the data when you make the request. To use the data in your approval process, define them in Application Data.

1. Enter the **Field Name**
1. Select the **Data Type** from the following:

   - Text
   - Number
   - Boolean
   - Date/Time
   - User (Email) - Can be used as approval user

1. (Optional) Enter the **Default Value**.
1. (Optional) Enter the **Description**.
1. Select **+ Add**.
1. Repeat these steps until you add all required application data.

    :::image type="content" source="media/application-data.png" alt-text="Screenshot of the Process Designer in Power Apps.":::

## Define workflow stages and nodes

In the Approvals kit, you can define stages in a workflow process. A minimum of one stage is required even for a simple workflow. Each stage then includes at least one _node_. The node is where you define who is going to be the actual approver. You can define multiple nodes within one stage, and each node is run sequentially.

After the first stage is defined, you can add more stages with conditions, which allows you to branch out to different nodes for sophisticated scenarios.

### Define the first workflow stage

1. Select **Workflow** > **New Stage**.
1. Enter a **Name** and **Description**.
1. Select **Save & Back**.

### Define the first node

Once you define your first stage, you optionally can add the first node.

1. Select the **+** sign.
1. Enter a **Name** and **Description**.
1. Select the **Approval Type**.

    |Approval type |Description  |
    |---------|---------|
    |Approve/Reject - Everyone must approve   | Every person included in this node has to approve to proceed to the next steps.        |
    |Approve/Reject - First to respond    | Only a single person included in this node has to approve to proceed to the next steps.        |
    |Custom Responses - Wait for all responses    | Define multiple responses beyond the Approve/Decline. Every person included in this node has to respond to proceed to the next steps.        |
    |Custom Responses - Wait for one response   | Define multiple responses beyond the Approve/Decline. Only a single person included in this node has to respond to proceed to the next steps.        |

1. Select either **User** or **Dynamic**.

    - **User**: You can select a specific user/employee.
    - **Dynamic**: The user information is automatically retrieved and set as approver.

1. Select **Notification**.

    1. Default
    1. None

1. Select a **Delegation Rule**.

    |Delegation rule |Description |
    |---------|---------|
    |None    |   No delegation settings set by the approver are applied to this workflow.      |
    |Time-out    |  Delegation settings set by the approver are automatically be applied if the approver assigned doesn't respond within the number of days defined.       |
    |Out of Office    |  Delegation settings set by the approver are automatically applied if the approver is out of office at the time the approval is received       |
    |Time-out or Out of Office     |    Delegation settings set by the approver are automatically applied if the approver assigned doesn't respond within the number of days defined, or if the approver is out of office at the time the approval is received.    |

1. Select a **Time Out Setting**.

    - **Actual Days**: The timeout calculation is the actual number of days since the node is started, and doesn't take holidays into consideration.

    - **Business Days**: The timeout calculation considers the number of business days passed based on the approvers work profile settings, and company holiday settings.

1. Select **Save & Back**.

Repeat steps if you would like to add more nodes in the same stage.

> [!NOTE]
> You don't need to specify only one approver in each node and can add multiple approvers together in a single node.

### Add a conditional stage with a switch condition

After adding the first stage of the workflow, you can add conditional approval by defining conditions in stages. A switch condition allows you to have 2-5 different paths that flow to depending on the condition you set.

1. Select **Add Stage**.
1. Enter a **Name** and **Description**.
1. Change the **Condition** to **Switch**.
1. Select the number of **Paths**.
1. Select a **Source**.

    - **Request Data**: The system automatically retrieves the
        application data from the approval request to use as condition.

    - **Previous Node Outcome**: The system automatically retrieves the outcome of the previous node (such as Approve/Reject or any custom options you defined) to use as condition.

1. Fill in the options for each path.

    Select either **Static value** or **Request Data**.

    - **Static value**: You must define the condition yourself.
    - **Request Data**: The system compares the Request
            Data defined in step 5 against what request data you define here.

#### Switch example

The example shown here's a scenario where the expense approval branches off to different nodes depending on what expense reimbursement category was selected in the original request.

:::image type="content" source="media/process-designer-approval-branch-example.png" alt-text="Screenshot of a Process Designer branch condition.'":::

Once defined, the Process Configurator shows three paths to add nodes to. Below shows if Gift is selected, Jamie from General Affairs is the approver, and if Equipment is selected, Karen from Procurement is the first approver, followed by her manager (Procurement Director). If neither option is selected, it will go to the next stage.

:::image type="content" source="media/process-designer-approval-branch-example-completed.png" alt-text="Screenshot of the Process Designer branch condition in completed form.":::

### Add a conditional stage with an If/Else Condition

After adding the first stage of the workflow, you can add conditional approval by defining conditions in stages. An If/Else condition allows you to outline a specific requirement (for example, an amount greater than 5,000 USD, a company code starts with 10.)

1. Select **Add Stage**.
2. Enter a **Name** and **Description**.
3. Change the **Condition** to **If/Else**.
4. Select a **Source**.

    - **Request Data**: The system automatically retrieves the application data from the approval request to use as condition.
    - **Previous Node Outcome**: The system automatically retrieves the outcome of the previous node (such as Approve/Reject or any custom options you defined) to use as condition.

5. Select an operand.

    > [!NOTE]
    > This will depend on what type of data you select in step 4.

6. Fill in the condition.

    Select either **Static Value** or **Request Data**.

    - **Static Value**: You must define the condition yourself.
    - **Request Data**: Tthe system compares the Request Data defined in step 4 against what request data you define here.

#### If/Else example

The example shown here's a scenario where expense approval branches off to two paths depending on the amount of expense reimbursement requested.  The condition is for expenses greater than or equal to 5000 USD.

:::image type="content" source="media/process-designer-approval-if-example.png" alt-text="Screenshot of the Process Designer showing an if condition.":::

## Publishing workflow

Once you finish configuring workflows, you must publish the workflow to be able to use it. The system automatically checks and validates that the workflow doesn't have any errors.

1. Open process you want to publish.
1. Select **Process Designer** > **Publish**.
1. For **Activate process when published**, select **Yes**.
1. Select **Publish**.

Once you select publish, a new version is stored and the system begins the publishing process. When complete, the system shows the **Activation status** as **Active**.

You're now ready to take approval requests.
