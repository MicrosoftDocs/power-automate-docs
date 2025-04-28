---
title: How to configure the open terminal session action
description: Learn to configure the open terminal session action in Power Automate for desktop. Set up terminal sessions with Micro Focus Reflection and HLLAPI.
author: NikosMoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 11/15/2024
ms.author: nimoutzo
ms.reviewer: NikosMoutzourakis
contributors:
  - NikosMoutzourakis
search.audienceType:
  - flowmaker
  - enduser
ms.custom:
- ai-gen-docs-bap
- ai-gen-description
- ai-seo-date:11/21/2024
---

# How to configure the open terminal session action

This guide shows you how to configure the open terminal session action in Power Automate for desktop. This action lets you interact with terminal emulation providers, specifically Micro Focus Reflection Desktop and HLLAPI. Follow the steps to set up and use terminal sessions efficiently, using these providers to automate your workflows.

## Micro focus reflection

Micro Focus Reflection Desktop is a terminal emulation software by Micro Focus. To use this provider, select the corresponding option in the **Provider** parameter of the **Open Terminal Session** action. This option integrates exclusively with this specific terminal emulation software, supporting versions 2011, 2014, 2016, and 2018.

### Prerequisites

When installing Micro Focus Reflection Desktop, ensure the Application Programmer Interface (API) is also installed.

:::image type="content" source="media/terminal-emulation-open-new-session/api-install.png" alt-text="Screenshot of the Application Programmer Interface (API) to be installed.":::

### Configuration

The configuration allows for two distinct connection methods:

- Existing profile
- Specify connection

### Existing profile

This option starts a terminal session using a saved profile file with predefined settings. It's an efficient way to start a session without specifying connection preferences.

### Specify connection

Add all connection parameters in the action configuration, including the terminal host type (IBM3270 or IBM5250), the host address, and the port.

> [!NOTE]
> Launching a terminal emulation session using the Micro Focus Reflection provider also initiates the terminal emulation software itself.

## HLLAPI

HLLAPI is a terminal emulation communication protocol supported by nearly all terminal emulation software. Power Automate for desktop provides a mechanism to locate the terminal's HLLAPI implementation for use in flow execution. Since HLLAPI is widely implemented, Power Automate for desktop can theoretically integrate with virtually any terminal emulation software available on the market.

### Configuration

The HLLAPI DLL path points to the DLL file location for the terminal emulation software. This DLL contains the HLLAPI implementation from each vendor and is usually in the product's installation directory. Common DLL files are *HLLAPI32.dll* or *ehlapi32.dll*. *Whlapi32.dll* isn't supported.

:::image type="content" source="media/terminal-emulation-open-new-session/configure-action.png" alt-text="Screenshot of the configuration in the action.":::

The session name is a letter that corresponds to the active session and can be configured in the terminal emulation software's options or preferences.

:::image type="content" source="media/terminal-emulation-open-new-session/configure-session-name.png" alt-text="Screenshot of the configuration of the session name.":::

Both the short and long names must match the letter used as the session name in the action configuration.

> [!NOTE]
> Using the HLLAPI provider doesn't automatically start the terminal emulation software. Manually launch the software first, for example, by using a Run Application action.

### Usage example

Launch the terminal with your connection preferences, save the configuration in an .rd3x file, and use that file with a Run Application action to start the application.

:::image type="content" source="media/terminal-emulation-open-new-session/configuration.png" alt-text="Screenshot of the configuration with Run application.":::
