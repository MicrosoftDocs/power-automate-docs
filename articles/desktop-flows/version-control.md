---
title: Version control in Power Automate for desktop (preview)
description: Learn how to enable and use version control in Power Automate for desktop to manage flow changes with drafts, publishing, and restore options.
author: nikosmoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 11/10/2025
ms.author: nimoutzo
ms.reviewer: dmartens
contributors:
- NikosMoutzourakis
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Version control in Power Automate for desktop (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Version control in Power Automate for desktop introduces a structured way to manage changes to your desktop flows throughout their lifecycle. Instead of relying on manual backups or duplicate flows, you can now save drafts, publish stable versions, and restore previous versions, all backed by Microsoft Dataverse. This feature helps improve governance, collaboration, and risk mitigation for enterprise automation projects. When version control is enabled, every draft and published version of a flow is stored in Dataverse. You can access these versions through the version history pane in the designer, making it easy to track changes and revert when necessary.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and might have restricted functionality.
> - The rollout of this feature will be gradual and may take several weeks to complete across all environments. Availability might vary depending on your region and tenant.

## Prerequisites

- The environment and flow use the [v2 schema](schema.md)
- Optional: ComponentChangesetVersion read and write permissions (included by default for [Environment Maker role](/power-platform/admin/database-security))

## Configuration

To configure version control:

1. Open the [Power Platform admin center](https://admin.powerplatform.microsoft.com/). 
1. Select **Manage**.
1. Select **Environments** and select the environment.
1. Select **Settings**, expand **Product**, and select **Features**. 
1. Locate the **Desktop flow version control** section and configure the following options :

    - **Enable version control of desktop flows**: Grants users in this environment access to view and manage all available versions of desktop flows through the version history pane.
    - **Desktop flows version control enabled by default**: Ensures version history is enabled by default for all desktop flows in this environment.

## Use version control

The following key features are available with version control:

1. **Save draft**
    - Save your latest changes without releasing them as the official version. This step creates the latest version of the flow.
    - Allows makers to save incremental changes without making them official.
    - Encourages iterative development and experimentation without disrupting production.
1. **Publish**
    - Set a version as official so it runs from the console or cloud. This step creates the published version of the flow.
    - Ensures only validated, stable flows are deployed, reducing operational risk.
1. **Version history pane**
    - Select the version history button to view all saved and published versions.
    - See timestamps and user details for each version.
    - Helps with transparency and auditing.

:::image type="content" source="media/version-control/version-control-options.png" alt-text="The options of version control.":::
 
> [!NOTE]
> The **Publish** option is disabled until you add and enable at least one action in the workspace. When you add an enabled action, the **Publish** option becomes available.

## Version history pane

In the version history pane, you can find all available versions of a specific desktop flow. The entries include:
- Date and timestamp
- User who performed the action
- Flags:
  - Latest version for the most recent draft
  - Published for official versions
  - Previously published for older published versions
 
:::image type="content" source="media/version-control/version-control-flags.png" alt-text="The flags of versions in version history pane.":::  

## Context menu options

When you open the context menu for one of the versions in the version history pane, you see the following options:
- **View**
    - Opens the version in read-only mode (no edits allowed).
- **Restore**
    - Saves the selected version as draft and flags it as the latest version.

:::image type="content" source="media/version-control/context-options.png" alt-text="The options of the context menu of a version.":::  

> [!NOTE]
> Designer in view mode is read-only. You can't add, remove, or edit actions, UI elements, or images.

## Best practices

- **Save drafts frequently during development**: Capture incremental changes as you build your flow. This practice ensures you have a clear record of progress and can easily revert if something goes wrong.
- **Publish only tested and stable versions**: Before publishing, validate the flow thoroughly to avoid introducing errors into production environments. Publishing marks a version as ready for execution.
- **Leverage version history for rollback**: Use the restore option and don't recreate flows, which wastes time and increases risk.
- **Coordinate with team members**: When multiple developers work on the same flow, communicate changes and avoid overlapping edits to maintain version integrity.

## Known issues

- Error when saving a desktop flow
  - You might see an error saying:
    - “You are attempting to do a published update of a component in an unmodified context when there is an unpublished active row.”
  - This error usually happens when:
    - You create or edit the flow by using a newer version of Power Automate for Desktop, but your device runs an older version.
    - The newer version is still rolling out and isn't yet available on your device.
        - You switch environments, and one of them doesn't have version control enabled.
  - How to fix it?
    - Use the same version that you last used to create or edit the flow, or upgrade to a newer version.
    - If the newer version isn't available yet, wait until it finishes rolling out.
- When a desktop flow with version control has its latest version saved as a draft, self-healing can't repair UI elements during each run.

