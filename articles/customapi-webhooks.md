<properties
	pageTitle="Using webhooks with Microsoft Flow | Microsoft Flow"
	description="Learn how to create an flows that interact with webhooks in Microsoft Flow"
	services=""
    suite="flow"
	documentationCenter=""
	authors="camsoper"
	manager="AFTOwen"
	editor=""/>

<tags
   ms.service="flow"
   ms.devlang="na"
   ms.topic="article"
   ms.tgt_pltfrm="na"
   ms.workload="na"
   ms.date="11/29/2016"
   ms.author="casoper"/>

# Using webhooks with Microsoft Flow

[Webhooks](http://www.webhooks.org/) are simple HTTP callbacks used to provide event notifications.  Microsoft Flow allows you to use webhooks to trigger flows.  This tutorial demonstrates how to create a flow triggered by a webhook.  We will use GitHub as an example of a service that can send notifications via webhooks.

## Prerequisites

To complete the tutorial, you will need:

 - Basic understanding of [webhooks](http://www.webhooks.org/)
 - Basic understanding of the [OpenAPI Specification](http://swagger.io/specification/) (Swagger).

## Overview

We will are going to create a flow that will be triggered when GitHub receives pushes to a repository.  To do this, we need to first build a Swagger JSON file that will tell Microsoft Flow:

1. How to create the webhook on GitHub
2. The shape of the webhook request (notification) from GitHub to Microsoft Flow 
3. How to delete the webhook on GitHub

## Creating the webhook

