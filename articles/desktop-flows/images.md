---
title: Images | Microsoft Docs
description: Use the images pane to manage images in a desktop flow.
author: olegmelnykov
ms.service: power-automate
ms.topic: article
ms.date: 09/22/2020
ms.author: olmelnyk
ms.reviewer: olmelnyk
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Automate using images

To capture a new image in Power Automate Desktop, navigate to the **Images** tab on the right pane of the flow designer.

![The Images tab in the flow designer.](\media\images\images-pane.png)

Select **Capture image**, and click and drag the cursor on the area you want to capture. A magnifying glass will help you to capture the image with high precision.

![The Capture image option in the Images tab.](\media\images\capture-image.png)

Alternatively, select the arrow on the **Capture image** button to capture images on a timer. Select the number of seconds and press **Capture image with delay**.

![The Capture image with delay option in the images tab.](\media\images\delay-capture.png)

After capturing the image, populate a name for it in the dialog box and select OK to add it to the flow.

![The dialog prompting you to enter a name for the captured image.](\media\images\image-name.png)

## Manage captured images

To remove all the images that aren't used in any action, select the dots icon next to the **Capture image** option, and then select **Remove unused images**. If you navigate inside a specific folder, the **Remove unused images** option will remove only the unused images located in this folder.

To create a new folder, select **Add a new folder** and specify a name for the created folder. You can store images into a specific folder by capturing them while the folder is open.

![The Remove unused images and Add a new folder options on the Images tab.](\media\images\remove-unused-images.png)

To rename or delete images and folders, right-click on the respective item and select the appropriate function. Select the image thumbnail to open and view it.

![The rename and delete options of the images.](\media\images\rename-delete-images.png)

To find where an image is being used in the flow, right-click on it and select **Find usages**. The results will present the actions that use the specific image. Double-clicking on a result will highlight the action in the workspace.

![find usages results pane](\media\images\find-usages-results.png)

## Use images in actions

After capturing images, you can use them as input in actions that require them, such as the **Move mouse to image** action.

![The Move mouse to image action.](\media\images\move-mouse-image-action.png)

In the advanced settings of these actions, you can select which image matching algorithm you want to use.

![The advanced settings of the Move mouse to image action.](\media\images\move-mouse-image-action-advanced.png)

[!INCLUDE[footer-include](../includes/footer-banner.md)]