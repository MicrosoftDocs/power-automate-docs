---
title: Configure Power Automate for desktop proxy settings
description: Configure the proxy settings of Power Automate for desktop to enable PAD components to access the Microsoft cloud services.
author: NicholasRallakis
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: how-to
ms.date: 03/16/2026
ms.author: nrallakis
ms.reviewer: 
contributors:
- PetrosFeleskouras
- DanaMartens
- NicholasRallakis
search.audienceType: 
  - flowmaker
  - admin
---
# Configure proxy settings for Power Automate for desktop

Power Automate for desktop connects to Microsoft cloud services for sign-in, machine registration, flow execution, logging, and updates. In environments where all outbound HTTP traffic must pass through a corporate proxy, each of these connections requires proxy configuration to succeed.

This article explains how proxy configuration works in Power Automate for desktop, identifies the symptoms of misconfigured proxy settings, and provides ready-to-use configuration examples organized by scenario.

---

## When to configure proxy settings

Configure proxy settings if you encounter any of the following errors when starting Power Automate for desktop, registering a machine, or running a desktop flow:

- `The proxy server in your network requires authentication.`
- `The communication with the cloud services requires network proxy authentication.`
- `During startup Power Automate couldn't sign you in. The proxy server in your network requires authentication.`
- `System.Net.WebException: The remote server returned an error: (407) Proxy Authentication Required`

---

## How proxy configuration works

### Configuration sources and priority

Power Automate for desktop resolves proxy settings from the following sources, in priority order:

1. **Windows Registry** — Keys under `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Power Automate Desktop`. If any PAD proxy registry key is present, the registry configuration is used exclusively and the configuration files are **ignored entirely**.
2. **Configuration files** — One XML file per component, edited manually. Used when no registry keys are set.
   - Within a file: `scriptLocation` (PAC) takes priority over `proxyaddress` (static proxy).
3. **Windows system proxy** — The proxy configured in Windows Internet Options. Used as a fallback when no PAD-specific configuration exists.

> [!IMPORTANT]
> The registry takes full precedence. If even a single PAD proxy registry key exists, all configuration files are ignored. When troubleshooting unexpected behavior, check the registry first.

### Configuration files vs. registry keys

Both methods configure the same underlying behavior, but they have different capabilities and trade-offs:

| | Configuration files | Registry keys |
|---|---|---|
| **Supported from** | Power Automate for desktop 2.45 | All versions |
| **PAC script support** | Yes (`scriptLocation`) — requires version 2.67 and `EnablePacProxy=1` registry flag | No (PAC script URL cannot be specified via registry; use config files) |
| **Per-component settings** | Yes (one file per process) | No (machine-wide, all components) |
| **Deployment method** | Edit files with admin rights | Group Policy, MDM, or `reg` commands |
| **Survives product upgrade** | Yes (from v2.45) | Yes |
| **Bypass list format** | .NET regular expressions | Comma-separated, interpreted as .NET regular expressions |

**Recommendation:** Use configuration files for new deployments on version 2.45 and later, especially when PAC scripts are needed or per-component settings are required. Use registry keys for centralized management via Group Policy or MDM, or for deployments on versions prior to 2.45.

> [!CAUTION]
> Modifying Windows registry settings incorrectly can cause serious problems. Back up the registry before making changes. If a proxy registry key doesn't exist yet, create the key first, then add the value.

### Per-component configuration files

Power Automate for desktop runs as multiple separate processes under different Windows accounts. Each has its own proxy configuration file, stored in `C:\Program Files (x86)\Power Automate Desktop`:

| Configuration file | Component | Windows account |
|---|---|---|
| `PAD.Proxy.config` | Console, Designer, some Machine Runtime features (list environments, edit machine details) | Signed-in user |
| `UIFlowService.Proxy.config` | UIFlowService.exe — cloud communication for machine registration and desktop flow runs | `NT SERVICE\UIFlowService` |
| `Microsoft.Flow.RPA.LogShipper.Proxy.config` | Log shipper service | `NetworkService` |
| `Microsoft.Flow.RPA.UpdateService.Proxy.config` | Update service | `System` |

> [!IMPORTANT]
> You must apply the same proxy settings to all four files. If only `PAD.Proxy.config` is updated, the Console and Designer work but unattended flow runs, machine registration, and log shipping continue to fail.

> [!NOTE]
> Registry keys are machine-wide and apply to all components simultaneously. When using the registry approach, you don't need to edit the component configuration files.

---

## Scenario 1: Use a static proxy server

**When to use this:** Your organization routes all internet traffic through a single proxy server with a fixed hostname and port.

### Configuration file

Edit all four configuration files:

```xml
<?xml version="1.0" encoding="utf-8"?>
<defaultProxy useDefaultCredentials="false">
  <proxy
    proxyaddress="http://proxy.corp.com:8080"
    bypassonlocal="True"
  />
</defaultProxy>
```

| Attribute | Notes |
|---|---|
| `useDefaultCredentials="false"` | Does not forward Windows credentials. Appropriate for proxies that accept unauthenticated requests. |
| `proxyaddress` | Full URI including scheme and port. Values without `http://` are invalid. |
| `bypassonlocal="True"` | Requests to plain hostnames (no dots) and loopback addresses skip the proxy. |

### Registry alternative

Set the following registry value. This affects all PAD components simultaneously.

| Hive | Key | Name | Type | Value |
|---|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `ProxyServer` | String | `http://proxy.corp.com:8080` |

To set this from an elevated command prompt:

```cmd
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v ProxyServer /t REG_SZ /d "http://proxy.corp.com:8080" /f
```

To also bypass the proxy for local addresses (equivalent to `bypassonlocal="True"`):

```cmd
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v ProxyServer /t REG_SZ /d "http://proxy.corp.com:8080" /f
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v BypassProxyOnLocal /t REG_DWORD /d 1 /f
```

> [!NOTE]
> Unlike the configuration file approach, the registry `ProxyServer` value applies to all four PAD components — you don't need to edit individual files. However, per-component differences (for example, different credentials for background services) are not possible with registry keys.

---

## Scenario 2: Authenticated proxy (use Windows credentials)

**When to use this:** Your proxy uses Windows-integrated authentication (NTLM or Kerberos) and the signed-in user's credentials should be forwarded automatically.

### Configuration file

```xml
<?xml version="1.0" encoding="utf-8"?>
<defaultProxy useDefaultCredentials="true">
  <proxy
    proxyaddress="http://proxy.corp.com:8080"
    bypassonlocal="True"
  />
</defaultProxy>
```

Setting `useDefaultCredentials="true"` instructs PAD to send the current Windows user's credentials to the proxy with each request, which resolves 407 errors in Windows-integrated authentication environments.

> [!IMPORTANT]
> For background services, `useDefaultCredentials="true"` forwards the credentials of the service account — `NT SERVICE\UIFlowService`, `NetworkService`, or `System`. These accounts typically do not have domain credentials accepted by a proxy. See [Scenario 7](#scenario-7-configure-proxy-credentials-for-background-services) for how to handle this.

> [!NOTE]
> If your proxy requires an explicit non-Windows username and password, use the `ProxyNetworkCredentialsKey` registry value to point to a generic credential stored in Windows Credential Manager. See [Scenario 7](#scenario-7-configure-proxy-credentials-for-background-services) for details.

### Registry alternative

Set both values. `UseDefaultProxyCredentials` requires `ProxyServer` to also be set.

| Hive | Key | Name | Type | Value |
|---|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `ProxyServer` | String | `http://proxy.corp.com:8080` |
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `UseDefaultProxyCredentials` | DWORD | `1` |

```cmd
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v ProxyServer /t REG_SZ /d "http://proxy.corp.com:8080" /f
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v UseDefaultProxyCredentials /t REG_DWORD /d 1 /f
```

---

## Scenario 3: Skip the proxy for internal addresses (bypass list)

**When to use this:** Most traffic should go through the proxy, but requests to specific internal hostnames, IP ranges, or domains should connect directly.

### Configuration file

```xml
<?xml version="1.0" encoding="utf-8"?>
<defaultProxy useDefaultCredentials="false">
  <proxy
    proxyaddress="http://proxy.corp.com:8080"
    bypassonlocal="True"
  />
  <bypasslist>
    <add address="intranet\.corp\.com" />
    <add address=".*\.internal\.corp\.com" />
    <add address="10\.0\." />
    <add address="192\.168\." />
  </bypasslist>
</defaultProxy>
```

**Bypass list rules (configuration file):**

- Each `address` value is a **.NET regular expression** matched against the destination hostname or IP address string.
- Dots (`.`) in hostnames must be escaped as `\.` to avoid matching any character.
- Patterns must not start with `*`. Use `.*` or `.+` for variable-length prefixes.
- `bypassonlocal="True"` on the `<proxy>` element already handles plain single-label hostnames and loopback. The `<bypasslist>` handles more specific patterns.

> [!TIP]
> Test your regular expressions with a .NET regex tool before deploying. An overly broad pattern like `corp` instead of `\.corp\.com` will inadvertently bypass the proxy for unintended hostnames.

### Registry alternative

The registry bypass list uses a **comma-separated string** of .NET regular expression patterns.

| Hive | Key | Name | Type | Value |
|---|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `ProxyServer` | String | `http://proxy.corp.com:8080` |
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `BypassProxyOnLocal` | DWORD | `1` |
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `ProxyBypassList` | String | `\.internal\.corp\.com, 10\.0\., 192\.168\.` |

```cmd
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v ProxyServer /t REG_SZ /d "http://proxy.corp.com:8080" /f
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v BypassProxyOnLocal /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v ProxyBypassList /t REG_SZ /d "\.internal\.corp\.com, 10\.0\., 192\.168\." /f
```

> [!IMPORTANT]
> The `ProxyBypassList` registry key requires `ProxyServer` to also be set. Each comma-separated entry is interpreted as a **.NET regular expression** — escape dots as `\.`. **Entries that start with `*` are invalid and are silently skipped** (a warning is logged). Use `\.corp\.com` instead of `*.corp.com`, and `10\.0\.` instead of `10.0.*`.

---

## Scenario 4: Use a PAC script from a URL

> [!IMPORTANT]
> PAC script support requires **Power Automate for desktop version 2.67 or later** and must be enabled via a registry flag. See [Enabling PAC script support](#enabling-pac-script-support) before proceeding.

**When to use this:** Your network team publishes a PAC (Proxy Auto-Config) script at an HTTP or HTTPS URL. The script selects a proxy or direct connection based on the destination URL.

### Configuration file

```xml
<?xml version="1.0" encoding="utf-8"?>
<defaultProxy useDefaultCredentials="false">
  <proxy
    scriptLocation="http://proxy.corp.com/proxy.pac"
  />
</defaultProxy>
```

For a PAC script served over HTTPS:

```xml
<?xml version="1.0" encoding="utf-8"?>
<defaultProxy useDefaultCredentials="false">
  <proxy
    scriptLocation="https://proxy.corp.com/proxy.pac"
  />
</defaultProxy>
```

**How PAC resolution works in Power Automate for desktop:**

- The PAC script is downloaded once at startup and cached in memory for **one hour**.
- Cache revalidation uses HTTP `ETag` / `If-None-Match` headers. A `304 Not Modified` response extends the cache for another hour without re-downloading.
- If a download fails but a valid cached copy exists, PAD continues using the cached copy. If no cached copy is available and the download fails, proxy resolution fails for this component.
- `FindProxyForURL(url, host)` is called for **each outbound HTTP request**.
- If the script throws a JavaScript error, PAD falls back to **DIRECT** for that request.
- `scriptLocation` takes priority over `proxyaddress`. If both are present in the same file, `proxyaddress` is ignored.

> [!IMPORTANT]
> PAD returns the **first syntactically valid** `PROXY` entry from the PAC result string. It does **not** perform TCP reachability probing. If your script returns `PROXY p1:8080; PROXY p2:8080; DIRECT` and `p1` is unreachable, PAD does not automatically fail over to `p2`. Ensure your PAC script returns the correct proxy for the machine's network environment.

> [!NOTE]
> Only `http://`, `https://`, and `file:///` URI schemes are supported for `scriptLocation`. Using any other scheme causes a startup error.

> [!NOTE]
> **PAC scripts are not supported via Windows Registry.** There is no registry key to specify a PAC script URL. To use PAC-based proxy configuration, you must use the configuration files. The `EnablePacProxy` registry flag only gates the feature — it does not configure the PAC URL itself.

---

## Scenario 5: Use a PAC script from a local file

> [!IMPORTANT]
> PAC script support requires **Power Automate for desktop version 2.67 or later** and must be enabled via a registry flag. See [Enabling PAC script support](#enabling-pac-script-support) before proceeding.

**When to use this:** The PAC script is a file on the local machine — air-gapped environments, or testing a PAC configuration before publishing it to a URL.

### Configuration file

```xml
<?xml version="1.0" encoding="utf-8"?>
<defaultProxy useDefaultCredentials="false">
  <proxy
    scriptLocation="file:///C:/ProxyConfig/proxy.pac"
  />
</defaultProxy>
```

**Notes:**

- Use `file:///` (three forward slashes) followed by an absolute path with forward slashes.
- The PAC file must be readable by the account running each component. For `UIFlowService.Proxy.config`, the file must be readable by `NT SERVICE\UIFlowService`. For the log shipper, by `NetworkService`.
- Local file PAC scripts use the same one-hour in-memory cache. If you update the file, the change takes effect after the cache expires or after restarting the application and services.
- If the file doesn't exist at startup, PAD logs a `FileNotFoundException` and proxy resolution fails for this component.

> [!TIP]
> Place the PAC file in a location accessible to all relevant service accounts, such as a subfolder under `C:\Program Files (x86)\Power Automate Desktop`, and grant read permissions to `NETWORK SERVICE` and `NT SERVICE\UIFlowService`.

> [!NOTE]
> **PAC scripts are not supported via Windows Registry.** There is no registry key equivalent for local file PAC scripts. To use PAC-based proxy configuration, you must use the configuration files.

### Enabling PAC script support

PAC script support (`scriptLocation`) is available starting in **version 2.67** and is disabled by default. To enable it, set the following registry flag on each machine:

| Hive | Key | Name | Type | Value |
|---|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `EnablePacProxy` | DWORD | `1` |

```cmd
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v EnablePacProxy /t REG_DWORD /d 1 /f
```

> [!IMPORTANT]
> The `EnablePacProxy` flag enables PAC support but does **not** configure the PAC URL itself. You must also set `scriptLocation` in the relevant configuration files. If `EnablePacProxy` is not set (or is set to `0`), PAD ignores `scriptLocation` in the configuration files and falls back to evaluating any `proxyaddress` configured in the same file.

> [!NOTE]
> `EnablePacProxy` alone does not trigger registry mode. Registry mode is triggered only when at least one proxy-related value (`ProxyServer`, `DisableWindowsProxy`, `UseDefaultProxyCredentials`, `ProxyNetworkCredentialsKey`, `ProxyBypassList`, or `BypassProxyOnLocal`) is present. Setting `EnablePacProxy=1` by itself does not suppress the configuration files.

---

## Scenario 6: Disable proxy entirely

**When to use this:** Power Automate for desktop is picking up a Windows system proxy that you don't want it to use — for example, a browser proxy configured in Internet Options that doesn't apply to PAD's cloud traffic.

### Configuration file

```xml
<?xml version="1.0" encoding="utf-8"?>
<defaultProxy enabled="false">
</defaultProxy>
```

Setting `enabled="false"` causes PAD to ignore the Windows system proxy and connect directly. No `<proxy>` or `<bypasslist>` elements are needed.

### Registry alternative

| Hive | Key | Name | Type | Value |
|---|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `DisableWindowsProxy` | DWORD | `1` |

```cmd
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v DisableWindowsProxy /t REG_DWORD /d 1 /f
```

> [!NOTE]
> Both `enabled="false"` in the configuration file and `DisableWindowsProxy=1` in the registry instruct PAD to ignore the Windows system proxy. Neither setting bypasses transparent proxies enforced at the network level — those operate below the application layer and are always in effect.

---

## Scenario 7: Configure proxy credentials for background services

**When to use this:** The interactive Console and Designer work correctly with Windows-integrated auth, but unattended flow execution fails because `UIFlowService.exe` runs as `NT SERVICE\UIFlowService` — a virtual account without domain credentials accepted by the proxy.

### Option A: Configuration file (per-component)

Edit `UIFlowService.Proxy.config` independently from `PAD.Proxy.config`. For a proxy that allows unauthenticated access from service accounts:

```xml
<?xml version="1.0" encoding="utf-8"?>
<defaultProxy useDefaultCredentials="false">
  <proxy
    proxyaddress="http://proxy.corp.com:8080"
    bypassonlocal="True"
  />
</defaultProxy>
```

### Option B: Explicit credentials via Windows Credential Manager (registry)

If the proxy requires a specific username and password that is not tied to a Windows domain account, store the credential in Windows Credential Manager and reference it via the registry. This approach works for all PAD components.

**Step 1: Store the credential**

1. Open **Credential Manager** → **Windows Credentials** → **Add a generic credential**.
2. Set **Internet or network address** to a name of your choice, for example `PAD_Proxy`.
3. Enter the proxy **Username** and **Password**, then select **OK**.

**Step 2: Set registry keys**

`ProxyNetworkCredentialsKey` requires `ProxyServer` to also be set.

| Hive | Key | Name | Type | Value |
|---|---|---|---|---|
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `ProxyServer` | String | `http://proxy.corp.com:8080` |
| `HKEY_LOCAL_MACHINE` | `SOFTWARE\Microsoft\Power Automate Desktop` | `ProxyNetworkCredentialsKey` | String | `PAD_Proxy` |

```cmd
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v ProxyServer /t REG_SZ /d "http://proxy.corp.com:8080" /f
reg add "HKLM\SOFTWARE\Microsoft\Power Automate Desktop" /v ProxyNetworkCredentialsKey /t REG_SZ /d "PAD_Proxy" /f
```

PAD retrieves the stored username and password from Credential Manager at runtime and uses them as explicit `NetworkCredential` for proxy authentication.

> [!IMPORTANT]
> `ProxyNetworkCredentialsKey` requires `ProxyServer` to be set first — the registry key alone has no effect without a configured proxy address.

> [!IMPORTANT]
> Registry values are machine-wide and override configuration files entirely for all components. When any PAD proxy registry key is set, all four configuration files are ignored.

---

## Apply configuration changes

### Applying configuration file changes

1. **Close Power Automate for desktop.** Confirm no PAD icon remains in the system tray and no PAD processes are running in Task Manager.

2. **Open each configuration file in a text editor with administrator privileges.** All four files are in `C:\Program Files (x86)\Power Automate Desktop`.

3. **Apply the same proxy settings to all four files:**
   - `PAD.Proxy.config`
   - `UIFlowService.Proxy.config`
   - `Microsoft.Flow.RPA.LogShipper.Proxy.config`
   - `Microsoft.Flow.RPA.UpdateService.Proxy.config`

4. **Restart the Windows services.** Open an elevated command prompt and run:

   ```cmd
   net stop UIFlowService && net start UIFlowService
   net stop "Power Automate Log Shipper" && net start "Power Automate Log Shipper"
   net stop "Power Automate Update Service" && net start "Power Automate Update Service"
   ```

   Confirm exact service names in **Services** (`services.msc`) before running.

5. **Start Power Automate for desktop** and verify that sign-in and machine registration succeed.

### Applying registry changes

Registry changes take effect when the relevant PAD process starts. Restart all PAD components after making registry changes:

1. Close Power Automate for desktop.
2. Restart all three PAD Windows services (same commands as above).
3. Start Power Automate for desktop.

> [!NOTE]
> If a PAC script is configured via `scriptLocation`, the script is cached in memory for one hour. Restarting the application and services forces an immediate re-download, which is useful after updating the script on your proxy server.

> [!NOTE]
> If new proxy settings still don't take effect after restarting, clear the Windows internet cache. Go to **Control Panel** → **Internet Options** → **General** tab → **Delete**, ensure **Temporary Internet files** and **Cookies** are selected, then select **Delete**.

---

## Configuration reference

### Configuration file schema

All four proxy configuration files share the same XML schema.

#### `<defaultProxy>` attributes

| Attribute | Values | Default | Description |
|---|---|---|---|
| `enabled` | `"true"`, `"false"` | `"true"` | Omit this attribute to accept the default. Set to `"false"` to bypass all proxy handling including the Windows system proxy. |
| `useDefaultCredentials` | `"true"`, `"false"` | `"false"` | `"true"` forwards the current Windows account's NTLM credentials to the proxy. Applies to both static proxy and PAC-based proxy. |

#### `<proxy>` child element attributes

| Attribute | Values | Default | Description |
|---|---|---|---|
| `proxyaddress` | Absolute URI | None | Static proxy URI. Must include scheme (`http://`) and port. Ignored when `scriptLocation` is also set. |
| `scriptLocation` | `http://`, `https://`, or `file:///` URI | None | PAC script URI. **Takes priority over `proxyaddress`.** Only `http://`, `https://`, and `file:///` schemes are supported. Requires version 2.67 and `EnablePacProxy=1`. No registry equivalent. |
| `bypassonlocal` | `"True"`, `"False"` | `"False"` | `"True"` skips the proxy for intranet single-label hostnames and loopback addresses. Note the capitalized boolean value. |
| `usesystemdefault` | `"True"`, `"False"` | `"False"` | Delegates proxy selection to the Windows system proxy. |
| `autoDetect` | `"true"`, `"false"` | `"false"` | Enables WPAD (Web Proxy Auto-Discovery). |

#### `<bypasslist>` element

The `<bypasslist>` element contains one or more `<add>` child elements:

```xml
<bypasslist>
  <add address="regex-pattern" />
</bypasslist>
```

| Attribute | Description |
|---|---|
| `address` | A .NET regular expression matched against the destination hostname or IP address. Escape dots as `\.`. Must not start with `*`. |

### Registry keys reference

All registry keys are under `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Power Automate Desktop`.

> [!IMPORTANT]
> If any of the proxy-related keys (`ProxyServer`, `DisableWindowsProxy`, `UseDefaultProxyCredentials`, `ProxyNetworkCredentialsKey`, `ProxyBypassList`, `BypassProxyOnLocal`) exist, PAD ignores all proxy configuration files entirely. `EnablePacProxy` alone does not trigger this behavior.

| Name | Type | Value | Notes |
|---|---|---|---|
| `ProxyServer` | String | Proxy URI, e.g. `http://proxy.corp.com:8080` | Sets the proxy server address. Required prerequisite for `ProxyBypassList`, `BypassProxyOnLocal`, and `ProxyNetworkCredentialsKey`. |
| `UseDefaultProxyCredentials` | DWORD | `1` = use Windows credentials | Authenticates to the proxy using the current user's NTLM credentials. Equivalent to `useDefaultCredentials="true"` in the config file. |
| `DisableWindowsProxy` | DWORD | `1` = disable Windows proxy | Ignores Windows system proxy settings. Equivalent to `enabled="false"` in the config file. |
| `BypassProxyOnLocal` | DWORD | `1` = bypass proxy for local addresses | Skips the proxy for intranet single-label hostnames and loopback addresses. Equivalent to `bypassonlocal="True"` in the config file. Requires `ProxyServer` to be set. |
| `ProxyBypassList` | String | Comma-separated .NET regex patterns, e.g. `\.corp\.com, 192\.168\.` | Bypass list for the proxy. **Requires `ProxyServer` to be set.** Each comma-separated entry is a .NET regular expression. Entries starting with `*` are silently skipped. |
| `ProxyNetworkCredentialsKey` | String | Credential Manager entry name, e.g. `PAD_Proxy` | Name of a generic credential in Windows Credential Manager to use for proxy authentication. **Requires `ProxyServer` to be set.** |
| `EnablePacProxy` | DWORD | `1` = enable PAC script support | Enables PAC script support in configuration files (`scriptLocation` attribute). Available from version 2.67. Does **not** trigger registry mode by itself. |

---

## PAC script reference

> [!NOTE]
> PAC script support is available starting in **version 2.67** and requires `EnablePacProxy=1` in the registry. See [Enabling PAC script support](#enabling-pac-script-support).

### Supported PAC functions

The following functions are available inside `FindProxyForURL(url, host)`.

**Host classification**

| Function | Description |
|---|---|
| `isPlainHostName(host)` | `true` if `host` contains no dots — i.e. a bare name like `intranet` with no domain suffix. Use to route unqualified hostnames directly without hitting the proxy. |
| `dnsDomainIs(host, domain)` | `true` if `host` ends with `domain`. Domain must include the leading dot: `dnsDomainIs(host, ".corp.com")`. Case-sensitive suffix match, no DNS lookup performed. |
| `localHostOrDomainIs(host, hostdom)` | `true` if `host` is an exact match for `hostdom`, or if `hostdom` starts with `host + "."`. Useful when the PAC script receives a short hostname but needs to compare against a FQDN. |
| `dnsDomainLevels(host)` | Returns the number of dots in `host`. `dnsDomainLevels("www.corp.com")` returns `2`. Use to distinguish bare hostnames (0 dots) from FQDNs. |

**DNS and IP address**

| Function | Description |
|---|---|
| `isResolvable(host)` | `true` if `host` resolves to at least one IPv4 address. Performs a live DNS lookup — avoid calling in tight loops on slow networks. |
| `dnsResolve(host)` | Returns the first IPv4 address for `host` as a string (e.g. `"10.0.1.5"`), or `null` if resolution fails. Used to convert a hostname to an IP before calling `isInNet`. |
| `myIpAddress()` | Returns the first non-loopback IPv4 address of the machine running the PAC script. Skips loopback and down interfaces. Returns an empty string if no address is found. |
| `isInNet(ipaddr, pattern, mask)` | `true` if `ipaddr` falls within the subnet defined by `pattern` and `mask`. If `ipaddr` is a hostname, it is resolved via `dnsResolve` first. Example: `isInNet(host, "10.0.0.0", "255.0.0.0")`. |
| `isInNetEx(ipaddr, prefix)` | `true` if `ipaddr` falls within a CIDR prefix. Supports both IPv4 (`"192.168.1.0/24"`) and IPv6 (`"2001:db8::/32"`). Unlike `isInNet`, accepts CIDR notation directly and does not perform DNS resolution. |

**Pattern matching**

| Function | Description |
|---|---|
| `shExpMatch(str, pattern)` | Shell-style wildcard match against `str`. `*` matches any sequence of characters; `?` matches any single character. Dots in the pattern are treated as literals. Example: `shExpMatch(host, "*.corp.com")`. |

**Time-based routing**

| Function | Description |
|---|---|
| `weekdayRange(wd1[, wd2[, "GMT"]])` | `true` if the current weekday falls between `wd1` and `wd2` (inclusive). Weekday values: `SUN MON TUE WED THU FRI SAT`. Omit `wd2` to match a single day. Append `"GMT"` as the last argument to evaluate against UTC instead of local time. |
| `dateRange(...)` | `true` if the current date falls within the specified range. Accepts one to six components — day numbers (1–31), month names (`JAN`–`DEC`), or four-digit years — in pairs for a range or alone for an exact match. Append `"GMT"` as the last argument for UTC. |
| `timeRange(...)` | `true` if the current time falls within the specified range. Accepts one or two hours for an hour range, four values (`h m h m`) for hour+minute precision, or six values (`h m s h m s`) for second precision. Append `"GMT"` for UTC. |

**IPv6 extension functions (registered only when the OS supports IPv6):**

| Function | Description |
|---|---|
| `dnsResolveEx(host)` | Like `dnsResolve`, but returns all resolved addresses — IPv4 and IPv6 — as a semicolon-separated string (e.g. `"10.0.1.5;2001:db8::1"`). Returns `null` on failure. |
| `myIpAddressEx()` | Like `myIpAddress`, but returns all non-loopback local addresses (IPv4 and IPv6) as a semicolon-separated string. |
| `isResolvableEx(host)` | `true` if `host` resolves to at least one address of any family (IPv4 or IPv6). |
| `sortIpAddressList(list)` | Sorts a semicolon-separated list of IP addresses: IPv4 addresses first (alphabetically), then IPv6. Returns the original string unchanged if parsing fails. |
| `getClientVersion()` | Returns `"1.0"`. Used by some PAC scripts to detect PAC client capabilities. |

> [!NOTE]
> IPv6 extension functions are registered only when the operating system reports IPv6 support. Calling them on a system without IPv6 throws a JavaScript error, causing PAD to fall back to `DIRECT` for that request.

### Result string behavior

| PAC result | Power Automate for desktop behavior |
|---|---|
| `DIRECT` | Connects directly — no proxy. |
| `PROXY host:port` | Uses the specified proxy. `http://` is prepended automatically if no scheme is present. |
| `PROXY p1:port; PROXY p2:port; DIRECT` | Returns the **first syntactically valid** `PROXY` entry. No TCP reachability probing — no automatic failover to later entries. |
| Empty or null result | Treated as `DIRECT`. |
| Script execution error | Falls back to `DIRECT` for that request. |
| `SOCKS host:port` | **Not supported.** Entry is skipped. If `SOCKS` is the only entry, PAD uses `DIRECT`. |

### Caching behavior

| Aspect | Behavior |
|---|---|
| Cache duration | 1 hour in memory per PAC URI |
| Revalidation | HTTP `ETag` / `If-None-Match`. `304 Not Modified` resets the expiration timer without re-downloading. |
| Download failure, cached copy exists | Continues using the cached copy. |
| Download failure, no cached copy | Proxy resolution fails for this component. |
| Local `file:///` PAC scripts | Same 1-hour cache. File changes are not picked up until the cache expires or services restart. |

---

## Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| 407 error on all components | Proxy requires credentials, none configured | Set `useDefaultCredentials="true"` in all four config files, or set `UseDefaultProxyCredentials=1` in the registry. For explicit credentials, use `ProxyNetworkCredentialsKey` (see Scenario 7). |
| Console and Designer work, unattended runs fail | `UIFlowService.Proxy.config` not updated, or service account credentials rejected by proxy | Update `UIFlowService.Proxy.config`; if auth fails, use `ProxyNetworkCredentialsKey` via registry (see Scenario 7). |
| Configuration file changes have no effect | Registry keys override the config file | Check `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Power Automate Desktop` for `ProxyServer`, `DisableWindowsProxy`, `UseDefaultProxyCredentials`, `ProxyBypassList`, `BypassProxyOnLocal`, `ProxyNetworkCredentialsKey`. Update or remove registry values as needed. |
| PAC script changes not taking effect | PAC script cached for 1 hour | Restart the application and all PAD services to force cache refresh. |
| `scriptLocation` in config file is ignored | `EnablePacProxy` registry flag not set, or version is earlier than 2.67 | Verify the machine is running version 2.67 or later, then set `EnablePacProxy=1` in the registry. If both `scriptLocation` and `proxyaddress` are in the same file and `EnablePacProxy` is not set, PAD uses `proxyaddress` instead. |
| SOCKS proxy not working | SOCKS is not supported | PAD supports `PROXY` (HTTP) entries only. Update your PAC script to use `PROXY host:port` or `DIRECT` entries. |
| Proxy settings appear correct but requests bypass the proxy | `bypassonlocal="True"` or a bypass list pattern is too broad | Audit bypass patterns. Both the config file and registry bypass list use .NET regular expressions — escape dots as `\.` and verify patterns with a regex tester. Entries starting with `*` in the registry bypass list are silently skipped. Use `"False"` for `bypassonlocal` if intranet traffic should also be proxied. |
| `ProxyNetworkCredentialsKey` or `ProxyBypassList` has no effect | `ProxyServer` registry key is missing | Both keys require `ProxyServer` to be set as a prerequisite. |

> [!TIP]
> To inspect the WinHTTP proxy setting used by Windows services — separate from the browser (WinInet) proxy — run `netsh winhttp show proxy` in an elevated command prompt. An unintended WinHTTP proxy can affect PAD service behavior independently of both the configuration files and the PAD registry keys.
