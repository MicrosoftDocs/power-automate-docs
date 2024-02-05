---
title: Workstation actions reference
description: See all the available workstation actions.
author: mattp123

ms.subservice: desktop-flow
ms.topic: reference
ms.date: 11/24/2022
ms.author: matp
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# Workstation actions

The workstation group of actions provides a collection of actions that automate some essential functionalities of your workstation.

To print a document, deploy the **Print document** action and populate the path of the file you want to print.

:::image type="content" source="media/workstation/print-document-action.png" alt-text="Screenshot of the Print document action.":::

To change the default printer of the workstation, use the **Set default printer** action. To check which is the current default printer, use the  **Get default printer** action.

If you want to sign out of your Windows account, use the **Log off user** action. Additionally, you can use the **Shutdown computer** and **Lock workstation** actions to shut down or lock your workstation, respectively.

To change the resolution of any of your screens, use the **Set screen resolution**. This action requires you to populate the ID number of the screen, the width and height, the bit count, and the frequency. You can select **Available screen resolutions** to see all the available resolutions for each screen. Also, you can retrieve the current values of the mentioned attributes with the **Get screen resolution** action.

:::image type="content" source="media/workstation/set-screen-resolution-action.png" alt-text="Screenshot of the Set screen resolution action.":::

## <a name="printdocument"></a> Print document

Prints a document on the default printer.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Document to print|No|[File](../variable-data-types.md#files-and-folders)||The path of the document to print|

### Variables produced

This action doesn't produce any variables.

### <a name="printdocument_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Document not found|Indicates that the specified document wasn't found|
|Access denied for document|Indicates that access was denied for the provided document|
|Can't print document|Indicates a problem printing the specified document|

## <a name="getdefaultprinter"></a> Get default printer

Gets the name of the default printer.

### Input parameters

This action doesn't require any input.

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|PrinterName|[Text value](../variable-data-types.md#text-value)|The name of the default printer|

### <a name="getdefaultprinter_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't get default printer|Indicates a problem getting the default printer|

## <a name="setdefaultprinter"></a> Set default printer

Sets a printer as the default printer.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Printer name|No|[Text value](../variable-data-types.md#text-value)||The name of the printer to set as default|

### Variables produced

This action doesn't produce any variables.

### <a name="setdefaultprinter_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't set default printer|Indicates a problem setting the default printer|

## <a name="showdesktop"></a> Show desktop

Shows the desktop.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Operation|N/A|Minimize all windows (show desktop), Restore all windows (undo show desktop)|Minimize all windows (show desktop)|Specify whether to minimize all windows to reveal the desktop or restore all windows to their original respective states|

### Variables produced

This action doesn't produce any variables.

### <a name="showdesktop_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="lockworkstation"></a> Lock workstation

Locks the workstation's display to protect it from unauthorized use.

### Input parameters

This action doesn't require any input.

### Variables produced

This action doesn't produce any variables.

### <a name="lockworkstation_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't lock the computer in non interactive mode|Indicates a problem locking the computer in non interactive mode|
|Can't lock the computer|Indicates a problem locking the computer in non-interactive mode|

## <a name="playsoundbase"></a> Play sound

Plays a system sound or a wav file.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Play sound from|N/A|System, WAV file|System|The type of sound to play|
|Sound to play|N/A|Asterisk, Beep, Exclamation, Hand, Question|Asterisk|The specific sound to play|
|File to play|No|[File](../variable-data-types.md#files-and-folders)||The full path of the specific WAV file to play|

### Variables produced

This action doesn't produce any variables.

### <a name="playsoundbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't find sound file|Indicates that the sound file couldn't be found|
|Invalid sound file|Indicates an invalid sound file|

## <a name="emptyrecyclebin"></a> Empty recycle bin

Deletes all files from the windows recycle bin.

### Input parameters

This action doesn't require any input.

### Variables produced

This action doesn't produce any variables.

### <a name="emptyrecyclebin_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="takescreenshotbase"></a> Take screenshot

Takes a screenshot of the foreground window or the specified screen and saves the image in a file or to the clipboard.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Capture|N/A|All screens, Primary screen, Select screen, Foreground window|All screens|The area to capture|
|Screen to capture|No|[Numeric value](../variable-data-types.md#numeric-value)||Specify which screen to capture|
|Save screenshot to|N/A|Clipboard, File|Clipboard|The location to save the screenshot to|
|Image file|No|[File](../variable-data-types.md#files-and-folders)||The full path of the file name where the captured image will be saved|
|Image format|N/A|BMP, EMF, EXIF, GIF, JPG, PNG, TIFF, WMF|BMP|The format for the image file to save|

### Variables produced

This action doesn't produce any variables.

### <a name="takescreenshotbase_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to take screenshot|Indicates a problem taking the screenshot|
|Failed to save screenshot to file|Indicates a problem saving the screenshot to a file|
|Failed to set screenshot to clipboard|Indicates a problem setting the screenshot to the clipboard|
|Failed to get specified screen|Indicates a problem getting the specified screen|

## <a name="controlscreensaver"></a> Control screen saver

Enables, disables, starts or stops the screensaver.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Screen saver action|N/A|Enable, Disable, Start, Stop|Enable|The function of the screensaver|

### Variables produced

This action doesn't produce any variables.

### <a name="controlscreensaver_onerror"></a> Exceptions

This action doesn't include any exceptions.

## <a name="getscreenresolution"></a> Get screen resolution

Gets the width, height, bit count and frequency of a selected monitor.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Monitor number|No|[Numeric value](../variable-data-types.md#numeric-value)||The number of the monitor to get the resolution of|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|MonitorWidth|[Numeric value](../variable-data-types.md#numeric-value)|The width of the monitor|
|MonitorHeight|[Numeric value](../variable-data-types.md#numeric-value)|The height of the monitor|
|MonitorBitCount|[Numeric value](../variable-data-types.md#numeric-value)|The monitor bit count|
|MonitorFrequency|[Numeric value](../variable-data-types.md#numeric-value)|The monitor frequency|

### <a name="getscreenresolution_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to get the screen's resolution|Indicates a problem getting the screen's resolution|

## <a name="setscreenresolution"></a> Set screen resolution

Sets the width, height, bit count and frequency of a selected monitor during an attended desktop flow run.

> [!IMPORTANT]
> To use the **Set screen resolution** action in flows triggered through cloud flows, you must be connected to the console session of your machine, where you can manually change the screen resolution. For example, you can use your machine's physical screen to connect to the machine. In remote sessions, such as unattended scenarios that use remote desktop clients, the action has no effect, as users can't manually change the resolution.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Monitor number|No|[Numeric value](../variable-data-types.md#numeric-value)||The number of monitor to set the resolution of|
|Monitor width|No|[Numeric value](../variable-data-types.md#numeric-value)||The value to set the monitor width to|
|Monitor height|No|[Numeric value](../variable-data-types.md#numeric-value)||The value to set the monitor height to|
|Monitor bit count|No|[Numeric value](../variable-data-types.md#numeric-value)||The value to set the monitor bit count to|
|Monitor frequency|No|[Numeric value](../variable-data-types.md#numeric-value)||The value to set the monitor frequency to|

### Variables produced

This action doesn't produce any variables.

### <a name="setscreenresolution_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Failed to set the screen's resolution|Indicates a problem setting the screen's resolution|

## <a name="logoffuser"></a> Log off user

Logs off the current user.

>[!NOTE]
> When you run the **Log off user** action through the flow designer, the action prompts you to verify that you want to log off the current user. However, the action doesn't require confirmation when the flow runs through the console or cloud flows. In all cases, the action will terminate the flow.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Force log off|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to force the user account to log off, regardless of unsaved files or programs that won't close|

### Variables produced

This action doesn't produce any variables.

### <a name="logoffuser_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't log off user in non interactive mode|Indicates a problem logging off the user in non-interactive mode|
|Can't log off the current user|Indicates a problem logging off the current user|

## <a name="shutdowncomputer"></a> Shutdown computer

Instructs the computer to shut down.

> [!IMPORTANT]
>
> - Although a desktop flow containing the **Shutdown computer** action is set to shut down the machine, some unrelated factors, such as other running Windows processes, may prevent it from achieving it.
> - When you run the **Shutdown computer** action through the flow designer, the action prompts you to verify that you want to shut down the computer. However, the action doesn't require confirmation when the flow is run through the console or cloud flows. In all cases, the action will terminate the flow.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|Action to perform|N/A|Shutdown, Restart, Suspend, Hibernate|Shutdown|Specify which shutdown option the computer will perform|
|Force|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to force the computer to shut down, regardless of unsaved files or programs that won't close|

### Variables produced

This action doesn't produce any variables.

### <a name="shutdowncomputer_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Can't shut down the computer|Indicates a problem shutting down the computer|

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
