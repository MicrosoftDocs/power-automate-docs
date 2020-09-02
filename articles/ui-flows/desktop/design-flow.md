---
title: Design a flow | Microsoft Docs
description: Use power automate and flow designer to design a flow.
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

# Design a flow in Power Automate and Power Automate Desktop

Create a new folder on the desktop, and name it **Countries**.
Go to **flow.microsoft.com** and login with your credentials.
Select **my flows**, then **+new**, and **Instant from blank**.

![alttext](\media\imgname.png)

In the dialog, enter a flow name, select **Manually trigger a flow** and select **Create**.

![alttext](\media\imgname.png)

Select **+new step**.

![alttext](\media\imgname.png)

Search for **ui flow**.

![alttext](\media\imgname.png)

Select the **Run a UI flow (V2)** action.

![alttext](\media\imgname.png)

In the action, under Run mode select **Attended - Runs when you're signed in** and under UI flow select **+Create a new UI flow**.

![alttext](\media\imgname.png)

Enter flow name or one will be generated and select **Create**.

![alttext](\media\imgname.png)

A message from the browser may appear, asking whether to allow flow.microsoft.com to open an application. Allow this action to continue to Power Automate Desktop.

![alttext](\media\imgname.png)

In Power Automate Desktop flow designer, add the **Get special folder** action.
Add the **Get current date and time** action and set **Retrieve** to **Current date only**. Select **Save** to add the action to the Power Automate Desktop workspace. This action will retrieve only the current date, and store it in a variable.

![alttext](\media\imgname.png)

Add the **Convert datetime to text** action. In **Datetime to convert**, select the **variables** icon and double click on **%CurrentDateTime%** in the popout to add the variable to the field. For Format to use set **Custom**, and enter **MM-dd-yyyy** in **Custom Format**. This action converts the datetime variable to a text variable, while also converting the date to the specified format.

![alttext](\media\imgname.png)

Add the **Get special folder** action. The **Special folder name** will default to **Desktop**. This action stores the location of the current user's Desktop.

![alttext](\media\imgname.png)

create folder in desktop/countries: US

![alttext](\media\imgname.png)

Add the **Write text to file** action and use the variables popout set File path to **%SpecialFolderPath%\%FormattedDateTime%.txt**. Additionally, set **Text to write** to **This text was written by Power Automate Desktop**. This action writes the specified text to a text file on the current user's desktop, and sets the filename to the current date.

![alttext](\media\imgname.png)

get files in folder (desktop/countries)

![alttext](\media\imgname.png)

set output var: file path (string)
set output var: file item.count (string)
save process
close