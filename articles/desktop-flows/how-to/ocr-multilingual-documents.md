---
title: Perform OCR on multilingual documents | Microsoft Docs
description: Perform OCR on multilingual documents
author: georgiostrantzas
ms.service: power-automate
ms.topic: article
ms.date: 06/08/2021
ms.author: getrantz
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Perform OCR on multilingual documents

Optical character recognition (OCR) enables you to locate and extract text from images or the screen.

Although most scenarios require you to handle text in a specific language, there are cases where the sources are multilingual.

To perform OCR in these sources, use a Tesseract engine in the respective OCR action and enable the **Use other languages** option in the engine settings.

![The Use other languages option in the Exctract text witg OCR action.](media/ocr-multilingual-documents/use-other-languages-extract-text-ocr-action.png)

When the **Use other languages** option is enabled, the action displays two additional settings: the **Language abbreviation** and **Language data path** fields.

The **Language abbreviation** field indicates to the engine which language to look for during OCR. 
The **Language data path** field contains the language data files used to train the OCR engine.

> [!NOTE]
> You can download the Tesseract OCR data files from [this GitHub repository](https://github.com/tesseract-ocr/tessdata/) or [this page](https://tesseract-ocr.github.io/tessdoc/Data-Files).

![The Language abbreviation and Language data path fields in the Exctract text witg OCR action.](media/ocr-multilingual-documents/language-abbreviation-extract-text-ocr-action.png)

After downloading the data files for the needed languages, move them to a common folder to make them available under the same path.

Next, select the  created folder in the **Language data path** field, and populate the corresponding language codes in the **Language abbreviation** field. To separate the language codes, use the plus character (**+**).

![The populated Language abbreviation and Language data path fields in the Exctract text witg OCR action.](media/ocr-multilingual-documents/populated-language-abbreviation-extract-text-ocr-action.png)
