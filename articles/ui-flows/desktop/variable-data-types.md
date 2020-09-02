---
title: Variable data types | Microsoft Docs
description: Variable data types
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 02/26/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Variable data types

Every variable belongs to a specific type, according to its content. **Power Automate Desktop** recognizes 17 distinct data types. 

Some of them can be used only with explicit actions, like **FTP connection**, while others are widely used throughout the platform like  **numbers**.  

**Simple data types**

- **Text** - Any kind of text, from email addresses to the text contents of a .txt file. 
- **Number** - Numerical values. Only this data type can be used in mathematical operations.
- **Boolean** - The value can be either **True** or **False**.

**Advanced data types**

- **List** - Collection of other items. Lists are the equivalent of a single-dimension array in programming terms. 
- **Data row** - A data row contains multiple values in a single, iterable row.
- **Data table** - Contains data in a tabular form. Data tables are the equivalent of a two-dimensional array in programming terms. 
- **Custom object** – Contains pairs of properties and values, and can be easily translated into JSON format. 

**Instances**

- **Custom dialog instance** – Stores the instance of a custom dialog created through the **Display custom dialog** action. 
- **Browser instance** – Contains a browser instance created through the **Launch new Internet Explorer** or other browser launching actions.
- **Window instance** – Contains a window instance created through the **Get window** action.
- **Excel instance** – Contains an Excel instance created through the **Launch Excel** action.

**Others**

- **Date time** - Contains date and time information.
- **FTP connection** - Contains an FTP connection created through the **Open FTP connection** and **Open secure FTP connection** actions.
- **File** - Represents a file.
- **Folder** - Represents a folder.
- **Mail message** - Represents an email message. The **Retrieve emails** action populates these variables.
- **OCR engine** – Contains an OCR engine created through the **Create OCR engine** action.