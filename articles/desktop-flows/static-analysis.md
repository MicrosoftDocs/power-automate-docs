---
title: Static analysis (Preview) | Microsoft Docs
description: Learn how to use the static analysis feature scans your code for errors, vulnerabilities, and coding standard violations, helping improve code quality without execution.
author: NikosMoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 05/08/2025
ms.author: nimoutzo
ms.reviewer: danamartens
contributors:
- NikosMoutzourakis
search.audienceType: 
  - flowmaker
  - enduser
---

# Static analysis
Elevate your development process with the newly integrated Static Analysis feature in our Solution Checker suite. Tailored to support best practices in robotic process automation (RPA) and meet your organization's critical 
flow requirements, this tool provides an automated evaluation of your flows to ensure optimal performance. Accessible via the 'Flows Checker' section in the designer, Static Analysis not only upholds essential guidelines but
also delivers real-time feedback and preemptive code inspection. By seamlessly integrating into your current workflow, it enhances code quality and offers a robust framework for a more streamlined and productive development
experience.

:::image type="content" source="media\web-automation\get-details-of-element-on-web-page-action.png" alt-text="Screenshot of the Get details of element on web page action.":::

## Rule Management
Rules are defined and managed through the Solution Checker in PPAC. Administrators can:
- Enable or disable specific rules.
- Configure severity levels (Error, Warning, Info).
- Apply rules to specific environments or environment groups (Managed Environments only).

## Configuration in PPAC
To configure static analysis rules:
- Navigate to Power Platform Admin Center (PPAC).
- Go to Environments.
- Click on Edit managed environments.
- In the Solution checker enforcement section, configure which rules should be excluded for the selected environment.
> [!NOTE]
> If the environment is already part of an Environment Group with a defined configuration, the rule settings will be inherited and cannot be edited individually.

## Running Static Analysis via Portal
To manually trigger static analysis:
- Navigate to the Solutions page in the Power Platform portal.
- Click the context menu (⋯) next to a solution.
- Hover over Solution checker.
- Choose one of the following options:
  - Run: Initiates the static analysis.
  - View results: Opens the latest analysis report.
  - Download results: Exports the report for offline review.
 
  More information about solution checker and its configuration can be found in the following links: '' , ''

## Static analysis in the designer
The Static Analysis is performed automatically, providing continuous inspection of your code without requiring manual intervention. As you add, remove, or edit actions within your flow, this feature is triggered 
automatically to evaluate the changes and update the analysis on the spot, ensuring that the development process is both seamless and efficient.

Each analysis generates a score, represented as a percentage, which indicates the proportion of rules that have been successfully adhered to. A higher score reflects fewer violations, thus signaling better code quality. 
This score is recalculated every time a change is made on the flow, providing immediate feedback and promoting good development practices.

If any rules are violated, the Static Analysis Report provides a clear and concise summary. The report lists the rule names, along with the number of actions or variables in your flow that breach each rule. By clicking 
on a specific rule, the feature conveniently highlights the corresponding action, offering a detailed explanation of the error. If a rule violation pertains to a variable, the system will automatically navigate you to the
variable pane, ensuring that corrections can be made with ease.

For each violation, a new tile displays further details, including the nature of the error, recommended remediation steps, and a direct link to comprehensive documentation. This integrated guidance supports developers in 
addressing issues promptly and effectively.

:::image type="content" source="media\web-automation\get-details-of-element-on-web-page-action.png" alt-text="Screenshot of the Get details of element on web page action.":::

## Rules of static analysis
<a name="unsafepasswordsecurity"></a>
### Unsafe password security
- Default severity: Warning
- Type: Security rules - Security
- Error details: Passwords are managed insecurely in the flow.
- Description: This rule verifies if passwords are managed insecurely within a desktop flow, ensuring that they are not exposed or mishandled during execution.
- Suggested fix: Ensure that all password-related inputs are handled appropriately by utilizing the password features of Power Automate for Desktop. Use 'Direct encrypted text input' for maximum security through machine-based encryption. For flows that need to be used on different machines, opt for 'Password input as variable' and designate the corresponding variable as sensitive to enhance security. Additionally, leverage secure credential management features like the 'Get Credential' action, which integrates with CyberArk credentials.

<a name="recursionsubflows"></a>
### Recursion between two subflows
- Default severity: Warning
- Type: Best practices rules - Performance
- Error details: Recursive calls detected between subflows, potentially causing an infinite loop.
- Description: This rule checks for recursive calls between two or more sub flows subflows, ensuring that the flow does not enter an infinite loop.
- Suggested fix: Eliminate any recursive calls between the subflows.

<a name="variablelength"></a>
### Variable length Exceeded 
- Default severity: Warning
- Type: Variable rules - Maintainability
- Error details: Variable name exceeds the 25-character limit.
- Description: This rule verifies if the name of each variable defined in the flow exceeds a specified number of characters. The default limit is set to 25 characters.
- Suggested fix: Rename any variables that exceed the specified character limit to ensure their names are shorter than 25 characters. 

<a name="variabledefaultvalues"></a>
### Input variable default values
- Default severity: Warning
- Type: Variable rules - Maintainability
- Error details: Input/Output variables are not using default values.
- Description: This rule verifies if Input/Output variables are using default values, ensuring that they are properly configured for the flow.
- Suggested fix: Assign default values to all input and output variables in the flow. 

<a name="thresholdvariablesnumber"></a>
### Threshold on number of input and output variables 
- Default severity: Warning
- Type: Best practices rules - Maintainability
- Error details: Total input/output variables exceed the 25-variable limit.
- Description: This rule verifies if the total number of input/output variables in the flow exceeds a specified threshold. The default limit is set to 25 variables.
- Suggested fix: Ensure that the number of input and output variables in the flow does not exceed 25.

<a name="emptyonblockerror"></a>
### Empty On block error action
- Default severity: Warning
- Type: Best practices rules - Maintainability
- Error details: "On block error" action is empty and not handling errors.
- Description: This rule verifies whether "On block error" actions in the flow are properly configured to handle errors, ensuring that no errors are thrown without appropriate handling.
- Suggested fix: Configure the 'On block error' actions in the flow to manage potential errors.

<a name="nestedifclauses"></a>
### Nested If Clauses
- Default severity: Warning
- Type: Ease of maintenance rules - Maintainability
- Error details: Nested If Clauses exceed 5 levels.
- Description: This rule verifies if there are nested if statements with more than 5 levels, ensuring that the flow remains manageable and readable.
- Suggested fix: Refactor the flow to reduce the nesting of if statements to no more than 5 levels. 

<a name="incompleteif"></a>
### Incomplete If
- Default severity: Warning
- Type: Ease of maintenance rules - Maintainability
- Error details: Incomplete If action detected, lacking content or only containing actions in the Else branch.
- Description: This rule verifies the flow to detect If actions that lack content or only contain actions in the Else branch, ensuring that conditional statements are effectively implemented.
- Suggested fix: Go through the flow and review each "If" condition to ensure that it includes meaningful actions in both the "If", ‘’Else if’’, and "Else" branches. 

<a name="infiniteloop"></a>
### Infinite Loop
- Default severity: Warning
- Type: Reliability rules - Performance
- Error details: Infinite loop detected in the flow, potentially causing it to run indefinitely.
- Description: This rule verifies whether there are any infinite loops in the flow, helping to identify and prevent scenarios where the flow may run indefinitely.
- Suggested fix: Ensure that each loop has a clearly defined and achievable termination condition. This could be based on a counter, a specific value, or the completion of a task. You may also implement additional checks or failsafe conditions that will break the loop if it runs longer than expected. For example, set a maximum iteration count or include a timeout. 

<a name="misusuwaitaction"></a>
### Misuse of wait actions
- Default severity: Warning
- Type: Performance rules - Performance
- Error details: Misuse of wait actions detected, with more than 10 wait actions causing potential bottlenecks.
- Description: This rule verifies whether the flow has an extreme number of wait actions, the default value is 10, helping to identify and reduce potential bottlenecks caused by excessive waiting.
- Suggested fix: Review the flow and identify all instances of wait actions and determine if it is essential for the flow's logic. Remove unnecessary waits or combine them where possible. 

<a name="immensewaitactions"></a>
### Immense wait time
- Default severity: Warning
- Type: Performance rules - Performance
- Error details: Immense wait time detected, exceeding the 600-second limit for hardcoded wait actions.
- Description: This rule verifies if the hardcoded wait actions in the flow exceed a specified amount of time, with the default limit set to 600 seconds.
- Suggested fix: Review the flow to find wait actions that exceed the 600-second limit. Evaluate the necessity of these long wait times and adjust their durations to the shortest time necessary for the flow to function correctly. If a long wait is necessary, consider breaking it into smaller intervals with additional checks or conditional actions in between. Finally, whenever possible, replace long wait actions with event-driven triggers. 

## Known Limitations
- Available only in Managed Environments.
- Rule customization is limited to enabling/disabling and severity configuration.

[!INCLUDE[footer-include](../includes/footer-banner.md)]
