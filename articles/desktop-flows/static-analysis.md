---
title: Flow Checker (preview)
description: Learn how to use the static analysis feature to scan your code for errors, security issues, and coding standard violations—helping you improve code quality.
author: NikosMoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 06/04/2025
ms.author: nimoutzo
ms.reviewer: danamartens
contributors:
- NikosMoutzourakis
search.audienceType: 
  - flowmaker
  - enduser
---

# Flow checker (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

Improve your development workflow with the static analysis feature in [solution checker](/power-apps/maker/data-platform/use-powerapps-checker). This tool supports best practices in robotic process automation (RPA) and meets critical flow requirements by automatically evaluating your flows to ensure optimal performance. Static analysis is available in the **Flow checker** section of the designer. It enforces key guidelines and provides real-time feedback and early code inspection. It integrates directly into your workflow, improves code quality, and lays the foundation for a more efficient and productive development experience.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-pp.md)]

## Rule management

Rules are defined and managed through solution checker in the Power Platform admin center. Admins can:

- Enable or disable rules.
- Configure severity levels (error, warning, info).
- Apply rules to specific environments or environment groups ([Managed Environments](/power-platform/admin/managed-environment-overview) only).

### Configuration in the admin center

To configure static analysis rules:

1. Go to the Power Platform admin center.
1. Select **Manage** > **Environments** to proceed.
1. Select **Edit managed environments**.
1. In the **Solution checker enforcement** section, configure which rules should be excluded for the selected environment.

> [!NOTE]
>
> - If the environment is part of an environment group with a defined configuration, the rule settings are inherited and can't be edited individually. Learn more about solution checker in [Solution checker](/power-apps/maker/data-platform/use-powerapps-checker) and [Solution checker enforcement in Managed Environments](/power-platform/admin/managed-environment-solution-checker).
> - Power Platform administrators should assign the following privilege to any roles that require access to the feature: `prvReadmsdyn_analysisoverride` (friendly name is 'Analysis Override (Read)').

## Run static analysis in the portal

To manually trigger static analysis:

1. Go to the **Solutions** page in the [Power Automate portal](https://make.powerautomate.com/).
1. Open the context menu (⋯) next to a solution.
1. Hover over **Solution checker**.
1. Choose one of the following options:

    - **Run**: Initiates the static analysis.
    - **View results**: Opens the latest analysis report.
    - **Download results**: Exports the report for offline review.

> [!NOTE]
> Static analysis runs for all desktop flows included in a solution. Identify which desktop flow triggers a specific rule violation by checking the **Object name** column in the results. This column shows the name of the corresponding desktop flow.

:::image type="content" source="media\static-analysis\static-analysis-solution-chekcer-results.png" alt-text="Screenshot of the results of static analysis for a solution in the Power Automate portal.":::

## Static analysis in the designer

Static analysis runs automatically, continuously inspecting your code without requiring manual intervention. When you add, remove, or modify actions in your flow, this feature activates to assess the changes and refresh the analysis. This process makes development seamless and efficient.

:::image type="content" source="media\static-analysis\static-analysis-pad-button.png" alt-text="Screenshot of the button in Power Automate for Desktop designer that opens the static analysis pane.":::

Each analysis generates a percentage score that shows the proportion of rules successfully followed. A higher score means fewer violations and better code quality.

This score is recalculated every time a change is made to the flow, providing immediate feedback and promoting good development practices.

:::image type="content" source="media\static-analysis\static-analysis-pad-score.png" alt-text="Screenshot showing the static analysis score and a summary of any violated rules.":::

If rules are violated, the static analysis report shows a clear summary. It lists rule names and the number of actions or variables in your flow that violate each rule. Selecting a rule highlights the corresponding action and provides a detailed error explanation. For variable-related violations, the system navigates to the variable pane, making corrections easy.

Each violation displays a tile with details, including the error's nature, recommended fixes, and a link to documentation. Use the slider in the rule’s header to navigate between occurrences of the same violation. This guidance helps developers address issues quickly and effectively.

:::image type="content" source="media\static-analysis\static-analysis-pad-details.png" alt-text="Screenshot showing the details of a static analysis rule.":::

## Static analysis rules

Static analysis rules are predefined guidelines that help ensure your flows are secure, maintainable, and performant. Each rule targets specific aspects of flow design, such as security, performance, and maintainability, and provides actionable feedback to improve your flow's quality. Below is a list of the rules, their descriptions, and suggested fixes.

<a name="unsafepasswordsecurity"></a>
### Unsafe password security

- **Severity**: Warning
- **Type**: Security
- **Error details**: Passwords are managed insecurely in the flow.
- **Description**: This rule checks if passwords are managed insecurely in a desktop flow to ensure they're not exposed or mishandled during execution.
- **Suggested fix**: Ensure all password-related inputs are handled appropriately by using the password features of Power Automate for desktop. Use "Direct encrypted text input" for maximum security through machine-based encryption. For flows used on different machines, choose "Password input as variable" and mark the corresponding variable as sensitive to enhance security. Also, use secure credential management features like the "Get Credential" action, which integrates with CyberArk credentials.

<a name="recursionsubflows"></a>
### Recursion between two subflows

- **Severity**: Warning
- **Type**: Performance
- **Error details**: Recursive calls detected between subflows, potentially causing an infinite loop.
- **Description**: This rule checks for recursive calls between two or more subflows, ensuring that the flow doesn't enter an infinite loop.
- **Suggested fix**: Remove any recursive calls between the subflows.

<a name="variablelength"></a>
### Variable length exceeded

- **Severity**: Warning
- **Type**: Maintainability
- **Error details**: Variable name exceeds the 25-character limit.
- **Description**: This rule verifies if the name of each variable defined in the flow exceeds a specified number of characters. The default limit is 25 characters.
- **Suggested fix**: Rename any variables that exceed the specified character limit to ensure their names are shorter than 25 characters.

<a name="variabledefaultvalues"></a>
### Input variable default values

- **Severity**: Warning
- **Type**: Maintainability
- **Error details**: Input/output variables aren't using default values.
- **Description**: This rule verifies if Input/Output variables are using default values, ensuring that they're properly configured for the flow.
- **Suggested fix**: Assign default values to all input and output variables in the flow.

<a name="thresholdvariablesnumber"></a>
### Threshold on number of input and output variables

- **Severity**: Warning
- **Type**: Maintainability
- **Error details**: Total input/output variables exceed the 25-variable limit.
- **Description**: This rule verifies if the total number of input/output variables in the flow exceeds a specified threshold. The limit is 25 variables.
- **Suggested fix**: Ensure that the number of input and output variables in the flow doesn't exceed 25.

<a name="emptyonblockerror"></a>
### Empty on block error action

- **Default severity**: Warning
- **Type**: Maintainability
- **Error details**: "On block error" action is empty and not handling errors.
- **Description**: This rule checks whether the "On block error" actions in your flow are set up correctly to handle errors, making sure that errors are thrown and managed as expected.
- **Suggested fix**: To manage potential errors, set up the **On block error** actions in the flow.

<a name="nestedifclauses"></a>
### Nested if clauses

- **Severity**: Warning
- **Type**: Maintainability
- **Error details**: Nested If clauses exceed five levels.
- **Description**: This rule checks if there are nested if statements with more than five levels, ensuring that the flow remains manageable and readable.
- **Suggested fix**: Refactor the flow to reduce nested if statements to no more than five levels.

<a name="incompleteif"></a>
### Incomplete if

- **Severity**: Warning
- **Type**: Maintainability
- **Error details**: Incomplete If action detected, lacking content or only containing actions in the Else branch.
- **Description**: This rule detects If actions that lack content or only contain actions in the Else branch, ensuring that conditional statements are effectively implemented.
- **Suggested fix**: Go through the flow and review each "If" condition to ensure that it includes meaningful actions in both the "If", "Else if", and "Else" branches.

<a name="infiniteloop"></a>
### Infinite loop

- **Severity**: Warning
- **Type**: Performance
- **Error details**: Infinite loop detected in the flow, potentially causing it to run indefinitely.
- **Description**: This rule checks if there are any infinite loops in the flow, helping to identify and prevent scenarios where the flow might run indefinitely.
- **Suggested fix**: Make sure each loop has a clearly defined and achievable termination condition. The condition can be based on a counter, a specific value, or the completion of a task. Add checks or failsafe conditions to break the loop if it runs longer than expected. For example, set a maximum iteration count or include a timeout.

<a name="misusuwaitaction"></a>
### Misuse of wait actions

- **Severity**: Warning
- **Type**: Performance
- **Error details**: Misuse of wait actions detected, with more than 10 wait actions causing potential bottlenecks.
- **Description**: This rule checks if the flow contains an excessive number of wait actions—more than 10—to help identify and minimize potential bottlenecks caused by prolonged delays.
- **Suggested fix**: Review the flow to identify all wait actions and check if they're essential for the flow's logic. Remove unnecessary waits or combine them where possible.

<a name="immensewaitactions"></a>
### Immense wait time

- **Severity**: Warning
- **Type**: Performance
- **Error details**: Immense wait time detected, exceeding the 600-second limit for hardcoded wait actions.
- **Description**: This rule checks if the hardcoded wait actions in the flow exceed a specified amount of time, with the limit set to 600 seconds.
- **Suggested fix**: Review the flow to find wait actions that exceed the 600-second limit. Check if these long wait times are necessary and adjust their duration to the shortest time needed for the flow to work correctly. If a long wait is required, break it into shorter intervals and add checks or conditions between them. Whenever possible, replace long wait actions with event-driven triggers.


## Known limitations

- Available only in [Managed Environments](/power-platform/admin/managed-environment-overview).
- Rule customization is limited to enabling or disabling rules and configuring severity.

## Known issues

- Deleting copied actions after viewing a rule violation detail can trigger unhandled errors.
- Using a nonsensitive password variable in the following actions causes static analysis to fail during rule evaluation.
  - Display input dialog
  - Display select folder dialog
  - Display custom form
