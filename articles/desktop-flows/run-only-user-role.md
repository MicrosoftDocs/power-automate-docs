---
title: Run-only user role
description: Learn about the security role that gives you run-only access in Power Automate for desktop
author: iomavrid
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 02/25/2026
ms.author: iomavrid
ms.reviewer: ellenwehrle
contributors:
search.audienceType: 
  - admin
  - flowmaker
  - enduser
---

# Run-only user role

Power automate enables run-only access in desktop flows through the **Desktop Flows Machine User** security role in Dataverse. Users assigned this role can run desktop flows that are explicitly shared with them, but can't create, edit, delete, or share desktop flows in the environment.
This model is designed to support common enterprise scenarios where automation creators (makers) and automation consumers (operators) must be clearly separated, while maintaining strong governance and least-privilege access.

## Overview

The Desktop Flows Machine User role has been updated so that:

* Users can't create, edit, or delete desktop flows.
* Users can't open desktop flows in the designer.
* Users can't share desktop flows with other users in their environment.
* Users can typically only run desktop flows that have been shared with them (unless they had created desktop flows of their own before being assigned this role, in which case they can also run their previously created flows).
* Users do not gain environment-wide visibility into desktop flows they do not own or that are not shared with them.

This effectively turns the role into a run-only role, which applies to all desktop flows shared with the assigned user in the environment, in contrast to the run-only user option that is available when an individual desktop flow is shared with a target user.

## Why this matters

Previously, organizations often had to choose between:

* Granting broader Dataverse or maker permissions than desired,
* Blocking users entirely from interacting with desktop flows, 
* Sharing individual desktop flows with the proper run-only permissions to target users, or
* Creating a custom role in Dataverse

With this change, organizations can:

* Enforce separation of duties between makers and operators
* Reduce accidental or unauthorized flow modifications
* Enable safe automation consumption at scale
* Simplify role assignment for frontline, operations, or business users

## Limitations and notes

* This capability applies only to desktop flows.
* Dataverse solution version 1.9.37.0 or later is required. To confirm the latest version used, go to the Power Automate portal, then select the Solutions page, go to the History tab, and search for the key term ‘MicrosoftFlowExtensionsCore’. Check the Version column to verify the most recent version update.
* Cloud flow permissions and roles are not affected.
* Users with additional roles (for example, Environment Maker) may regain authoring capabilities.

