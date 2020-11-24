---
title: Overview of Process Advisor | Microsoft Docs
description: Overview of the Process Advisor feature in Power Automate.
services: ''
suite: flow
documentationcenter: na
author: nijemcevic 
manager: kvivek
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/09/2020
ms.author: tatn
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---
# Work with of Processes

Before you can use Process Advisor to visualize and analyze your processes, you have to:

- Create your process in Process Advisor.
- Record the activities that make up the process in the Process Advisor recorder.
- Prepare the recording for analysis.

## Create a process

In general, processes that you think might be inefficient or repetitive are good candidates for analysis. It should also be limited to a single user, and not suited for complicated business processes that involve multiple individuals.

1. Sign in to [Power Automate](https://powerautomate.microsoft.com/).
1. Select **Process advisor (preview)** in the left-side navigation pane.
1. Select Create under **Process advisor (preview)**.
1. Select the Create a new process tile.
1. Give your process a name and optionally a description, then select Create.

## Record your process

Create a recording in one of three ways:

- From the **Create** screen in Process Advisor
- Immediately following process creation
- From the process details page

### Create a recording From the 'Create' screen

1. From the **Process Advisor (preview)** > Create page, select Add a new recording.
2. Under the Process dropdown, select the process you want to record for.
3. Press Open recorder.
If you are not able to see the process in the dropdown, ensure that the process has been correctly shared with you.
Immediately following process creation
1. After the process is created, a creation successful modal will be shown with a few options as next steps.
2. Select Add a recording.
From the process details page
1.	From the **Process Advisor (preview)** > Processes page, select the process you want to record for from the list view.
2.	Click on the name of the process to get to the process details page.
3.	Select New recording from the command bar.
4.	Press Open recorder.
Launching the recorder in Power Automate Desktop
1.	From any of the ways described above, you should now see a modal that says Launching the recorder in Power Automate Desktop.
2.	We recommend that you Download Power Automate Desktop first, but if you did not, you can select Get the app now to download and install it.
5.	If you have installed Power Automate Desktop, you should get a browser popup to Open Power Automate Desktop, select it to open the app.
6.	If Power Automate Desktop is installed but didn’t open correctly, try pressing Open again.
Power Automate Desktop Recorder
1.	In the Desktop recorder screen, select Start recording to start recording.
2.	Perform the actions that you want to record, and when finished press Finish on the bottom of the recorder window.
3.	Once the recording has saved successfully press Got it to close the popup.
4.	Return to the web portal in your browser, and press View recording.

Note: Depending on the length of the recording, it may take some time before the actions will be available.
Recorder features
-	As you record your actions, the action descriptions will be listed in the recorder window. You can click the trashcan icon to delete any action from your recording.
-	Pause the recording by pressing Pause recording at any time during the recording, continue recording from where you left off by pressing Start recording again.
-	Reset the recording by pressing Reset recording to erase all the recorded actions and start over.
Recording Tips
-	Be more methodical in your actions to improve the readability of the recording. There is a slight delay so wait for the red box to focus on the item you are trying to interact with before selecting.
-	If there were mis-clicks, delete the action in the recorder window. 
Prepare a recording for analysis
Once the recording has completed, you can view the recorded actions in the recording details page. More importantly, you need to prepare the recording to be ready for analysis. What does this mean?
-	The actions recorded are very granular, group them into activities. These will be the building blocks for the process map that is created through analysis.
-	Remove any sensitive information from the recording, refer to link for more information on privacy.
Grouping actions into activities
1.	Select Add group to add a group header. All actions under the group header and before the next group header are considered part of the group.
2.	Move the group header up and down the actions list to where you want to group to start.
3.	Name your group on the right side of the screen.
4.	Use the dropdown to find group names that already exist for the process or create your own.
5.	If you made a mistake and want to delete a group, use the trash can icon next to the group name.
6.	At any time, press Save on the top right to save your work.
7.	To be ready to analyze, you need at least 2 groups (otherwise the process map will not be very meaningful).
8.	When you finish grouping, set the Ready to analyze toggle next to Save.
9.	Press Close to return to the process details page.
Removing sensitive information
1.	Select the step which contains sensitive information.
2.	Edit the step name or description to remove any sensitive information such as account numbers or passwords.
3.	Delete any screenshots that contain sensitive information.
Grouping tips
-	As much as possible use an existing group name, this will create a more consistent and accurate process map.
-	Group names will be available from the dropdown whenever a recording is saved, but to remove group names from the dropdown that was removed from all recordings that used the group names, you need to analyze the recording.


## See also

