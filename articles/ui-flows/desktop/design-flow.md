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

In Power Automate Desktop, go to Variables and click on **+** to add a new input variable.

![alttext](\media\imgname.png)

Configure tha variable as follows:
Variable type: Input
Variable name: CountryName
Default value: France
Data type: String
External name: CountryName
Description: This is the country name input variable.

Add the **Get current date and time** action and set **Retrieve** to **Current date only**. Select **Save** to add the action to the Power Automate Desktop workspace. This action will retrieve only the current date, and store it in a variable.

![alttext](\media\imgname.png)

Add the **Convert datetime to text** action. In **Datetime to convert**, select the **variables** icon and double click on **%CurrentDateTime%** in the popout to add the variable to the field. For Format to use set **Custom**, and enter **MM-dd-yyyy** in **Custom Format**. This action converts the datetime variable to a text variable, while also converting the date to the specified format.

![alttext](\media\imgname.png)

Add the **Get special folder** action. The **Special folder name** will default to **Desktop**. This action stores the location of the current user's Desktop.

![alttext](\media\imgname.png)

Add the **Create Folder** action and set **Create new folder into** to **%SpecialFolderPath%\Countries** and **New folder name** to **%CountryName%**.

![alttext](\media\imgname.png)

Add the **Write text to file** action and use the variables popout set File path to **%SpecialFolderPath%\Countries\%CountryName%\%FormattedDateTime%.txt**. Additionally, set **Text to write** to **This text was written by Power Automate Desktop**. This action writes the specified text to a text file on the current user's desktop, and sets the filename to the current date.

![alttext](\media\imgname.png)

Add the **Get files in folder** action and set **Folder** to **%SpecialFolderPath%\Countries\%CountryName%**.

![alttext](\media\imgname.png)

In the **Variables** pane, create two Output variables as follows:

Variable type: Output
Variable name: FileCount
External name: FileCount
Description: This is the file count output variable.

and

Variable type: **Output**
Variable name: **FilePath**
External name: **FilePath**
Description: This is the file path output variable.

set output var: file path (string)
set output var: file item.count (string)

![alttext](\media\imgname.png)

Add two **Set variable** actions and configure them as follows:

Set variable: **FilePath**

To: **%SpecialFolderPath%\Countries\%CountryName%\%FormattedDateTime%.txt**

and

Set variable: **FileCount**

To: **%Files.count%**

Select **Save** to save the flow and close flow designer.

![alttext](\media\imgname.png)

Back in Power Automate, in the dialog select **Keep Working**.

![alttext](\media\imgname.png)

Select the new UI flow in the action, and enter **Greece** into **CountryName**.

![alttext](\media\imgname.png)

Select **Save** to save the flow and then select **Test**.

![alttext](\media\imgname.png)

Select **I'll perform the trigger action.** and **Test**.

![alttext](\media\imgname.png)

When Power Automate connects to Power Automate Desktop, select **Run Flow** and then **Done**.

![alttext](\media\imgname.png)

When the flow finishes running, all actions will have a green checkmark icon and a message will appear saying **Your flow ran successfully.**

![alttext](\media\imgname.png)

Select the **Run a UI flow (V2)** action to open its nputs and outputs. In the Outputs, select **Show raw outputs**. This displays the two variables, **FileCount** and **FilePath** which were returned from Power Automate Desktop. Any output variables may be used elsewhere in the flow.

![alttext](\media\imgname.png)

Check the **Countries** folder on the desktop. A folder with the name **Greece** has been added, and contains a text file with today's date.