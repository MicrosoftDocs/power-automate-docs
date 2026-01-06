---
title: Troubleshoot unattended desktop flow execution failures
description: Learn how to diagnose and resolve common problems when running Power Automate desktop flows in unattended mode.
author: iomimtso
ms.reviewer: ellenwehrle
ms.author: iomimtso
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 01/05/2026
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

1. Access the execution logs in the [Power Automate portal](../monitor-run-details.md).
1. Review the error message to determine whether the issue relates to:
   - **Web automation**: Browser automation action failed.
   - **Desktop automation**: UI automation action failed.
1. If available, review the screenshot captured at the time of failure to understand the machine and application state.

If you didn't enable screenshots:

- Turn on the **On error Add screenshot to logs** option in the flow properties.
- Use an **On block error** action to trigger a subflow that captures a screenshot during execution.

Make sure [full verbosity logging](../configure-desktop-flow-logs.md) is enabled for detailed diagnostics.

## Validate environment setup

Environment differences between attended and unattended sessions can cause flows to fail. Verify the following settings.

### Screen resolution

Ensure the screen resolution for unattended sessions matches that of attended sessions. Different resolutions might hide certain elements, causing runtime failures.

Learn how to [set screen resolution for unattended mode](set-screen-resolution-unattended-mode.md).

### DPI awareness

If your application isn't DPI aware, it might not scale correctly when accessed in unattended mode. This problem can result in invalid element selectors that fail to identify elements.

You can:

- Set DPI at 100% for both design time and runtime.
- [Build a custom selector](../build-custom-selectors.md) using attributes that don't change between attended and unattended sessions.
- Disable DPI virtualization for the application to render at its native resolution.

### OS version

Ensure the OS version for unattended sessions matches that of attended sessions. Different OS versions can affect how elements are displayed on the screen.

### Multi-user session requirements

Ensure you meet all [prerequisites for multi-user sessions](../requirements.md#prerequisites-and-limitations).

> [!NOTE]
> These prerequisites cover Power Automate for desktop-specific requirements. When you configure a machine, also account for resource needs of other applications and system processes.

Ensure the same user doesn't sign in to multiple sessions on the same machine.

### Installation conflicts

You can't install both MSI and Microsoft Store versions of Power Automate for desktop on the same machine. Installing both versions causes confusion about which components load during runtime.

Make sure you install only the version you need.

## Handle UIPI problems

User Interface Privilege Isolation (UIPI) can block UI and browser automation actions from interacting with applications.

For more information, see [UIPI problems with UI and browser automation actions](/troubleshoot/power-platform/power-automate/desktop-flows/ui-automation/uipi-issues).

## Run diagnostic tools

Use the following tools to detect and resolve problems automatically.

### Power Automate Troubleshooter

Run the Power Automate Troubleshooter on the affected machine. It detects and automatically resolves problems related to:

- UI automation
- Web automation
- Java, SAP, and RDP/Citrix automation

For more information, see [use the Power Automate Troubleshooter](../troubleshooter.md).

### Event Viewer logs

Check Event Viewer logs for errors or unusual behavior related to:

- Power Automate for desktop
- The machine
- The target application

## Adjust timeout settings

If you encounter timeout problems, increase timeout values for UI and browser automation actions.

Learn how to [change the timeout configuration for UI and browser automation](ui-automation-change-timeout-cofiguration.md).

## Ensure consistent window mode

Make sure the application starts in the same window mode (full screen or windowed) in both attended and unattended sessions.

Use the **Set window state** action or the **Window state** property within **Launch new Browser** actions to enforce the correct mode at runtime.

## Test and isolate the problem

To determine whether the problem is machine-specific or user-specific, test the flow in different environments.

### Reproduce the problem

- **On another machine**: If the problem doesn't occur, investigate the original machine configuration.
- **With another Windows user on the same machine**: If the problem is user-specific, compare user profiles and permissions.

### Test locally

1. Connect to the machine by using the unattended Windows user account.
1. Run the flow locally and attended from the portal to compare behavior.

## Ensure reliable UI element selectors

Power Automate for desktop creates selectors by capturing UI element properties, such as name, class, or automation ID, and their position in the UI hierarchy. These selectors uniquely identify elements so the flow can interact with them reliably during automation.

Selectors can be affected by:

- Screen resolution and DPI scaling
- Application updates or UI changes
- OS version
- Window size or mode (for example, maximized versus windowed)
- The state of an element (enabled or disabled)
- User permissions. An application might load differently based on the user profile.

### Guidance for selectors

- Add multiple selectors for the element to enable fallback behavior.
- [Build custom selectors](../build-custom-selectors.md) with static attributes. Use the [inspect UI element tool](../inspect-ui-elements.md) to explore the hierarchy tree of all UI elements on your screen.
- Use [image fallback](../ui-elements-fallback-mechanism.md) when appropriate.
- Add a retry policy in error handling of the action.
- Use the appropriate action type per element: [browser automation for web elements, UI automation for desktop elements](../ui-elements.md).
- Ensure the application starts in the same window mode in unattended as in attended sessions.
- Manually recapture the selector on the unattended machine by using the UI element picker.
- [Test the selector](../test-selectors.md) on the machine that runs unattended.
- Use the [Repair selector](../repair-selector.md) functionality on the unattended machine.
- Recapture the element (UI element, not web) by using Microsoft Active Accessibility (MSAA) mode. Some legacy apps work better in MSAA mode when trying to capture elements.

## Related information

[Power Automate troubleshooting](/troubleshoot/power-platform/power-automate/welcome-power-automate)
