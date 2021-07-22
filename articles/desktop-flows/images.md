---
title: Images | Microsoft Docs
description: Use the images pane to manage images in a desktop flow.
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 09/22/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Automate using images



On the right-hand side pane, select the **Images** tab.

![images pane.](\media\images\images-pane.png)

Select **Capture image**, and a crosshair with a magnifying glass will appear. Then, capture the image by clicking and dragging, while using the magnifying glass for pixel precision.

![capture image.](\media\images\capture-image.png)

Additionally, select the arrow on the **Capture image** button to capture images on a timer. Select the number of seconds and enter a new value to adjust the timer.

![delay capture.](\media\images\delay-capture.png)

After capturing an image, specify a name for it in the dialog box and select **OK** to add it to the flow.

![image name.](\media\images\image-name.png)

Select **Add a new folder** and specify a name to create a folder in Images. Sort images into folders by capturing images while the specific folder is open. Navigate back by clicking on **Home**.

To rename or delete images or folders, right-click on an item and select the appropriate function. Select the image thumbnail to open and view it.

![rename delete images.](\media\images\rename-delete-images.png)

To find where the image is being used in the flow, right-click the image and select **Find usages**. The results will show the actions which use the image. Double-clicking on a result will highlight the action in the workspace.

![find usages results pane.](\media\images\find-usages-results.png)

### Known issues and limitations

- **Issue**: In some cases, when you rename an image, actions that use the renamed image may no longer work as you might expect.


- **Workarounds**: Open and save one of the actions that uses the image resolves the issue




[!INCLUDE[footer-include](../includes/footer-banner.md)]