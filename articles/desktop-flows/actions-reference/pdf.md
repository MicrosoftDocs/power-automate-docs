---
title: PDF | Microsoft Docs
description: PDF Actions Reference
author: mariosleon
ms.service: power-automate
ms.subservice: desktop-flow
ms.topic: reference
ms.date: 12/02/2020
ms.author: marleon
ms.reviewer:
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# PDF



Automate PDF files and their content (text and images)

|<!-- --> |
|-----|
|[Extract tables from PDF](#extracttablesfrompdfaction)|
|[Extract text from PDF](#extracttextfrompdfaction)|
|[Extract images from PDF](#extractimagesfrompdfaction)|
|[Extract PDF pages to new PDF](#extractpages)|
|[Merge PDF files](#mergefiles)|

## Getting started with PDF actions

Use the PDF action group to extract images and text from PDF files and arrange pages to create new documents.

To extract text from a PDF file, use the **Extract text from PDF** action. In the example below, a file has been specified, and the action is configured to extract text from a range of pages. In the **Advanced** section, a password has been entered to access the secure file.

![Screenshot of the Extract text from PDF action.](media\pdf\extract-text-pdf-example.png)

Similarly, extract images with the **Extract images from PDF** action. This action contains an additional option to specify a prefix for the image names.

To create a new PDF document from an existing file, use the **Extract PDF file pages to new PDF file**. In the example below, the source document has been selected, and a file name for a new document has been specified. The pages have been entered as a combination of specific pages and a range.

![Screenshot of the Extract PDF file pages to new PDF file action.](media\pdf\extract-pdf-new-file-example.png)


## PDF actions


### <a name="extracttextfrompdfaction"></a> Extract text from PDF
Extract text from a PDF file

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PDF file|No|File||The PDF file to extract text from. Enter a file path, a variable containing a file or a text path|
|Password|Yes|Encrypted value||The password of the PDF file. Leave this blank if the PDF isn't password protected|
|Page(s) to extract|N/A|All, Single, Range|All|Specifies how many pages to extract: All pages, a single page or a range of pages|
|Single page number|No|Numeric value||The number of the single page to extract text from|
|From page number|No|Numeric value||The first page number from the range of pages to extract text from|
|To page number|No|Numeric value||The last page number from the range of pages to extract text from|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ExtractedPDFText|Text value|The extracted text|

##### <a name="extracttextfrompdfaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|PDF file doesn't exist|File doesn't exist on the given path|
|Invalid password|The given password is invalid|
|Failed to extract text|Error while trying to extract text|

### <a name="extracttablesfrompdfaction"></a> Extract tables from PDF
Extract tables from a PDF file

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PDF file|No|File||The PDF file to extract tables from. Enter a file path, a variable containing a file or a text path|
|Page(s) to extract|N/A|All, Single, Range|All|Specifies how many pages to extract tables from: all pages, a single page or a range of pages|
|Single page number|No|Numeric value||The number of the single page to extract tables from|
|From page number|No|Numeric value||The first page number from the range of pages to extract tables from|
|To page number|No|Numeric value||The last page number from the range of pages to extract tables from|
|Password|Yes|Encrypted value||The password of the PDF file. Leave this blank if the PDF isn't password protected|
|Merge tables that cross page margins|N/A|Boolean value|True|Specifies whether to merge tables that cross page margins in the specified page range|
|First line contains column names|N/A|Boolean value|True|Specifies whether the first line of table contains column names|

##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ExtractedPDFTables|Datatable|The extracted tables|

##### <a name="extracttablesfrompdfaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|PDF file doesn't exist|File doesn't exist on the given path|
|Invalid password|The given password is invalid|
|Failed to extract tables|Error while trying to extract tables|

### <a name="extractimagesfrompdfaction"></a> Extract images from PDF
Extract images from a PDF file

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PDF file|No|File||The PDF file to extract images from. Enter a file path, a variable containing a file or a text path|
|Password|Yes|Encrypted value||The password of the PDF file. Leave this blank if the PDF isn't password protected|
|Page(s) to extract|N/A|All, Single, Range|All|Specifies how many pages to extract: All pages, a single page or a range of pages|
|Single page number|No|Numeric value||The number of the single page to extract images from|
|From page number|No|Numeric value||The first page number from the range of pages to extract images from|
|To page number|No|Numeric value||The last page number from the range of pages to extract images from|
|Image(s) name|No|Text value||How the name of the image(s) starts. Extracted image(s) name example: GivenName_1, GivenName_2|
|Save image(s) to|No|Folder||The folder to save the extracted images as png files|


##### Variables Produced
- This action doesn't produce any variables

##### <a name="extractimagesfrompdfaction_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid password|The given password is invalid|
|Failed to extract images |Indicates that an error occured while extracting images from the given pages of the PDF|
|Folder doesn't exist|Indicates that the folder doesn't exist|
|PDF file doesn't exist|File doesn't exist on the given path|


### <a name="extractpages"></a> Extract PDF pages to new PDF
Extract pages from a PDF file to a new PDF file

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PDF file|No|File||The PDF file to extract pages from. Enter a file path, a variable containing a file or a text path|
|Password|Yes|Encrypted value||The password of the PDF file. Leave this blank if the PDF isn't password protected|
|Page selection|No|Text value||The index numbers of the pages to keep (eg 1,3,17-24 )|
|Extracted PDF path|No|File||The path to store the extracted PDF file|
|If file exists|N/A|Overwrite, Don't overwrite, Add sequential suffix|Add sequential suffix|Specifies what to do in case the output PDF file already exists|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|ExtractedPDF|File|The new PDF file|


##### <a name="extractpages_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|Invalid password|The given password is invalid|
|PDF file doesn't exist|File doesn't exist on the given path|
|Page out of bounds|Indicates that one or more pages are out of bounds of the PDF file|
|Invalid page selection|Indicates that the given pages aren't valid for the PDF file|
|Failed to extract new PDF |Indicates that an error occured while trying to extract new PDF |

### <a name="mergefiles"></a> Merge PDF files
Merges multiple PDF files into a new one

##### Input Parameters
|Argument|Optional|Accepts|Default Value|Description|
|-----|-----|-----|-----|-----|
|PDF files|No|List of Files||The files to merge. Enclose multiple files in double quotes (") and separate them by a delimiter, or use a list of files|
|Merged PDF path|No|File||The path to store the merged PDF|
|If file exists|N/A|Overwrite, Don't overwrite, Add sequential suffix|Add sequential suffix|Specifies what to do in case the destination file already exists|
|Passwords|Yes|Encrypted value||The delimited passwords. The order should be the same as the order of the input PDFs. Leave this blank if the PDFs aren't password protected|
|Delimiter|Yes|Text value|,|A custom password delimiter. This delimiter shouldn't be part of any of the passwords|


##### Variables Produced
|Argument|Type|Description|
|-----|-----|-----|
|MergedPDF|File|The merged PDF file|


##### <a name="mergefiles_onerror"></a> Exceptions
|Exception|Description|
|-----|-----|
|PDF file doesn't exist|File doesn't exist on the given path|
|Invalid password|The given password is invalid|
|Failed to merge PDF files|Indicates that an error occured while merging the files|




[!INCLUDE[footer-include](../../includes/footer-banner.md)]