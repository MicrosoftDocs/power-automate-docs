---
title: Let customers test drive your flows on AppSource | Microsoft Docs
description: Use AppSource to share apps with customers, and generate leads for your business.
author: v-aangie
ms.subservice: developer
ms.topic: conceptual
ms.date: 05/09/2017
ms.author: angieandrews
ms.reviewer: angieandrews
search.audienceType: 
  - developer
---
# Let customers test drive your flows on AppSource

Do you want to show off how your app integrates with Power Automate? We now Test Drive solutions on [AppSource.com](https://appsource.microsoft.com) as a way for you to share Power Automate integration with customers, and generate leads for your business.

## What is a Test Drive solution?
A Test Drive solution enables your customers to try out a real app without installing any applications. Customers just sign into AppSource.com using their Microsoft Entra ID (Microsoft Entra ID) account and run the app in a web browser. Without Test Drive, customers can only read about your app or watch a video that describes it. With Test Drive, customers get a better idea of what your solution is and what functionality your app has. And they have the experience of actually using the app. Customers won't be able to look under the hood to see how your app is built, so your intellectual property is protected. We collect and share lead information with you to help you grow your business.

## How do I build a Test Drive solution?
Building an app for a Test Drive solution is just like building any app, but you need to use a data source that the user can be granted access to as a read-only user. Using a data source that's already set up will mean there is zero friction for them to try it out. The full solution that you ultimately distribute to customers will include writable data, but read-only data works well for a Test Drive solution.

### Embed flow into your product
Once you have a data source that you can grant the user read-only access to, you can embed Power Automate into your application. [Read more about embedding here](embed-flow-dev.md). You will likely want to use the search functionality to highlight templates that are unique to your application. For example, if your application creates data in Dynamics 365, you can highlight a Dynamics 365 template that pulls data and then sends an email to the user. 

## How do I list my Test Drive solution on AppSource.com?
Now that your app is ready, it's time to publish it to AppSource.com. In order to start this process, please complete the [application form](https://make.powerautomate.com/partners/get-listed/). Once you apply you will receive an email with instructions on how to submit your app to be published on AppSource.com.



[!INCLUDE[footer-include](../includes/footer-banner.md)]