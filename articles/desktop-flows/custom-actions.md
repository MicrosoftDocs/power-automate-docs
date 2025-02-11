---
title: Custom actions
description: Learn about custom actions in Power Automate desktop flows.
author: jpapadimitriou
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 02/06/2025
ms.author: dipapa
ms.reviewer: tapanm-msft
contributors:
  - jpapadimitriou
  - tapanm-msft
  - iomavrid
search.audienceType: 
  - flowmaker
  - enduser
---

# Custom actions in desktop flows

Custom actions developed by your organization and uploaded to the respective environments can be included in desktop flows and utilized like actions that belong in the standard library of automation actions. 

> [!IMPORTANT]
> - This feature requires Power Automate for desktop v2.32 or later.
> - Ensure the .dll files describing Custom actions, their dependency .dll files, and the .cab files are properly signed with a digital certificate trusted by your organization. The certificate should also be installed on the device under the trusted root certificate authority where the desktop flow with custom action dependencies is modified and/or executed.
> - If you use custom security roles to manage access, Power Platform admins need to update the role to include read permission for the Desktop Flow Module table (`prvReaddesktopflowmodule`).

Custom actions exist at the environment level. As a best practice, use a "dev&mdash;test&mdash;prod" model when developing custom actions.

## Known limitations

- Custom actions groups can't exceed 30 MB upon upload.
- Specific endpoints must be included in the allowlist for desktop flows containing custom actions to work properly. More information: [Desktop flow services required for runtime](../ip-address-configuration.md#services-required-for-desktop-flows-runtime)
- Application lifecycle management (ALM) isn't fully supported for desktop flows with dependencies on custom actions.
- Upload date might differ in the portal than what is shown in the Assets library inside Power Automate for desktop.
- Custom actions are not available for organizations that have enabled [Bring your own key (BYOK)](/azure/information-protection/byok-price-restrictions) from the protection service.
- Machines belonging in a [hosted machine group](hosted-machine-groups.md) should have the appropriate certificates required for custom actions, as set by your organization, installed on them. You can create a [golden image](/azure/virtual-desktop/set-up-golden-image), containing the respective certificate(s) and provide it during the creation process of the respective hosted machine group.
- All dependencies used in custom actions and Power Automate for desktop must be the same version. Using different versions of the same dependency within the same process isn't supported.

## Next steps

[Create custom actions](create-custom-actions.md)

## Related information

- [Assets library](assets-library.md)
- [Upload custom actions](upload-custom-actions.md)
- [Use custom actions](use-custom-actions.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
