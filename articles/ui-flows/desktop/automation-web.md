---
title: Automation in the web | Microsoft Docs
description: Automation in the web
author: rokontol
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: rokontol
ms.reviewer: rokontol
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Automation in the web

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

The flow designer includes a number of actions under the **Web automation** category, each of them corresponding to an interaction between a user and a web browser.

Four web browsers are currently supported:

* Internet Explorer
* Edge
* Firefox
* Chrome

Web automation is achieved by launching, or attaching to, one of the aforementioned browsers, then performing web automation actions on them. Development may be performed manually, or through the use of the web recorder.

## Building a web automation flow

To begin a web automation flow, use one of the Launch web browser actions (**Launch new Internet Explorer**, **Launch new Edge**, **Launch new Firefox**, or **Launch new Chrome**) to start a new browser session, or attach to an already existing one:

![Launch web browser](.\media\web-automation\launch-web-browser-action.png)

> [NOTE!]
> Some browsers may require configuration before they can be used in Power Automate Desktop. Refer to the relevant article for more information.

After the browser session is stored in a variable, add other web automation actions to interact with the browser's content. The **Web form filling** action group focuses on providing input to web pages, while **Web data extraction** actions draw data from web pages, to be used in the flow.

Most web automation actions require a browser instance as input, as well as a web element with which to interact:

![Web action inputs](.\media\web-automation\web-action-inputs.png)

Existing web elements may be added from the repository, while new ones may also be added directly from the action's properties:

![Adding new elements through a web action](.\media\web-automation\adding-new-elements-through-a-web-action.png)

To add a new element, highlight it and press **Ctrl & left-click**:

![Capturing new elements](.\media\web-automation\capturing-new-elements.png)

After adding all the required elements, select **Done** to save them to the repository.

## Data population on the web

To provide input to a web page, select the appropriate **Web form filling** action depending on the nature of the element to interact with, and specify the browser instance:

![Set drop down list value on web page action](.\media\web-automation\set-drop-down-list-value-on-web-page-action.png)

![Populate text field on web page action](.\media\web-automation\populate-text-field-on-web-page-action.png)

## Web data extraction

To extract a piece of data from a web page, use the appropriate action, depending on whether the data in question concerns the entire web page, or an element inside it:

![Get details of web page action](.\media\web-automation\get-details-of-web-page-action.png)

![Get details of element on web page action](.\media\web-automation\get-details-of-element-on-web-page-action.png)

To extract larger amounts of data, use the **Extract data from web page** action, then right-click on the required data on the web page to view the available options:

![Extracting data from web page](.\media\web-automation\extracting-data-from-web-page.png)

 Note that any lists or tables of data will be automatically identified after two of their elements are designated for extraction:

![Extracting data table from web page](.\media\web-automation\extracting-data-table-from-web-page.png)