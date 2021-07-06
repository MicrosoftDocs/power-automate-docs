---
title: Create a desktop flow that connects to SAP | Microsoft Docs
description: In this step of the RPA Playbook for SAP GUI Automation with Power Automate tutorial, we'll create a new flow in Power Automate Desktop and use the previously prepared VBScript code in a Run VBScript action within our process.
suite: flow
documentationcenter: na
author: kathyos
manager: kvivek
editor: ''
ms.custom: guidance
ms.service: power-automate
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/01/2021
ms.author: kathyos
ms.reviewer: deonhe
---

# Create a desktop flow that connects to SAP

In this section we'll create a new flow with Power Automate Desktop and use the previously prepared VBScript code in a **Run VBScript** action within the flow.

1. Select **New flow** in Power Automate Desktop.

2. Enter a name for the flow, and then select **Create**.

   ![Screenshot of Power Automate Desktop dialog box for naming a new flow ](media/naming-new-flow.png)

3. Select the Power Automate Desktop designer Window, and then select **Variables**.

   ![Screenshot of Power Automate Desktop variables icon on the right of the screen ](media/power-automate-desktop-variables-icon.png)

4. Select the plus sign, and then select **Input** to create several input variables. You will pass these variables into the flow from a desktop flow.

   ![Screenshot of the create variable UI in Power Automate Desktop ](media/create-variable-UI.png)

5. First, we'll create a few **technical SAP variables** which will be needed in almost all SAP based automation flows. For each variable, enter the **Variable name**, **External name** and **Description** and select **Update.**

    Here's the list of techical SAP variables.

    -   SAPPassword

    -   SAPUser

    -   SAPClient

    -   SAPSystemId

   ![Screenshot of Add a new variable dialog box ](media/add-new-variable.png)

6. Create the following use-case-specific variables.

    -   EmployeeId

    -   AddressType

    -   EffectiveDate

    -   Street

    -   City

    -   State

    -   ZipCode

    -   CountryCode

   ![Screenshot of the variables window with the created variable names](media/variables-window-with-created-variable-names.png)

7. Search for **Run application** in the **Actions** pane, and then drag it onto the design canvas to create our first process action.

   ![Screenshot of a Run Application action dialog that has been added to the authoring canvas](media/run-application-action.png)

8. Enter the following information in the parameter list, and then select **Save**.

    - **Application Path:** C:\Program Files (x86)\SAP\FrontEnd\SapGui\sapshcut.exe

    -   **Command line arguments:** start -system=%SAPSystemId% -client=%SAPClient% -user=%SAPUser% -pw=%SAPPassword% -maxgui

    -   **Window style:** Maximized

    - **After application launch:** Wait for application to complete

   ![Screenshot of Run Application dialog box with parameters entered ](media/run-application-dialog-with-parameters-entered.png)

9. Now search for the **Wait** action, drag it onto the design canvas, enter **10** seconds wait time into the **Duration** field, and then select **Save**.

   ![Screenshot of Power Automate Desktop Designer window with a Wait action dialog box open ](media/power-automate-desktop-designer-with-wait-action.png)

10. Search for the **Run VBScript** action, drag it onto the design canvas, and paste the previously generated and optimized VBScript into the **VBScript to run** field, and then select **Save**.

    ![Screenshot of Power Automate Desktop Designer window with Run VBScript dialog box open ](media/power-automate-desktop-designer-with-run-vbscript.png)

11. Open the **SAP Logon 760** (your version might differ) application, connect to an SAP system, and then sign into **SAP Easy Access**.

12. In Power Automate Desktop, select the **UI elements** icon on the right pane, expand **Add UI element**, and then select **Add a screen**.

    ![Screenshot of Power Automate Desktop Designer window with UI elements icon indicated ](media/power-automate-desktop-designer-with-UI-elements-icon.png)

    ![Screenshot of Power Automate Desktop Designer window with Add a screen panel open ](media/power-automate-desktop-designer-with-add-screen-panel.png)

13. Bring **SAP Easy Access** to the foreground, hover over the outermost frame of the SAP Easy Access window until a red border labeled **Window** appears. While the border is active, hold down **Ctrl**, and then click to select the window.

    ![Screenshot of an SAP Easy Access Window surrounded by a red bordered box ](media/SAP-easy-access-window.png)

14. Repeat steps 12 and 13 for the **SAP Logon 760** (your version might differ) window. You should now see the following in the UI elements pane.

    ![Screenshot of Power Automate Desktop Designer window with SAP Easy Access and SAP Login 760 windows shown in the UI elements pane ](media/power-automate-desktop-designer-window-with-SAP-easy-access-and-SAP-login-760-windows.png)

15. Search for the **Close Window** action, drag it onto the design canvas, and then in the **Window** drop-down menu, select **Windows 'SAP Easy Access'**.

    ![Screenshot of Power Automate Desktop Designer window with Close Window dialog box open ](media/power-automate-desktop-designer-window-with-close-window.png)

16. Repeat step 15, but this time select **Window 'SAP Logon 760'**.

17. Select **Save**. Your authoring canvas should look like this now.

    ![Screenshot of Power Automate Desktop Designer window with Save dialog box open ](media/power-automate-desktop-designer-window-with-save.png)

That's it! You've just configured your first SAP GUI automation desktop flow with Power Automate Desktop. In the next step, we'll set up an cloud flow that provides the input variables based on the employee's request.
