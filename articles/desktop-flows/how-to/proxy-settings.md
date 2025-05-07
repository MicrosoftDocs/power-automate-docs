---
title: Configure Power Automate for desktop proxy settings
description: Configure the proxy settings of Power Automate for desktop to enable PAD components to access the Microsoft cloud services.
author: PetrosFeleskouras
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 05/02/2025
ms.author: pefelesk
ms.reviewer: 
contributors:
- PetrosFeleskouras
- DanaMartens
search.audienceType: 
  - flowmaker
  - admin
---
# Configure Power Automate for desktop proxy settings

To reach Microsoft's cloud services, it might be necessary for web requests originating from various Power Automate for desktop components to be directed through a network proxy server.

## When to configure proxy settings

Configure proxy settings when you’re connected to the internet using a proxy server.

The following are some of the proxy related errors you might encounter in a Power Automate for desktop component:

- > `System.Net.WebException: The remote server returned an error: (407) Proxy Authentication Required`
- > `System.Net.WebException`

    This issue might occur if Power Automate for desktop is installed by someone other than the intended user, such as help desk personnel or through automated deployment solutions like Configuration Manager.
- > `The proxy server in your network requires authentication.`
- > `The communication with the cloud services requires network proxy authentication.`
- > `During startup Power Automate couldn't sign you in. The proxy server in your network requires authentication.`

## How to configure proxy settings

Configure how Power Automate for desktop interacts with a proxy server using the Power Automate proxy configuration files. As an alternative, you can use the Windows registry to configure proxy settings that aren't available in the proxy configuration files.

> [!IMPORTANT]
> - From Power Automate for desktop version 2.45, the proxy settings can be configured in centralized way, through the Power Automate proxy configuration files, and are not overridden on a product upgrade.
> - It is suggested that you configure the proxy settings using only the **Power Automate proxy configuration files**, as they apply to all the on-premises components. Proxy settings configured through **Windows registry** apply only to a subset of components like the Console and Designer.
> - If a proxy setting is configured in both Windows registry and configuration files, the registry key takes precedence. [Learn how to configure proxy settings through Windows registry](..\governance.md#configure-power-automate-for-desktop-to-interact-with-a-corporate-proxy-server)

| Proxy setting | Description | Configuration file element/value | Registry key |
|---|---|---|---|
| Proxy server | The proxy address and port | proxyaddress="your_proxy_address" | ProxyServer |
| Use default credentials | Authenticate to the proxy server with default account credentials | useDefaultCredentials="True" | UseDefaultProxyCredentials |
| Bypass proxy server | Don't honor the Windows Proxy settings and bypass the proxy server | enabled ="False" | DisableWindowsProxy |
| Bypass list of IP addresses | Provide a set of regular expressions that describe addresses that don't use a proxy |  ```<bypasslist> <add address="bypassed_address" /> <add address="bypassed_address" /> </bypasslist> ``` | ProxyBypassList |
| Use network credentials | Authenticate with a generic credential from Windows’ Credential Manager | Not applicable | ProxyNetworkCredentialsKey |
| Automatic detection of proxy configuration script | Location of the proxy configuration script | scriptLocation="your_proxy_script_location" | Not applicable |

### How to update proxy configuration files

All proxy configuration files are stored in the installation folder and are listed in the following table. The default installation folder location is "*C:\Program Files (x86)\Power Automate Desktop\dotnet*".

| Proxy file | Related component | Description | Component type | Account type |
|---|---|---|---|---|
| *PAD.Proxy.config* | All Power Automate for desktop application components | Console, Designer, some machine runtime app functionalities such as list environments and edit machine details, etc. | Application | User |
| *UIFlowService.Proxy.config* | UIFlowService.exe | The Power Automate service (UIFlowService) communicates with Power Automate cloud services for machine registration and running desktop flows | Service | Virtual account |
| *Microsoft.Flow.RPA.LogShipper.Proxy.config* | Microsoft.Flow.RPA.LogShipper.exe | Logs collector service | Service | NetworkService |
| *Microsoft.Flow.RPA.UpdateService.Proxy.config* | Microsoft.Flow.RPA.UpdateService.exe | Update applications service | Service | System |

To configure the proxy settings:

1. Close all instances of Power Automate for desktop.

   - Ensure that the icon doesn't exist in the system tray.
   - Ensure that no processes are running in the background using Windows Task Manager.

1. For all the proxy files, edit each file with administrator rights as shown in the following examples:

    Example #1 – Configure proxy with address and authenticate with default account credentials

    ```xml
    <defaultProxy useDefaultCredentials="True"> 
        <proxy
          bypassonlocal="True"
          proxyaddress="replace_with_your_proxy_address"
        />
    </defaultProxy>
    ```

    Example #2 - Configure proxy with script location and authenticate with default account credentials

    ```xml
    <defaultProxy useDefaultCredentials="True"> 
        <proxy
          scriptLocation="replace_with_your_proxy_script_location"
        />
    </defaultProxy>
    ```

    Example #3 - Configure proxy with address and don't authenticate with default account credentials

    ```xml
    <defaultProxy> 
        <proxy
          bypassonlocal="True"
          proxyaddress="replace_with_your_proxy_address"
        />
      </defaultProxy>
    ```

    For more examples of how to update proxy configuration files, refer to [.NET documentation](/dotnet/framework/configure-apps/file-schema/network/defaultproxy-element-network-settings).

1. Save the changes.

1. Restart Power Automate for desktop.

1. Restart the Power Automate services:
     1. In Windows, open the **Services** desktop app. Press <kbd>Windows</kbd>+<kbd>R</kbd> to open the **Run** box, enter *services.msc*, and then press <kbd>Enter</kbd> or select **OK**.
     1. Look for **Power Automate service**, **Power Automate log shipper service**, and **Power Automate update service**.
     1. Right-click on each service and select **Restart**.

> [!NOTE]
> If the new proxy settings do not take effect even after restarting the services, try clearing the internet cache from your system. Go to **Control Panel**, search for and open **Internet Options**. From the **General** tab, select **Delete**. Ensure that at least **Temporary Internet files** and **Cookies** are selected, and select **Delete**.

### For authenticated proxy servers, change the "Power Automate Service" (UIFlowService.exe) account with an allowed domain service account

To [change the on-premises Service account](../troubleshoot.md#change-the-on-premises-service-account), use the **Troubleshoot** tab in the **Power Automate machine runtime application** or use the **TroubleshootingTool.Console.exe** command line utility.
