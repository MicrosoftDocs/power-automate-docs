---
title: Troubleshooter
description: Troubleshooter application for Power Automate for desktop.
author: YiannisMavridis
ms.subservice: desktop-flow
ms.topic: troubleshooting
ms.date: 11/14/2023
ms.author: iomavrid
ms.reviewer: matp
contributors:
- YiannisMavridis
search.audienceType: 
  - flowmaker
  - enduser
---

# Troubleshooter

[!INCLUDE [cc-beta-prerelease-disclaimer](actions-reference/includes/cc-beta-prerelease-disclaimer.md)]

The troubleshooter in Power Automate for desktop is a component that allows you to diagnose, and in certain cases, troubleshoot, potential issues that you might face in the desktop application of Power Automate.

:::image type="content" source="media/troubleshooter/Troubleshooter window GA.png" alt-text="Troubleshooter main screen" border="false":::

The troubleshooter includes two categories of diagnostics, for connectivity and UI/Web automation issues, while it also hosts the functionality that puts Power Automate in an improved diagnostics state for troubleshooting purposes.

>[!NOTE]
>The existing categories don't require you to be logged in to use the troubleshooter.

The troubleshooter can be manually opened via the console and the flow designer, through the dedicated menu under **Help** > **Troubleshooter**. It can also be opened via the process file PAD.Troubleshooter.exe, found in the installation folder of Power Automate for desktop.

<!-- :::image type="content" source="media/troubleshooter/Troubleshooter option under Help menu.png" alt-text="Troubleshooter option under Help menu" border="false":::  -->

## Connectivity issues

The connectivity issues diagnostic includes a series of steps that are followed in a set order to check whether Power Automate for desktop has the required access to a predetermined list of public endpoints. These are necessary for the desktop application to work without issues.

On a high level, there are three steps that are checked one after the other:

* Internet connection
* Proxy server
* Required services

:::image type="content" source="media/troubleshooter/Steps of connectivity issues diagnostic GA.png" alt-text="All steps of diagnostic with no issues detected" border="false":::

For the **internet connection**, the troubleshooter checks in sequence:

1. If an active internet connection can be detected.
2. If there's proper DNS resolution for the endpoints that need to be checked, mapping their domain names to IP addresses.
3. If a sample Microsoft page can be pinged.
4. If the required endpoints can be reached.

For the **proxy server**, the troubleshooter checks if there's any proxy related error regarding the endpoints. For the **required services**, the troubleshooter checks if the endpoints are properly set up and running.

If one step fails with an error, the following steps aren't checked at all, as the success of one check on connectivity issues is a requirement to proceed to the following step.

:::image type="content" source="media/troubleshooter/Connectivity error detected GA.png" alt-text="Connectivity error detected during step" border="false":::

> [!NOTE]
> In case of one or more errors, the respective details are displayed in the troubleshooter screen, after expanding the corresponding error.

After a category is checked for issues end to end, there’s always the option to generate the report of that check, which includes all the detailed steps that were followed therein. The report is produced in CSV format and is available independently of whether the check was successful or had errors.

Τhere can be relevant connectivity errors while using Power Automate for desktop. In those cases, you're prompted to launch the troubleshooter directly, through a link in the error dialog. Doing so automatically opens and runs the connectivity issues category.

:::image type="content" source="media/troubleshooter/error-dialog-with-troubleshooter-link.png" alt-text="Connection error detected dialog with troubleshooter link" border="false":::

## Improve troubleshooting

Apart from the various diagnostics, the troubleshooter also hosts the verbose logging functionality. As per the respective description in the troubleshooter app, the toggle button can be turned on and off, forcing the Power Automate desktop application to function in a verbose logging state. This means that any action taken from you, from that point on, is logged with verbose details in local files. The log files are generated in the default path mentioned in the description (**PowerAutomateVerbose** subfolder in your **Documents** folder).

Because of this feature’s nature, we recommend that you not leave verbose logging on permanently as there might be slower performance and capacity issues. While verbose logging is enabled, Power Automate constantly produces files with verbose logs, which may eventually consume a larger disk capacity. So enable this mode only for the purposes of reproducing the issue faced and capturing the respective logs, before turning it off again.

There are two registry entries related to verbose logging, as explained in [Improve troubleshooting of the Power Automate troubleshooter](governance.md#improve-troubleshooting-of-the-power-automate-troubleshooter) and [Turn on verbose logging state in Power Automate for desktop](governance.md#turn-on-verbose-logging-state-in-power-automate-for-desktop).

When verbose logging is enabled, the corresponding info banner appears in the console and all the flow designers that are open at the same time. This is so you know that you're in a state that shouldn't be used permanently. You can turn off the functionality directly through that banner.

:::image type="content" source="media/troubleshooter/verbose-logging-banner.png" alt-text="Verbose logging banner" border="false":::

The console and the designer are affected immediately, when verbose logging is enabled. This means that from that point on, your actions produce verbose logs.

> [!NOTE]
> This is not the case for a recording session, or a flow that may be already running - those scenarios respect the state of verbose logging at the beginning of the corresponding procedure, and aren't affected in real time.
In other words, verbose logging needs to be already on, before starting a recording session or running a flow, for the respective events to be logged under the verbose state.

When you turn off verbose logging, the **Export logs** button becomes available in the troubleshooter window. This allows you to collect all the produced log files and zip them in a single .zip file for convenience, before deleting the original individual files.

### Known issues and limitations

When **Export logs** is used when at least one flow designer is open, not all files may be saved in the .zip file, as some of them are used in the designer process. Those files can’t be automatically deleted.

## See also

[Troubleshoot desktop flows](troubleshoot.md)
