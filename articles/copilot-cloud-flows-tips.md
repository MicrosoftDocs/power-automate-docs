---
title: Get the most from Copilot in Power Automate designer - Power Automate
description: Learn what Copilot can and can't do in the flow designer, with prompt patterns that work and tips for better results.
author: radioblazer
ms.author: matow
ms.reviewer: angieandrews
ms.topic: how-to
ms.date: 04/09/2026
ms.subservice: cloud-flow
---

# Get the most from Copilot in Power Automate designer

Copilot in Power Automate designer helps you build and modify flows using natural language. This guide covers what works well today, what doesn't, and how to get the best results.

## What Copilot can do today

Copilot works best when you give it clear, scoped instructions for modifying your flow. It can:

- **Add actions to your flow**: Ask Copilot to insert a specific action at a specific point. It understands the action catalog and can configure common parameters.
- **Modify existing actions**: Change trigger schedules, update conditions, swap out connectors, or adjust action settings.
- **Explain what a flow does**: Select a flow and ask Copilot to walk through the logic step by step. This is especially useful for flows you inherited from someone else.
- **Suggest next steps**: After adding a trigger, Copilot can recommend a logical next action based on common patterns.
- **Help with simple expressions**: Copilot can write basic expressions like `formatDateTime()`, `concat()`, string manipulation, and simple conditionals. It handles one-liners well.
- **Add parallel branches and error handling**: Ask Copilot to add a parallel branch with **Configure run after** settings for failure notification patterns.
- **Generate scope blocks**: Copilot can wrap actions in a try/catch pattern using **Scope** actions with run-after configuration.

## What Copilot can't do yet

Being upfront about limitations saves you time. Copilot currently can't:

- **Debug runtime errors**: Copilot doesn't have access to your flow's run history, error logs, or execution context. It doesn't know why a specific run failed.
- **Read your data**: Copilot doesn't query your SharePoint lists, Dataverse tables, SQL databases, or any live data source. It can't validate that a column name exists or a value is correct.
- **Fix connection issues**: Expired tokens, permission errors, and gateway problems are outside Copilot's scope. These require manual re-authentication or admin action.
- **Reliably modify complex nested logic**: Deeply nested conditions, multiple levels of Apply to Each, or Switch statements with many branches can produce unexpected results. Break these into smaller requests.
- **Understand cross-flow dependencies**: If your flow calls a child flow or depends on another flow's output, Copilot treats each flow in isolation.
- **Generate complex expressions**: Multi-function nested expressions, XPath queries, or expressions referencing dynamic content from several steps back are often incorrect or incomplete.

> [!NOTE]
> These limitations are temporary. The product team is actively working on giving Copilot access to run history and error context.

## Prompt patterns that work

Specific, single-purpose prompts get the best results. Here are patterns that consistently work well.

### Add actions

- "Add a condition after the Get Items action that checks if the Status column equals 'Approved'."

- "Add a Send Email (V2) action after the approval step. Set the To field to the RequestorEmail variable and the subject to 'Your request was approved'."

### Modify existing steps

- "Change the trigger to run every Monday at 9:00 AM Pacific Time."

- "Update the condition to also check if the Priority field is 'High' using an OR operator."

### Explain flows

- "Explain what this flow does step by step."

- "What happens when the condition on the Apply to Each is false?"

### Handle errors

- "Add error handling to the HTTP action. If it fails, send me an email with the error details and then terminate the flow as failed."

- "Wrap the SharePoint actions in a Scope with a parallel Scope that runs on failure and posts to our Teams channel."

### Expressions

- "Write an expression that formats today's date as YYYY-MM-DD."

- "Create an expression that gets the file extension from the FileName field."

## Prompt patterns that don't work well

These prompt styles produce poor results. Avoid them.

### Too vague

"Fix my flow."

Copilot doesn't know what's wrong. It can't see errors, and "fix" could mean anything. Instead, tell Copilot exactly what you want changed.

### Ask to debug runtime errors

- "Why did my flow fail at 3pm yesterday?"

- "Debug this error: 'The requested operation is invalid.'"

Copilot has no access to run history or error logs from the designer, though it can help troubleshoot flow runs from the flow runs page. Learn more about debugging in [When to use external AI](#when-to-use-external-ai) in this article.

### Enter multi-step instructions in one message

"Add a trigger for when a SharePoint item is created, then get the item details, check if the status is approved, send an email to the manager, wait for approval, update the item, and post to Teams."

Break this into individual requests. Give one instruction, confirm the result, then give the next. Copilot handles single steps reliably but loses accuracy across long chains.

### Ask about your specific data

- "What columns does my SharePoint list have?"

- "Is the email address in my Dataverse contact table valid?"

Copilot can't query your data sources. Check your data directly, then tell Copilot the exact field names to use.

## When to use external AI

For some tasks, general-purpose AI tools are more effective today. This can change as Copilot gains more context, but for now:

**Use external AI for debugging error messages**: Copy the full error message from your failed run and paste it into Copilot, GitHub Copilot, or other tools. Include:

- The error message and status code
- The action type that failed (HTTP, SharePoint, SQL, and similar)
- What you expected to happen

External AI tools have broad knowledge of API error codes and can often identify the root cause immediately.

**Use external AI for complex expressions**: If you need a nested expression combining multiple functions, external AI tools often produce more accurate results. Paste the fields you're working with and describe the desired output. Then paste the generated expression back into Power Automate.

> [!TIP]
> Learn about using a library of ready-to-use expressions in [Expression cookbook for cloud flows](expression-cookbook.md). That article covers many common patterns without needing an AI tool.

**Use external AI for flow design advice**: Describe your business process and ask for an architecture recommendation. External tools can suggest patterns like parent/child flows, error handling strategies, and retry logic.

**Use external AI for connector-specific questions**: If you need to know the exact JSON format for an HTTP request body, or the OData filter syntax for SharePoint, external AI tools have deep reference knowledge.

> [!NOTE]
> This isn't a reflection of Copilot's quality. It's a reflection of scope. Copilot is optimized for in-context flow editing. External tools are optimized for broad knowledge retrieval. Use both.

## Tips for better results

1. **Be specific**: Name the action, the field, and the value. "Add a Condition that checks if `Status` equals `Approved`" beats "add a check for approval."

1. **One request per message**: Copilot performs best with focused, single-purpose instructions. Add the action, confirm it looks right, then move on.

1. **Use action verbs**: Start your prompt with "Add," "Change," "Remove," "Explain," or "Move." These map directly to operations Copilot can perform.

1. **Include field names and values**: Don't make Copilot guess. If you know the column is called `EmployeeEmail`, say so.

1. **Review before you save**: Always check what Copilot generated before saving. Open the action it created and verify the parameters, especially dynamic content references.

1. **Iterate in small steps**: Build your flow incrementally. Add the trigger, verify it. Add the first action, verify it. This catches issues early and keeps Copilot's context clean.

1. **Use Copilot's explain feature to validate**: After Copilot modifies your flow, ask it to explain what the flow does. Compare its description to your intent. This catches misunderstandings before they become runtime errors.

1. **Save your flow before major Copilot edits**: If Copilot produces an undesirable change, you can revert to your last saved version. Treat saves as checkpoints.

> [!TIP]
> If Copilot produces an unexpected result, undo it and try rephrasing your request with more specific details. Shorter, more focused prompts almost always work better than long, multi-part instructions.

## Related information

- [Get started with Copilot in cloud flows](/power-automate/get-started-with-copilot)
- [Expression cookbook for cloud flows](expression-cookbook.md)
- [Troubleshoot cloud flow errors](troubleshoot-flow-errors.md)
- [Cloud flow error code reference](error-reference.md)
- [Classic designer vs. modern designer](classic-vs-modern-designer.md)
