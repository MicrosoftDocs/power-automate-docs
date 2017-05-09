<properties
   pageTitle="AppSource Test Drive | Microsoft PowerApps"
   description="Use AppSource to share apps with customers, and generate leads for your business."
   services=""
   suite="flow"
   documentationCenter="na"
   authors="linhtranms"
   manager="anneta"
   editor=""
   tags=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="05/09/2016"
   ms.author="litran"/>


# AppSource Test Drive #

Do you want to show off how your app integrates with Microsoft Flow? We now Test Drive solutions on [AppSource.com](https://appsource.microsoft.com) as a way for you to share Microsoft Flow integration with customers, and generate leads for your business.

## What is a Test Drive solution? ##

A Test Drive solution enables your customers to try out a real app without installing any applications. Customers just sign into AppSource.com using their Azure Active Directory (AAD) account and run the app in a web browser. Without Test Drive, customers can only read about your app or watch a video that describes it. With Test Drive, customers get a better idea of what your solution is and what functionality your app has. And they have the experience of actually using the app. Customers won't be able to look under the hood to see how your app is built, so your intellectual property is protected. We collect and share lead information with you to help you grow your business.

## How do I build a Test Drive solution? ##

Building an app for a Test Drive solution is just like building any app, but you need to use a data source that the user can be granted access to with a read-only user. Using a data source that's already set up will mean there is zero friction for them to try it out. The full solution that you ultimately distribute to customers will include writable data, but read-only data works well for a Test Drive solution.

### Embed flow into your product ###

Once you have a data source that you can grant the user read-only access to, you can embed Microsoft Flow into your application. [Read more about embedding here](embed-flow-dev.md). You will likely want to use the search functionality to highlight templates that are unique to your application. For example, if your application creates data in Dynamics 365, you can highlight a Dynamics 365 template that pulls data and then sends an email to the user. 

## How do I list my Test Drive solution on AppSource.com? ##

Now that your app is ready, it's time to publish it to AppSource.com. Follow the step-by-step instructions on how to complete this proces in the [Publishing Guide for Cloud Solutions Apps](https://aka.ms/publishinguideforwebapps). After you have entered the app metadata through the publishing portal, click or tap **PUSH TO STAGING**, and we will circle back to the next steps.