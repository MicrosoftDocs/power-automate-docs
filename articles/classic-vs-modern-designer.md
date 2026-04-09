---
title: "Classic designer vs. modern designer for cloud flows - Power Automate"
description: Compare the classic and new flow designers, learn when to use each, and find workarounds for known issues.
author: radioblazer
ms.author: matow
ms.reviewer: angieandrews
ms.topic: conceptual
ms.date: 04/09/2026
ms.subservice: cloud-flow
---

# Classic designer vs. new designer for cloud flows

Power Automate has two flow designers. This article explains the differences, when to use each, and what to expect going forward.

## Which designer am I using?

### Classic designer

- Horizontal left-to-right layout with actions arranged in a linear flow.
- Blue header bar with the flow name.
- Actions appear as compact rectangles connected by arrows.
- The **New step** button is at the bottom of the flow.
- Condition branches spread horizontally (left = Yes, right = No).

### New designer

- Vertical top-to-bottom card layout.
- Gray/white header with a Copilot panel on the right side.
- Actions appear as larger cards with expandable sections.
- The **+** button appears between actions to insert new steps.
- Condition branches stack vertically.
- A Copilot chat panel is visible (or can be toggled) on the right side of the canvas.

> [!TIP]
> Not sure which designer you're in? Look at the top-right corner. If there's a toggle enabled that says **New designer**, you're in the new designer.

## What the new designer does better

**Copilot integration**: The new designer includes an AI assistant panel that helps you build and modify flows using natural language. You can describe what you want ("send an approval when a new file is uploaded") and get a starting flow. Find tips on getting the best results in [Get the most from Copilot in Power Automate designer](copilot-cloud-flows-tips.md).

**Modern action cards**: Actions display more information at a glance. You can get input values, dynamic content references, and configuration status without selecting each action.

**Inline testing panel**: The test pane is integrated into the designer rather than opening a separate page. You can trigger a test run and view results without navigating away.

**Expression editor with autocomplete**: The expression editor in the new designer offers function autocomplete and parameter hints. The classic designer's expression editor is a plain text box.

**Better mobile and narrow-window experience**: The vertical layout adapts to smaller screens. The classic designer's layout can require more horizontal scrolling on narrow windows.

**Future investment**: All new designer features ship to the new designer only. The classic designer receives security and critical bug fixes but no new capabilities.

## What the classic designer still does that the new designer doesn't

> [!NOTE]
> Some capabilities available in the classic designer aren't yet supported in the new designer. The following list documents these gaps so you can plan accordingly.

**Copy-paste actions across browser tabs**: In the classic designer, you can copy an action from one flow (in one browser tab) and paste it into another flow (in another tab). The new designer doesn't support cross-tab clipboard operations. You can copy-paste within the same flow in the new designer, but not across tabs or across flows.

**Deep nesting of conditions**: The classic designer handles deeply nested conditions (4+ levels) and for-each loops without collapsing. The new designer can struggle visually with deeply nested structures. Branches might overlap or become difficult to navigate past depth 3.

**Large flow editing performance**: Some users with large flows (50+ actions) report that the classic designer feels faster. The new designer can consume more browser memory on complex flows. Performance improvements for the new designer are in progress.

**Certain legacy on-premises gateway configurations**: A small number of on-premises data gateway connector configurations that were set up in the classic designer might display differently or require reconfiguration in the new designer. If you use on-premises gateways configured years ago, test in the new designer before fully switching.

**Familiarity**: If you've been building flows for years in the classic designer, your memory and workflows are optimized for its layout. We recognize that switching costs are real, and we're investing in making the transition smoother.

## Known new designer issues and workarounds

These are issues we hear about most frequently. We continue to work on fixes.

### Complex flows collapse all branches on open

**Issue**: When you open a flow with multiple conditions, for-each loops, or switch cases, the new designer collapses all branches by default. A wall of collapsed blocks displays and you need to select each one to find what you're looking for.

**Workaround**: Look for an **Expand all** option in the toolbar or right-click menu. If it isn't available, you need to select each branch to expand it. Consider using the search function (**Ctrl** + **f** in some versions) to jump to a specific action by name.

### Save sometimes fails silently

**Issue**: You select **Save**, but the changes don't persist. The next time you open the flow, your edits are gone. In some cases the browser might become unresponsive during save.

**Workaround**: After selecting **Save**, wait for the explicit save confirmation message (a green banner or notification). If the message doesn't appear, try saving again. If the browser becomes unresponsive, wait rather than closing the tab. Closing might lose your changes.

> [!TIP]
> For critical edits, copy your expression text to a separate text file before saving. If the save fails, you can re-enter it without rewriting from memory. If the saves consistently fail on a specific flow, try opening it in the classic designer and saving there, then returning to the new designer. Learn more in [How to switch between the classic and new designer](#switch-between-the-classic-and-new-designer).

### Expression editor can be slow on large flows

**Issue**: Opening the expression editor on flows with many actions (50+) or many dynamic content references can cause a noticeable delay (several seconds) before the editor is responsive.

**Workaround**: Write complex expressions in a text editor first (Notepad, Visual Studio Code, or similar), then paste them into the expression editor. This avoids repeated typing in a slow editor.

### Comments feature might interfere with save

**Issue**: In some cases, adding or editing comments on flow actions can cause save errors.

**Workaround**: If you experience save failures after adding comments, try removing the comments and saving again. If the flow saves successfully without comments, the comments feature might be the issue. Re-add comments one at a time to isolate which comment causes the problem.

## Switch between the classic and new designer

### From new to classic

1. Open your flow in the new designer (the default editor when opening from make.powerautomate.com).
1. Look for a toggle labeled **New designer** in the top-right area of the designer.
1. Toggle it off. The flow reloads in the classic designer.

### From clasic to new

1. Open your flow in the classic designer.
1. Look for a toggle labeled **New designer** in the top-right area of the designer. If a toggle isn't visible, open the flow from [Power Automate](https://make.powerautomate.com/) -> **My flows**.
1. Toggle it. The page reloads in the new designer.

### Availability notes

- **New flows** created from [Power Automate](https://make.powerautomate.com/) default to the new designer.
- **Existing flows** might open in the classic designer or new designer depending on your environment settings and when the flow was last edited.
- Both designers work on the same underlying flow definition. Switching between classic and new doesn't change your flow logic or break anything. It's purely a UI change.

## When will the classic designer be retired?

The classic designer is in **maintenance mode**. It receives security updates and critical bug fixes, but no new features are being developed for it.

The new designer is where all future investment goes. The specific parity gaps listed earlier in this article are being addressed.

> [!IMPORTANT]
> When a timeline is set for the deprecation of the classic designer, it will be communicated in advance so you can prepare. Your existing flows built in the classic designer continue to work regardless of which designer you use to edit them. The Power Automate runtime doesn't depend on the designer version.

If the classic designer works for you today, you don't need to switch immediately.

## Related information

- [Get the most from Copilot in Power Automate designer](copilot-cloud-flows-tips.md)
- [Troubleshoot cloud flow errors](troubleshoot-flow-errors.md)
- [Expression cookbook for cloud flows](expression-cookbook.md)
- [Cloud flow designer overview](/power-automate/flows-designer)
