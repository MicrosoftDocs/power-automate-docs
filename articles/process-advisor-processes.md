---
title: Prepare processes and recordings in process advisor (contains videos) | Microsoft Docs
description: Before you can use process advisor task mining, learn how to create a process, record the activities, and prepare the recording for analysis.
author: donums
contributors:
  - donums
  - v-aangie 
ms.subservice: process-advisor
ms.topic: conceptual
ms.date: 11/15/2022
ms.author: derahonuorah
ms.reviewer: angieandrews
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Prepare processes and recordings in process advisor

Before you can use process advisor task mining to visualize and analyze your processes, you need to:

- [Create your process](#create-a-process) in process advisor.
- [Record the activities](#record-your-process) that make up the process using the Power Automate recorder.
- [Prepare the recording for analysis](#prepare-a-recording-for-analysis).
- (Optional) [Create recommended activity names](#create-recommended-activity-names) to make it easier for you and others to prepare the recording for analysis.

Learn more about process advisor processes in the following video.<br>
</br>
>[!VIDEO https://www.microsoft.com/videoplayer/embed/RWKx7r]

## Create a process

In general, processes you think might be inefficient or repetitive are good candidates for analysis.

1. Sign in to [Power Automate](https://make.powerautomate.com).

1. On the left-side navigation pane, select **Process advisor** .

1. In the **Create a new process** section, select the **Start here** tile.

1. Enter a name for your process and description, and then select **Recordings**.

1. Select **Create**.

## Record your process

Create a recording in one of two ways:

- [Right after process creation](#create-a-recording-right-after-process-creation).
- [From the process details page](#create-a-recording-from-the-process-details-screen)

### Create a recording right after process creation

After you create a process, you'll see a screen with two options as next steps.

- Select **Add a recording**.

### Create a recording from the process details screen

1. Select **Process advisor** > **All processes** below the tiles to the right.

    :::image type="content" source="media/all-processes-recording.png" alt-text="Screenshot of the 'process advisor home screen with the 'All processes' button.":::

1. Select the name of the process to go to the process details screen.

1. On the menu at the top, select **New recording**.

    :::image type="content" source="media/new-rec-button.png" alt-text="Screenshot of the 'New recording' button.":::

1. Select **Open recorder**.

### Launching the recorder in Power Automate

1. By using any of the methods described previously, you should receive a message that says **Launching the recorder in Power Automate**.

    > [!NOTE]
    >
    > You should've [downloaded Power Automate](https://go.microsoft.com/fwlink/?linkid=2102613) before you started. However, you can also select **Get the app** to install it.

1. If you've installed Power Automate, you should see an **Open Power Automate** browser pop-up window. Select it to open the app.

1. If Power Automate is installed but doesn’t open correctly, select **Open again**.

    :::image type="content" source="./media/launch-recorder.png" alt-text="Screenshot of the 'Launching the recorder in Power Automate Desktop' screen.":::

## Power Automate recorder

1. On the Desktop recorder screen, select **Record**.

1. Perform the actions that you want to record, and then select **Finish** at the bottom of the recorder screen.

    :::image type="content" source="./media/desktop-recorder.png" alt-text="Screenshot of the 'Desktop recorder' screen.":::

1. After the recording has been saved successfully, select **View recording** to view the recorded steps and prepare the recording for analysis.

   > [!NOTE]
   >
   > Depending on the length of the recording, it may take some time before the actions will be available.

### Recorder features

As you record your actions, the action descriptions will be listed in the recorder screen.
- To delete any action from your recording, select the trash can icon.

- To temporarily stop recording, select **Pause recording** at any time during the recording.

- To continue recording from where you left off, select **Start recording again**.

- To erase all the recorded actions and start over, select **Reset recording**.

### Recording tips

- To improve the readability of the recording, it is important to be methodical in your actions. This includes waiting for the red box to focus on the item you're trying to interact with before selecting it, as there may be a slight delay.

- If there were any selections made by mistake, delete the action in the recorder screen.

- If you record steps that is not intended to be a part of the process, delete the step using the trash icon.

## Prepare a recording for analysis

Once the recording is finished, the recorded actions can be viewed on the recording details screen. However, it is important to prepare the recording for analysis before proceeding.

*What does this mean?*

- This means that the actions that were recorded during the process can be very detailed and specific. In order to make sense of them and create a clear process map, these actions need to be grouped together into larger activities. Process advisor now has the ability to automatically group similar actions into activities.

- It's important to ensure that any sensitive information is removed from the recording before analysis. This can be done to protect data privacy and security. For more information on how to protect your data in process advisor visit [Protect your data in process advisor](process-advisor-protect.md).

Here's a short video on how to prepare a recording for analysis with process advisor.</br>
</br>
> [!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RWN6PQ]

### Grouping actions into activities

Once you have completed the recording process, you may notice that some activities have already been automatically created for you. You have the option to keep these activities as they are, or you can modify them to better suit your needs.

#### Edit an existing activity

1. If you want to change the starting action of an activity, simply drag the header of the activity up or down the list of actions to the desired starting point.

2. To change the name of an activity, select it and a combo box will appear on the right side of the screen.

3. You can choose from existing activity names in the dropdown list or create your own if needed.

#### Add a new activity

1. Select **Add activity** to add an activity header. All actions below the header and before the next activity header are part of the group.

1. Move the activity header up or down the actions list to where you want the activity to start.

1. Name the activity on the right side of the screen, using the dropdown list to find existing activity names or create a new one.

    :::image type="content" source="./media/group-actions.png" alt-text="Screenshot of grouping actions into activities.":::

#### Delete an activity

To analyze, you need at least two activities. Otherwise, the process map wouldn't be meaningful.

1. If you don't want an auto create activity or made a mistake and want to delete an activity, select **Delete activity** in the command bar.

1. If you don’t want any of the auto created activities or just want to start over from scratch, select **Delete all activities** in the command bar.

1. At any time, select **Save** on the top right to save your work.

#### Save and analyze

1. When you finish grouping, select **Save and analyze** on the top right.

1. Once analyzed, select **View analytics** in the notification bar to go to the analytics page. For more information, go to [Analyze processes in process advisor](process-advisor-analyze.md).

    :::image type="content" source="./media/view-analytics-button.png" alt-text="Screenshot of the 'View analytics' button.":::

1. Alternatively, you can save without analyzing by selecting the caret next to **Save and analyze**, and then select **Save**.  

1. Select **Close** to return to the process details screen.

### Grouping tips

Here are some tips to group actions into activities, which may be helpful for your use case.

1. **Use existing activity name**: This creates a more consistent and accurate process map. Activity names will be available in the dropdown list whenever a recording is saved. To remove an activity name from the  list after it was removed from all recordings that used that name, you need to analyze the recording.

2. **Look for patterns**: Analyze the recorded actions for patterns that occur frequently, such as similar steps taken to complete a task or common applications used. Grouping these actions together can help identify common activities.

3. **Use discretion**: Group actions together that make sense to you and are related to the overall process. For example, if you are analyzing a sales process, you might group actions related to lead generation, outreach, and closing deals.

4. **Consider frequency**: You may want to group actions that occur frequently together. This can help identify bottlenecks in the process or areas where automation could be beneficial.

5. **Think about dependencies**: Consider grouping actions that have dependencies on each other. For example, if you need to download a file before uploading it, these two activities could be grouped together.

6. **Use feedback**: Collaborate with other stakeholders in the process, such as employees who perform the tasks or supervisors who oversee the process, to get feedback on the grouping of actions. Their insights can help improve the accuracy and usefulness of the process map.

### Create recommended activity names

As a process owner or co-owner, you can create recommended activity names for a process. This will ensure more consistency in naming across recordings.

1. On the process details screen, select **Create activity names** to bring up the panel.

    :::image type="content" source="./media/create-act-names.png" alt-text="Screenshot of the 'Create activity names' button.":::

1. To add a new activity name entry to the recommended list, select **New name**.

1. When you're done, select **Save**.

The activity names you added will now show up under **Recommended names** in the dropdown list when grouping actions for a recording. Any activities that aren't defined in the recommended list will show up under **Custom names**.

[!INCLUDE[footer-include](includes/footer-banner.md)]
