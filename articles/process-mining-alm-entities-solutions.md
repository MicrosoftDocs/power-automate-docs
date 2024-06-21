---
title: Transfer ALM Process Mining entities with Power Platform solutions
description: Learn how to use the process mining capability with sample data in a tutorial.
author: donums
contributors:
  - donums
  - v-aangie  
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 07/03/2024
ms.author: derahonuorah
ms.reviewer: angieandrews
search.audienceType: 
  - flowmaker
  - enduser
---

# Transfer ALM Process Mining entities with Power Platform solutions

For this example, we make these references:

- **Dev environment**: The environment *from* which you want to port process mining artifacts.
- **Test environment**: The environment *to* which you want to port process mining artifacts.

1. Sign in to [Power Automate](https://make.powerautomate.com).
1. Select your Dev environment.
1. In Process Mining, create your process.

    :::image type="content" source="media/process-mining-alm-entities-solutions/create-process.png" alt-text="Screenshot of the connections that can be configured.":::

1. After the process has been successfully created, navigate to Solutions from the left navigation (it may be under More).
14.	Create a new solution.
a.	From the top command bar, select + New solution.
b.	Provide a Display name.
c.	Select a Publisher.
d.	Select a Version.

5. Select **Create**.
6. After the solution has been created select Add existing from the command bar.
7. Select More > Other > PM Inferred Task.

 

8. From the Add existing PM Inferred Task list select the process you created and want to copy to the Test environment and select Add.
9. Once added, go back using the back arrow in the left navigation.
10. In Solutions you should now see the solution you created. Select the solution, select Export solution and Publish.

 

11.	After the publish is successful, select Next > Export.

12.	After the export a green message bar should appear. Select Download from the message bar.

 

13.	After the download is successful, go to your Test environment.

14.	From the left navigation go to Solutions.

15.	Import the solution.
a.	Select Import solution.
b.	Select Browse.
c.	From your file explorer select the solution you downloaded.
d.	Select Next.
e.	Select Import.

16.	After the solution has been successfully imported you should see the process mining homepage with an orange exclamation mark inside a speech bubble on it. When you select it follow the Setup process to complete the import to the Test environment.

 
You can update entities in your Test environment by upgrading or updating your solution: https://learn.microsoft.com/en-us/power-apps/maker/data-platform/update-solutions#apply-the-upgrade-or-update-in-the-target-environment 
To learn more solutions, go to Solution concepts - Power Platform | Microsoft Learn.
