---
title: Configuring an action | Microsoft Docs
description: Configuring an action
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 02/26/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Configuring an action

**Power Automate Desktop** actions consist of two main segments:
- The input parameters - Have the form of text fields, dropboxes, and checkboxes
- The produced variables - Automatically created variables

The input parameters determine the way an action functions and the data it gets as input. The data can be hardcoded values or variables. 

To use a variable as a parameter, select the icon on the field's right side and pick the respective variable.

Each field can accept specific data types, such as numbers, text, or lists. If a value or variable of a wrong data type is used as an input, the action will throw an error. 

The produced variables hold the outcomes of the action for later use. All the output variables are displayed on the bottom part of the action's properties. 

Each output variable has a data type defined by its data. You can see the data type of a variable in the **Variables** pane. Find more information about data types in the respective article (link to be added). 

In case an output variable isn't needed for later use, select the icon on the left side of it and pick **Not needed**. 