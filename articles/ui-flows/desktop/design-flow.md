---
title: Design a flow | Microsoft Docs
description: Use flow designer to design a flow.
author: msftman
ms.service: flow
ms.topic: article
ms.date: 02/26/2020
ms.author: olmelnyk
ms.reviewer: olmelnyk
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Design a flow in flow designer

Add the **Get current date and time** action and set **Retrieve** to **Current date only**. Select **Save** to add the action to the Power Automate Desktop workspace. This action will retrieve only the current date, and store it in a variable.

![alttext](\media\imgname.png)

Add the **Convert datetime to text** action. In **Datetime to convert**, select the **variables** icon and double click on **%CurrentDateTime%** in the popout to add the variable to the field. For Format to use set **Custom**, and enter **MM-dd-yyyy** in **Custom Format**. This action converts the datetime variable to a text variable, while also converting the date to the specified format.

![alttext](\media\imgname.png)

Add the **Get special folder** action. The **Special folder name** will default to **Desktop**. This action stores the location of the current user's Desktop.

![alttext](\media\imgname.png)

Add the **Write text to file** action and use the variables popout set File path to **%SpecialFolderPath%\%FormattedDateTime%.txt**. Additionally, set **Text to write** to **This text was written by Power Automate Desktop**. This action writes the specified text to a text file on the current user's desktop, and sets the filename to the current date.

![alttext](\media\imgname.png)

Select **Save** to save the flow, then select **Run** to run it. The values of the variables are populated as each action runs.

![alttext](\media\imgname.png)

When the flow completes its run, a text file with the current date as its name will appear on the desktop, containing the text specified in the Write text to file action.