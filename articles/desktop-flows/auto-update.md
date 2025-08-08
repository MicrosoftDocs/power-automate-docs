---
title: Configure automatic updates for Power Automate for desktop
description: Learn how to configure automatic updates for Power Automate for desktop to ensure your machines stay current.
author: a-887178056
ms.service: power-automate
ms.subservice: desktop-flow
ms.date: 08/08/2025
ms.author: guco
ms.topic: article
ms.custom:
  - ai-gen-docs-bap
  - ai-gen-description
  - ai-seo-date:02/19/2025
  - ai-gen-title
---

# Configure automatic updates for Power Automate for desktop

Starting with the March 2025 (2.54) release of Power Automate for desktop, machines upgrade automatically to new versions in the background without requiring user interaction.

> [!IMPORTANT]
> - This article only applies to the MSI version of Power Automate for desktop. The store version's updates are managed by the Windows Store.

There are two automatic update modes: regular and emergency.

## Regular automatic updates

When a new Power Automate for desktop release is available, the `Power Automate update service` downloads and installs it automatically in the background when the machine is idle.

Automatic updates are disabled by default. Enable them using the registry. Learn more in [Configuring automatic updates](#configuring-automatic-updates).

## Emergency automatic updates

Use this update mode to receive critical security patches and major regression fixes to Power Automate for desktop machines.

When a patch is available, machines upgrade to the patched minor version (2.XX.Y to 2.XX.Z) or the latest version with the patch, which might include a minor version update (2.X to 2.Y). Machines upgrade only when Power Automate for desktop isn't in use.

Emergency automatic updates are enabled by default but can be disabled using the registry. Learn more in [configuring automatic updates](#configuring-automatic-updates).

## Configuring automatic updates

By default, regular automatic updates are disabled, but emergency automatic updates are enabled.

To configure automatic updates, use the Windows registry. You need administrator rights to make changes. To modify the default behavior, create the following registry values.

| Key | Name | Type | Value |
|---|---|---|---|
| SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Global | EnableRegularAutoUpdates | DWORD | If set to `1`, regular automatic updates are enabled. |
| SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Global | DisableEmergencyAutoUpdates | DWORD | If set to `1`, emergency automatic updates are disabled. |

## Automatic updates limitations

Automatic updates don't run when:

- The machine isn't registered.
- The Power Automate service is running as a custom account. Learn more in [change the on-premises service account](./troubleshoot.md#change-the-on-premises-service-account).
- A local or cloud-orchestrated desktop flow run is executing on the machine.
- The Power Automate for desktop designer, runtime application, installer, or troubleshooter is running.
- There's custom configuration in the `*.exe.config` files of the Power Automate install folder.
  - If you need custom proxy configuration, set it in the `*.Proxy.config` files instead of the `*.exe.config` files. Learn more in [configure Power Automate for desktop proxy settings](./how-to/proxy-settings.md).
  - If you need custom screen settings, define them in the registry instead of in the config files. Learn more in [set screen resolution for unattended mode](./how-to/set-screen-resolution-unattended-mode.md).
- The machine belongs to a [hosted machine group](./hosted-machine-groups.md).
- Power Automate for desktop was installed by extracting the MSI installer from the .exe bundle installer.
