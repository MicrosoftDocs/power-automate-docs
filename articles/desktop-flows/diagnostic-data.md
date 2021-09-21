---
title: Data Collection in Power Automate | Microsoft Docs
description: Data Collection in Power Automate
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/21/2021
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Data Collection in Power Automate

## Overview of Diagnostic Data in Power Automate

Microsoft is dedicated to being transparent with our customers about the data we collect from our client software and giving them more control over their data. As part of this work, we’re moving our major products to a model where diagnostic data we collect from our client software as customers use their devices will be classified as either *Required* or *Optional*. This will make it easier for our customers to find information about the data we collect and how we use it, and to make informed choices about their privacy. 

Diagnostic data is used to keep Power Automate client software secure and up-to-date, detect, diagnose and fix problems, and also make product improvements. This data does not include a user's name or email address, the content of the user's files, or information about apps unrelated to the product. 

While Microsoft classifies some diagnostic data as *Required*  and some as *Optional*, Power Automate client software doesn’t collect Optional diagnostic data from its users by default unless specified otherwise during the initial installation process or later within the Settings area. This article provides an overview of the types of diagnostic data that are Required and Optional, and the specific categories of diagnostic data that are collected by Power Automate client products. 

## Required data 

As noted above, data in the *Required* category is necessary to keep our products up to date, secure, and working as expected. Required diagnostic data includes things like the type and version of a customer’s device or software configuration so we can provide connectivity to our cloud services, security patches to help keep our customers’ experiences safe, secure and functioning with a high degree of performance, detect significant feature failures, and then diagnose and fix those failures more quickly to reduce impact to customers. 

Required diagnostic data is the minimum data necessary to help keep Power Automate client software performing as expected on the device it's installed on. Examples include summary details about the health and security of the running service like versioning information about your infrastructure, configuration details, success or errors you’ve received, and aggregated information about failures and security concerns, flow runs, service interactions, and more. 

Required diagnostic data is managed with your organization’s and your employees’ security and privacy in mind. You can learn more about our commitments to protect data in the [Microsoft Trust Center / Privacy](https://www.microsoft.com/trust-center/privacy). 

Required diagnostic data in Power Automate client software is organized into various data categories: 

## Required diagnostic data summary

|Data category|Description|Examples|
|----|-----|----|
|Device connectivity and configuration|This type of **Required diagnostic data** includes details about the device, its configuration, and connectivity capabilities|<ul><li>Details on the user’s device, screen resolution, screen orientation, and other configuration details</li></ul>|
|Product and service performance|This type of **Required diagnostic data** includes details about device or service health and performance|<ul><li>Information about memory, processor, disk usage</li><li> Information about form load times</li><li>Information about process completion times</li></ul>|
|Product and service usage|This type of **Required diagnostic data** includes details about the usage of the device, operating system, applications, and services|<ul><li>Details on navigation patterns </li><li>Details on form usage</li><li>Details on frequency use of activities and actions</li></ul>|
|Software setup and inventory|This type of **Required diagnostic data** includes software installation and update information on the device|<ul><li>An event used to ensure new users can successfully launch and run Power Automate client applications for the first time</li><li>An event that ensures critical regression detection for installed client applications</li></ul>|

## Optional data 

Data in the Optional category isn’t essential to the product or service experience, however opting into this feature allows us to identify additional usage trends which further enhances our ability to make product improvements. Power Automate client products don’t collect Optional data unless the user consents during the product installation process, or has enabled the feature through the application settings thereafter.  If you choose to send Optional diagnostic data, it is collected in addition to Required diagnostic data.

|Data category|Description|Examples|
|----|-----|----|
|Enhanced anonymized product usage|This type of **Optional diagnostic data** includes details about the usage of advanced flow objects, such as selectors|<ul><li>Process names that the user is trying to automate such as EXCEL.exe</li></ul>|

