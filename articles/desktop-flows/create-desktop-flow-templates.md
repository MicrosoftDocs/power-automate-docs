---
title: Create Desktop Flow Templates in Power Automate
description: Desktop flow templates let you reuse and standardize automation logic in Power Automate for desktop. Learn how to author, publish, and share templates today.
author: cochamos
ms.author: cochamos
ms.reviewer: smurkute
ms.date: 09/17/2026
ms.topic: feature-guide
---

# Create and manage desktop flow templates

A desktop flow template helps makers reuse and standardize automation logic across multiple desktop flows. Templates can include common components such as error handling, logging, reporting, or reusable automation patterns.

After a template is published, users can create new desktop flows from it instead of building similar automations from scratch. A flow created from a template is an independent copy of that template.

## Prerequisites

- A work or school account.
- A supported version of Power Automate for desktop (v2.72+).
- The appropriate permissions to create or access desktop flows in the selected environment.

## Benefits of desktop flow templates

Templates can help organizations:

- Reuse common automation logic.
- Standardize implementation patterns.
- Apply consistent error handling, reporting, and logging practices.
- Reduce repetitive authoring work.
- Help makers start from an established automation structure.

## Template authoring experience

You author a template in the Power Automate for desktop designer by using the same authoring experience as a desktop flow. While editing a template, use the same designer capabilities to build, test, run, and debug automation logic.

You can't run, schedule, or trigger a published template directly. To execute the automation, create a desktop flow from the template and run the resulting flow.

> [!IMPORTANT]
> A flow created from a template is an independent copy of that template. Changes made to the template after you create the flow don't update the flow. Likewise, changes made to the flow don't update the source template.

## View templates for desktop

To view desktop flow templates in the current environment:

1. Open the Power Automate for desktop console.
1. In the left navigation pane, select **Templates**.
1. Select one of the following tabs:
 - **My templates** displays templates that you own.
 - **Shared with me** displays templates that other users shared with you.
 
The **Templates** page provides information about each template, including:

- Name
- Status (Published or Draft)
- Tags
- Template description

Use **Search** to locate a template by name. You can also use filters to narrow the results.


## Create and edit a template

Create desktop flow templates from the designer by using the **Save as** command. You can create a template from a new automation or from an existing desktop flow.

### Create a template

To create a desktop flow template, follow these steps:

1. In the Power Automate for desktop console, select **New**, and then select **Flow**.
1. Build the automation in the designer by adding and configuring actions, subflows, variables, and other assets.
1. Test and debug the automation to verify that it behaves as expected.
1. Select **File** > **Save as**.
1. In the **Save as** dialog, enter a name in **Flow name**.
1. From the **Type** dropdown, select **Template**.
1. Select **Save**.

The template is created and appears under **Templates** > **My templates** in the Power Automate for desktop console.

> [!NOTE]
> If you save a new, previously unsaved automation as a template, you create only the template. You don't create a desktop flow, and no entry appears on the **Flows** page.

### Create a template from an existing desktop flow

To create a template from an existing desktop flow:

1. Open the desktop flow in the Power Automate for desktop designer.
1. Select **File** > **Save as**.
1. Enter a name for the template.
1. From the **Type** dropdown, select **Template**.
1. Select **Save**.

Power Automate creates a separate template and leaves the existing desktop flow unchanged.

> [!IMPORTANT]
> Creating a template from an existing desktop flow doesn't create a relationship between the two artifacts. Changes made to the desktop flow don't update the template, and changes made to the template don't update the desktop flow.

### Edit a template

To edit a desktop flow template, follow these steps:

1. In the Power Automate for desktop console, select **Templates**.
1. Locate the template under **My templates**.
1. Open the template's menu and select **Edit**.
1. Modify the template in the designer.
1. Save your changes.
1. Publish the template when the updated version is ready for use.

When you open a template in the designer, it supports the same authoring experience as a standard desktop flow. You can:

- Add, remove, and configure actions.
- Create and manage subflows.
- Work with variables and other flow assets.
- Use all available designer tools.
- Run the template during authoring.
- Debug the template.
- Step through actions.
- Stop a run or debugging session.
- Save changes.
- Publish updates.

This experience lets you validate the template before other makers use it to create desktop flows.

> [!NOTE]
> Running or debugging a template in the designer is part of the authoring experience. You can't run templates directly from the Power Automate for desktop console. You also can't schedule or trigger templates from a cloud flow. To run an automation based on a template, first create a desktop flow from that template.

## Manage a template

Depending on your permissions, the template menu provides the following actions:

- Edit
- Flow from template
- Rename
- Delete
- Create a copy
- Manage tags
- Properties

You can't run templates directly from the console.

## Create a desktop flow from a template

You can create a desktop flow from the **New** menu or from an existing template's menu.

### Create a flow from the new menu

To create a desktop flow from the new menu:

1. Open the Power Automate for desktop console.
1. Select **New**.
1. Select **Flow from template**.
1. In the **Create a flow from template** dialog, enter a value in **Flow name**.

If you leave the field empty, a name is generated automatically.

1. Open the **Select template** dropdown.
1. Search for a template or browse the templates available under:
    - **My templates**
    - **Shared with me**
1. Select the template that you want to use.
1. Select **Select**.
1. Select **Create**.

The new desktop flow opens in the designer with a copy of the logic and assets in the selected template. After you save the flow, it appears with your other desktop flows and can be run like any other desktop flow.

> [!NOTE]
> Creating a flow from a template creates an independent copy of the template. Changes made to the template later don't update flows that were previously created from it.

### Create a flow from the Templates page

To create a flow from a template displayed on the Templates page, follow these steps:

1. In the Power Automate for desktop console, select **Templates**.
1. Locate the template that you want to use.
1. Open the template's menu.
1. Select **Flow from template**.
1. Enter a flow name or leave the name empty to use an automatically generated name.
1. Select **Create**.

## Template publication requirements

You must publish a template before you can use it to create a new desktop flow.

An unpublished template can appear under **Templates** while you're authoring it, but it doesn't appear in the template picker in the **Create a flow from template** dialog.

## Publish a template

Publish a template to make it available for creating new desktop flows.

Only published templates appear in the template picker when users create flows from templates.

Publishing an updated template makes the updated version available for future flows. Existing flows created from the template aren't updated.

## Relationship between templates and flows

When you create a desktop flow from a template, Power Automate copies the template content into the new flow.

The new flow and its source template are maintained independently.

- Editing the source template doesn't change previously created flows.
- Publishing a new version of the source template doesn't update previously created flows.
- Editing a flow created from a template doesn't change the source template.
- Deleting the source template doesn't modify the copied logic in an existing flow.

To use an updated version of a template, create a new desktop flow from the updated published template.

## View desktop flow templates in Power Automate

To view and manage desktop flow templates in the Power Automate portal:

1. Sign in to Power Automate.
1. Select **My flows**.
1. Select **Desktop flow templates**.

The page displays the published desktop flow templates available in the selected environment.

From this page, you can view template details and share templates with coworkers.

## Share a desktop flow template

Sharing a desktop flow template uses the same experience as sharing a desktop flow.

To share a template:

1. In Power Automate, select **My flows**.
1. Select **Desktop flow templates**.
1. Select the template that you want to share.
1. Select **Share**.
1. Add the users who should have access.
1. Assign the appropriate level of access.
1. Save the changes.

After a template is shared, recipients can find it in the following locations:

- In Power Automate under **My flows** > **Desktop flow templates**.
- In the Power Automate for desktop console under **Templates** > **Shared with me**.

A template shared with co-owner permissions can be edited by the recipient. A template shared with user permissions is available as read-only.

## Limitations and considerations

Consider the following behavior when working with desktop flow templates:

- You must publish a template before it appears in the template picker.
- You can't run a template directly from the Power Automate for desktop console.
- You can't schedule or trigger a template from a cloud flow.
- You can run and debug templates from the designer during authoring.
- Creating a flow from a template creates an independent copy.
- Existing flows don't receive later changes made to their source templates.
- Updating a flow created from a template doesn't update the source template.
- You manage template sharing through Power Automate.
- Shared templates appear under **Shared with me** in the Power Automate for desktop console.