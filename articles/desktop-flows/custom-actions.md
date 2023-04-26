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

Custom actions (preview) exist on an environment level. As a best practice you should use the dev-test-prod model when developing custom actions (preview), having a development environment and working the way up until you feel confident about stability and finally uploading the stable version of custom actions (preview) to the production environment.

> [!NOTE]
> .dll files describing the custom actions (preview), their .dll dependencies and the .cab file containing everything should be properly signed with a digital certificate trusted by your organization (included in Trusted Root Certification Authorities). The certificate should also be present under the Trusted Root Certification Authorities for each machine on which a desktop flow with custom action (preview) dependencies is executed.

## Known limitations
- Custom actions groups (preview) uploaded cannot be bigger than 30mb.
- Specific endpoints must be included in the allow list for desktop flows containing custom actions (preview) to work properly. 
Refer to [desktop flow services required for runtime](../ip-address-configuration.md#desktop-flows-services-required-for-runtime) for more details.
- ALM is not yet fully supported for desktop flows with dependencies on custom actions (preview)
- Upload date might differ in the portal than what is shown in the Asset library, in Power Automate for Desktop


[!INCLUDE[footer-include](../includes/footer-banner.md)]