---
title: "Create a mobile task flow with Power Apps | MicrosoftDocs"
description: "Learn about how to create a mobile task flow with Power Apps."
ms.custom: ""
ms.date: 06/11/2018
ms.suite: ""
ms.tgt_pltfrm: ""
ms.service: power-automate
ms.subservice: cloud-flow
ms.topic: how-to
applies_to: 
  - "Dynamics 365 (online)"
  - "Dynamics 365 Version 9.x"
  - "Power Apps"
ms.assetid: 046480e6-f2ff-4c56-9e03-f642c982ff7d
caps.latest.revision: 12
author: "Mattp123"
ms.author: "angieandrews"
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---
# Create a mobile task flow


Design a cloud flow in Dynamics 365 for phones or Dynamics 365 for tablets based on common tasks your users perform. For example, if they need to regularly perform a series of follow-up steps after client meetings, create a task flow. When users tap the new task in their mobile app, it will lead them through from start to finish so they don't forget an important step.  
  
 Task flows can use multi-table forms and logic, and can have form logic that runs across the task flow pages.  
  
## Create a task flow
  
1. Make sure that you have the System Administrator, or System Customizer security role or equivalent permissions. The Manager, Vice President, or CEO-Business Manager, security roles can also create mobile task flows. 
  
2. Open [solution explorer](/powerapps/maker/model-driven-apps/advanced-navigation#solution-explorer) and select **Processes**.  
  
3.  On the **Actions** toolbar, select **New**.  
  
4.  In the **Create Process** dialog box, complete the required fields:  
  
    -   Enter a process name.  
  
    -   In the **Category** list, select **Business Process Flow**.  
  
    -   In the **Table** list, select the table you want.  
  
5.  Select the **Run process as a task flow (Mobile online)** option.  
  
6.  Select **OK**.
  
     The task flow designer opens in a new window.  
  
     ![Task flow designer window.](media/task-flow-designer-window.png "Task flow designer window") 
  
7.  If your users will progress from one page to another in order, drag the **Page** component from the **Components** tab on the right side of the screen and drop it on the + sign in the appropriate spot. To add a name for a page, select the page, select the **Properties** tab, type a new name, and then select **Apply**.  
  
8.  To add a branch to the task flow, drag the **Condition** component from the **Components** tab and drop it on the + sign in the appropriate spot. To set properties for the condition, select the condition, set the properties in the **Properties** tab, and then select **Apply**.  
  
    > [!NOTE]
    >  As you add pages and conditions to the task flow, you'll see a minimap in the lower-left corner of the window that shows all the pages and conditions in the task flow.  
  
9. To add a field, label,  or section label  to a page, drag **Field**, **Label**, or **Section Label** from the **Components** tab to the appropriate page. To change the properties for one of these items, select the item, set the properties in the **Properties** tab, and then select **Apply**.  
  
10. To validate the task flow, select **Validate** on the action bar.  
  
11. To save the process as a draft, select **Save** at the top of the screen. (As long as a process is a draft, people won’t be able to use it.)  
  
12. To activate the task flow so that people can use it, select **Activate**.  
  
> [!TIP]
>  Here are a few tips to keep in mind as you work on your task flow in the designer window:  
>   
> -  To take a snapshot of everything in the task flow window, select **Snapshot** on the action bar.  
> -  To connect a valid component to another valid component in the designer, select **Connector** on the action bar.  
> -  You can make the images on the screen larger or smaller by selecting the **Increase the zoom level** or **Decrease the zoom level** buttons in the upper-right corner of the screen. Select the **Fit to canvas** button to blow the images up to the largest size that fits on the screen.  
  
## Next steps  
 [Create a business process flow](create-business-process-flow.md)   



[!INCLUDE[footer-include](includes/footer-banner.md)]
