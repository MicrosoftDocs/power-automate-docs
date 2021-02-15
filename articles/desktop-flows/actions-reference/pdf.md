---
title: PDF | Microsoft Docs
description: PDF Actions Reference
author: mariosleon
ms.service: flow
ms.topic: article
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
|[Extract images from PDF](#extractimagesfrompdfaction)|
|[Extract text from PDF](#extracttextfrompdfaction)|
|[Extract PDF pages to new PDF](#extractpages)|
|[Merge PDF files](#mergefiles)|

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