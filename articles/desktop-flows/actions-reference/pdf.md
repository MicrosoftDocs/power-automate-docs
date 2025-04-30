---
title: PDF actions reference
description: See all the available PDF actions.
author: mattp123

ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 10/20/2023
ms.author: iomavrid
ms.reviewer: matp
contributors:
- Yiannismavridis
- NikosMoutzourakis
- PetrosFeleskouras
search.audienceType: 
  - flowmaker
  - enduser
---

# PDF actions

PDF actions enable you to extract images, text, and tables from PDF files, and arrange pages to create new documents.

To extract text from a PDF file, use the **Extract text from PDF** action. The following example extracts text from a specific range of pages of a password-protected file. The password is specified in the **Advanced** settings.

To extract texts arranged in a tabular form, enable **Optimize for structured data** to improve the results' format and accuracy.

:::image type="content" source="media\pdf\extract-text-pdf-example.png" alt-text="Screenshot of the Extract text from PDF action.":::

To extract tables from a PDF file, deploy the **Extract tables from PDF** action, select the file, and specify the pages to extract from.

The action produces the **ExtractedPDFTables** variable that contains a list of PDF table info. To find information about this type of list, go to [Advanced data types](../variable-data-types.md#advanced-data-types).

> [!NOTE]
>
> - The **Extract tables from PDF** action doesn't use Optical Character Recognition (OCR), so you can't extract non-copyable text from scanned PDFs.
> - The library behind the action occasionally extracts additional PDF data that aren't tables. This functionality minimizes the risk of accidentally omitting a real table.

:::image type="content" source="media\pdf\extract-tables-pdf-example.png" alt-text="Screenshot of the Extract tables from PDF action.":::

Apart from extracting information from PDF files, you can create a new PDF document from an existing file using the **Extract PDF file pages to new PDF file** action.

The following example selects a combination of specific pages and a range of pages.

:::image type="content" source="media\pdf\extract-pdf-new-file-example.png" alt-text="Screenshot of the Extract PDF file pages to new PDF file action.":::

## <a name="extracttextfrompdfaction"></a> Extract text from PDF

You can extract text from a PDF file by using the "Extract text from PDF" action. In the action properties you can define the source PDF file and the pages that text should be extracted from. Under the advanced action properties you can define a password in case the PDF file is protected and if the engine should optimize for structured data or not. 

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PDF file|No|[File](../variable-data-types.md#files-and-folders)||The PDF file to extract text from. Enter a file path, a variable containing a file or a text path|
|Page(s) to extract|N/A|All, Single, Range|All|Specifies how many pages to extract: All pages, a single page or a range of pages|
|Single page number|No|[Numeric value](../variable-data-types.md#numeric-value)||The number of the single page to extract text from|
|From page number|No|[Numeric value](../variable-data-types.md#numeric-value)||The first page number from the range of pages to extract text from|
|To page number|No|[Numeric value](../variable-data-types.md#numeric-value)||The last page number from the range of pages to extract text from|
|Password|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password of the PDF file. Leave this blank if the PDF isn't password protected|
|Optimize for structured data|N/A|[Boolean value](../variable-data-types.md#boolean-value)|False|Specify whether to detect formatted layout in the document and extract text accordingly|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ExtractedPDFText|[Text value](../variable-data-types.md#text-value)|The extracted text|

### <a name="extracttextfrompdfaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|PDF file doesn't exist|File doesn't exist on the given path|
|Invalid password|The given password is invalid|
|Failed to extract text|Error while trying to extract text|

## <a name="extracttablesfrompdfaction"></a> Extract tables from PDF

You can extract tables that are contained in a PDF file by using the **Extract tables from PDF** action. In the action properties you can define the PDF file and the range of pages that the tables will be extracted from. Under the advanced action properties you can define a password in case a the PDF file is protected, define if the table has headers or not, and finally if tables that cross page margins should be merged or not.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PDF file|No|[File](../variable-data-types.md#files-and-folders)||The PDF file to extract tables from. Enter a file path, a variable containing a file or a text path|
|Page(s) to extract|N/A|All, Single, Range|All|Specifies how many pages to extract tables from: all pages, a single page or a range of pages|
|Single page number|No|[Numeric value](../variable-data-types.md#numeric-value)||The number of the single page to extract tables from|
|From page number|No|[Numeric value](../variable-data-types.md#numeric-value)||The first page number from the range of pages to extract tables from|
|To page number|No|[Numeric value](../variable-data-types.md#numeric-value)||The last page number from the range of pages to extract tables from|
|Password|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password of the PDF file. Leave this blank if the PDF isn't password protected|
|Merge tables that cross page margins|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether to merge tables that cross page margins in the specified page range|
|First line contains column names|N/A|[Boolean value](../variable-data-types.md#boolean-value)|True|Specifies whether the first line of table contains column names|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ExtractedPDFTables|[List of PDF table info](../variable-data-types.md#list-of-pdf-table-info)|The extracted tables with their info as a list|

### <a name="extracttablesfrompdfaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|PDF file doesn't exist|File doesn't exist on the given path|
|Invalid password|The given password is invalid|
|Failed to extract tables|Error while trying to extract tables|

## <a name="extractimagesfrompdfaction"></a> Extract images from PDF

To extract images from a PDF file you can use the **Extract images from PDF** action. In the action parameters you can define the PDF file and the pages to extract images from, the naming convention of the extacted images and the target location of the saved images. You can also define a password if the PDF file is protected under the advanced settings. 

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PDF file|No|[File](../variable-data-types.md#files-and-folders)||The PDF file to extract images from. Enter a file path, a variable containing a file or a text path|
|Password|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password of the PDF file. Leave this blank if the PDF isn't password protected|
|Page(s) to extract|N/A|All, Single, Range|All|Specifies how many pages to extract: All pages, a single page or a range of pages|
|Single page number|No|[Numeric value](../variable-data-types.md#numeric-value)||The number of the single page to extract images from|
|From page number|No|[Numeric value](../variable-data-types.md#numeric-value)||The first page number from the range of pages to extract images from|
|To page number|No|[Numeric value](../variable-data-types.md#numeric-value)||The last page number from the range of pages to extract images from|
|Image(s) name|No|[Text value](../variable-data-types.md#text-value)||How the name of the image(s) starts. Extracted image(s) name example: GivenName_1, GivenName_2|
|Save image(s) to|No|[Folder](../variable-data-types.md#files-and-folders)||The folder to save the extracted images as png files|

### Variables produced

This action doesn't produce any variables.

### <a name="extractimagesfrompdfaction_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid password|The given password is invalid|
|Failed to extract images |Indicates that an error occurred while extracting images from the given pages of the PDF|
|Folder doesn't exist|Indicates that the folder doesn't exist|
|PDF file doesn't exist|File doesn't exist on the given path|

## <a name="extractpages"></a> Extract PDF file pages to new PDF file

You can create a new PDF file by extracting pages from an existing PDF file by using the **PDF file pages to a new PDF file** action. In the action parameters you can define the PDF file to extract the pages from, the page(s) to be extracted, the location of the new PDF file and what should happen if a file with the same name and extension already exists. Finally, under the advanced properties you can define a password in case the source PDF is protected. 

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PDF file|No|[File](../variable-data-types.md#files-and-folders)||The PDF file to extract pages from. Enter a file path, a variable containing a file or a text path|
|Password|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The password of the PDF file. Leave this blank if the PDF isn't password protected|
|Page selection|No|[Text value](../variable-data-types.md#text-value)||The index numbers of the pages to keep (for example, 1,3,17-24)|
|Extracted PDF path|No|[File](../variable-data-types.md#files-and-folders)||The path to store the extracted PDF file|
|If file exists|N/A|Overwrite, Don't overwrite, Add sequential suffix|Add sequential suffix|Specifies what to do in case the output PDF file already exists|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|ExtractedPDF|[File](../variable-data-types.md#files-and-folders)|The new PDF file|

### <a name="extractpages_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|Invalid password|The given password is invalid|
|PDF file doesn't exist|File doesn't exist on the given path|
|Page out of bounds|Indicates that one or more pages are out of bounds of the PDF file|
|Invalid page selection|Indicates that the given pages aren't valid for the PDF file|
|Failed to extract new PDF |Indicates that an error occurred while trying to extract new PDF |

## <a name="mergefiles"></a> Merge PDF files

Merges multiple PDF files into a new one.

You can use the **Merge PDF files** action to take two or more PDF files and merge them into a single file. The files to be merged can be provided either in the form of a list, or enclosed in double quotes and separated by a delimiter. You can also provide passwords for the PDF files, in case they are password-protected.

### Input parameters

|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PDF files|No|[List](../variable-data-types.md#list) of [Files](../variable-data-types.md#files-and-folders)||The files to merge. Enclose multiple files in double quotes (") and separate them by a delimiter, or use a list of files|
|Merged PDF path|No|[File](../variable-data-types.md#files-and-folders)||The path to store the merged PDF|
|If file exists|N/A|Overwrite, Don't overwrite, Add sequential suffix|Add sequential suffix|Specifies what to do in case the destination file already exists|
|Passwords|Yes|Direct encrypted input or [Text value](../variable-data-types.md#text-value)||The delimited passwords. The order should be the same as the order of the input PDFs. Leave this blank if the PDFs aren't password protected|
|Delimiter|No|[Text value](../variable-data-types.md#text-value)|,|A custom password delimiter. This delimiter shouldn't be part of any of the passwords|

### Variables produced

|Argument|Type|Description|
|-----|-----|-----|
|MergedPDF|[File](../variable-data-types.md#files-and-folders)|The merged PDF file|

### <a name="mergefiles_onerror"></a> Exceptions

|Exception|Description|
|-----|-----|
|PDF file doesn't exist|File doesn't exist on the given path|
|Invalid password|The given password is invalid|
|Failed to merge PDF files|Indicates that an error occurred while merging the files|

> [!NOTE]
> When using the "Merge PDF Files" action, the destination for the merged PDF should not be one of the original files being merged. Doing so can result in the failure of the action and potential deletion of the original file. To avoid this, always designate a new file location for the merged PDF output to ensure the integrity of your original documents.

[!INCLUDE[footer-include](../../includes/footer-banner.md)]
