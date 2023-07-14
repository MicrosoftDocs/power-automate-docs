---
title: Troubleshooter (preview)
description: Troubleshooter application for Power Automate for desktop.
author: YiannisMavridis
ms.subservice: desktop-flow
ms.topic: troubleshooting
ms.date: 07/12/2023
ms.author: iomavrid
ms.reviewer: tapanm
contributors:
- YiannisMavridis
search.audienceType: 
  - flowmaker
  - enduser
---

# Troubleshooter (preview)

The troubleshooter in Power Automate for desktop is a new component that has been introduced in public preview, which allows to diagnose (and in certain cases, troubleshoot) potential issues that the user might be facing in the desktop application of Power Automate.

:::image type="content" source="media/troubleshooter/Troubleshooter window.png" alt-text="Troubleshooter window" border="false":::

The troubleshooter currently includes two categories of diagnostics, for connectivity and UI/Web automation issues, while it also hosts the functionality that puts Power Automate in an improved debuggability state for troubleshooting purposes. 

>[!NOTE]
>The existing categories do not require the user to be logged in to use the troubleshooter.

The troubleshooter can be manually launched via the console and the flow designer, through the dedicated menu option under ‘Help’. It can also be launched via the process ‘PAD.Troubleshooter.exe’, found in the installation folder of Power Automate for desktop.

:::image type="content" source="media/troubleshooter/Troubleshooter option under Help menu.png" alt-text="Troubleshooter option under Help menu" border="false":::
 
## Connectivity issues

The connectivity issues diagnostic includes a series of steps that are followed in a set order, to check whether Power Automate for desktop has the required access to a predetermined list of public endpoints, which are necessary for the desktop application to work without issues.

On a high level, there are three steps that are checked one after the other:
* Internet connection
* Proxy server
* Required services

:::image type="content" source="media/troubleshooter/Steps of connectivity issues diagnostic.png" alt-text="Steps of connectivity issues diagnostic" border="false":::

For the **internet connection**, the troubleshooter checks in sequence:
1.	If an active internet connection can be detected
2.	If there is proper DNS resolution for the endpoints that need to be checked, mapping their domain names to IPs
3.	If a sample Microsoft page can be pinged
4.	If the required endpoints are indeed reachable

For the **proxy server**, we check if there is any proxy related error regarding the endpoints, while for the **required services**, we check if the endpoints are properly up and running.

If one step fails with an error, the following steps are not checked at all, as the success of one check on connectivity issues is a requirement to proceed to the following step.

:::image type="content" source="media/troubleshooter/Connectivity error detected.png" alt-text="Connectivity error detected" border="false":::

>[!NOTE]
>In case of one or more errors, the respective details are displayed in the troubleshooter’s screen, after expanding the corresponding erroneous step.

After a category is checked for issues end to end, there’s always the option to generate the report of that check, which includes all the detailed steps that were followed therein. The report is produced in CSV format, and is available independently of whether the check was successful or included errors.

Τhere can be relevant connectivity errors while using Power Automate for desktop, so in those cases, the user is now prompted to launch the troubleshooter directly, through a link in the error dialog. Doing so automatically opens and runs the connectivity issues category.

:::image type="content" source="media/troubleshooter/Error dialog with troubleshooter link.png" alt-text="Error dialog with troubleshooter link" border="false":::

## Improved debuggability

Apart from the various diagnostics, the troubleshooter also hosts the verbose logging functionality. As per the respective description in the troubleshooter app, the toggle button can be turned on and off, forcing the Power Automate desktop application to function in a verbose logging state. This means that any action taken from the user from that point on, will be logged with verbose details in local files, which will be generated in the default path mentioned in the description (**PowerAutomateVerbose** subfolder in user’s **Documents** folder).

Because of this feature’s nature, it's recommended to not leave this mode on permanently, as there may be risks associated with slower performance and capacity issues. While improved debuggability is enabled, Power Automate constantly produces files with verbose logs, which may eventually consume a larger disk capacity. So the best practice is to enable this mode, only for the purposes of reproducing the issue faced and capturing the respective logs, before turning it off again.

There are two registry entries related to verbose logging, as explained [here](governance.md#enable-improved-debuggability-functionality-to-be-used-via-power-automates-troubleshooter) and [here](governance.md#turn-on-verbose-logging-state-in-power-automate-for-desktop).

When verbose logging is enabled, the corresponding info banner appears in the console and all the flow designers that are open at the same time, so that the users know that they are in a state that should not be used permanently. They also have the option to turn off the functionality directly through that banner.

:::image type="content" source="media/troubleshooter/Verbose logging banner.png" alt-text="Verbose logging banner" border="false":::

The console and the designer are affected immediately, when verbose logging is enabled – this means that from that point on, the users' actions will produce verbose logs. 

>[!NOTE]
>This is not the case for a recording session, or a flow that may be already running - those scenarios respect the state of verbose logging at the beginning of the corresponding procedure, and are not affected in real time.
In other words, verbose logging needs to be already on, before starting a recording session or running a flow, for the respective events to be logged under the verbose state.

After turning off verbose logging, the **Export logs** button becomes available in the troubleshooter window. This button allows to collect all the produced log files and zip them in a single .zip file for convenience, before deleting the original individual files.

### Known issues and limitations

When the **Export logs** button is used when at least one flow designer is open, not all files may be saved in the .zip file, as some of them are used in the designer process. Those files can’t be automatically deleted either.
