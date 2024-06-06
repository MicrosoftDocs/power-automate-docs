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

| Proxy setting | Description | Registry key | Config file element/value |
|---|---|---|---|
| Proxy server | The proxy address and port | *ProxyServer* [Learn more](..\governance.md#configure-power-automate-for-desktop-to-interact-with-a-corporate-proxy-server) | *proxyaddress="your_proxy_address"* |
| Use default credentials | Authenticate to the proxy server with default account credentials | *UseDefaultProxyCredentials* [Learn more](..\governance.md#configure-power-automate-for-desktop-to-authenticate-to-a-corporate-proxy-server-using-the-current-users-credentials) | *useDefaultCredentials="True"* |
| Bypass proxy server | Do not honor the Windows Proxy settings and bypass the proxy server | *DisableWindowsProxy* [Learn more](..\governance.md#configure-power-automate-for-desktop-to-bypass-a-corporate-proxy-server) | *enabled ="False"* |
| Bypass list of IP addresses | Provide a set of regular expressions that describe addresses that do not use a proxy | *ProxyBypassList* [Learn more](..\governance.md#configure-power-automate-for-desktop-to-bypass-a-set-of-addresses-while-interacting-with-a-corporate-proxy-server) |  ```<bypasslist> <add address="bypassed_address" /> <add address="bypassed_address" /> </bypasslist> ``` |
| Use network credentials | Authenticate with a generic credential from Windows’ Credential Manager | *ProxyNetworkCredentialsKey* [Learn more](..\governance.md#configure-power-automate-for-desktop-to-authenticate-to-a-corporate-proxy-server-using-windows-credentials) | Not applicable |
| Automatic detection of proxy configuration script | Location of the proxy configuration script | Not applicable | *scriptLocation="your_proxy_script_location"* |



