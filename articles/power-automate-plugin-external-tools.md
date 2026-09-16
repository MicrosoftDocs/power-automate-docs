---
title: Get started with the Power Automate plugin for GitHub Copilot CLI and Claude Code
description: Create, edit, run, debug, and manage Power Automate cloud flows from an AI coding agent using the Power Automate plugin.
author: matow
ms.topic: how-to
ms.date: 09/14/2026
ms.service: power-automate
ms.subservice: cloud-flow
ms.author: matow
ms.reviewer: cyanderson
audience: Power user
ai-usage: ai-assisted
---

# Get started with the Power Automate plugin for GitHub Copilot CLI and Claude Code

The Power Automate plugin for [GitHub Copilot CLI](https://github.com/features/copilot/cli/) and [Claude Code](https://claude.ai/code) provides an AI-assisted way to create, edit, run, debug, and manage Power Automate cloud flows from your terminal.

Describe what you want in natural language, and the plugin uses Power Automate tools and guided skills to help complete the task. You can work with existing cloud flows, build a flow from a description, investigate failed runs, manage connections, and perform common lifecycle operations from the same terminal session. The plugin also supports listing and running desktop flows.

> [!IMPORTANT]
>
> - A generative AI coding agent uses the plugin's skills and tools to perform Power Automate tasks with your signed-in account.
> - AI-generated flow definitions and proposed changes can be inaccurate. Review, test, and validate all changes before you publish or deploy a flow.
> - The plugin calls Power Automate services by using your signed-in identity. Power Automate and Power Platform enforce the permissions, licensing requirements, connector policies, and tenant restrictions that apply to that identity and environment.

## Prerequisites

Before you begin, verify that you have the required software and access.

### Software requirements

| Component | Minimum version | More information |
| --- | --- | --- |
| Node.js | 18.0 or later | [Download Node.js](https://nodejs.org/) |
| Azure CLI | Latest | [Install Azure CLI](/cli/azure/install-azure-cli) |
| GitHub Copilot CLI or Claude Code | Latest | [GitHub Copilot CLI](https://github.com/features/copilot/cli/) or [Claude Code](https://claude.ai/code) |
| GitHub CLI (optional) | Latest | Required only to file a public issue by using `/report-issue`. [Install GitHub CLI](https://cli.github.com/) |

You also need:

- A Power Platform environment with Power Automate enabled
- Permission to access the environments, flows, connections, and other resources you want to manage
- A Power Automate license appropriate for the flows and connectors you use
- An Azure CLI session signed in with the same work account that you use for Power Automate

Sign in with Azure CLI:

```powershell
az login --allow-no-subscriptions
```

Verify that Azure CLI can request a Power Automate token:

```powershell
az account get-access-token --resource https://service.flow.microsoft.com --query expiresOn --output tsv
```

The plugin uses your Azure CLI session to access Power Automate. Some connection-management tasks can open a browser for an additional Power Platform sign-in.

## Install the plugin

Install the Power Automate plugin from the [Power Platform Skills marketplace](https://github.com/microsoft/power-platform-skills).

### Quick install

The Power Platform Skills installer registers the marketplace, installs its plugins, and enables automatic updates.

**Windows PowerShell:**

```powershell
iwr https://raw.githubusercontent.com/microsoft/power-platform-skills/main/scripts/install.js -OutFile install.js; node install.js; del install.js
```

**macOS, Linux, or Windows command prompt:**

```bash
curl -fsSL https://raw.githubusercontent.com/microsoft/power-platform-skills/main/scripts/install.js | node
```

Restart GitHub Copilot CLI or Claude Code after installation.

### Install only the Power Automate plugin

The following commands use Claude Code plugin syntax. For GitHub Copilot CLI, see [Finding and installing plugins for GitHub Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing).

1. Add the Power Platform Skills marketplace:

    ```text
    /plugin marketplace add microsoft/power-platform-skills
    ```

1. Install the Power Automate plugin:

    ```text
    /plugin install power-automate@power-platform-skills
    ```

1. Restart your agent session.

> [!TIP]
> Turn on automatic updates for the marketplace so that you receive the latest skills and fixes.

The plugin includes its Power Automate MCP server. You don't need to install a separate npm package or configure a remote MCP host.

## Skills overview

You can invoke a skill as a slash command or describe the task conversationally.

| Skill | Command | What it does |
| --- | --- | --- |
| Set up the plugin | `/setup` | Checks Node.js, Azure CLI authentication, Power Automate access, and plugin connectivity |
| Browse flows | `/browse-flows` | Browses environments and flows and helps you select a flow to work with |
| Create a flow | `/create-flow` | Guides you through creating a flow and confirming its trigger, actions, and connections |
| Build a flow | `/build-flow` | Builds a complete flow from a description or template |
| Debug a flow | `/debug-flow` | Inspects a failed run and guides you through the error and possible fixes |
| Diagnose a flow | `/diagnose-flow` | Performs a deeper investigation of a specified failed run and identifies likely root causes and fixes |
| Manage flows | `/manage-flows` | Handles publishing and testing, batch operations, health checks, and inventory reports |
| Manage desktop flows | `/manage-desktop-flows` | Lists and runs desktop flows and works with machine groups |
| Check environment routing | `/route-environments` | Checks environment routing status and explains how a default environment is resolved. Configure routing in the Power Platform admin center. |
| Report an issue | `/report-issue` | Collects bug details, previews the report, and, with your approval, files a public GitHub issue |

The plugin also exposes tools that let the agent edit an existing flow, inspect run details and loop iterations, manage connections, resolve connector values, validate flow definitions, and restore plugin-created backups.

## Typical workflow

A common workflow follows these steps:

1. Run `/setup` to verify prerequisites and access.
1. Run `/browse-flows` to select an environment or an existing flow.
1. Run `/create-flow` or `/build-flow` to create a flow.
1. Review the proposed trigger, actions, expressions, and connections.
1. Approve the change and publish the flow.
1. Test the flow and review the run result.
1. If the run fails, run `/debug-flow` or `/diagnose-flow`.

You don't need to follow this exact order. For example, you can start with `/debug-flow` when you already have a failed run, or ask the agent to edit a specific flow.

## Create a flow

Describe the automation you want:

```text
Create a flow that posts a Teams message when a new item is added
to the Project Tasks SharePoint list.
```

The plugin helps you:

- Select an environment
- Identify the trigger and actions
- Find or create the required connections
- Resolve environment-specific values, such as a SharePoint site, list, Teams team, or channel
- Build and validate the flow definition
- Create the flow in a stopped state so you can review and validate it before enabling it

You can also start with a built-in template:

```text
Create a scheduled email digest flow from a template.
```

## Edit an existing flow

Ask for a targeted change:

```text
In the Invoice Processing flow, add a Teams notification after
the approval is completed.
```

The plugin reads the current flow, proposes the change, and preserves the rest of the definition. For supported edits, it can show a preview before applying the update and create a backup that can be restored if needed.

Review changes carefully, especially when you work with production flows, managed solutions, connection references, or complex expressions.

## Debug a failed run

Describe the problem or identify the flow:

```text
Why did the Daily Report flow fail last night?
```

The plugin can:

- Find recent failed runs
- Inspect each action's status, inputs, outputs, and error details
- Drill into individual loop iterations
- Identify common causes such as expired connections, invalid data, throttling, missing resources, or dependent action failures
- Suggest a fix for you to review
- Apply an approved change and run the flow again

Use `/diagnose-flow` when you have the environment, flow, and run IDs and want a deeper investigation. Review any proposed fix before allowing the agent to change the flow.

## Manage flows and connections

Use conversational requests for common operational tasks:

```text
Copy the Invoice Processing flow to the test environment.
```

```text
Show recent failed runs for this flow.
```

```text
Check whether the connections used by this flow are healthy.
```

```text
Create an inventory of flows in this environment.
```

The plugin can help with flow lifecycle operations, connection discovery and repair, environment routing, run management, backups, connector metadata, and validation.

## Use Microsoft Learn from the plugin

The plugin includes the Microsoft Learn MCP server as a companion knowledge source. The agent can search current Microsoft Learn content when it needs official guidance about connectors, expressions, cloud flow patterns, product behavior, or troubleshooting.

Ask a question such as:

```text
Find the official Power Automate guidance for child flows and explain
whether this design follows it.
```

Microsoft Learn provides reference information. Power Automate operations still use the plugin's bundled FlowAgent MCP server and your signed-in account.

## Security and governance

The plugin calls Power Automate services by using your signed-in identity. Power Automate and Power Platform enforce the permissions, licensing requirements, connector policies, and tenant restrictions that apply to that identity and environment.

- Some connection operations require interactive sign-in or consent.
- You should review proposed changes before you let the agent modify or publish a flow.

Use test environments and nonproduction data when you evaluate the plugin. Follow your organization's policies for source control, change management, secrets, customer data, and production access.

## Limitations

- AI-generated flow definitions and edits might require correction or refinement.
- Connector behavior, available operations, and dynamic values vary by environment and connector.
- Tenant policies can block connectors or connection creation.
- Desktop flow support covers discovery, execution, and machine-group operations. You can't use the plugin to edit Power Automate Desktop scripts.
- Some authentication or consent steps require interaction in a browser.
- Features and skills can change as the Power Platform Skills marketplace is updated.

## Troubleshooting

| Issue | Suggested action |
| --- | --- |
| Power Automate tools aren't available | Restart the agent session, then run `/setup`. |
| Azure CLI isn't signed in | Run `az login --allow-no-subscriptions`, then run `/setup` again. |
| An environment or flow isn't found | Confirm that you selected the correct tenant and have access to the environment. |
| A connector or operation isn't available | Check connector availability, licensing, and your organization's data policies. |
| A connection fails | Ask the plugin to test or repair the connection. An interactive sign-in might be required. |
| A flow fails validation | Review the validation details and ask the plugin to explain or correct the specific issue. |
| A generated flow behaves unexpectedly | Disable the flow if needed, review its definition and connections, and restore a backup or apply a corrected edit. |

If the issue appears to be in the plugin, run `/report-issue` or file an issue in the [Power Platform Skills repository](https://github.com/microsoft/power-platform-skills/issues). Reports are public. Remove credentials, tenant and environment identifiers, internal URLs, customer data, proprietary code, and other sensitive information before submitting an issue.

## Related information

- [Power Platform Skills marketplace](https://github.com/microsoft/power-platform-skills)
- [Power Automate documentation](/power-automate/)
- [Overview of cloud flows](/power-automate/overview-cloud)
- [Power Automate connectors](/connectors/connector-reference/connector-reference-powerautomate-connectors)
- [Get started with the Power Pages plugin for GitHub Copilot CLI and Claude Code](/power-pages/configure/create-code-site-using-claude-code)
- [Create and edit canvas apps with AI code generation tools](/power-apps/maker/canvas-apps/create-canvas-external-tools)
