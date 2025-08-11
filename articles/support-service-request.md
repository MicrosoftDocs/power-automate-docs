---
title: Create an effective Power Automate support request
description: Learn how to write a clear Power Automate support request so Microsoft support can help you quickly.
suite: flow
author: v-aangie
ms.reviewer: angieandrews
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: article
ms.date: 08/11/2025
ms.author: angieandrews
---

# Create an effective Power Automate support request

In this article, you'll learn what you should consider when creating a support service request to reach Microsoft support. An effective support service request with information that explains clearly the problem symptoms or the behavior provides a better context for faster problem resolution. You'll learn the differences between examples of problems with individual flows and how they differ with the problems related to the Power Automate product and relevant services. You'll also learn about what additional information you can provide to help expedite the problem investigation. This will help narrow down the scope of the problem through clear steps to reproduce the issue that helps the support team reach a resolution faster.

## Who can help with different issue types

Depending on the nature of the problem, different people or organizations might be best suited to help you:

- **Flow configuration issues (issues with your flow)**: For problems isolated to a specific flow that you or your team built (for example, logic errors or misconfigured actions), the creators or owners of the flow (possibly you or your Power Platform team) and your environment administrators should troubleshoot first. They understand the flow’s design and the context in which it runs.

- **Power Automate service issues (platform bugs)**: If the issue appears to be a bug in the Power Automate platform or in a Microsoft-provided connector (meaning the problem isn't specific to one flow and could affect any flow under certain conditions), then Microsoft Support is the right place to get help.

- **External system or integration issues**: If your flow’s problem stems from an external service or data source that the flow integrates with (for example, a third-party API or a SharePoint server), then the support team for that external system is most appropriate.

## Differences between issues with a flow and issues with the Power Automate product

Not every flow failure is due to a bug in Power Automate itself. It’s important to distinguish between an issue in your specific flow vs. a potential platform bug. The following table describes some signs to help tell them apart.

| Flow issue (issue with one flow) | Power Automate bug (platform issue) |
|--------------------------------------|------------------------------------------|
| The problem can be reproduced only in one specific flow (just your problematic flow). | You can create a new, simple flow to reproduce the same issue, suggesting it isn't tied to just one complex workflow. |
| It requires specific data, connectors, or context to trigger the issue (for example, it only fails with a certain file or in one particular SharePoint site). | Any comparable data or connector usage reproduces the issue. The same error occurs with any similar data or in any SharePoint list, indicating a broader bug. |
| It affects only one environment or tenant (other environments aren’t experiencing this problem). | It potentially affects multiple environments or organizations. You suspect others could encounter this bug in their flows as well. |
| The flow is complex with many steps, some not directly related to the failing part. (This complexity might obscure the root cause.) | A minimal flow with just the essential steps can demonstrate the issue. The problem persists even when the flow is stripped down to a simple scenario. |
| The error involves custom code or unusual configurations (for example, a custom script in a desktop flow or a unique API call specific to your business). | The error involves a standard Power Automate feature or action (for example, the built-in `filter array` action) behaving unexpectedly. |
| There's no Microsoft documentation covering the particular scenario that’s failing (because it's unique to your implementation). | Microsoft documentation exists for the feature, and the behavior you observe clearly contradicts the expected behavior described in the documentation. |

## Examples of issues with a flow

### Flow fails to send an email when a SharePoint item is created

- **Scenario**: You have a cloud flow that triggers `When an item is created` in a SharePoint list, then sends an email.
- **Steps to reproduce**: Create a new item in the specified SharePoint list.
- **Expected behavior**: An email is sent with the item details.
- **Actual behavior**: No email is sent. The flow either doesn’t run, or it runs but skips the email step without error.

This might be due to a misconfiguration (for example, incorrect trigger condition or expired Outlook connection). Since it only happens on that specific list and flow, it’s likely a configuration issue. The flow’s owner should check the run history and connections. There’s no evidence of a platform bug, as similar flows still work.

### A daily scheduled flow didn't run on a particular day

- **Scenario**: A scheduled cloud flow is supposed to run every day at 9:00 AM to perform a data update.
- **Expected behavior**: The flow should run each day at 9:00 AM.
- **Actual behavior**: On Tuesday, it didn’t run at all; there’s no run recorded.

This could be a one-time issue (for example, service downtime or flow turned off) or something specific to that environment. If other scheduled flows ran on Tuesday, the issue is likely with this flow. Try resaving the flow or checking if the schedule was paused. Only if multiple flows failed would you suspect a platform problem.

In both of the previous cases, the problem is confined to one flow or one environment. The flow's owner should begin troubleshooting, as these are likely not platform bugs.

## Example of issues with the Power Automate product

### The 'filter array' action returns no results when the filter text contains an asterisk (*)

- **Scenario**: In a simple flow, you use the `filter array` action to filter items in an array.
- **Steps to reproduce**: Create a flow with an array like `["a", "*b"]`. Use `flter array` to match `"*b"`.
- **Expected behavior**: The filter should return `"*b"`.
- **Actual behavior**: The filter returns an empty result set.

This issue is reproducible in any environment and involves a standard action misbehaving. It suggests a bug in how Power Automate handles special characters. In your support request, highlight that this is reproducible with a basic flow.

### Power Automate for desktop recorder fails to capture keystrokes in one application

- **Scenario**: When you use the desktop recorder, keystrokes aren't recorded for a specific legacy app, though they work in others.
- **Steps to reproduce**: Open the legacy app, start recording, type into a text field, and stop recording.
- **Expected behavior**: The script should show a “Populate text field” action.
- **Actual behavior**: No action is recorded.

This happens across multiple machines and flows. Other apps work fine. This suggests a product bug or incompatibility with that app. In your support request, indicate that it's reproducible on multiple devices.

## How to create an effective support service request for help with Power Automate

Once you determined that you might need to contact Microsoft (or your support provider) about the issue, it’s time to write the support request. A good support request is detailed and frames the issue in a way that shows it could be a platform bug (if applicable), not just a user error. It should contain enough information that someone else can understand and reproduce the problem without much back-and-forth. Follow these guidelines (where applicable) to craft an effective support ticket.

## Have a descriptive title

The title should mention:

- A specific Power Automate feature
- The unexpected behavior
- The conditions that cause the bug to happen

Example of a bad title:

 "Flow is broken." This title is too vague. It doesn’t indicate which part of Power Automate or what error.

Example of a good title:

"SharePoint trigger fails to start flow when item has attachments larger than 50MB." This title specifies the component (SharePoint trigger), the problem (fails to start), and the condition (when an item has large attachments)

## Add a simplified exported flow to the support service request

Whenever feasible, try to recreate the issue with the simplest possible flow. Rather than using your full production flow (which might be complex), build a small test flow that contains only the components necessary to reproduce the bug.

## Attach a network trace to the support service request

For issues that might be related to network calls or API interactions, consider capturing a network trace during the failure. You can use the browser's developer tools (for cloud flows), or a tool like Fiddler to capture a network trace. Start recording the trace just before reproducing the issue and stop right after&mdash;this ensures the trace focuses only on the failure.

## Provide detailed steps to reproduce the issue

 In the description, list step-by-step instructions so that someone else can follow them to see the problem. If possible, base this on a simple example (see next point). For example:

1. Create a new flow with trigger X. 
1. Add action Y with parameters A, B, C. 
1. Run the flow by doing Z.
  
Expected result: (What should happen after the above steps?)

Actual result: (What does happen instead?)

Be precise and include only the relevant steps needed to demonstrate the issue. Including both the observed behavior and the expected behavior clarifies the discrepancy.

## Provide screenshots or videos

For user interface issues, screenshots or videos can more quickly clarify the steps to reproduce the bug, rather than a written description.

## Link to the official documentation

Include links to Microsoft Learn documentation to clarify the affected feature and its expected behavior.

For issues with professional development features, provide a link to the documentation for the API function that doesn't work.

## Simplify code samples

If the issue involves coding and other professional development features, simplify the code first. Verify the issue occurs and attach a snippet of the problematic code.

## Provide system info

Some issues occur only under specific conditions, so it's important to share detailed information about your setup. Include the following:

- **Environment ID or Name**  
  Example: `Environment: ContosoProd (ID: 12345abc-cd67-…)`  
  You can find the environment ID in the URL when you're in Power Automate (it appears as a GUID).
- **Region**  
  Example: `Europe West` or `United States`  
  This is often tied to the environment, but stating it explicitly helps identify region-specific issues.
- **Tenant or Organization ID**  
  Provide the GUID of your Azure AD tenant and, if possible, the tenant name.  
  If a specific user is relevant (for example, flow owner or affected user), include their **User ID** or **email address**.
- **Flow Identifiers**  
  Include the **flow name** and **flow ID**.  
  The flow ID can be found in the URL after `/flows/` in Power Automate.  
  This helps Microsoft support locate backend logs more easily.
- **Run Identifiers**  
  If a specific run failed, include the **Run ID** or a **direct link** to the run.  
  The Run ID is visible in the URL when viewing run details.  
  Also include any **Correlation ID** or **Client Request ID** shown in error messages.
- **Browser and OS**  
  If the issue involves the Power Automate web portal or designer, specify the browser and version.  
  Example: `Chrome v112 on Windows 10`  
  For desktop flow issues, include the OS version.  
  Example: `Windows 11 Pro, version 21H2`

## Information required for Power Automate for desktop flows

Issues with Power Automate for desktop might require more details in your support request. When creating a support request for a desktop flow problem, include the following information:

- **Power Automate for desktop version**: Specify the exact version number of the Power Automate for desktop application you're using.

    To find this, open the Power Automate for desktop and select **Help > About**.

- **Operating system details**: Provide the edition and version of Windows in use.

- **Run type: Local or Cloud**: Indicate if the flow was executed by a cloud flow (attended/unattended run), or from the console (local run).

- **Run mode**: If the issue involves a desktop flow running from the cloud, specify if it was an **Attended** or **Unattended** run.

- **Network configuration (proxy/firewall)**: If the machine is on a corporate network, mention if it’s behind a proxy server or a strict firewall.

- **Machine logs**: Refer the steps to [collect the machine logs](desktop-flows/troubleshoot.md#collect-machine-logs)
- **Installation type**: This is needed to determine whether the Power Automate for desktop installed in your machine is the Microsoft Store version or the MSI version. To do this, go to the **Start** menu > **Add or remove programs**. Then search for **Power Automate**. If Power Automate for desktop is in the list, it's the MSI version. Power Automate is the Microsoft Store version.
- **Troubleshooter Reports**: The troubleshooter provides insights regarding certain issues in Power Automate for desktop, especially around misconfiguration. Learn about generating the reports in [Troubleshooter](desktop-flows/troubleshooter.md).
- **Session ID, Client ID & Correlation ID**: Find information in the Power Automate for Desktop console by selecting **Help** > **About**.

## Add notes from your investigation

You might try different configurations to eliminate possible causes. Mention these configurations in the support request. This inclusion helps others understand the issue better and avoid repeating the same steps.

## Submit a Power Automate support request

Before you submit a support request, [check if the bug is a known issue](/power-platform/admin/view-known-issues). If the bug isn't already known, you can [create a support request](/power-platform/admin/get-help-support) to report the bug.

## Related information

[Power Automate troubleshooting](/troubleshoot/power-platform/power-automate/welcome-power-automate?branch=main&branchFallbackFrom=pr-en-us-3421)
