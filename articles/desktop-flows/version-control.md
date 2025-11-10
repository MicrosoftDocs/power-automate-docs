---
title: Version control (Preview)
description: Learn how to enable and use version control in Power Automate for Desktop to manage flow changes with drafts, publishing, and restore options.
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
# Version control in Power Automate for desktop (Preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

Version control in Power Automate for Desktop introduces a structured way to manage changes to your desktop flows throughout their lifecycle. Instead of relying on manual backups or duplicate flows, you can now save drafts, 
publish stable versions, and restore previous versions, all backed by Microsoft Dataverse. This feature helps improve governance, collaboration, and risk mitigation for enterprise automation projects. When version control is 
enabled, every draft and published version of a flow is stored in Dataverse. You can access these versions through the version history panel in the designer, making it easy to track changes and revert when necessary.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren’t meant for production use and might have restricted functionality.
> - The rollout of this feature will be gradual and may take several weeks to complete across all environments. Availability might vary depending on your region and tenant.

## Prerequisites
- CDS Environment 9.2.25102 or newer
- Schema v2 environment and flow
- Optional: ComponentChangesetVersion read and write permissions (Included by default for Environment Maker role)

## PPAC Configuration
For enabling version control, configure the following settings in Power Platform Admin Center (PPAC):
- Enable version control of desktop flows: Grants users in this environment access to view and manage all available versions of desktop flows through the Version History panel.
- Desktop flows version control enabled by default: Ensures version history is enabled by default for all desktop flows in this environment.

## Using version control
The main options for utlizing version control are:
- Save draft (1):
  - Save your latest changes without releasing the snapshot as the official version. This step creates the latest version of the flow.
  - Allows developers to capture incremental changes without making them official.
  - Encourages iterative development and experimentation without disrupting production.
- Publish (2):
  - Set a version as official so it runs from the console or cloud. This step creates the published version of the flow.
  - Ensures only validated, stable flows are deployed, reducing operational risk.
- Version history pane (3):
  - Access via the Version history button on the right side of the designer. It displays all saved and published versions.
  - Provides a centralized view of all saved and published versions, including timestamps and user details.
  - Enhances transparency and simplifies audits.

:::image type="content" source="media/Version control PAD/vc_options.png" alt-text="The options of version control.":::
 
> [!NOTE]
> The Publish option remains disabled until at least one action is added and enabled in the workspace. Once an enabled action is present, the Publish option becomes available.

## Version history panel
In version history panel, you may find all available versions of the specific desktop flow. The entries include:
- Date and timestamp
- User who performed the action
- Flags:
  - Latest version for the most recent draft
  - Published for official versions
  - Previously published for older published versions
 
:::image type="content" source="media/Version control PAD/vc_flags.png" alt-text="The flags of versions in version history panel.":::  

## Context menu options
When you open the context menu of one of the versions in the version history panel, you may find the following options:
- View: Opens the version in read-only mode (no edits allowed).
- Restore: Saves the selected version as draft and flags it as the latest version.
:::image type="content" source="media/Version control PAD/vc_context_options.png" alt-text="The options of the context menu of a version.":::  

> [!NOTE]
> Designer in View mode is read-only; no adding, removing, or editing actions, UI elements, or images is allowed.

## Best practices
- Save drafts frequently during development
  - Capture incremental changes as you build your flow. This ensures you have a clear record of progress and can easily revert if something goes wrong.
- Publish only tested and stable versions
  - Before publishing, validate the flow thoroughly to avoid introducing errors into production environments. Publishing should mark a version as ready for execution.
- Leverage version hstory for rollback
  - Use the restore option and do not recreate flows, which wastes time and increases risk.
- Coordinate with team members
  - When multiple developers work on the same flow, communicate changes and avoid overlapping edits to maintain version integrity.

## Known issues
- Error when saving a desktop flow
  - You might see an error saying:
    - “You are attempting to do a published update of a component in an unmodified context when there is an unpublished active row.”
  - This usually happens when:
    - The flow was created or edited using a newer version of Power Automate for Desktop, but your device is running an older version.
    - The newer version is still rolling out and not yet available on your device.
    - You switched environments, and one of them does not have Version Control enabled.
  - How to fix it?
    - Use the same version that was last used to create or edit the flow, or upgrade to a newer version.
    - If the newer version isn’t available yet, wait until it finishes rolling out.
- When a desktop flow with version control has its latest version saved as a draft, self-healing cannot repair UI elements during each run.

