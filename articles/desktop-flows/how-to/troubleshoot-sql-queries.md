---
title: Troubleshoot SQL queries | Microsoft Docs
description: Troubleshoot SQL queries
author: georgiostrantzas
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: article
ms.date: 08/05/2021
ms.author: v-gtrantzas
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Troubleshoot SQL queries

While developing flows that run queries on databases, you may encounter errors in the deployed database actions.

If you can't identify the source of the issue through the displayed error messages, perform the following troubleshooting steps:

1. Replace any single quote (**'**) characters with double quotes (**"**) or the other way around. 

    For example, the following query produces an error because of the single quote at the end of the variable’s value. 

    ``` SQL
    SELECT * FROM SALES WHERE VALUE = '%value%'; 
    ```
    To resolve this issue, replace the single quotes in the SQL statement with double-quotes.

    ``` SQL
    SELECT * FROM SALES WHERE VALUE = "%value%"; 
    ```

1. Escape percentage signs (**%**) that don't indicate variables.

    Power Automate Desktops identifies percentage signs as characters that indicate variables. To use them as normal characters, escape them using an extra percentage sign (%%). 
    
    > [!NOTE]
    > You can find more information about the percentage signs in [Use variables and the % notation](../variable-manipulation.md).

1. Verify that the firewall or any other network security system isn't blocking the connection between Power Automate Desktop and the database. 

1. If you're using database actions to run queries on Excel files, ensure that you've applied the following practices:
    
    - The name of the Excel worksheet is used as a database name. Enclose the worksheet name in brackets (**\[\]**) and add a dollar sign (**\$**) at the end, for example **\[Sheet1$\]**. 
    - The database columns are the headers of the Excel data table. 

    ``` SQL
    SELECT * FROM [Sheet1$] WHERE Value = "%value%"; 
    ```

