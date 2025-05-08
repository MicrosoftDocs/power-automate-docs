---
title: Static analysis (Preview) | Microsoft Docs
description: Learn how to use the static analysis feature scans your code for errors, vulnerabilities, and coding standard violations, helping improve code quality without execution.
author: NikosMoutzourakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 05/08/2025
ms.author: nimoutzo
ms.reviewer: danamartens
contributors:
- NikosMoutzourakis
search.audienceType: 
  - flowmaker
  - enduser
---

# Static analysis
Elevate your development process with the newly integrated Static Analysis feature in our Solution Checker suite. Tailored to support best practices in robotic process automation (RPA) and meet your organization's critical 
flow requirements, this tool provides an automated evaluation of your flows to ensure optimal performance. Accessible via the 'Flows Checker' section in the designer, Static Analysis not only upholds essential guidelines but
also delivers real-time feedback and preemptive code inspection. By seamlessly integrating into your current workflow, it enhances code quality and offers a robust framework for a more streamlined and productive development
experience.

## How rules can be enabled
SOlution checker+++

## Static analysis in the designer
The Static Analysis is performed automatically, providing continuous inspection of your code without requiring manual intervention. As you add, remove, or edit actions within your flow, this feature is triggered 
automatically to evaluate the changes and update the analysis on the spot, ensuring that the development process is both seamless and efficient.

Each analysis generates a score, represented as a percentage, which indicates the proportion of rules that have been successfully adhered to. A higher score reflects fewer violations, thus signaling better code quality. 
This score is recalculated every time a change is made on the flow, providing immediate feedback and promoting good development practices.

If any rules are violated, the Static Analysis Report provides a clear and concise summary. The report lists the rule names, along with the number of actions or variables in your flow that breach each rule. By clicking 
on a specific rule, the feature conveniently highlights the corresponding action, offering a detailed explanation of the error. If a rule violation pertains to a variable, the system will automatically navigate you to the
variable pane, ensuring that corrections can be made with ease.

For each violation, a new tile displays further details, including the nature of the error, recommended remediation steps, and a direct link to comprehensive documentation. This integrated guidance supports developers in 
addressing issues promptly and effectively.













> [!IMPORTANT]
> Before automating webpages, you need to install the appropriate browser extension and configure the browser accordingly. To find more information regarding the supported browsers and the required extensions, go to [Install Power Automate browser extensions](install-browser-extensions.md).


> [!NOTE]
> To launch a browser on a virtual desktop, first capture at least one UI element within that desktop. This element needs to be available in the UI element repository of your flow.

## Use Internet Explorer vs Automation browser

Although Automation browser is based on Internet Explorer, it provides some features and limitations that increase automation effectiveness.

1. Automation browser works out of the box, while Internet Explorer requires [extra configuration](install-browser-extensions.md). Security configurations may be unwanted in organizations with strict security policies that prohibit manual changes.

1. The **Click download link on web page** action works with Automation browser whatever the Internet Explorer version. For the actual Internet Explorer, the action requires version 8 or below.


:::image type="content" source="media\web-automation\get-details-of-element-on-web-page-action.png" alt-text="Screenshot of the Get details of element on web page action.":::

[!INCLUDE[footer-include](../includes/footer-banner.md)]
