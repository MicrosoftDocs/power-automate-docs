---
title: Variable data types | Microsoft Docs
description: Variable data types
author: georgiostrantzas
ms.service: flow
ms.topic: article
ms.date: 09/22/2020
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Variable data types

[!INCLUDE [cc-beta-prerelease-disclaimer.md](../../includes/cc-beta-prerelease-disclaimer.md)]

Every variable belongs to a specific type, according to its content. Power Automate Desktop recognizes 17 distinct data types. 

Some of them can be used only with explicit actions, like **FTP connection**, while others are widely used throughout the platform like  **numbers**.  

## Simple data types

- **Text value** - Any kind of text, from email addresses to the text contents of a .txt file. 
- **Numeric value** - This is the type applied to numbers. Only this data type can be used in mathematical operations.
- **Boolean value** - The value can be either **True** or **False**.

## Advanced data types

- **List** - Collection of other items. Lists are the equivalent of single-dimension arrays in programming terms. 
- **Datarow** - A data row contains the values of a single row of a datatable.
- **Datatable** - Contains data in a tabular form. Datatables are the equivalent of a two-dimensional array in programming terms. 
- **Custom object** – Contains pairs of properties and values, which can be easily converted to JSON format. 

## Instances

- **Web browser instance** – Contains a browser instance created through the **Launch new Internet Explorer** or other browser launching actions.
- **Window instance** – Contains a window instance created through the **Get window** action.
- **Excel instance** – Contains an Excel instance created through the **Launch Excel** action.
- **Outlook instance** - Contains an Outlook instance created through the **Launch Outlook** action.

## Connections

- **SQL connection** - Contains a connection to an SQL database established through the **Open SQL connection** action.
- **Exchange connection** - Contains a connection to an Exchange server established through the **Connect to Exchange server** action.

## Active Directory

- **Active Directory entry** - Contains a connection to an Active Directory server established through the **Connect to server** action.
- **Group info** - Contains information about a specified Active Directory group.
- **Group member** - Represents a member of a specified Active Directory group.
- **User info** - Contains information about a specified Active Directory user.

## Azure

- **Azure client** - Contains an Azure session created through the **Create session** action.
- **Azure resource group** - Represents a retrieved Azure resource group.
- **Azure managed disk** - Represents a retrieved Azure disk.
- **Azure snapshot** - Represents an Azure snapshot.
- **Azure virtual machine** - Represents a retrieved Azure virtual machine.
- **Azure virtual machine info** - Contains information about an Azure virtual machine.
- **Azure subscription** - Represents a retrieved Azure subscription.

## AWS

- **EC2 client** - Contains an EC2 session created through the **Create EC2 session** action.
- **EC2 instance** - Represents a retrieved EC2 instance.
- **EC2 instances info** - Contains information about an EC2 instance.
- **Instance state change** - Contains information about an EC2 instance that was started or stopped.
- **EBS snapshot** - Represents an EBS snapshot.
- **EBS volume** - Represents an EBS volume.

## Others

- **Datetime** - Contains date and time information.
- **File** - Represents a file.
- **Folder** - Represents a folder.
- **FTP connection** - Contains an FTP connection created through the **Open FTP connection** and **Open secure FTP connection** actions.
- **FTP file** - Represents an FTP file.
- **FTP directory** - Represents an FTP directory
- **Mail message** - Represents an email message. The **Retrieve emails** action populates these variables.
- **Exchange mail message** - Represents an email message retrieved from an Exchange server. The **Retrieve Exchange email messages** action populates these variables.
- **Outlook mail message** - Represents an email Outlook message. The **Retrieve email messages from Outlook** action populates these variables.
- **OCREngineObject** – Contains an OCR engine created through the **Create OCR engine** action.
- **CMD session** - Contains a CMD session created through the **Open CMD session** action.
- **Terminal session** - Contains a terminal session created through the **Open terminal session** action.
- **XML node** - Contains the content of an XML document. The **Read XML from file** action populates these variables.