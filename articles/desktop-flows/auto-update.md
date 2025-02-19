---
title: Automatic updates for Power Automate for desktop
description: How to enable Power Automate for desktop to update itself automatically
author: a-887178056
ms.subservice: desktop-flow
ms.date: 02/14/2025
ms.author: guco
ms.topic: conceptual
---

# Automatic update capability

Starting with the April 2025 (2.54) release of Power Automate for desktop, machines are able to upgrade to greater versions in the background without requiring user interaction.

> [!IMPORTANT]
> - This article only applies to the MSI version of Power Automate for desktop. The store version's updates are managed by the Windows store.

There are two automatic update modes: regular and emergency.

> [!NOTE]
> Automatic updates will be gradually enabled on a per-tenant basis, you can expect some delay between enabling auto-updates and your tenant's machines starting to update.
> If you want your tenant to be enabled early, please contact support.

### Regular automatic updates

When a new Power Automate for desktop release is available, the `Power Automate update service` will download the latest version and run the update in the background when the machine is not in use.

This behavior is disabled by default and can be enabled via the registry, see [Configuring Automatic updates](#configuring-automatic-updates).

### Emergency automatic updates

This update mode can be used to distribute critical security patches and major regression fixes to Power Automate for desktop machines.

When such an patch is available, machines will upgrade to their patched minor version (2.XX.Y => 2.XX.Z) when available, or to the latest version including the patch. This will only happen when machines are not in use.

This behavior is enabled by default and can be disabled via the registry, see [Configuring Automatic updates](#configuring-automatic-updates).

## Configuring automatic updates

By default, regular automatic updates are disabled and emergency auto-updates are enabled.

To change from the default behavior, create the following registry values. This will require admin privileges.

| Key | Name | Type | Value |
|---|---|---|---|
| SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Global | EnableRegularAutoUpdates | DWORD | If set to '1', will enable regular automatic updates. |
| SOFTWARE\WOW6432Node\Microsoft\Power Automate Desktop\Global | DisableEmergencyAutoUpdates | DWORD | If set to '1', will disable emergency automatic updates. |

## Automatic updates limitations

Automatic updates will not run when:
- The Power Automate service has been configured to run with a custom account, see [change the on-premises service account](./troubleshoot.md#change-the-on-premises-service-account).
- A local or cloud-orchestrated desktop flow run is currently executing on the machine.
- The Power Automate for desktop designer, runtime application, installer or troubleshooter is currently running.
- There is custom configuration in the *.exe.config files of the Power Automate install folder:
  - If you require custom proxy configuration, they should be set in the *.Proxy.config files instead of the *.exe.config files. See [configure Power Automate for desktop proxy settings](./how-to/proxy-settings.md).
  - If you require custom screen settings, it should be defined in the registry instead of the config files. See [set screen resolution for unatttended mode](./how-to/set-screen-resolution-unattended-mode.md).
- The machine is a member of a [hosted machine group](./hosted-machine-groups.md).
- Power Automate for desktop was installed by extracting the MSI installer from the .exe bundle installer.