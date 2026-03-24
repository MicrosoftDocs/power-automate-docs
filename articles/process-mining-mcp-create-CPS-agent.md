---
title: Create a Copilot Studio agent with process mining
description: Step-by-step guide to creating an AI agent in Copilot Studio that analyzes process mining data using the MCP connector.
author: praak
contributors:
  - v-aangie
ms.service: power-automate
ms.subservice: process-advisor
ms.topic: how-to
ms.date: 03/23/2026
ms.author: praveenkumar-ak
ms.reviewer: angieandrews
search.audienceType:
  - processanalyst
  - flowmaker
  - enduser
---


# Create a Copilot Studio agent with process mining

## Overview

Create an intelligent "Process Analyst Assistant" agent in Microsoft Copilot Studio that helps users analyze process performance, identify bottlenecks, and gain insights from process mining data through natural language conversations.

**What you'll build:**
- An AI agent that understands process mining concepts
- Natural language interface to process analytics via MCP tools
- Automated tool selection and parameter handling through generative orchestration
- Contextual insights and recommendations

**Example interactions:**
- User: "What are the bottlenecks in our Order-to-Cash process?"
- User: "Show me cases that took longer than 5 days"
- User: "Which department has the longest processing time?"
- User: "Does customer type influence case duration?"

**Time to complete**: 30-45 minutes


## Prerequisites

Before you begin, ensure you have the following:

> [!NOTE]
>
> **Prerequisites:**
> - **Completed setup**:
>   - Process Mining environment with at least one ingested process (see [Process Mining overview](https://learn.microsoft.com/en-us/power-automate/process-mining-overview))
>   - Active Power Platform environment
>   - Process Mining connector connection configured (see setup options below)
> - **Permissions**:
>   - Copilot Studio account with agent creator permissions
>   - Process Mining contributor or viewer access
>   - Power Platform environment maker role
>   - Microsoft Entra ID authentication enabled for your tenant
> - **Knowledge**:
>   - Basic familiarity with Copilot Studio
>   - Understanding of process mining concepts (activities, cases, variants)
>   - Your process schema (attribute names, custom metrics)

> [!IMPORTANT]
>
> **Critical requirements before proceeding:**
> 1. You must have **at least one process ingested** and available in [Process Mining](https://learn.microsoft.com/en-us/power-automate/process-mining-overview)
> 2. You need access to **Copilot Studio web app** at https://copilotstudio.microsoft.com

### Set up the Process Mining connection

The [Process Mining connector](https://learn.microsoft.com/en-us/connectors/processmining/) is a prebuilt Power Platform connector that provides Model Context Protocol (MCP) access to Process Mining data. It is listed in the [MCP server connectors catalog](https://learn.microsoft.com/en-us/connectors/connector-reference/connector-reference-mcpserver-connectors) and available in all regions.

You have two options to set up the connection:

**Option A: Pre-create the connection in Power Automate**

1. Sign in to [Power Automate](https://make.powerautomate.com/)
1. Select the **same environment** as your Copilot Studio environment using the environment picker
1. In the left navigation pane, select **Data** > **Connections**
1. Select **+ New connection**
1. Search for **Process Mining** in the search box and select the connector
1. Follow the authentication prompts to create the connection

For more information, see [Add and manage connections in Power Automate](https://learn.microsoft.com/en-us/power-automate/add-manage-connections).

**Option B: Create the connection when adding the tool in Copilot Studio**

You can skip this step and create the connection directly when adding the Process Mining tool to your agent in Step 5. If no connection exists, Copilot Studio prompts you to create one inline.

> [!TIP]
>
> Option A is recommended if you want to verify the connection is working before configuring your agent, or if you plan to reuse the same connection across multiple agents.


## Step 1: Create the agent

1. **Sign in to Copilot Studio**
   - Navigate to https://copilotstudio.microsoft.com
   - Sign in with your organizational account
   - Verify you are in the correct environment by checking the **Environment** selector in the top navigation bar
   - Select the environment where Process Mining MCP is enabled

1. **Create a new agent from scratch**
   - On the **Home** page, locate the **Start building from scratch** section
   - Select **Create an agent**

   > [!NOTE]
   >
   > Do not use the "Quick start: Create and deploy an agent" option or the description-based creation at the top of the page. Select **Create an agent** under "Start building from scratch" for full control over the agent configuration.

1. **Wait for agent provisioning**
   - Copilot Studio provisions your new agent
   - This typically takes 10-30 seconds
   - Once complete, the agent **Overview** page appears

1. **Familiarize yourself with the Overview page**
   - The Overview page is your central hub for configuring the agent. It contains the following sections:
     - **Details**: Agent name, icon, and description
     - **Instructions**: System prompt that guides agent behavior (up to 8,000 characters)
     - **Model**: AI model selection for reasoning and responding
     - **Starter prompts**: Suggested conversation starters for users
     - **Knowledge**: Connected knowledge sources
   - The top navigation includes additional tabs:
     - **Overview** | **Knowledge** | **Tools** | **Agents** | **Topics** | **Activity** | **Evaluation** | **Analytics** | **Channels**

:::image type="content" source="media/process-mining-mcp/copilot-studio-home-page.png" alt-text="Copilot Studio home page.":::


## Step 2: Edit agent details

1. **Edit the agent name and description**
   - In the **Details** section on the Overview page, select **Edit**
   - **Name**: `Process Analyst Assistant`
     - Maximum 42 characters
     - No angle brackets allowed
   - **Description**: `Helps users analyze process performance, identify bottlenecks, and discover insights from process mining data through natural language conversations.`
   - Optionally select **Change icon** to set a custom icon (PNG format, less than 30 KB)
   - Select **Save**



## Step 3: Select the AI model

1. **Choose the reasoning model**
   - On the Overview page, locate the **Model** section
   - Select the model dropdown
   - The dropdown displays available models with the current default pre-selected

1. **Model selection guidance**

   > [!TIP]
   >
   > **Recommended approach for model selection:**
   > 1. **Start with the best available model** &mdash; Select the most advanced model in the dropdown. This gives you the highest accuracy baseline for process mining analysis, which requires precise tool selection and complex parameter construction.
   > 2. **Test thoroughly with the best model** &mdash; Use the Test chat panel and Evaluation test sets (Steps 6a and 6b) to validate accuracy across all process mining scenarios (bottleneck analysis, filtering, correlation, variant analysis).
   > 3. **Systematically test with less advanced models** &mdash; Once you have a quality baseline, try the next model down. Re-run the same test sets and compare scores.
   > 4. **Find the balance between cost and performance** &mdash; Select the least expensive model that still meets your accuracy requirements. Process mining queries require reliable tool selection and correct filter construction, so prioritize accuracy over cost savings.
   >
   > For process mining agents specifically, the model must reliably:
   > - Select the correct MCP tool based on user intent (e.g., `get_bottleneck_analysis` for bottleneck questions)
   > - Construct valid filter JSON from natural language descriptions
   > - Distinguish between case-level and event-level attributes for correlation analysis
   > - Handle multi-turn conversations with context retention

   > [!NOTE]
   >
   > Experimental models are subject to preview terms. For production agents, prefer generally available models.



## Step 4: Configure the system prompt (Instructions)

The Instructions field defines how the agent behaves, what data it uses, and how it responds. This is the most critical configuration for a process mining agent.

1. **Open the Instructions editor**
   - In the **Instructions** section on the Overview page, select **Edit**

1. **Paste the system prompt**
   - Replace any auto-generated instructions with the following template
   - Maximum length: **8,000 characters**
   - Select **Save** when done

1. **System prompt template**

   Copy and customize the following prompt:

```
ROLE DEFINITION
You are a Process Mining Agent. Your function is to analyze and interpret structured process analytics provided at runtime. You have no independent access to databases, environments, or external systems. All insights must originate strictly from the data supplied in the current request.

PRIMARY OBJECTIVE
Transform the provided structured analytics into clear, accurate, and actionable process insights.
- Operate strictly within the domain of process mining, process analysis, and operational understanding.
- Do not act as a general-purpose conversational model.
- Every response must reflect the process context, metrics provided, and recognized process mining principles.

DATA SOURCES AND GROUNDING RULE
You may receive structured process-related data in the following categories:

1. Overall Process Metrics: Total cases, min/max/average/median case duration, throughput, SLA indicators. Use for high-level summaries and trend identification.

1. Activity Level Metrics: Activity names, occurrence counts, case frequency, mean/median/total durations, waiting times, rework count and percentage. Use for bottleneck analysis, rework detection, and activity performance.

1. Variant Level Metrics: Variant identifiers, paths (activity sequences), frequency, case count, average/median/total duration. Use to identify common paths, longest-running variants, and deviations.

1. Transition/Edge-Level Metrics: From-activity and to-activity transitions, frequency, duration, deviation indicators. Use for flow structure analysis and handover delays.

1. Attribute-Level Metrics: Case-level or event-level attribute names, values, and grouped metrics. Use for segment analysis (regions, departments, customer types).

1. Correlation/Influence Data: Attribute influence on case duration, waiting time, or activity delays. Use to explain why certain cases are slow and which attributes correlate with delays.

1. Root-Cause Insights: Attribute splits, mean durations for filtered subsets, positive/negative influence indicators. Use for explaining why certain behaviors occur.

TOOL USAGE GUIDELINES
- Always start with get_processes to list available processes
- Use get_process_details to discover attributes before filtering
- For bottleneck questions, use get_bottleneck_analysis
- For variant analysis, use get_variants_with_metrics
- For correlation questions, use get_correlation (case-level attributes only)
- Apply filters to reduce data volume and improve performance
- Use get_attribute_values to discover valid filter values

AVAILABLE PROCESSES
[CUSTOMIZE: Replace with your actual processes and GUIDs]
Example:
- Order-to-Cash: processId 12345678-1234-1234-1234-123456789abc
- Purchase-to-Pay: processId 87654321-4321-4321-4321-cba987654321

[To get your process IDs: In the Test panel, ask "What processes are available?"]

KEY ATTRIBUTES
[CUSTOMIZE: Replace with your actual process attributes]
Example for Order-to-Cash:
- Activity: Create Order, Approve Order, Credit Check, Prepare Shipment, Ship Goods, Generate Invoice, Confirm Payment
- Department: Sales, Finance, Warehouse, Accounting
- Customer: Customer names or IDs
- Region: North, South, East, West, International

[To get attributes: In the Test panel, ask "Tell me about the Order-to-Cash process attributes"]

ANALYSIS PRINCIPLES
- Use only the provided data
- Reference relevant metrics explicitly (durations, counts, frequencies)
- Avoid overgeneralization or speculation
- Interpret results using process mining concepts: case duration, variant frequency, bottlenecks, rework loops, activity performance, transition delays, segment behavior, root cause influences
- Give explanations that are factual, data-driven, and concise
- If data is insufficient, respond: "No such data available."

BEHAVIOR AND TONE
1. Professional and analytical tone - clear, direct, structured
1. No greetings or sign-offs
1. No creative writing - strictly analytical
1. Use system duration formats exactly as provided
1. Neutral, polite, factual - no subjective judgment

RESPONSE FORMATTING
- Present metrics with appropriate units (days, hours, minutes, counts)
- Highlight top 3-5 results for bottleneck/variant analyses
- Explain significance of findings in business terms
- Offer follow-up analysis suggestions when relevant
```

> [!NOTE]
>
> The sections marked [CUSTOMIZE] must be updated with your actual process IDs and attributes before the agent will work effectively. Use the Test panel (Step 6a) to discover this information, then return here to update the instructions.

> [!TIP]
>
> **Optimizing the prompt for the 8,000 character limit:**
> - Remove example process names/attributes if your actual data fills the space
> - Keep the TOOL USAGE GUIDELINES section &mdash; it is critical for correct tool selection
> - The BEHAVIOR AND TONE section can be shortened if needed
> - Always keep the DATA SOURCES section &mdash; it enables the agent to interpret MCP tool responses correctly

:::image type="content" source="media/process-mining-mcp/agent-builder-overview.png" alt-text="Agent builder overview page.":::


## Step 5: Add the Process Mining MCP connector and tools

### Step 5a: Add the Process Mining connector tool

Add the Process Mining MCP tool to your agent using the prebuilt [Process Mining connector](https://learn.microsoft.com/en-us/connectors/processmining/). For general guidance on adding connector tools, see [Add tools to custom agents](https://learn.microsoft.com/en-us/microsoft-copilot-studio/advanced-connectors).

1. **Open your agent**
   - Select **Agents** in the left navigation pane and select your **Process Analyst Assistant** agent

1. **Go to the Tools page**
   - Select the **Tools** tab and select **Add a tool**

1. **Select Connector**
   - In the **Add tool** pane, select **Connector**
   - The available services with connectors are displayed

1. **Search for Process Mining**
   - In the search box, type **Process Mining**
   - Select the **Process Mining** connector from the results
   - A list of tools available for the connector is displayed

1. **Select the MCP tool**
   - Select the Process Mining MCP tool from the list
   - The **Add tool** pane opens with the tool details

1. **Connect to the Process Mining service**
   - If you pre-created a connection in Power Automate (see Prerequisites > Option A), select the existing connection
   - If the connection doesn't already exist, select **Create new connection** and follow the authentication prompts to sign in with your organizational account

   > [!NOTE]
   >
   > The connection uses your user credentials by default. Each user who interacts with the agent must have Process Mining Contributor or Viewer access. For more information about credential options, see [Use connectors with agent author's credentials](https://learn.microsoft.com/en-us/microsoft-copilot-studio/advanced-connectors#use-connectors-with-agent-authors-credentials).

1. **Submit the connection**
   - Select **Submit** or **Create** as applicable

1. **Add and configure the tool**
   - Select **Add and configure**
   - The configuration page for the new tool opens, showing the tool and its details

:::image type="content" source="media/process-mining-mcp/tool-connector-selection.png" alt-text="Tool connector selection dialog.":::

### Step 5b: Enable individual MCP tools

1. **Verify tool discovery**
   - After adding the connector, Copilot Studio discovers the available tools
   - Confirm that **9 tools** are listed:

   | Tool | Purpose |
   |------|---------|
   | `get_processes` | Lists all available processes with IDs and names |
   | `get_process_details` | Retrieves attributes, custom metrics, and business rules for a process |
   | `get_attribute_values` | Gets values for a specific attribute with pagination |
   | `get_bottleneck_analysis` | Analyzes activities sorted by duration to identify bottlenecks |
   | `get_variants_with_metrics` | Retrieves process variants with frequency and performance metrics |
   | `get_edges_with_metrics` | Retrieves transitions between activities with metrics |
   | `get_cases_with_metrics` | Retrieves individual cases with metrics and attributes |
   | `get_process_overall_metrics` | Returns aggregated process-level metrics |
   | `get_correlation` | Calculates attribute influence on process metrics (case-level attributes only) |

1. **Enable all tools**
   - Ensure all 9 tools are enabled (toggled on)
   - Review tool descriptions to verify they match the expected capabilities
   - Keep all tools enabled for full process mining functionality

1. **Verify tool descriptions**
   - Good tool descriptions help generative orchestration select the right tool for each user query
   - The MCP server provides pre-configured descriptions for each tool
   - If descriptions appear generic, update them to be more specific about process mining use cases

> [!NOTE]
>
> If fewer than 9 tools are discovered, verify:
> 1. The Process Mining connector connection is active (check **Data** > **Connections** in [Power Automate](https://make.powerautomate.com/))
> 2. Process Mining has at least one ingested process in your environment
> 3. Your user account has Process Mining Contributor or Viewer access
> If the issue persists, see the Troubleshooting section at the end of this document.

:::image type="content" source="media/process-mining-mcp/tool-selection-activation.png" alt-text="Tool selection and activation.":::


## Step 6: Test the agent

Use both the interactive Test chat and the automated Evaluation system to validate your agent.

### Step 6a: Test locally with the Test chat panel

The Test chat panel allows you to interact with your agent in real time and verify tool invocations.

1. **Open the Test panel**
   - Select the **Test your agent** panel (typically in the bottom-right corner of the Copilot Studio canvas)
   - The panel opens as a chat interface

1. **Run basic functionality tests**

   **Test 1: Process discovery**
   - Type: `What processes are available?`
   - **Expected**: Agent calls `get_processes` and returns a list of process names with IDs
   - **Verify**: Process list matches your Process Mining environment

   **Test 2: Process details**
   - Type: `Tell me about the Order-to-Cash process attributes`
   - **Expected**: Agent calls `get_process_details` and returns categorized attributes (case-level and event-level)
   - **Verify**: All process attributes are listed and correctly categorized

   **Test 3: Bottleneck analysis**
   - Type: `What are the top 3 bottlenecks in Order-to-Cash?`
   - **Expected**: Agent calls `get_bottleneck_analysis` with processId and itemsPerPage=3
   - **Verify**: Activities are returned with durations and business interpretation

   **Test 4: Filtering**
   - Type: `Show me bottlenecks in the Sales department only`
   - **Expected**: Agent calls `get_bottleneck_analysis` with an AttributeValueFilter for Department=Sales
   - **Verify**: Results are specific to Sales department; agent explains the filtering applied

   **Test 5: Correlation analysis**
   - Type: `Does department influence process duration?`
   - **Expected**: Agent calls `get_correlation` with attributeName="Department" and influenceFormula="DurationInfluence"
   - **Verify**: Influence values are returned and interpreted (high/moderate/low)

   **Test 6: Error handling**
   - Type: `Analyze correlation for Activity attribute`
   - **Expected**: Agent receives an error (Activity is event-level, not case-level) and explains the limitation to the user with alternative suggestions
   - **Verify**: Agent does not crash; provides a user-friendly error message

1. **Review the Activity map**
   - After each test, select the **Activity map** tab in the test panel
   - Verify:
     - The correct tool was selected for each query
     - Parameters are correct (processId, filters, pagination)
     - Response was parsed successfully

> [!TIP]
>
> After running Tests 1-2, use the discovered process IDs and attribute names to update the [CUSTOMIZE] sections in your Instructions (Step 4). Then re-run Tests 3-6 with the updated instructions for better accuracy.

:::image type="content" source="media/process-mining-mcp/test-panel-tool-invocation.png" alt-text="Test panel showing tool invocation.":::

### Step 6b: Evaluate with test sets

Agent evaluation provides automated, repeatable testing using test sets with up to 100 test cases.

1. **Navigate to the Evaluation tab**
   - Select the **Evaluation** tab from the top navigation

1. **Create a new evaluation**
   - Select **+ New evaluation**
   - Choose **Or, write some questions yourself** to manually create test cases for process mining scenarios

1. **Add process mining test cases**

   Create test cases covering key scenarios. Example test set:

   | Question | Expected Response | Test Method |
   |----------|-------------------|-------------|
   | What processes are available? | Lists process names with IDs | General quality |
   | What are the bottlenecks in Order-to-Cash? | Lists top activities by duration with insights | Tool use (get_bottleneck_analysis) |
   | Show me bottlenecks in Sales department | Filtered bottleneck results for Sales only | Keyword match (Sales, bottleneck, duration) |
   | Does department influence process duration? | Correlation analysis with influence scores | Tool use (get_correlation) |
   | What are the most common process variants? | Variant list with frequencies and paths | Tool use (get_variants_with_metrics) |
   | Show me cases longer than 5 days | Filtered case list with duration > 5 days | Keyword match (cases, duration, days) |
   | What are the overall metrics for Order-to-Cash? | Total cases, average duration, median duration | Tool use (get_process_overall_metrics) |
   | Analyze correlation for Activity attribute | Error explanation: Activity is event-level, suggest alternatives | General quality |
   | Show transitions in Order-to-Cash | Edge list with from/to activities and frequencies | Tool use (get_edges_with_metrics) |
   | What departments exist in the process? | List of department values | Tool use (get_attribute_values) |

1. **Select test methods**
   - Select **Add test method** and choose the methods relevant to your test cases:

   | Test Method | Use For | Scoring |
   |-------------|---------|---------|
   | **General quality** | Overall response quality assessment | Scored out of 100% |
   | **Tool use** | Verifying the agent calls the correct MCP tools | Pass/fail |
   | **Keyword match** | Checking responses contain expected terms (e.g., "bottleneck", "duration") | Pass/fail |
   | **Compare meaning** | Comparing response meaning to expected answer | Scored out of 100% |

   > [!TIP]
   >
   > For process mining agents, the **Tool use** method is particularly valuable. It verifies that the agent selects the correct MCP tool for each question, which is the most critical behavior for accurate process analysis.

1. **Configure the user profile**
   - Select **User profile** and choose an account that has:
     - Access to the Process Mining MCP connector
     - Viewer or Contributor permissions on the process mining data
   - This ensures the evaluation can authenticate to the MCP tools

1. **Run the evaluation**
   - Select **Evaluate** to run the test set immediately
   - Or select **Save** to save and run later
   - Review the results:
     - **Aggregate score**: Overall pass/fail rate and quality scores
     - **Individual test cases**: Drill into each case to see the agent's response, tool invocations, and scoring details
     - **Activity map**: Review which tools were called for each test case

1. **Iterate based on results**
   - If tool selection accuracy is low: Refine the TOOL USAGE GUIDELINES in your Instructions
   - If response quality is low: Add more specific examples to Instructions
   - If filter construction fails: Add filter examples to Instructions
   - If a different model scores higher: Update the model selection (Step 3)

> [!IMPORTANT]
>
> Test results are available in Copilot Studio for 89 days. To save results longer, export them to a CSV file from the evaluation results page.



## Step 7: Add starter prompts

Starter prompts suggest common questions to users when they begin a conversation, helping them discover the agent's capabilities.

1. **Navigate to the Overview page**
   - Select the **Overview** tab to return to the agent overview

1. **Add starter prompts**
   - In the **Starter prompts** section, select **+ Add starter prompts**
   - Add the following (example) process mining starter prompts:

   | Starter Prompt |
   |---------------|
   | What are the bottlenecks in our Order-to-Cash process? |
   | Show me cases that took longer than 5 days |
   | Which department has the longest processing time? |
   | Analyze the correlation between department and duration |
   | What are the most common process variants? |

   > [!TIP]
   >
   > Customize these prompts to match your actual process names and common analysis scenarios. Starter prompts appear in Microsoft Teams and Microsoft 365 Copilot channels, helping users understand what questions they can ask.

1. **Save the starter prompts**
   - Select **Save** to apply the changes

:::image type="content" source="media/process-mining-mcp/suggested-prompts.png" alt-text="Suggested prompts configuration.":::


## Step 8: Publish and deploy the agent

### Step 8a: Publish the agent

1. **Review before publishing**
   - Verify all configuration is complete:
     - ✓ Agent name and description set (Step 2)
     - ✓ AI model selected (Step 3)
     - ✓ Instructions configured with process-specific details (Step 4)
     - ✓ All 9 MCP tools connected and enabled (Step 5)
     - ✓ Test chat passes key scenarios (Step 6a)
     - ✓ Evaluation test set results are acceptable (Step 6b)
     - ✓ Starter prompts added (Step 7)

1. **Publish the agent**
   - Select the **Publish** button in the top-right corner of the page
   - Review the publish summary:
     - Agent name and description
     - Connected tools (Process Mining MCP - 9 tools)
     - Enabled channels
   - Select **Publish** to confirm

> [!NOTE]
>
> Publishing makes your agent available on all configured channels. You can continue to edit and republish the agent at any time. Each publish creates a new version.

### Step 8b: Deploy to Microsoft Teams and Microsoft 365 Copilot

1. **Navigate to the Channels tab**
   - Select the **Channels** tab from the top navigation

1. **Enable Microsoft Teams**
   - Select **Microsoft Teams** from the available channels
   - Configure availability:
     - **Personal app**: Users can chat with the agent directly in Teams
     - **Team or group chat**: Agent can be added to team conversations
   - Set permissions:
     - **Everyone in my organization** (recommended for internal use)
     - **Only specific people or groups** (for pilot testing)

1. **Enable Microsoft 365 Copilot**
   - Under **Turn on Microsoft 365**, select **Make agent available in Microsoft 365 Copilot**
   - Select **Add channel**
   - Edit details to customize:
     - Agent icon (follow Teams app icon format guidelines)
     - Accent color
     - Short and long descriptions (visible in the Teams app store and About tab)

1. **Share with users**
   - After configuring channels, share the agent link with your target users
   - For Teams: Users can find the agent in the Teams app store or through a direct link
   - For Microsoft 365 Copilot: The agent appears as an available extension in Copilot

:::image type="content" source="media/process-mining-mcp/teams-microsoft-365-channels.png" alt-text="Teams and Microsoft 365 channels configuration.":::


## Step 9: Monitor analytics

After deployment, monitor your agent's performance to identify improvement opportunities.

1. **Navigate to the Analytics tab**
   - Select the **Analytics** tab from the top navigation

1. **Review key metrics**

   | Metric | What to Look For | Action if Needed |
   |--------|------------------|------------------|
   | **Session count** | Steady or growing usage over time | Low usage: Promote agent, improve discoverability, add starter prompts |
   | **Average session length** | 3-5 interactions optimal for process mining | Too short (<2): Users not finding value. Too long (>8): Simplify responses |
   | **Resolution rate** | >80% ideal for successful conversations | <80%: Review unresolved conversations, improve instructions |
   | **Tool invocation frequency** | Balanced usage across MCP tools | Unused tools: Review tool descriptions. Overused: Add specialized topics |
   | **Error rate** | <5% acceptable for failed tool calls | >5%: Review error logs, fix filter syntax issues, check MCP connection |

1. **Analyze themes (preview)**
   - In the Analytics tab, review the **Themes** section
   - Themes group user questions by topic, showing:
     - Total questions per theme
     - Answered percentage
     - Response quality score
     - User reactions (thumbs up/down)
   - Use themes to identify:
     - Common questions not handled well
     - New process mining scenarios to add to instructions
     - Opportunities for creating evaluation test sets from production data

1. **Create test sets from themes**
   - When you identify a theme with low response quality, select **Evaluate** next to the theme
   - This creates a test set from real user questions
   - Run the evaluation to measure improvement after instruction updates

1. **Continuous improvement cycle**
   - Review analytics weekly during initial deployment
   - Update agent instructions based on common failure patterns
   - Re-run evaluation test sets after instruction changes to measure improvement
   - Adjust model selection if accuracy drops or costs are too high




## Example scenarios

These scenarios demonstrate common use cases for the Process Analyst Assistant.

### Scenario 1: Business user queries bottlenecks

**Persona**: Business analyst investigating process delays

**User query**: "What activities are causing delays in our Order-to-Cash process?"

**Agent workflow**:
1. Recognizes "Order-to-Cash" process reference
1. Selects `get_bottleneck_analysis` as the appropriate tool
1. Calls with processId for Order-to-Cash
1. Receives activities sorted by duration
1. Formats top 5 bottleneck activities with insights

**Expected output**:

```
I've analyzed the Order-to-Cash process for bottlenecks. Here are the top 5 activities causing delays:

1. **Approve Order** - Average duration: 3.2 days
   This is the biggest bottleneck, likely due to approval routing complexity or availability of approvers.

1. **Credit Check** - Average duration: 2.8 days
   Credit verification appears to be slower than optimal, possibly due to external system dependencies.

1. **Prepare Shipment** - Average duration: 2.1 days
   Warehouse preparation shows significant wait time, indicating potential capacity constraints.

1. **Generate Invoice** - Average duration: 1.6 days
   Invoice creation has moderate delays, possibly due to manual processing.

1. **Confirm Payment** - Average duration: 1.2 days
   Payment confirmation shows some bottleneck characteristics.

**Key insight**: The approval and credit check steps account for 6 days of the average process duration.

**Follow-up suggestions**:
- Analyze which departments are most affected by these bottlenecks
- Investigate specific cases with longest delays in approval
- Review approval workflow automation opportunities
```

### Scenario 2: Process analyst with filtering

**Persona**: Process improvement specialist focusing on specific segment

**User query**: "Show me bottlenecks in the Sales department for cases that took longer than 5 days"

**Agent workflow**:
1. Parses two filter requirements:
   - Department filter: AttributeValueFilter (Department = Sales)
   - Duration filter: MetricConditionFilter (CaseDuration > 5 days)
1. Constructs filter JSON:
   ```json
   {
     "attributeValueFilters": [
       {
         "attributeName": "Department",
         "attributeValues": ["Sales"],
         "isInclusive": true
       }
     ],
     "metricConditionFilters": [
       {
         "metric": "CaseDuration",
         "comparisonOperator": "GreaterThan",
         "dataType": "Time",
         "value": "5.00:00:00",
         "isInclusive": true
       }
     ]
   }
   ```
1. Calls `get_bottleneck_analysis` with filters
1. Presents filtered results with context

**Expected output**:

```
I've identified bottlenecks in the Sales department for cases exceeding 5 days:

**Filtered dataset**: 127 cases (out of 1,245 total) match your criteria.

**Top bottlenecks in Sales department (5+ day cases):**
1. **Approve Order** - Average: 4.1 days (vs 3.2 days overall)
   Sales cases show 28% longer approval times than the overall average.

1. **Credit Check** - Average: 3.5 days (vs 2.8 days overall)
   Credit checks in Sales take 25% longer, possibly due to higher-value orders.

1. **Generate Invoice** - Average: 2.2 days (vs 1.6 days overall)
   Invoice generation shows 38% longer duration in Sales-specific long-running cases.

**Key insight**: Sales department shows significantly longer bottleneck durations compared to the overall process, particularly in approval and credit check steps.

**Recommendations**:
- Review Sales-specific approval workflows for optimization opportunities
- Investigate if Sales orders require additional approval layers
- Consider dedicated credit check resources for Sales high-value orders
```

### Scenario 3: Root cause investigation

**Persona**: Operations manager investigating attribute influence

**User query**: "Does the customer attribute influence case duration?"

**Agent workflow**:
1. May call `get_process_details` to confirm "Customer" is case-level
1. Calls `get_correlation` with attributeName="Customer", influenceFormula="DurationInfluence", sortOrder="Descending"
1. Interprets influence values
1. Provides business interpretation and recommendations

**Expected output**:

```
I've analyzed how the Customer attribute influences case duration in the Order-to-Cash process.

**Top customers affecting duration:**

1. **GlobalCorp Inc** - Influence: 0.85 (high)
   - Average case duration: 8.2 days
   - 94% longer than process average

1. **EnterprisePartners LLC** - Influence: 0.72 (high)
   - Average case duration: 7.1 days
   - 69% longer than process average

1. **MegaRetail Co** - Influence: 0.68 (high)
   - Average case duration: 6.8 days
   - 62% longer than process average

1. **StandardBusiness Inc** - Influence: 0.15 (low)
   - Average case duration: 2.3 days
   - 45% faster than process average

**Key insight**: Enterprise customers (GlobalCorp, EnterprisePartners, MegaRetail) show significantly longer processing times, suggesting they require special handling or additional approval steps.

**Recommendations**:
1. Create dedicated workflows for high-influence enterprise accounts
1. Consider pre-approval processes for frequent large orders
1. Set appropriate SLA expectations for enterprise vs standard customers
```

### Scenario 4: Variant analysis

**Persona**: Process mining specialist analyzing conformance

**User query**: "What are the most common process variants and how do they perform?"

**Agent workflow**:
1. Calls `get_variants_with_metrics` with processId, metricToSortBy="CaseCount", sortOrder="Descending"
1. Compares duration metrics across variants
1. Classifies variants (happy path, rework, expedited)
1. Generates insights with recommendations

**Expected output**:

```
I've analyzed process variants in the Order-to-Cash process:

**Variant 1 (45% of cases - 562 cases)**
- Path: Create Order → Approve Order → Credit Check → Prepare Shipment → Ship Goods → Generate Invoice → Confirm Payment
- Average duration: 4.2 days
- Classification: Standard "happy path"

**Variant 2 (22% of cases - 275 cases)**
- Path: Create Order → Approve Order → Reject Order → Modify Order → Approve Order → Credit Check → ...
- Average duration: 7.8 days (86% longer than happy path)
- Classification: Rework variant with approval rejection loop

**Variant 3 (15% of cases - 187 cases)**
- Path: Create Order → Rush Approval → Prepare Shipment → Ship Goods → Credit Check → ...
- Average duration: 2.1 days (50% faster than happy path)
- Classification: Expedited process with parallel credit check

**Summary**:
- 55% of cases deviate from the happy path
- Rework and exception variants add 3-7 days on average

**Recommendations**:
1. Reduce order rejection rate (Variant 2 affects 22% of cases, adds 3.6 days)
1. Streamline credit checks for repeat customers
1. Evaluate expanding the rush process (Variant 3) to more eligible cases
```


## Enhance the agent (optional)

These optional enhancements can improve the agent experience for advanced scenarios.

### Add a knowledge source

Optionally add Process Mining documentation as a knowledge source to help the agent understand process mining terminology.

1. **Navigate to the Knowledge tab**
   - Select the **Knowledge** tab from the top navigation
   - Select **+ Add knowledge**

1. **Add public website**
   - Choose **Public websites**
   - Enter URL: `https://learn.microsoft.com/power-automate/process-mining-overview`
   - **Name**: `Process Mining Documentation`
   - **Description**: `Official Process Mining documentation for concept reference`
   - Select **Add**

> [!NOTE]
>
> This knowledge source is optional. The MCP tools and system prompt provide the primary analytical capabilities. The knowledge source adds terminology context for edge cases.

### Create custom topics

For frequently asked questions that benefit from a guided flow, create custom topics.

#### Bottleneck analysis topic

1. **Navigate to Topics tab**
   - Select the **Topics** tab
   - Select **+ Add topic** > **From description**

1. **Configure the topic**
   - **Name**: `Bottleneck Analysis`
   - **Description**: `User asks about bottlenecks, delays, or slowest activities in a process`
   - **Trigger phrases** (for classic orchestration) or **Description** (for generative orchestration):
     - "What are the bottlenecks?"
     - "Show me delays"
     - "Which activities are slowest?"

1. **Add topic logic**
   - Add a Question node: "Which process would you like to analyze?"
   - Add an Action node: Call `get_bottleneck_analysis` with processId
   - Add a Message node: Format and present results

### Configure conversation memory

Enable context retention for multi-turn analysis sessions.

1. **Use global variables**
   - Create variables to store current process context:
     - `Global_CurrentProcessId`: Currently analyzed process
     - `Global_CurrentProcessName`: Process name for display
     - `Global_CurrentFilters`: Active filters as JSON

1. **Reference in follow-up queries**
   - "Show me bottlenecks" → Sets process context
   - "Now filter by Sales department" → Uses stored processId, adds filter
   - "What about correlation?" → Uses stored processId and filters

1. **Create a reset topic**
   - **Trigger**: "Start over", "New analysis", "Reset"
   - **Action**: Clear all global variables
   - **Message**: "I've cleared the current analysis context. What would you like to analyze?"


## Troubleshooting

### Connection issues

| Issue | Symptoms | Resolution |
|-------|----------|------------|
| **Connection failed** | "Unable to connect to server" error | Verify the Process Mining connector connection is active in [Power Automate](https://make.powerautomate.com/) > **Data** > **Connections**. If the connection shows an error, select **Fix connection** or recreate it. |
| **No tools discovered** | Tool count shows 0 after adding connector | Verify Process Mining has at least one ingested process. Check that the connector connection is in the same environment as your Copilot Studio agent. |
| **Authentication errors** | 401 Unauthorized or 403 Forbidden | Verify your user account has Process Mining Contributor or Viewer access. If the connection has expired, recreate it in Power Automate > **Data** > **Connections**. |
| **Tool calls timeout** | Requests hang or timeout | Check if processes are loaded in Process Mining, verify network connectivity, set appropriate client timeout values (recommend 60+ seconds) |
| **Empty responses** | Tools return empty results | Ensure at least one process is ingested, check process has data, verify filters aren't too restrictive, confirm date ranges are valid |

### Agent behavior issues

| Issue | Symptoms | Resolution |
|-------|----------|------------|
| **Wrong tool selected** | Agent calls incorrect MCP tool | Refine Instructions &mdash; add more specific TOOL USAGE GUIDELINES with examples |
| **Filter construction fails** | Invalid filter errors | Add filter JSON examples to Instructions, verify attribute names match process schema (case-sensitive) |
| **Correlation errors** | "Non case-level attribute" error | Verify attribute is case-level using get_process_details before correlation |
| **Slow responses** | Timeout or long wait times | Reduce itemsPerPage, apply filters to reduce data volume, check MCP server health |

### Tool invocation errors

**InvalidParams errors:**

| Symptom | Cause | Resolution |
|---------|-------|------------|
| `"processId (Guid) must be id of the process"` | Empty or invalid processId | Use `get_processes` to obtain valid process IDs. Verify processId is a valid GUID format. |
| `"Attribute name must be provided"` | Missing attributeName parameter | Use `get_process_details` to discover valid attribute names. Verify parameter is included in request. |
| `"Attribute values must contain at least one value"` | Empty attributeValues array in filter | Add at least one value to the attributeValues array. |
| `"CustomMetricId is required when metric is CustomMetric"` | Missing customMetricId | Provide the GUID of the custom metric when using CustomMetric filter type. |

**InvalidRequest errors:**

| Symptom | Cause | Resolution |
|---------|-------|------------|
| `"Correlation cannot be calculated for non case-level attributes"` | Attempting correlation on event-level attribute (e.g., Activity) | Call `get_process_details` to identify case-level attributes. Use only case-level attributes for correlation. |
| `"Invalid filter syntax"` or `"Attribute not found"` | Filter references non-existent attribute or has syntax errors | Verify attribute names match process schema exactly (case-sensitive). Check filter JSON structure. |
| `"StartDate must be before EndDate"` | TimeframeFilter has invalid date range | Verify startDate is before endDate in ISO 8601 format. |

**InternalError:**

| Symptom | Cause | Resolution |
|---------|-------|------------|
| `"Operation failed"` or `"Invalid response type received"` | Server-side processing issue | Retry the operation (may be transient). Check Process Mining service health. Contact support with correlation ID if issue persists. |

### Enable diagnostic logging

1. In the Test chat panel, select the **Activity map** to view tool invocations
1. For connection-level tracing, go to **Settings** > **Diagnostics** and enable **Connection tracing**
1. Set log level to **Verbose** for detailed request/response payloads
1. Review logs in **Monitor** > **Connection logs**, filtering by correlation ID and connection name
1. Save correlation IDs when errors occur &mdash; these are essential for support investigations

**Common HTTP status codes in logs:**

| HTTP Status | Meaning | Action |
|-------------|---------|--------|
| 401 Unauthorized | Authentication failed | Check AAD token, verify credentials |
| 403 Forbidden | Permission denied | Verify managed identity has Process Mining permissions |
| 404 Not Found | Invalid endpoint or process ID | Check endpoint URL, verify processId exists |
| 500 Internal Server Error | Server-side error | Retry; check Process Mining health; contact support |
| 504 Gateway Timeout | Long-running operation not completing | Reduce query complexity; apply filters; increase timeout |


## Related information

- [Process Mining MCP Server Reference](process-mining-mcp-server-reference.md) - Complete tool and filter reference
- [Process Mining connector reference](https://learn.microsoft.com/en-us/connectors/processmining/) - Connector details and throttling limits
- [Add tools to custom agents](https://learn.microsoft.com/en-us/microsoft-copilot-studio/advanced-connectors) - General connector tool guidance for Copilot Studio
- [MCP server connectors](https://learn.microsoft.com/en-us/connectors/connector-reference/connector-reference-mcpserver-connectors) - Full list of available MCP connectors
- [Copilot Studio documentation](https://learn.microsoft.com/en-us/microsoft-copilot-studio/) - General Copilot Studio guidance
- [Orchestrate agent behavior with generative AI](https://learn.microsoft.com/en-us/microsoft-copilot-studio/advanced-generative-actions) - How generative orchestration works
- [Automate testing with agent evaluation](https://learn.microsoft.com/en-us/microsoft-copilot-studio/analytics-agent-evaluation-overview) - Test set creation and evaluation methods
- [Process Mining overview](https://learn.microsoft.com/en-us/power-automate/process-mining-overview) - Understanding process mining concepts
- [Add and manage connections in Power Automate](https://learn.microsoft.com/en-us/power-automate/add-manage-connections) - Connection setup and management

