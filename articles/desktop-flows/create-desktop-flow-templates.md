# Create and manage desktop flow templates

Desktop flow templates help makers reuse and standardize automation logic across multiple desktop flows. Templates can include common components such as error handling, logging, reporting, or reusable automation patterns.

After a template is published, users can create new desktop flows from it instead of building similar automations from scratch.

## In this article

- Understand desktop flow templates
- View templates in Power Automate for desktop
- Create and edit a template
- Manage a template
- Create a desktop flow from a template
- Publish a template
- Relationship between templates and flows
- View desktop flow templates in Power Automate
- Share a desktop flow template

## Prerequisites

To use desktop flow templates, you need:

- A work or school account.
- A supported version of Power Automate for desktop (v2.72+).
- The appropriate permissions to create or access desktop flows in the selected environment.

## Understand desktop flow templates

A desktop flow template is a reusable automation that provides a starting point for creating new desktop flows.

Templates can help organizations:
- Reuse common automation logic.
- Standardize implementation patterns.
- Apply consistent error handling, reporting, and logging practices.
- Reduce repetitive authoring work.
- Help makers start from an established automation structure.

A template is authored in the Power Automate for desktop designer by using the same authoring experience as a standard desktop flow. While editing a template, makers can use the same designer capabilities to build, test, run, and debug automation logic.
A published template can't be run, scheduled, or triggered directly. To execute the automation, create a desktop flow from the template and run the resulting flow.

> [!IMPORTANT]
> A flow created from a template is an independent copy of that template. Changes made to the template after the flow is created don't update the flow. Similarly, changes made to the created flow don't update the source template.

## View templates in Power Automate for desktop

To view the desktop flow templates available in the current environment:

1. Open the Power Automate for desktop console.
2. In the left navigation pane, select **Templates**.
3. Select one of the following tabs: 
    - **My templates** displays templates that you own.
    - **Shared with me** displays templates that other users have shared with you.

The Templates page provides information about each template, including:

- Name
- Status (published / draft)
- Tags
- Template description

Use **Search** to locate a template by name. You can also use filters to narrow the displayed results.

## Create and edit a template

Desktop flow templates are created from the designer by using the **Save as** command. You can create a template from a new automation or from an existing desktop flow.

### Create a template

1. In the Power Automate for desktop console, select **New**, and then select **Flow**.
2. Build the automation in the designer by adding and configuring actions, subflows, variables, and other assets.
3. Test and debug the automation to verify that it behaves as expected.
4. On the designer menu bar, select **File** > **Save as**.
5. In the **Save as** dialog, enter a name in **Flow name**.
6. From the **Type** dropdown, select **Template**.
7. Select **Save**.

The template is created and appears under **Templates** > **My templates** in the Power Automate for desktop console.

> [!NOTE]
> If you save a new, previously unsaved automation as a template, only a template is created. No desktop flow is created and no entry appears on the **Flows** page.

### Create a template from an existing desktop flow

You can also create a template from an existing desktop flow.

1. Open the desktop flow in the Power Automate for desktop designer.
2. Select **File** > **Save as**.
3. Enter a name for the template.
4. From the **Type** dropdown, select **Template**.
5. Select **Save**.

Power Automate creates a separate template and leaves the existing desktop flow unchanged.

> [!IMPORTANT]
> Creating a template from an existing desktop flow doesn't create a relationship between the two artifacts. Changes made to the desktop flow don't update the template, and changes made to the template don't update the desktop flow.

### Edit a template

To edit an existing template:

1. In the Power Automate for desktop console, select **Templates**.
2. Locate the template under **My templates**.
3. Open the template's menu and select **Edit**.
4. Modify the template in the designer.
5. Save your changes.
6. Publish the template when the updated version is ready for use.

When a template is open in the designer, it supports the same authoring experience as a standard desktop flow. You can:

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

This behavior allows you to validate the template before other makers use it to create desktop flows.

> [!NOTE]
> Running or debugging a template in the designer is part of the authoring experience. Templates can't be run directly from the Power Automate for desktop console and can't be scheduled or triggered from a cloud flow. To run an automation based on a template, first create a desktop flow from that template.

## Manage a template

Depending on your permissions, the template menu provides the following actions:

- **Edit**
- **Flow from template**
- **Rename**
- **Delete**
- **Create a copy**
- **Manage tags**
- **Properties**

Templates don't provide a command for running the template directly from the console.

## Create a desktop flow from a template

You can create a desktop flow from the **New** menu or from an existing template's menu.

### Create a flow from the New menu

1. Open the Power Automate for desktop console.
2. Select **New**.
3. Select **Flow from template**.
4. In the **Create a flow from template** dialog, enter a value in **Flow name**.

If you leave the field empty, a name is generated automatically.

1. Open the **Select template** dropdown.
2. Search for a template or browse the templates available under:
    - **My templates**
    - **Shared with me**
3. Select the template that you want to use.
4. Select **Select**.
5. Select **Create**.

The new desktop flow opens in the designer with a copy of the logic and assets contained in the selected template. After you save the flow, it appears with your other desktop flows and can be run like any other desktop flow.

> [!NOTE]
> Creating a flow from a template creates an independent copy of the template. Changes made to the template later don't update flows that were previously created from it.

### Create a flow from the Templates page

You can also create a flow from a template displayed on the Templates page.

1. In the Power Automate for desktop console, select **Templates**.
2. Locate the template that you want to use.
3. Open the template's menu.
4. Select **Flow from template**.
5. Enter a flow name or leave the name empty to use an automatically generated name.
6. Select **Create**.

## Template publication requirements

A template must be published before it can be selected as the basis for a new desktop flow.

An unpublished template can appear under **Templates** while it's being authored, but it doesn't appear in the template picker in the **Create a flow from template** dialog.

## Publish a template

Publish a template to make it available for creating new desktop flows.

Only published templates appear in the template picker when users create flows from templates.

Publishing an updated template makes the updated version available for future flows. Existing flows created from the template aren't updated.

## Relationship between templates and flows

When you create a desktop flow from a template, Power Automate copies the template's content into the new flow.

The new flow and its source template are maintained independently:

- Editing the source template doesn't change previously created flows.
- Publishing a new version of the source template doesn't update previously created flows.
- Editing a flow created from a template doesn't change the source template.
- Deleting the source template doesn't modify the copied logic in an existing flow.

To use an updated version of a template, create a new desktop flow from the updated published template.

## View desktop flow templates in Power Automate

You can also view and manage desktop flow templates in the Power Automate portal.

1. Sign in to Power Automate.
2. Select **My flows**.
3. Select **Desktop flow templates**.

The page displays the published desktop flow templates available in the selected environment.

From this page, you can view template details and share templates with coworkers.

## Share a desktop flow template

The experience for sharing a desktop flow template is the same as the experience for sharing a desktop flow.

To share a template:

1. In Power Automate, select **My flows**.
2. Select **Desktop flow templates**.
3. Select the template that you want to share.
4. Select **Share**.
5. Add the users who should have access.
6. Assign the appropriate level of access.
7. Save the sharing changes.

After a template is shared, the recipient can find it in both of the following locations:

- In Power Automate under **My flows** > **Desktop flow templates**.
- In the Power Automate for desktop console under **Templates** > **Shared with me**.

A template shared with co\-owner permissions can be edited by the recipient. A template shared with user permissions is available as read\-only.

## Limitations and considerations

Consider the following behavior when working with desktop flow templates:

- A template must be published before it appears in the template picker.
- A template can't be run directly from the Power Automate for desktop console.
- A template can't be scheduled or triggered from a cloud flow.
- Templates can be run and debugged from the designer during authoring.
- Creating a flow from a template creates an independent copy.
- Existing flows don't receive later changes made to their source templates.
- Updating a flow created from a template doesn't update the source template.
- Template sharing is managed through Power Automate.
- Shared templates appear under **Shared with me** in the Power Automate for desktop console.

