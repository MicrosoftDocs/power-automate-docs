---
title: Automation in the web | Microsoft Docs
description: Automation in the web
author: mariosleon

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
# Automate web flows

Power Automate offers several actions under the browser automation group to enable users to interact with web browsers. Browser automation is a special case of UI automation used for interacting with web elements..

Four web browsers are currently supported:
- Microsoft Edge
- Microsoft Internet Explorer
- Google Chrome
- Mozilla Firefox

> [!IMPORTANT]
> To interact with browsers, you need to install the appropriate browser extension and configure the browser accordingly. You can find more information regarding the supported browsers and the required extension in [Use browsers and manage extensions](using-browsers.md).

Browser automation is achieved by launching or attaching to one of the supported browsers and then deploying browser automation actions. Development may be performed manually or through the [use of the recorder](recording-flow.md).

The actions of this group enable users to interact with web pages and emulate events, such as clicking, using JavaScript scripts. 

By default, browser automation actions don't move the actual mouse on the screen. However, some actions like the **Click link on web page** and **Populate text field on web page** support physical interactions for cases where JavaScript events don't work as expected.

Browser automation actions can run even when the web browser is minimized, or the target tab isn't the focused tab. This functionality allows you to perform other activities on your computer while a browser automation flow is running. 

> [!IMPORTANT]
> If you enable physical interaction in a browser automation action, the browser can't be minimized, and the target tab must be focused.

## Building a browser automation flow

To begin a browser automation flow, use one of the browser-launching actions: **Launch new Microsoft Edge**, **Launch new Internet Explorer**, **Launch new Chrome**, or **Launch new Firefox**. You can start a new browser session or attach to an existing one.

![Screenshot of the Launch new Microsoft Edge action.](.\media\web-automation\launch-new-microsoft-edge-action.png)

After the browser instance is stored in a variable, you can deploy other browser automation actions to interact with the browser's content. The web form filling actions focus on providing input to web pages, while the web data extraction actions draw data from web pages.

Most browser automation actions require you to specify a browser instance and a UI element to interact with. You can find a list with all the available browser automation actions in the [Browser automation actions reference](actions-reference/webautomation.md).

![Screenshot of the inputs of the Populate text field on web page action.](.\media\web-automation\web-action-inputs.png)

Existing UI elements are displayed in the UI element pane, while new ones can be added directly through the action's properties or the pane. To find more information about UI elements and their different types, refer to [Automate using UI elements](ui-elements.md).

> [!NOTE]
> Browser automation actions accept exclusively UI elements captured from web pages. Therefore, existing UI elements captured from desktop applications aren't displayed in the browser automation actions.


![Screenshot of the available UI elements in the Populate text field on web page action.](.\media\web-automation\adding-new-elements-through-a-web-action.png)

To add a new UI element, highlight the appropriate web element and press **Ctrl & left-click**. After adding all the required elements, select **Done** to save them to the UI elements pane.

> [!NOTE]
> When the browser extension isn't able to communicate with Power Automate, the browser window is identified as a desktop application. As a result, Power Automate grabs desktop UI elements, not web UI elements.

![Screenshot of the highlighted UI elements to capture.](.\media\web-automation\capturing-new-elements.png)

## Data population on the web

To provide input to a web page, select the appropriate web form filling action depending on the nature of the element, and specify the browser instance.

![Screemshot of the Set drop-down list value on web page action.](.\media\web-automation\set-drop-down-list-value-on-web-page-action.png)

## Web data extraction

To extract a piece of data from a web page, use the **Get details of web page** or the **Get details of element on web page** action, depending on whether the data in question concerns the entire web page or an element inside it. You can find more information regarding details extraction from web pages in [Retrieve details from a web page](how-to/retrieve-details-web-page.md).

![Screenshot of the Get details of web page action.](.\media\web-automation\get-details-of-web-page-action.png)

Apart from the prepopulated options, you can manually select to retrieve any HTML attribute the selected web element may have. 

Additionally, the **Get details of element on web page** action supports the **waelementrectangle** attribute that retrieves the top-left point and the dimensions of a web element. You can find more information regarding this attribute in [Get the coordinates and size of a web element](how-to/get-coordinates-size-web-element.md).

![Screenshot of the Get details of element on web page action.](.\media\web-automation\get-details-of-element-on-web-page-action.png)

To extract large amounts of structured data, use the **Extract data from web page** action. After deploying the action, right-click on the required data on the web page to view the available options.

![Screenshot of a web page while extracting data from it.](.\media\web-automation\extracting-data-from-web-page.png)

Any lists or tables of data will be automatically identified after two of their elements are designated for extraction.

![Screenshot of a web page while extracting a data table from it.](.\media\web-automation\extracting-data-table-from-web-page.png)

## Interacting with the web and web services

Power Automate provides various HTTP actions to allow users to communicate directly with web resources, such as web pages, files, and APIs, without the need of a web browser. You can find a list with all the available HTTP actions in the [HTTTP actions reference](actions-reference/web.md).

### Downloading web resources

Use the **Download from web** action to directly download web page content or files stored on the web.

Both the **GET** and **POST** methods can be used with this action. The files can be downloaded directly to the disk, while web page contents are saved into a variable.

![Screenshot of the Download from web action.](./media/interacting-web-services/download-from-web-action.png)

### Accessing web APIs

Use the **Invoke web service** action to access web APIs. Various methods are compatible with this action, which is fully customizable in order to accommodate virtually any API.

> [!NOTE]
> Before using the **Invoke web service** action, refer to the documentation page of the web service you want to use. The example presented in the following screenshot can't be applied to all scenarios, as each web service requires a different configuration and syntax. 

![Screenshot of the Invoke web service action.](./media/interacting-web-services/invoke-web-service-action.png)

Apart from the **Invoke web service** action, Power Automate provides the **Invoke SOAP web service** action to interact with SOAP web services.

[!INCLUDE[footer-include](../includes/footer-banner.md)]