---
title: Building a web automation flow | Microsoft Docs
description: Building a web automation flow
author: rokontol
ms.service: flow
ms.topic: article
ms.date: 09/01/2020
ms.author: rokontol
ms.reviewer: rokontol
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Building a web automation flow

To begin a web automation flow, use one of the Launch Web Browser actions (**Launch New Internet Explorer**, **Launch New Edge**, **Launch New Firefox**, or **Launch New Chrome**) to start a new browser session, or attach to an already existing one:

![Launch web browser](.\media\building-web-flow\launch-web-browser-action.png)

> [NOTE!]
> Some browsers may require configuration before they can be used in PAD. Refer to the relevant article for more information.

After the browser session is stored in a variable, add other web automation actions to interact with the browser's content. The **Web forms** action group focuses on providing input to web pages, while **web data extraction** actions draws data from web pages, to be used in the flow.

Most web automation actions require a browser instance as input, as well as a web element with which to interact:

![Web action inputs](.\media\building-web-flow\web-action-inputs.png)

Existing web elements may be added from the Repository, while new ones may also be added directly from the action's properties:

![Adding new elements through a web action](.\media\building-web-flow\adding-new-elements-through-a-web-action.png)

To add a new element, highlight it and press Ctrl & left-click:

![Capturing new elements](.\media\building-web-flow\capturing-new-elements.png)

After adding all the required elements, select **Done** to save them to the repository.

## Data population on the web

To provide input to a web page, select the appropriate **Web form filling** action depending on the nature of the element to interact with, and specify the browser instance:

![Set drop down list value on web page action](.\media\building-web-flow\set-drop-down-list-value-on-web-page-action.png)

![Populate text field on web page action](.\media\building-web-flow\populate-text-field-on-web-page-action.png)

## Web data extraction

To extract a piece of data from a web page, use the appropriate action, depending on whether the data in question concerns the entire web page, or an element inside it:

![Get details of web page action](.\media\building-web-flow\get-details-of-web-page-action.png)

![Get details of element on web page action](.\media\building-web-flow\get-details-of-element-on-web-page-action.png)

To extract larger amounts of data, use the **Extract data from web page** action, then right-click on the required data on the web page to view the available options:

![Extracting data from web page](.\media\building-web-flow\extracting-data-from-web-page.png)

 Note that any lists or tables of data will be automatically identified after two of their elements are designated for extraction:

![Extracting data table from web page](.\media\building-web-flow\extracting-data-table-from-web-page.png)