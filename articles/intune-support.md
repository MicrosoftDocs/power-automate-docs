---
title: Power Automate mobile app now supports Microsoft Intune's Mobile Application Management. | Microsoft Docs
description: Power Automate mobile app now supports Microsoft Intune's Mobile Application Management.
services: ''
suite: flow
documentationcenter: na
author: v-aangie
editor: ''
tags: ''

ms.subservice: cloud-flow
ms.topic: conceptual
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 04/29/2019
ms.author: angieandrews
ms.reviewer: angieandrews
---

# Power Automate mobile app supports Microsoft Intune


The Power Automate mobile app for iOS and Android supports Intune's Mobile Application Management (MAM) without device enrollment. Using MAM allows IT administrators to create and enforce mobile data policies to safeguard organizational data.

## Why Intune support is important

Organizations are looking for more control over the data that resides on employee mobile devices. Organizations might want to restrict how that data moves to the device and ensure the data is removed, should the employee leave the organization.

## What is Microsoft Application Management (MAM)

MAM allows organizations to create policies that govern how apps are used within a tenant. This includes enforcing app data encryption, limiting the ability to copy or extract data to only approved applications, or enforcing a PIN on a device.

### Prerequisites

- An Intune [app protection policy](/intune/app-protection-policies).
- An Microsoft Entra group.
- Company Portal. One key benefit of using MAM is that devices don't need to be enrolled in Intune MAM. All that's required is the Company Portal, which is available from the App Store and the Google Play store.
- Version 2.31.0 of the Power Automate mobile app for iOS, Android, or Windows Phone.

## Create an app protection policy, assign apps to the policy, define settings, and add users to a Microsoft Entra group

For the Power Automate mobile app to be managed, you must:

1. Create an app protection policy.
1. Assign the Power Automate mobile app to the app protection policy.
1. Assign the policy settings. For example, you might assign the policy to require a PIN to access the mobile device that runs the Power Automate mobile app.
1. Apply the app protection policy to a specific Microsoft Entra group.
1. Add all users to which the app protection policy applies to the Microsoft Entra group.

Follow these steps to create an [app protection policy](/intune/app-protection-policies) that requires Power Automate mobile app users to enter a PIN before they can access the app. 


## Test the app protection policy

After you've created the app protection policy and assigned users to the Microsoft Entra group, it's time to use the Power Automate mobile app and confirm the policy works.

To confirm the policy works, follow these steps:

1. Install the Power Automate mobile app on a device whose platform matches one of the platforms you defined in the app protection policy.
1. Sign in to the mobile app with an account that's in the Microsoft Entra group that restricts use of the mobile app to users who have a PIN.

You'll then be prompted to:
1. Install the Company Portal.
1. Set your PIN if you don't already have a PIN that meets the app protection policy's criteria.


## Learn more

Learn to create an [app protection policy](/intune/app-protection-policies).



[!INCLUDE[footer-include](includes/footer-banner.md)]