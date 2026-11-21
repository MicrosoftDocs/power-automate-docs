---
title: Use flowchart mode in Power Automate for desktop (preview)
description: Learn how to create, edit, navigate, and debug desktop flows by using flowchart mode in Power Automate for desktop.
author: cochamos
ms.author: cochamos
ms.reviewer: smurkute
ms.topic: how-to
ms.date: 10/05/2026
ms.service: power-automate
ms.subservice: desktop-flow
---

# Use flowchart mode in Power Automate for desktop (preview)

[!INCLUDE [cc-beta-prerelease-disclaimer](../includes/cc-beta-prerelease-disclaimer.md)]

**Flowchart mode** provides a visual authoring experience in which desktop flow actions are represented as nodes and the connections between nodes are represented as edges. This view can make execution paths easier to understand, especially in flows that contain branches, loops, or other complex logic.

> [!IMPORTANT]
> - This is a preview feature.
> - Preview features aren't meant for production use and might have restricted functionality. These features are available before an official release so that customers can get early access and provide feedback.
> - Learn more in [preview terms](https://go.microsoft.com/fwlink/?linkid=2189520).
> - This feature is being gradually rolled out across regions and might not be available yet in your region.

Power Automate for desktop provides the following designer modes:

- **Sequence mode** displays actions as a numbered list. Sequence mode is the default.
- **Flowchart mode** displays actions as connected nodes on a canvas.

Both modes represent the same desktop flow. Changes that you make in one mode are available when you open the flow in the other mode.


## Create a flow in flowchart mode

To create a desktop flow directly in flowchart mode:

1. Open Power Automate for desktop.
1. In the console, select **New flow**.
1. In the **Create a flow** dialog, enter a name for the desktop flow. If you leave the field empty, a name is generated automatically.
1. Select **Flowchart mode (Preview)**.
1. Configure the remaining flow options as needed.
1. Select **Create**.

The desktop flow opens in the designer using flowchart mode.

> [!NOTE]
> Sequence mode is selected by default. Flowchart mode is identified as a preview feature in the **Create a flow** dialog.

## Switch an existing flow between modes

You can change the visualization of a desktop flow without creating a separate flow.

To switch an existing flow between sequence mode and flowchart mode:

1. Open the desktop flow in the designer.
1. Select **View**.
1. Select one of the following options:
   - To open the flow in flowchart mode, select **Flowchart mode**.
   - To open the flow in sequence mode, select **Sequence mode**.

The **View** menu displays the mode that is available for switching. For example, when a flow is displayed in flowchart mode, the menu displays **Sequence mode**.

> [!IMPORTANT]
> You can switch to flowchart mode only when the flow has no errors. If the flow contains errors, resolve them before you switch modes.

## Open flowchart mode

When flowchart mode opens, the current subflow appears on a canvas. Each action is represented as a node, and edges connect the nodes to show their execution paths.

An empty subflow contains a **Start** node, a stub edge, and an insert button for adding the first action.

The **Actions** pane is collapsed by default to provide more space for the canvas.

## Open the Actions pane

To open the **Actions** pane, select the **Actions** icon at the top of the left navigation bar.

The **Actions** pane opens automatically when you select an insert button on the canvas.  

You can find an action by:

- Entering the action name in the search field.
- Expanding an action category.
- Selecting an action from your favorites.

## Add actions to a flowchart

Add an action by dragging it from the **Actions** pane or by using an insert button on an edge.

### Add an action after a node

To add an action after an existing node:

1. Locate the outgoing edge of the node.
1. Hover over the edge to display the **+** insert button.
1. Select the **+** button.
1. In the **Actions** pane, find the action that you want to add.
1. Drag the action to the insertion point, or double-click the action.

The action is inserted at the selected position, and its properties dialog opens.

> [!NOTE]
> The action is added to the flow before its properties dialog opens. Closing or canceling the dialog doesn't remove the action from the flow.

### Add an action between nodes

To add an action between two connected nodes:

1. Hover over the edge that connects the nodes.
1. Select the **+** button that appears on the edge.
1. Drag an action from the **Actions** pane to the insertion point, or double-click the action.

The new action is inserted between the connected nodes.

For conditional branches and loops, use the insert button on the edge that represents the execution path where you want to add the action.

### Add an action to an empty subflow

An empty subflow displays a Start node, a stub edge, and an insert button.

To add the first action:

1. Select the **+** button on the stub edge.
1. Find the action in the Actions pane.
1. Drag the action to the insertion point, or double-click the action.

## Work with branching and loop actions

Conditional and loop actions use specialized node layouts that display their execution paths directly on the canvas.

### Configure an If action

In flowchart mode, the **If** action uses a consolidated properties dialog that contains the complete conditional structure.

To configure an If action:

1. In **First operand**, enter the value or expression to evaluate.
1. Select an operator.
1. In **Second operand**, enter the value or expression to compare.
1. To add another condition, select **+ Else if**, and configure its operands and operator.
1. Add more **Else if** conditions as needed.
1. Use the **Else** branch as the path that runs when none of the configured conditions evaluates to true.
1. Select **Save**.

On the canvas, the **If** action appears as a branching node. The node contains:

- One row for the initial **If** condition.
- One row for each **Else if** condition.
- An **Else** row.

Each branch has a separate outgoing edge. The branches reconnect before the flow continues.

To add an action to a branch, select the **+** button on the corresponding edge. Actions inserted on an edge run only for the associated **If**, **Else if**, or **Else** branch.

> [!NOTE]
> The consolidated properties dialog applies to the **If** action in the **Conditionals** category. Action-based conditions, such as **If process** and **If file exists**, continue to use their standard properties dialogs.

### Configure a Switch action

In flowchart mode, the **Switch** action uses a consolidated properties dialog for the Switch expression and its cases.

To configure a Switch action:

1. In **Value to check**, enter the value or expression to evaluate.
1. For each case, select an operator.
1. In **Value to compare**, enter the value for the case.
1. To add another case, select **+ Case**.
1. Add more cases as needed.
1. Use the default branch for values that don't match a configured case.
1. Select **Save**.

On the canvas, the Switch action appears as a branching node. The node displays one branch for each case and a default branch. Each branch has a separate outgoing edge.

To add an action to a case, select the **+** button on the corresponding case edge. Actions inserted on the edge run only when that case is selected.

### Reorder conditions and cases

In the consolidated If and Switch properties dialogs, each **Else if** or **Case** group provides a **More options** button.

Use the available commands to:

- Move the group up.
- Move the group down.
- Remove the group.

The option to move a group up isn't available for the first group.

### Add actions to a loop

The loop-specific node layout applies to the following actions:

- **For each**
- **Loop**
- **Loop condition**

A loop node has a loop-back edge that represents the loop body and an outgoing edge that continues execution after the loop finishes.

To add an action to the loop body:

1. Locate the **+** button on the loop-back edge.
1. Select the **+** button to open the **Actions** pane.
1. Drag an action to the insertion point, or double-click the action.

Actions inserted on the loop-back edge run during each loop iteration.

## Select and manage nodes

Select a node to display a blue outline and the commands available for that action.

Depending on the action and its state, the node toolbar can contain the following controls:

| Control | Purpose | Behavior |
|---|---|---|
| Breakpoint | Pause execution during debugging | Select the breakpoint control to add or remove a breakpoint. |
| Edit | Open the action properties | Select the pencil icon to open the properties dialog. You can also double-click the node or select it and press Enter. |
| More options | Manage the action | Open the node context menu. Available commands depend on the action and the current context. |
| Error details | Review an error | Appears when the action has a runtime or configuration error. |
| Analysis violation | Review a flow analysis issue | Appears when the action violates a flow analysis rule. |
| Error handling | Configure error handling | Appears when the action supports error-handling configuration. |

Comment nodes display only the controls that apply to comments.

### Open the node context menu

To open the context menu for a node, use one of the following methods:

- Right-click the node.
- Select the **More options** button on the node toolbar.
- Select the node and press **Shift+F10**.
- Select the node and press the **Applications** key.

Depending on the action, the context menu can provide commands such as:

- **Edit**
- **Run from here**
- **Undo**
- **Redo**
- **Cut**
- **Copy**
- **Paste**
- **Disable action**
- **Disable logging**
- **Move**
- **Reorder**
- **Delete**

For **Run subflow** and **Run flow** nodes, the context menu also provides a command for opening the referenced subflow or flow.

### Move nodes on the canvas

To change the visual position of a node:

1. Select and hold the node.
1. Drag the node to its new position on the canvas.
1. Release the node.

Connected edges adjust to the node's new position.

Moving a node changes only its visual position. It doesn't change the flow's execution order.

### Reorder nodes

Reordering a node changes its position in the flow's execution order.

To reorder a node:

1. Open the node context menu.
1. Select **Reorder**.
1. Select the appropriate reorder command.

> [!IMPORTANT]
> **Move** and **Reorder** have different effects. Moving changes only the node's position on the canvas. Reordering changes the flow's execution order.

### Select multiple nodes

To select multiple nodes, hold down **Ctrl** while you navigate to or select more nodes.  

Operations that support multiple selected nodes, such as cut, copy, move, and delete, apply to the entire selection.  

### View node information

Hover over a node to see information about the action it represents.  

Node index badges match the action indexes you see in sequence mode. To keep the indexes visible:  

1. Select **View**.
1. Select **Show index on nodes**.

To hide the persistent indexes, select **View** > **Hide index on nodes**.

## Navigate the canvas

You can pan, zoom, and use the minimap to navigate large flowcharts.

### Pan and zoom

Use the following interactions to navigate the canvas:

- Drag an empty area of the canvas to pan across the flowchart.
- Hold **Ctrl** and rotate the mouse wheel to zoom in or out.
- Use the canvas navigation toolbar to change the zoom level or reset the layout.

The current zoom level appears as a percentage in the canvas navigation toolbar.

### Use the minimap

The minimap displays a compact overview of the flowchart and identifies the visible area of the canvas.

The minimap appears above the canvas navigation toolbar while you interact with the canvas. Pan or zoom the canvas to display it.

The minimap isn't displayed when the current subflow contains no actions.

### Use the canvas navigation toolbar

The canvas navigation toolbar appears in the lower-left corner of the canvas.

| Control | Description |
|---|---|
| Reset layout | Automatically rearrange the nodes on the canvas. |
| Zoom in | Increase the canvas zoom level. |
| Zoom level | Display the current zoom level as a percentage. |
| Zoom out | Decrease the canvas zoom level. |
| Reset zoom | Return the canvas to its default zoom level. |

## Use keyboard shortcuts

The following keyboard shortcuts apply to canvas navigation and node operations in flowchart mode.

### Navigate and manage nodes

| Keyboard shortcut | Action |
|---|---|
| Tab | Move between nodes and edge insertion buttons. |
| Shift+Tab | Move backward between nodes and edge insertion buttons. |
| Arrow keys | Move between nodes based on their spatial position on the canvas. |
| Ctrl while navigating | Extend the current selection to include more nodes. |
| Enter | Open the properties dialog for the focused node. |
| Shift+F10 or Applications key | Open the context menu for the focused node. |
| Delete | Delete the selected node or nodes. |
| Ctrl+X | Cut the selected node or nodes. |
| Ctrl+C | Copy the selected node or nodes. |
| Ctrl+V | Paste previously cut or copied nodes. |
| Ctrl+Z | Undo the previous change. |
| Ctrl+Y | Redo the previously undone change. |
| Ctrl+B | Open the referenced subflow or flow from a **Run subflow** or **Run flow** node. |
| Alt+F5 | Run the flow starting from the selected node. |

> [!NOTE]
> Ctrl extends the current node selection. Shift doesn't extend the selection when you navigate with Tab because Shift+Tab moves focus backward.

### Move nodes on the canvas

The following shortcuts change only the visual position of the selected node:

| Keyboard shortcut | Action |
|---|---|
| Ctrl+Shift+Up Arrow | Move the selected node upward on the canvas. |
| Ctrl+Shift+Down Arrow | Move the selected node downward on the canvas. |
| Ctrl+Shift+Left Arrow | Move the selected node left on the canvas. |
| Ctrl+Shift+Right Arrow | Move the selected node right on the canvas. |

### Change the execution order

The following shortcuts change the execution order of the selected node:

| Keyboard shortcut | Action |
|---|---|
| Shift+Alt+Up Arrow | Move the selected node earlier in the execution order. |
| Shift+Alt+Down Arrow | Move the selected node later in the execution order. |
| Shift+Alt+Left Arrow | Reorder the selected node backward in the execution path. |
| Shift+Alt+Right Arrow | Reorder the selected node forward in the execution path. |

> [!IMPORTANT]
> The Ctrl+Shift+Arrow shortcuts change only the node's position on the canvas. The Shift+Alt+Arrow shortcuts change the flow's execution order.

## Debug a flow in flowchart mode

Use the standard desktop flow debugging tools while viewing the flow as a flowchart.

During a debugging run:

- The currently executing node displays a running indicator.
- A completed node displays a success indicator.
- A failed node displays an error indicator.
- Breakpoints appear on the corresponding nodes.
- Nodes that didn't run retain their default appearance.

Use the breakpoint control on the node toolbar to add or remove a breakpoint.

Open a node's context menu and select **Run from here** to run the flow starting from that action.

## Review and locate errors

If an error occurs during a run, the Errors pane opens at the bottom of the designer.

The pane displays the following information:

- Error type.
- Error description.
- Subflow name.
- Index of the node where the error occurred.

To go to the node associated with an error:

1. In the Errors pane, right-click the error.
1. Select **Go to node**.

The designer goes to the corresponding node on the canvas.

## Use other designer capabilities

Flowchart mode changes how you visualize and edit the current subflow. You still have access to other designer capabilities.

You can continue to:

- Create and manage subflows.
- Work with variables in the **Variables** pane.
- Manage UI elements in the **UI elements** pane.
- Manage images.
- Search inside the flow.
- Use flow analysis.
- Configure breakpoints.
- Run and debug the flow.
- Review version history.
- Use other supported desktop flow designer tools.

## Terminology

| Term | Definition |
|---|---|
| Node | A visual representation of an action or flow control element on the canvas. |
| Edge | A line that connects nodes and represents an execution path. |
| Stub edge | An edge that doesn't yet connect to another action and provides an insertion point. |
| Loop-back edge | The edge that contains the loop body and returns execution to the loop node for the next iteration. |
| Branch | An execution path created by a conditional or Switch action. |
| Convergence point | The point where multiple branches reconnect before the flow continues. |
| Canvas | The workspace where nodes and edges are displayed and arranged. |
| Minimap | A compact overview of the flowchart used to navigate the canvas. |
| Canvas navigation toolbar | The toolbar in the lower-left corner of the canvas that contains layout and zoom controls. |
