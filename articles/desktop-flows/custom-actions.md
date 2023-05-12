---
title: Custom actions
description: Learn about custom actions in Power Automate desktop flows.
author: jpapadimitriou
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 05/15/2023
ms.author: dipapa
ms.reviewer: tapanm-msft
contributors:
  - jpapadimitriou
  - tapanm-msft
search.audienceType: 
  - flowmaker
  - enduser
---

# Custom actions in desktop flows (preview)

[!INCLUDE[cc-preview-features-top-note](../includes/cc-preview-features-top-note.md)]

Custom actions (preview) developed by your organization and uploaded to the respective environments can be included in desktop flows and utilized like actions that belong in the standard library of automation actions. 

> [!IMPORTANT]
> - [!INCLUDE[cc-preview-features-note](../includes/cc-preview-features-note.md)]
> - [!INCLUDE[cc-preview-features-definition](../includes/cc-preview-features-definition.md)]
> - This feature requires Power Automate for desktop v2.32 or later.
> - Ensure the .dll files describing Custom actions (preview), their dependency .dll files, and the .cab files are properly signed with a digital certificate trusted by your organization. The certificate should also be installed on the device under the trusted root certificate authority where the desktop flow with custom action dependencies is executing.

Custom actions (preview) exist at the environment level. As a best practice, use a "dev&mdash;test&mdash;prod" model when developing custom actions.

## Known limitations

- Custom actions groups (preview) can't exceed 30 MB upon upload.
- Specific endpoints must be included in the allowlist for desktop flows containing custom actions to work properly. More information: [Desktop flow services required for runtime](../ip-address-configuration.md#desktop-flows-services-required-for-runtime)
- Application lifecycle management (ALM) isn't fully supported for desktop flows with dependencies on custom actions.
- Upload date might differ in the portal than what is shown in the Assets library (preview) inside Power Automate for desktop.
- The Assets library (preview) can't display more than 5000 custom actions groups.
- Custom actions are not available for organizations that have enabled [BYOK](https://learn.microsoft.com/en-us/azure/information-protection/byok-price-restrictions) from the Protection Service.

## Next steps

[Create custom actions](create-custom-actions.md)

### See also

- [Assets library (preview)](assets-library.md)
- [Upload custom actions](upload-custom-actions.md)
- [Use custom actions](use-custom-actions.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]