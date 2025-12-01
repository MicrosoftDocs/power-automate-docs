---
title: Troubleshoot unattended desktop flow execution failures
description: Learn how to diagnose and resolve common issues when running Power Automate desktop flows in unattended mode.
ms.reviewer: iomimtso
ms.author: iomimtso
ms.service: power-automate
ms.subservice: desktop-flow
ms.date: 2025-12-01
search.audienceType: 
  - flowmaker
  - enduser
contributors:
  - iomimtso
---

# Troubleshoot unattended desktop flow execution failures

This article provides a structured approach to diagnose and resolve failures during unattended execution of Power Automate desktop flows.

## Review execution logs

Start by examining the execution logs to identify the root cause of failures.

1. Access the execution logs in the [Power Automate portal](../monitor-run-details).
1. Review the error message to determine whether the issue relates to:
   - **Web automation**: Browser automation action failed.
   - **Desktop automation**: UI automation action failed.
1. If available, review the screenshot captured at the time of failure to understand the machine and application state.

If screenshots aren't enabled:

- Enable the **On error Add screenshot to logs** option in the flow properties.
- Use an **On block error** action to trigger a subflow that captures a screenshot during execution.

Ensure [full verbosity logging](../configure-desktop-flow-logs) is enabled for detailed diagnostics.

## Validate environment setup

Environment differences between attended and unattended sessions can cause flows to fail. Verify the following settings.

### Screen resolution

Ensure the screen resolution for unattended sessions matches that of attended sessions. Different resolutions may hide certain elements, causing runtime failures.

Learn how to [set screen resolution for unattended mode](set-screen-resolution-unattended-mode).

### DPI awareness

If your application isn't DPI aware, it may not scale correctly when accessed in unattended mode. This can result in invalid element selectors that fail to identify elements.

You can:

- Set DPI at 100% for both design time and runtime.
- [Build a custom selector](../build-custom-selectors) using attributes that don't change between attended and unattended sessions.
- Disable DPI virtualization for the application to allow it to render at its native resolution.

### OS version

Ensure the OS version for unattended sessions matches that of attended sessions. Different OS versions may affect how elements are displayed on the screen.

### Multi-user session requirements

Ensure all [prerequisites for multi-user sessions](../requirements#prerequisites-and-limitations) are met.

> [!NOTE]
> These prerequisites cover Power Automate for desktop-specific requirements. When you configure a machine, also account for resource needs of other applications and system processes.

Ensure the same user isn't logged into multiple sessions on the same machine.

### Installation conflicts

Having both MSI and Microsoft Store versions of Power Automate for desktop installed on the same machine isn't supported. This can cause confusion about which components are loaded during runtime.

Ensure only the version you need is installed.

## Handle UIPI issues

User Interface Privilege Isolation (UIPI) can prevent UI and browser automation actions from interacting with applications.

Learn more about [UIPI issues with UI and browser automation actions](https://learn.microsoft.com/en-us/troubleshoot/power-platform/power-automate/desktop-flows/ui-automation/uipi-issues).

## Run diagnostic tools

Use the following tools to detect and resolve issues automatically.

### Power Automate Troubleshooter

Run the Power Automate Troubleshooter on the affected machine to detect and automatically resolve issues related to:

- UI automation
- Web automation
- Java, SAP, and RDP/Citrix automation

Learn how to [use the Power Automate Troubleshooter](../troubleshooter).

### Event Viewer logs

Inspect Event Viewer logs for errors or unusual behavior related to:

- Power Automate for desktop
- The machine
- The target application

## Adjust timeout settings

If you experience timeout issues, increase timeout values for UI and browser automation actions.

Learn how to [change the timeout configuration for UI and browser automation](ui-automation-change-timeout-cofiguration).

## Ensure consistent window mode

Ensure that the application starts in the same window mode (full screen or windowed) in both attended and unattended sessions.

Use the **Set window state** action or the **Window state** property within **Launch new Browser** actions to enforce the correct mode at runtime.

## Test and isolate the issue

To determine whether the issue is machine-specific or user-specific, test the flow in different environments.

### Reproduce the issue

- **On another machine**: If the issue doesn't occur, investigate the original machine configuration.
- **With another Windows user on the same machine**: If the issue is user-specific, compare user profiles and permissions.

### Test locally

1. Connect to the machine using the unattended Windows user account.
1. Run the flow locally and attended from the portal to compare behavior.

## Ensure reliable UI element selectors

Power Automate for desktop creates selectors by capturing UI element properties (like name, class, or automation ID) and their position in the UI hierarchy. These selectors uniquely identify elements so the flow can interact with them reliably during automation.

Selectors can be affected by:

- Screen resolution and DPI scaling
- Application updates or UI changes
- OS version
- Window size or mode (for example, maximized versus windowed)
- The state of an element (enabled or disabled)
- User permissions. An application may load differently based on the user profile.

### Guidance for selectors

- Add multiple selectors for the element to enable fallback behavior.
- [Build custom selectors](../build-custom-selectors) with static attributes. Use the [inspect UI element tool](../inspect-ui-elements) to explore the hierarchy tree of all UI elements on your screen.
- Use [image fallback](../ui-elements-fallback-mechanism) when appropriate.
- Add a retry policy in error handling of the action.
- Use the appropriate action type per element: [browser automation for web elements, UI automation for desktop elements](../ui-elements).
- Ensure the application starts in the same window mode in unattended as in attended sessions.
- Manually recapture the selector on the unattended machine using the UI element picker.
- [Test the selector](../test-selectors) on the machine that runs unattended.
- Use the [Repair selector](../repair-selector) functionality on the unattended machine.
- Recapture the element (UI element, not web) using MSAA mode. Some legacy apps work better in MSAA mode when trying to capture elements.

## Related information

- [Power Automate troubleshooting](https://learn.microsoft.com/en-us/troubleshoot/power-platform/power-automate/welcome-power-automate)
