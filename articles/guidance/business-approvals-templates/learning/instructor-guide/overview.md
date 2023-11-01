---
title: Approvals Kit instructor guide overview | Microsoft Learn
description: Approvals Kit instructor guide overview
documentationcenter: na
author: Grant-Archibald-MS
ms.custom: guidance
ms.topic: article
ms.date: 11/10/2023
ms.author: grarchib
ms.reviewer: angieandrews
---

# Overview of the Approvals Kit Instructor Guide

This instructor guide is designed to provide you with instructions on how to setup and provide support for the [Approvals Kit workshop](../workshop/overview.md) learning module.

## Context

Automation scripts provided in this guide aren't meant to be a general purpose example of how-to setup and manage a workshop environment for the Power Platform. These scripts are focused specifically on the Approvals kit and setup of the sample Contoso Coffee application used by the workshop.

While the scripts might be helpful for setting up a similar environment, they aren't intended to be a comprehensive solution for all workshop scenarios. We encourage you to review and modify the scripts as needed to fit your specific workshop needs.

We recommend that you have a basic understanding of command line interface (CLI) tools. This guide used the Azure CLI and Power Platform CLI, if you need extra guidance on these tools, refer to the learning resources provided in this guide.

## Prerequisites

Support delivery of this learning module requires:

1. A Power Platform tenant.

  > NOTE: The guide will provide you steps to create a new tenant using an Azure Subscription if you do not already have a tenant.

1. Ability to assign the [Power Apps Developer Plan](https://powerapps.microsoft.com/developerplan/)

1. Power Automate Premium or [Power Automate Trial](https://powerautomate.microsoft.com/pricing/)

1. Local install of the following tools to setup users and environments:

   - PowerShell 7.2.15 or newer
   - The Power Platform Command Line interface
   - The Azure Command Line interface

## Single Environment Install

If you would rather perform a single environment install of the workshop without using the command line tool approach, the following instructions can be followed:

1. Install of the Approvals Kit using [Setup instructions](../../setup.md)

1. Install of the Contoso Coffee solution using [Import Contoso Coffee](../workshop/import-contoso-coffee.md)

## Assumptions

This learning guide has the following assumptions:

- This instructor guide isn't optimized for a single environment install, but for automating multiple installs.

- Each person completing the learning guide has an isolated development environment so that they're unaffected by other users.

- Each user has access Office 365 mailbox to use the [Office 365 Users Connector](https://learn.microsoft.com/connectors/office365users/).

## Automation Tool Selection

This version of the workshop instructor guide makes use of the command line interface (CLI) tools including Azure CLI and Power Platform CLI. These tools provide a versatile approach that can you can use to automate the setup of your workshop environment in multiple hosting locations.

In addition, the Azure CLI and Power Platform CLI can be used with Playwright, an open-source solution for automating web browsers. Playwright is used to run headless browser automation, which allows you to run browser automation scripts as a workshop user to configure the environment ready for use.

By combining the Azure CLI and Power Platform CLI with Playwright, you can automate the setup of a workshop environment and perform browser automation tasks, all from the command line.

## Power Platform Command Line Interface (CLI)

The Power Platform CLI is a command-line tool that allows you to manage Power Platform resources from your local computer. It provides a set of commands that you can use to create, update, and delete Power Platform resources, as well as manage Power Platform environments and solutions.

The Power Platform CLI is available for Windows, macOS, and Linux, and can be installed using various methods, including package managers, installers, and source code.

If you're new to the Power Platform CLI, Microsoft offers several learning resources to help you get started from [Microsoft Power Platform CLI documentation](https://learn.microsoft.com/power-platform/developer/cli/introduction). The documentation provides a comprehensive guide to using the CLI, including installation instructions, command reference, and examples.

## Azure Command Line Interface

The Azure CLI is a command-line tool that allows you to manage Azure resources from your local computer. It provides a set of commands that you can use to create, update, and delete Azure resources, as well as manage Azure subscriptions and resource groups.

The instructor guide setup scripts make use the Azure CLI to sign in, provide authentication tokens and automate steps of the setup process. These lower level command line tools are wrapped in PowerShell or bash scripts. When new to the Azure CLI, use the [Azure CLI documentation](https://docs.microsoft.com/cli/azure/) to provide a comprehensive guide to using the CLI, including installation instructions, command reference, and examples.

## Optional Azure Components

Optional guides to help understand Azure Cloud Shell and Virtual Machines to help with setup of the workshop:

- [Introduction to Azure Cloud Shell](https://learn.microsoft.com/training/modules/intro-to-azure-cloud-shell/)

- [Introduction to Linux on Azure](https://learn.microsoft.com/training/modules/intro-to-linux-on-azure/)

- [Get started with the Linux command line and the Shell](https://learn.microsoft.com/training/paths/shell/)

## This instructor guide has the following sections

### [Getting Started](./getting-started.md)

15 mins

### [Tenant Setup](./tenant-setup.md)

15 mins

### [User Setup](./user-setup.md)

15 mins+

### [Environment Setup](./environment-setup.md)

15 mins+

### [Environment Validation](./environment-validation.md)

15 mins+

### [Monitor Workshop Progress](./monitor-progress.md)

5 mins

### [Get Feedback](./get-feedback.md)

5 mins