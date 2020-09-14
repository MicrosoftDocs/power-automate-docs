---
title: Using the actual Internet Explorer vs the Automation browser| Microsoft Docs
description: Using the actual Internet Explorer vs the Automation browser
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 09/09/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Using the actual Internet Explorer vs the Automation browser

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

Although **Automation browser** is based on **Internet Explorer**, it provides some features and limitations that increase automation effectiveness.

1. **Automation browser** works out of the box, while **Internet Explorer** requires additional configuration. Security configurations may be unwanted in organizations with strict security policies that prohibit manual changes. 

1. The **Click download link on web page** action works with the **Automation browser** whatever the **IE** version. For the actual **IE**, the action requires version 8 or below.

1. **Automation browser** suppresses all message dialogs that may pop up unhindered in the actual **IE**. If this feature is undesirable, apply the **ShowDialogs** suffix at the end of the URL in the **Launch new Internet Explorer** action.

1. **Automation browser** doesn't support tabs or opening links in windows. When the user clicks on a link, the browser opens it in the same window/instance.

1. **Automation browser** has a small performance advantage because it doesn't load unnecessary elements and add-ons like the actual **IE** does.