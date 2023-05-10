---
title: Custom actions
description: Custom actions in desktop flows	
author: jpapadimitriou
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 04/24/2023
ms.author: dipapa
ms.reviewer: 
contributors:
search.audienceType: 
  - flowmaker
  - enduser
---

# Custom actions in desktop flows (preview)

> [!IMPORTANT]
> Power Automate for desktop v2.32 and newer is required

Custom actions (preview) developed by your organization and uploaded to the respective environments can be included in desktop flows and utilized like actions that belong in the standard library of automation actions. 

Custom actions (preview) exist on an environment level. 
As a best practice you should use the dev-test-prod model when developing custom actions (preview). 

> [!IMPORTANT]
> .dll files describing the custom actions (preview), their .dll dependencies and the .cab file containing everything should be properly signed with a digital certificate trusted by your organization. The certificate should also be installed on each machine on which a desktop flow with custom action (preview) dependencies is executed, present under the Trusted Root Certification Authorities.

## Known limitations
- Custom actions groups (preview) uploaded can't be bigger than 30 mb.
- Specific endpoints must be included in the allowlist for desktop flows containing custom actions (preview) to work properly. 
For more information, see [desktop flow services required for runtime](../ip-address-configuration.md#desktop-flows-services-required-for-runtime) for more details.
- ALM isn't yet fully supported for desktop flows with dependencies on custom actions (preview)
- Upload date might differ in the portal than what is shown in the Assets library (preview), in Power Automate for Desktop
- The Assets library (preview) won't display more than 5000 custom actions groups


[!INCLUDE[footer-include](../includes/footer-banner.md)]