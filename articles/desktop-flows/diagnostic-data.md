---
title: Diagnostic data collection in Power Automate
description: Learn about the diagnostic data Microsoft collects in Power Automate.
author: mattp123
ms.topic: conceptual
ms.date: 01/10/2023
ms.author: pefelesk
ms.reviewer: matp
contributors:
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
ms.subservice: desktop-flow
ms.service: power-automate
ms.custom: bap-template
---

# Diagnostic data collection in Power Automate

We use diagnostic data to keep Power Automate client software secure and up-to-date; to detect, diagnose, and fix problems; and to make product improvements. This data doesn't include a user's name or email address, the content of the user's files, or information about apps unrelated to the product.

Microsoft is dedicated to being transparent with our customers about the data we collect from our client software and giving them more control over their data. As part of this work, diagnostic data we collect from our client software as customers use their devices is classified as either *Required* or *Optional*. This classification will make it easier for our customers to make informed choices about their privacy.

Power Automate client software doesn't collect optional diagnostic data by default unless the user specified otherwise during the initial installation process or later in the product's settings.

This article provides an overview of the types of diagnostic data that are required and optional, and the specific categories of diagnostic data that are collected by Power Automate client products.

## Required data

Data classified as *Required* is necessary to keep our products up-to-date, secure, and working as expected. Required diagnostic data includes the type and version of a customer's device or software configuration so we can provide connectivity to our cloud services and security patches to help keep our customers' experiences safe, secure, and functioning with a high degree of performance; detect significant feature failures; and then diagnose and fix those failures more quickly to reduce their impact on customers.

Required diagnostic data is the minimum data necessary to help keep Power Automate client software performing as expected on the device it's installed on. Examples include summary details about the health and security of the running service, version information about infrastructure, configuration details, success or errors received, and aggregated information about failures and security concerns, flow runs, service interactions, and more.

Required diagnostic data is managed with your organization's and your employees' security and privacy in mind. You can learn more about our commitments to protect data in the [Microsoft Trust Center](https://www.microsoft.com/trust-center/privacy).

### Required diagnostic data summary

Required diagnostic data in Power Automate client software is organized into various data categories.

|Data category|Description|Examples|
|----|-----|----|
|Device connectivity and configuration|This type of **Required diagnostic data** includes details about the device, its configuration, and connectivity capabilities|<ul><li>Data about the user's device, screen resolution, screen orientation, and other configuration details</li></ul>|
|Product and service performance|This type of **Required diagnostic data** includes details about device or service health and performance|<ul><li>Information about memory, processor, and disk usage</li><li> Information about form load times</li><li>Information about process completion times</li></ul>|
|Product and service usage|This type of **Required diagnostic data** includes details about the usage of the device, operating system, applications, and services|<ul><li>Details about navigation patterns </li><li>Details about form usage</li><li>Details about frequency of use of activities and actions</li></ul>|
|Software setup and inventory|This type of **Required diagnostic data** includes software installation and update information on the device|<ul><li>An event used to ensure new users can successfully launch and run Power Automate client applications for the first time</li><li>An event that ensures critical regression detection for installed client applications</li></ul>|

## Optional data

Data in the *Optional* category isn't essential to the product or service experience. Opting in to this feature allows us to identify usage trends, which enhances our ability to make product improvements.

Power Automate client products don't collect optional data unless the user consents during the product installation process or has enabled the feature through the application settings later. If users choose to send optional diagnostic data, it's collected in addition to required diagnostic data.

|Data category|Description|Examples|
|----|-----|----|
|Enhanced anonymized product usage|This type of **Optional diagnostic data** includes details about the usage of advanced flow objects, such as selectors|<ul><li>Process names that the user is trying to automate such as EXCEL.exe</li></ul>|

[!INCLUDE[footer-include](../includes/footer-banner.md)]
