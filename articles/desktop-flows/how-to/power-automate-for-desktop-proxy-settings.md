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

Update your Power Automate proxy configuration settings in case you receive any of the following errors in a Power Automate for desktop component:

- > The proxy server in your network requires authentication.
- > The communication with the cloud services requires network proxy authentication.
- > During startup Power Automate couldn't sign you in. The proxy server in your network requires authentication.
- > The proxy server in your network is blocking access to Microsoft cloud services.
- > System.Net.WebException: The remote server returned an error: (407) Proxy Authentication Required
- > Power Automate for desktop was not installed by the target end-user (e.g. Helpdesk, SCCM, etc..) and a component fails with System.Net.WebException

## How to configure the proxy settings

Configure how Power Automate for desktop interacts with a proxy server using either the Windows registry or the Power Automate proxy configuration files. 
> [!IMPORTANT]
> - If a proxy setting is configured in both Windows registry and configuration files, the registry key prevails.

| Proxy setting | Description | Registry key | Configuration file element/value |
|---|---|---|---|
| Proxy server | The proxy address and port | *ProxyServer* | *proxyaddress="your_proxy_address"* |
| Use default credentials | Authenticate to the proxy server with default account credentials | *UseDefaultProxyCredentials* | *useDefaultCredentials="True"* |
| Bypass proxy server | Do not honor the Windows Proxy settings and bypass the proxy server | *DisableWindowsProxy* | *enabled ="False"* |
| Bypass list of IP addresses | Provide a set of regular expressions that describe addresses that do not use a proxy | *ProxyBypassList* |  ```<bypasslist> <add address="bypassed_address" /> <add address="bypassed_address" /> </bypasslist> ``` |
| Use network credentials | Authenticate with a generic credential from Windows’ Credential Manager | *ProxyNetworkCredentialsKey* | Not applicable |
| Automatic detection of proxy configuration script | Location of the proxy configuration script | Not applicable | *scriptLocation="your_proxy_script_location"* |

[Learn how to configure proxy settings through Windows registry](..\governance.md#configure-power-automate-for-desktop-to-interact-with-a-corporate-proxy-server)

### How to update the proxy configuration files

> [!NOTE]
> From Power Automate for desktop version 2.45, the proxy settings can be configured in specific files, which are not overridden on a product upgrade.

All proxy configuration files are stored in the installation folder (default location: *"C:\Program Files (x86)\Power Automate Desktop"*) and are listed below:

| Proxy file | Related component | Description | Component type | Account type |
|---|---|---|---|---|
| *PAD.Proxy.config* | All Power Automate for desktop application components | Console, Designer, Machine runtime app, etc.. | Application | User |
| *UIFlowService.Proxy.config* | *UIFlowService.exe* | The Power Automate service (UIFlowService) communicates with Power Automate cloud services for machine registration and running desktop flows | Service | Virtual account |
| *Microsoft.Flow.RPA.LogShipper.Proxy.config* | *Microsoft.Flow.RPA.LogShipper.exe* | Logs collector service | Service | NetworkService |
| *Microsoft.Flow.RPA.UpdateService.Proxy.config* | *Microsoft.Flow.RPA.UpdateService.exe* | Update applications service | Service | System |

To configure the proxy settings, edit all **.Proxy.config* files with administrator rights as shown in the examples below and save them.

> [!IMPORTANT]
> - If you edit a proxy file of a service, you need to restart the service.

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

