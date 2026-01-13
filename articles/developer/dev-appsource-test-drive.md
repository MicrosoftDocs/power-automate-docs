---
title: Let customers test drive your flows on Marketplace | Microsoft Docs
description: Use Marketplace to share apps with customers, and generate leads for your business.
author: maordp
ms.service: power-automate
ms.subservice: developer
ms.topic: article
ms.date: 03/06/2025
ms.author: maord
ms.reviewer: angieandrews
search.audienceType: 
  - developer
---
# Let customers test drive your flows on Marketplace

> [!NOTE]
> Test Drives is deprecated. As an alternative to Test Drives, we encourage you to consider transitioning to Free Trials, which allows you to fully engage with your product using your personalized settings and configurations to meet your specific requirements.
>
> We recommend that you remove Test Drives from your offers and clean up your test drive environments.

Do you want to show off how your app integrates with Power Automate? We now Test Drive solutions on [Marketplace.com](https://marketplace.microsoft.com) as a way for you to share Power Automate integration with customers, and generate leads for your business.

## What is a Test Drive solution?

A Test Drive solution enables your customers to try out a real app without installing any applications. Customers just sign into Marketplace.com using their Microsoft Entra ID (Microsoft Entra ID) account and run the app in a web browser. Without Test Drive, customers can only read about your app or watch a video that describes it. With Test Drive, customers get a better idea of what your solution is and what functionality your app has. And they have the experience of actually using the app. Customers can't look under the hood to see how your app is built, so your intellectual property is protected. We collect and share lead information with you to help you grow your business.

## How do I build a Test Drive solution?

Building an app for a Test Drive solution is just like building any app, but you need to use a data source that the user can be granted access to as a read-only user. Using a data source that is already set up means there's zero friction for them to try it out. The full solution that you ultimately distribute to customers includes writable data, but read-only data works well for a Test Drive solution.

### Embed flow into your product

Once you have a data source that you can grant the user read-only access to, you can embed Power Automate into your application. [Read more about embedding here](embed-flow-dev.md). You likely want to use the search functionality to highlight templates that are unique to your application. For example, if your application creates data in Dynamics 365, you can highlight a Dynamics 365 template that pulls data and then sends an email to the user.

## How do I list my Test Drive solution on Marketplace.com?

Now that your app is ready, it's time to publish it to Marketplace.com. To start this process, complete the [application form](https://make.powerautomate.com/partners/get-listed/). After you apply, you receive an email with instructions on how to submit your app to be published on Marketplace.com.



[!INCLUDE[footer-include](../includes/footer-banner.md)]
