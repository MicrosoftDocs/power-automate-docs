---
title: Configure SAP GUI scripting for Power Automate for desktop
description: How to enable and verify SAP GUI scripting so Power Automate for desktop can automate SAP dialogs. Includes steps for RZ11, RZ10, and using the PAD troubleshooter.
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 2025-11-19
ms.author: iomimtso
ms.reviewer: ststravri, nimoutzo
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---
# Configure SAP GUI scripting for Power Automate for desktop

This article explains how to enable and verify SAP GUI scripting so Power Automate for desktop can automate SAP dialogs. Follow these steps to enable scripting, confirm user permissions, and use the Power Automate for desktop (PAD) troubleshooter.

## Symptoms

You can't use SAP automation actions or you receive errors when running SAP actions that require scripting.

## Before you begin

- You need SAP administrator access to change system parameters.
- Coordinate with your SAP team to confirm user authorizations.

## Steps to enable SAP GUI scripting

1. Open the SAP GUI.
2. Start transaction **RZ11**.
3. In **Parameter Name**, enter `sapgui/user_scripting`.
4. Select **Display**.
5. Check **Current Value** under **Value of Profile Parameter sapgui/user_scripting**:
   - If the value is `TRUE`, scripting is enabled.
   - If the value is `FALSE`, select **Change Value**, enter `TRUE` in **New Value**, then select **Save**.

## Make the change permanent on the server (recommended)

If you see the warning "Change not permanent, will be lost at server restart," make the change permanent on the server:

1. Start transaction **RZ10**.
2. Restart the SAP server for the change to take effect.

## Verify user authorization

Confirm with your SAP team that the `S_SCR` authorization is assigned to each user who will run automated scripts. Without this authorization, scripting actions can fail.

## Use the PAD troubleshooter to fix client issues

1. Close all SAP GUI windows.
2. Open Power Automate for desktop.
3. Open the troubleshooter and select **Run** under **Troubleshoot UI/Web automation issues**.
4. If there are issues listed under **SAP Automation**, expand the entry and select **Fix**.

:::image type="content" source="media/sap-gui-scripting-configuration/pad-troubleshooter-ui-web-automation-issues.png" alt-text="Power Automate for desktop troubleshooter showing Troubleshoot UI/Web automation issues":::

:::image type="content" source="media/sap-gui-scripting-configuration/pad-troubleshooter-sap-automation.png" alt-text="Power Automate for desktop troubleshooter showing SAP Automation issues and Fix option":::

## More information

- [Introduction to SAP GUI–based RPA in Power Automate Desktop](/power-automate/guidance/rpa-sap-playbook/introduction)
- [Power Automate for desktop actions reference](/power-automate/desktop-flows/actions-reference)
