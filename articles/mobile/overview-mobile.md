---
title: Power Automate mobile app overview
description: Get an overview of the Microsoft Power Automate mobile app, including installation, changing environments, and limitations of the app.
services: ''
suite: flow
documentationcenter: na
author: jamiemwork
contributors:
  - jamiemwork
  - kartikraop
  - v-aangie
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: overview
ms.date: 07/24/2026
ms.author: matow
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Power Automate mobile app (deprecated)

[!INCLUDE [mobile-deprecation](../includes/mobile-deprecation.md)]

## Alternatives

Existing cloud flows aren't affected. Automated, scheduled, and instant flows continue to run normally.

| What you use the app for | Where to go instead |
|---|---|
| Approvals (view, respond, track) | [Approvals app in Microsoft Teams](/power-automate/teams/native-approvals-in-teams) |
| View and manage your flows | [Power Automate portal](https://make.powerautomate.com) (works in mobile browsers) |
| Run instant/button flows | Power Automate portal, or run from a Power App in [Power Apps mobile](/power-apps/mobile/run-powerapps-on-mobile) |
| Receive push notifications | Update the flow to notify via Teams or email |
| Turn flows on/off, edit, or delete | [Power Automate portal](https://make.powerautomate.com) |

## Known limitations of alternatives

- **Home-screen widget**: The iOS and Android widget to run a flow from the home screen has no direct equivalent. Users can pin a Power App to their home screen as a partial workaround.
- **Push notifications on flow failure**: These require the maker to add an explicit Teams or email notification action in the flow (using a "Run after" configuration on the preceding action set to "has failed").
- **Flow editing on mobile**: The Power Automate designer isn't optimized for small screens. Complex editing is best done on a desktop or tablet.

[!INCLUDE[footer-include](../includes/footer-banner.md)]