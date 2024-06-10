---
title: Configure Power Automate for desktop proxy settings
description: Configure the proxy settings of Power Automate for desktop to enable PAD components to access the Microsoft cloud services.
author: PetrosFeleskouras
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 06/06/2023
ms.author: pefelesk
ms.reviewer: 
contributors:
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - admin
---
# Configure Power Automate for desktop proxy settings

In some organizations, web requests from various Power Automate for desktop components (service, update service, console, designer, robot, etc..) may need to go through a network proxy server to access the Microsoft cloud services. 

## When to configure the proxy settings

Update your proxy configuration settings in case you receive any of the following errors in a Power Automate for desktop component:

- > System.Net.WebException: The remote server returned an error: (407) Proxy Authentication Required
- > System.Net.WebException (this error may appear when Power Automate for desktop was not installed by the target end-user (e.g. Helpdesk, SCCM, etc..))
- > The proxy server in your network requires authentication.
- > The communication with the cloud services requires network proxy authentication.
- > During startup Power Automate couldn't sign you in. The proxy server in your network requires authentication.
- > The proxy server in your network is blocking access to Microsoft cloud services.

## How to configure the proxy settings

Configure how Power Automate for desktop interacts with a proxy server using the **Power Automate proxy configuration files**. As an alternative, you can use the **Windows registry** to configure proxy settings that are not available in the proxy configuration files. 

> [!IMPORTANT]
> - From Power Automate for desktop version 2.45, the proxy settings can be configured in centralized way, through the **Power Automate proxy configuration files**, and are not overridden on a product upgrade.
> - It is suggested that you configure the proxy settings using only the **Power Automate proxy configuration files**, as they apply to all the on-premises components. Proxy settings configured through **Windows registry** apply only to a subset of components like the Console, Designer and Machine runtime app.
> - If a proxy setting is configured in both Windows registry and configuration files, the registry key prevails. [Learn how to configure proxy settings through Windows registry](..\governance.md#configure-power-automate-for-desktop-to-interact-with-a-corporate-proxy-server)

| Proxy setting | Description | Configuration file element/value | Registry key |
|---|---|---|---|
| Proxy server | The proxy address and port | *proxyaddress="your_proxy_address"* | *ProxyServer* |
| Use default credentials | Authenticate to the proxy server with default account credentials | *useDefaultCredentials="True"* | *UseDefaultProxyCredentials* |
| Bypass proxy server | Do not honor the Windows Proxy settings and bypass the proxy server | *enabled ="False"* | *DisableWindowsProxy* |
| Bypass list of IP addresses | Provide a set of regular expressions that describe addresses that do not use a proxy |  ```<bypasslist> <add address="bypassed_address" /> <add address="bypassed_address" /> </bypasslist> ``` | *ProxyBypassList* |
| Use network credentials | Authenticate with a generic credential from Windows’ Credential Manager | Not applicable | *ProxyNetworkCredentialsKey* |
| Automatic detection of proxy configuration script | Location of the proxy configuration script | *scriptLocation="your_proxy_script_location"* | Not applicable |

### How to update the proxy configuration files

All proxy configuration files are stored in the installation folder (default location is _"C:\Program Files (x86)\Power Automate Desktop"_) and are listed below:

| Proxy file | Related component | Description | Component type | Account type |
|---|---|---|---|---|
| *PAD.Proxy.config* | All Power Automate for desktop application components | Console, Designer, Machine runtime app, etc.. | Application | User |
| *UIFlowService.Proxy.config* | *UIFlowService.exe* | The Power Automate service (UIFlowService) communicates with Power Automate cloud services for machine registration and running desktop flows | Service | Virtual account |
| *Microsoft.Flow.RPA.LogShipper.Proxy.config* | *Microsoft.Flow.RPA.LogShipper.exe* | Logs collector service | Service | NetworkService |
| *Microsoft.Flow.RPA.UpdateService.Proxy.config* | *Microsoft.Flow.RPA.UpdateService.exe* | Update applications service | Service | System |

To configure the proxy settings, follow the steps below:
1. Close all instances of Power Automate for desktop.
   
   - Ensure that the icon doesn't exist in the system tray.
   - Ensure that no processes are running in the background using Windows Task Manager.

2. For all the proxy files, edit each file with administrator rights as shown in the examples below:

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

Example #3 - Configure proxy with address and do not authenticate with default account credentials
```xml
<defaultProxy> 
    <proxy
      bypassonlocal="True"
      proxyaddress="replace_with_your_proxy_address"
    />
  </defaultProxy>
```
[See more examples on how to update the proxy configuration files](https://learn.microsoft.com/dotnet/framework/configure-apps/file-schema/network/defaultproxy-element-network-settings)

4. Save the changes.

5. Restart Power Automate for desktop.

6. Restart the Power Automate services:
     1. In Windows, open the **Services** desktop app. Press <kbd>Windows</kbd>+<kbd>R</kbd> to open the **Run** box, enter *services.msc*, and then press <kbd>Enter</kbd> or select **OK**.
     2. Look for **Power Automate service**, **Power Automate log shipper service** and **Power Automate update service**.
     3. Right-click on each service and select **Restart**.

> [!NOTE]
> If the new proxy settings do not take effect even after restarting the services, try clearing the internet cache from your system. Go to **Control Panel**, search for and open **Internet Options**. From the **General** tab, click **Delete**. Ensure that at least **Temporary Internet Files** and **Cookies** are selected, and hit **Delete**.

### For authenticated proxy servers, change the "Power Automate Service" (UIFlowService.exe) account with an allowed domain service account

a. Either using the [TroubleshootTool UI "change service account" feature](../troubleshoot.md#change-the-on-premises-service-account)

b. Or using the TroubleshootTool Console
1. Create a temporary file “temporary.txt” with the account password inside

2. Put this file in the installation folder (default location is _"C:\Program Files (x86)\Power Automate Desktop"_)

3. Run the two commands after replacing the \<accountname\> by the target account  
```
cd " C:\Program Files (x86)\Power Automate Desktop\”
“TroubleshootingTool.Console.exe ChangeUIFlowServiceAccount <accountname> < temporary.txt”
```

4. Delete the temporary.txt file
