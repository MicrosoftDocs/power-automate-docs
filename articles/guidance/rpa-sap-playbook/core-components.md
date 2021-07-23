---
title: Core components to use for RPA SAP GUI automation | Microsoft Docs
description: You'll need these four main components for SAP GUI automation with Power Automate.
suite: flow
documentationcenter: na
author: kathyos
manager: kvivek
editor: ''
ms.custom: guidance
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/01/2021
ms.author: kathyos
ms.reviewer: deonhe
---

# Core components for Power Automate RPA SAP GUI automation

Here are the four components needed to automate SAP GUI with Power Automate:

- [Power Automate](#power-automate)
- [Desktop flows](#desktop-flows)
- [Power Automate Desktop](#power-automate-desktop)
- [On-premises data gateway](#on-premises-data-gateway)

## Power Automate

Let's start with the core platform service called Power Automate. Power Automate is an enterprise service that helps you create automated workflows by using your favorite apps and services to synchronize files, get notifications, collect data, and more. Learn more on [docs.microsoft.com](../../getting-started.md) and [Microsoft Learn](../../learning-catalog/learning-catalog.md).

![Screenshot of the Power Automate portal home page.](media/power-automate-website.png)

The Power Automate designer is shown in the following image.<!--note from editor: Alt text could be more descriptive.-->

![Screenshot of the Power Automate designer.](media/power-automate-flow-authoring.png)

## Desktop flows

Desktop flows bring robotic process automation (RPA) capabilities to Power Automate. You can use desktop flows to automate repetitive tasks in Windows and web applications. A desktop flow can record and play back UI actions (such as clicks and keyboard input) for applications that don't have easy-to-use or complete APIs available.

A list of desktop flows is shown in the following image.

![Screenshot of the Desktop flows tab on the Power Automate portal My flows screen.](media/my-flows-screen.png)

## Power Automate Desktop

It's quicker and easier than ever to automate with new, intuitive Power Automate Desktop. You can use Power Automate Desktop to automate legacy applications, such as terminal emulators, and interact with modern web and desktop applications, files, folders and many more.

Power Automate Desktop broadens the existing RPA capabilities in Power Automate. In conjunction with desktop flows, all repetitive desktop processes can be automated. 

You can use prebuilt drag-and-drop actions or record your own cloud flows to run later.<!--note from editor: I don't know what the following means: You can also with the machine using images or coordinates.-->

The following image shows an example of the Power Automate Desktop console, showing desktop flows to which an individual has access.

![Screenshot of Power Automate Desktop console home screen.](media/power-automate-desktop-console.png)

The following image shows an example of the Power Automate Desktop designer, from which you can create desktop flows.<!--note from editor: Alt text could be more descriptive.-->

![Screenshot of Power Automate Desktop authoring experience.](media/power-automate-desktop-authoring.png)

## On-premises data gateway

The on-premises data gateway acts as a bridge. It provides quick and secure data transfer between on-premises data (data that isn't in the cloud) and several Microsoft cloud services. These cloud services include Power BI, Power Apps, Power Automate, Azure Analysis Services, and Azure Logic Apps.

By using a gateway, organizations can keep databases and other data sources on-premises, while securely using that on-premises data in cloud services.

> [!div class="nextstepaction"]
> [Next step: Sample SAP GUI automation for this tutorial](sample-sap-scenario.md)
