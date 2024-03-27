---
title: UI elements collections 
description: Learn about UI elements collections in Power Automate desktop flows.
author: iomavrid
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: conceptual
ms.date: 03/27/2024
ms.author: iomavrid
ms.reviewer: tapanm-msft
contributors:
  - iomavrid
search.audienceType: 
  - flowmaker
  - enduser
---

# UI elements collections in desktop flows

UI elements collections developed by organization users and published to the respective environments can be included in desktop flows. 

In Power Automate for desktop, UI elements are elements that are grabbed and captured from the various user interfaces (either desktop applications or web pages). These elements can be text fields, buttons, links, anything that the user can interact with.

After these elements are captured, they can be associated with the respective UI or web automation actions, so that the corresponding interaction with the said elements can be automated in the context of desktop flows.

Previously, UI elements were only available separately to each desktop flow. This means that they needed to be captured individually in the context of each desktop flow built, even if the elements happened to be exactly the same. To avoid this, UI elements collections now offer makers and admins the ability to have control and central management over 'groups' of UI elements, which can be shared across multiple users and imported in multiple desktop flows as reusable components. In this way, in case of an application update for instance, the UI elements collection only needs to be updated once from a single point - all desktop flows referencing this collection in the same environment should be updated automatically.

> [!IMPORTANT]
> - This feature requires Power Automate for desktop v2.43 or later.

UI elements collections exist at the environment level. As a best practice, use a "dev&mdash;test&mdash;prod" model when deploying UI elements collections.

## Known limitations

- Custom actions groups can't exceed 30 MB upon upload.
- Specific endpoints must be included in the allowlist for desktop flows containing custom actions to work properly. More information: [Desktop flow services required for runtime](../ip-address-configuration.md#desktop-flows-services-required-for-runtime)
- Application lifecycle management (ALM) isn't fully supported for desktop flows with dependencies on custom actions.
- Upload date might differ in the portal than what is shown in the Assets library inside Power Automate for desktop.
- The Assets library can't display more than 5000 custom actions groups.

## Next steps

[Create custom actions](create-custom-actions.md)

### See also

- [Assets library](assets-library.md)
- [Upload custom actions](upload-custom-actions.md)
- [Use custom actions](use-custom-actions.md)

[!INCLUDE[footer-include](../includes/footer-banner.md)]
