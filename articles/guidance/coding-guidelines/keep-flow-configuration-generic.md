---
title: Keep Flow configuration generic
description: Learn how to keep Flow configuration generic
author: manuelap-msft
ms.subservice: guidance
ms.topic: conceptual
ms.date: 12/12/2024
ms.author: rachaudh
ms.reviewer: angieandrews
contributors: 
  - manuelap-msft
search.audienceType: 
  - admin
  - flowmaker
---

# Keep Flow configuration generic

## Environment Variables

When a Power Automate flow is exported via a solution or as a zip package, its very easy to open the flow definition and any hard coded values like passwords or secrets can be exposed. To avoid this, use [Environment variables](/power-apps/maker/data-platform/environmentvariables-power-automate). 

## Service Principals

[A service principal](/entra/identity-platform/app-objects-and-service-principals) is a non-human security identity that represents an application or service that can own and manage resources within Azure and the Power Platform. To use a service principal in the Power Platform, a service principal application user needs to be created that represents the service principal [through the portal](/power-platform/admin/create-users) or [through API](/power-platform/admin/manage-application-users). An application user can have connections shared with them and own resources such as flows.

Use service principals for flow ownership as well as creating connections wherever possible. To understand more about service principals refer [here](/power-automate/service-principal-support).