---
title: Classic designer vs. modern designer for cloud flows - Power Automate
description: Compare the V1 classic and V3 modern flow designers, learn when to use each, and find workarounds for known issues.
author: matow
ms.author: matow
ms.reviewer:
ms.topic: conceptual
ms.date: 03/19/2026
ms.subservice: cloud-flow
---

# Classic designer vs. modern designer for cloud flows

Power Automate has two flow designers. This guide explains the differences, when to use each, and what to expect going forward.

## Which designer am I using?

### V1 (Classic designer)

- Horizontal left-to-right layout with actions arranged in a linear flow
- Blue header bar with the flow name
- Actions appear as compact rectangles connected by arrows
- The "New step" button is at the bottom of the flow
- Condition branches spread horizontally (left = Yes, right = No)

### V3 (Modern designer)

- Vertical top-to-bottom card layout
- Gray/white header with a Copilot panel on the right side
- Actions appear as larger cards with expandable sections
- The **+** button appears between actions to insert new steps
- Condition branches stack vertically
- A Copilot chat panel is visible (or can be toggled) on the right side of the canvas

> [!TIP]
> Not sure which designer you're in? Look at the top-right corner. V3 has a toggle or link that says **Switch to classic designer**. If you see that, you're in V3.

## What V3 does better

**Copilot integration.** V3 includes an AI assistant panel that helps you build and modify flows using natural language. You can describe what you want ("send an approval when a new file is uploaded") and get a starting flow. For tips on getting the best results, see [Get the most from Copilot in Power Automate designer](copilot-in-cloud-flows-tips.md).

**Modern action cards.** Actions display more information at a glance. You can see input values, dynamic content references, and configuration status without selecting each action.

**Inline testing panel.** The test pane is integrated into the designer rather than opening a separate page. You can trigger a test run and see results without navigating away.

**Expression editor with autocomplete.** The expression editor in V3 offers function autocomplete and parameter hints. V1's expression editor is a plain text box.

**Better mobile and narrow-window experience.** The vertical layout adapts to smaller screens. V1's horizontal layout requires horizontal scrolling on narrow windows.

**Future investment.** All new designer features ship to V3 only. V1 receives security and critical bug fixes but no new capabilities.

## What V1 still does that V3 doesn't

> [!NOTE]
> We want to be straightforward about this. V3 has gaps, and pretending otherwise doesn't help anyone.

**Copy-paste actions across browser tabs.** In V1, you can copy an action from one flow (in one browser tab) and paste it into another flow (in another tab). V3 doesn't support cross-tab clipboard operations. You can copy-paste within the same flow in V3, but not across tabs or across flows.

**Deep nesting without visual issues.** V1 handles deeply nested conditions (4+ levels) and for-each loops without collapsing. V3 can struggle visually with deeply nested structures. Branches may overlap or become difficult to navigate past depth 3.

**Large flow editing performance.** Some users with large flows (50+ actions) report that V1 feels faster. V3 can consume more browser memory on complex flows. Performance improvements for V3 are in progress.

**Certain legacy on-premises gateway configurations.** A small number of on-premises data gateway connector configurations that were set up in V1 may display differently or require reconfiguration in V3. If you use on-premises gateways configured years ago, test in V3 before fully switching.

**Familiarity.** If you've been building flows for years in V1, your muscle memory and workflows are optimized for its layout. That's a real cost to switching, and it's okay to acknowledge it.

## Known V3 issues and workarounds

These are issues we hear about most frequently. We're working on fixes.

### Complex flows collapse all branches on open

**Issue:** When you open a flow with multiple conditions, for-each loops, or switch cases, V3 collapses all branches by default. You see a wall of collapsed blocks and have to select each one to find what you're looking for.

**Workaround:** Look for an **Expand all** option in the toolbar or right-click menu. If it's not available, you need to select each branch to expand it. Consider using the search function (Ctrl+F in some versions) to jump to a specific action by name.

### Save sometimes fails silently

**Issue:** You select Save, but the changes don't persist. The next time you open the flow, your edits are gone. In some cases the browser may become unresponsive during save.

**Workaround:** After selecting Save, wait for the explicit save confirmation message (a green banner or notification). If you don't see it, try saving again. If the browser becomes unresponsive, wait rather than closing the tab. Closing may lose your changes.

> [!TIP]
> For critical edits, copy your expression text to a separate text file before saving. If the save fails, you can re-enter it without rewriting from memory. If saves consistently fail on a specific flow, try opening it in V1 (see [How to switch between V1 and V3](#how-to-switch-between-v1-and-v3)) and saving there, then returning to V3.

### Expression editor can be slow on very large flows

**Issue:** Opening the expression editor on flows with many actions (50+) or many dynamic content references can cause a noticeable delay (several seconds) before the editor is responsive.

**Workaround:** Write complex expressions in a text editor first (Notepad, VS Code, and similar), then paste them into the expression editor. This avoids repeated typing in a slow editor.

### Comments feature may interfere with save

**Issue:** In some cases, adding or editing comments on flow actions can cause save errors.

**Workaround:** If you experience save failures after adding comments, try removing the comments and saving again. If the flow saves successfully without comments, the comments feature may be the issue. Re-add comments one at a time to isolate which comment causes the problem.

## How to switch between V1 and V3

### From V3 to V1 (Classic)

1. Open your flow in V3 (the default editor).
1. Look for a link or toggle labeled **Switch to classic designer** in the top-right area of the designer.
1. Select it. The page reloads in V1.

Alternatively, in the flow URL, look for the `v3` parameter and remove it, or append `&useClassicDesigner=true` to the URL.

### From V1 to V3 (Modern)

1. Open your flow in V1.
1. Look for a banner at the top of the designer that says **Try the new designer** or a toggle for the modern designer.
1. Select it. The page reloads in V3.

### Availability notes

- **New flows** created from the portal default to V3 in most environments.
- **Existing flows** may open in V1 or V3 depending on your environment settings and when the flow was last edited.
- **Admin controls:** Tenant administrators can set the default designer version for their environment through Power Platform admin center settings.
- Both designers work on the same underlying flow definition. Switching between V1 and V3 doesn't change your flow logic or break anything. It's purely a UI change.

## When will V1 be retired?

V1 (Classic Designer) is in **maintenance mode**. It receives security updates and critical bug fixes, but no new features are being developed for it.

V3 (Modern Designer) is where all future investment goes. The specific parity gaps listed earlier in this article are being addressed.

> [!IMPORTANT]
> There's no announced retirement date for V1. When a timeline is set, it will be communicated well in advance so you can prepare. Your existing flows built in V1 continue to work regardless of which designer you use to edit them. The flow runtime doesn't depend on the designer version.

If V1 works for you today, you don't need to switch immediately. When the remaining V3 gaps are closed, we'll share migration guidance and a timeline.

## See also

- [Get the most from Copilot in Power Automate designer](copilot-in-cloud-flows-tips.md)
- [Troubleshoot cloud flow errors](troubleshoot-flow-errors.md)
- [Expression cookbook for cloud flows](expression-cookbook.md)
- [Cloud flow designer overview](/power-automate/flows-designer)
