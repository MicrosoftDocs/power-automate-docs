---
title: Use markdown to format Power Automate approvals | Microsoft Docs
description: Learn to use markdown to format Power Automate approval requests.
services: ''
suite: flow
documentationcenter: na
author: hamenon-ms
editor: ''
tags: ''

ms.devlang: na
ms.subservice: cloud-flow
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 06/28/2021
ms.author: hamenon
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Use Markdown in Power Automate approval requests


This article teaches you how to use [Markdown](https://en.wikipedia.org/wiki/Markdown) syntax to add rich formatting to your approval requests.

> [!IMPORTANT]
>
> - Approval request emails are *actionable messages*. If your [Microsoft Outlook client](/outlook/actionable-messages/#outlook-version-requirements-for-actionable-messages) doesn't support actionable messages, it displays approval requests in HTML format. 
> - All Markdown renderers have implementation differences. Review the [Client Support](#client-support) section for details.
> - Markdown is not currently supported for the Approvals app on Microsoft Teams.
> - Markdown is not currently supported for [GCC and GCC High customers](./us-govt.md).

## Client Support

Markdown support among clients is inconsistent. The Power Automate team works to address these inconsistencies, however, inconsistencies remain. The following table lays out the known limitations among the supported clients.

| Feature | Power Automate | Power Automate mobile app | Outlook | Outlook Web | Teams | Teams mobile app | Approvals Teams App |   
|---------|--------|---------------|-----------------|-------------|-------|--------------|--------------|
| **Headers** | Yes | Yes | Yes | Yes | **_No_** | **_No_** | **_No_** |
| **Numbered Lists** | Yes | Yes | **_No_** | Yes | Yes | Yes | **_No_** |
| **Nested Numbered Lists** | Yes | Yes | **_No_** | Yes | Yes | Yes | **_No_** |
| **Tables** | Yes | Yes | Yes | Yes | **_No_** | **_No_** | **_No_** |
| **Images** | **_No_** | **_No_** | **_No_** | **_No_** | **_No_** | **_No_** | **_No_** |
| **Forced Line Breaks** | Yes* | Yes* | **_No_** (use a blank line instead) | Yes* | Yes* | Yes* | **_No_** |
| **Blank Lines** | **_No_** | **_No_** | Yes | Yes | **_No_** | Yes | **_No_** |
| **Emphasis** | Yes | Yes | Yes | Yes | **_No_** | **_No_** | **_No_** |

*Forced line breaks *within table cells* are not supported for Power Automate, the Power Automate mobile app, Outlook Web, Teams, and the Teams mobile app.

> [!NOTE]
> For Outlook Mobile, the previous parameters can vary depending on the Outlook client app and version that you are using.

## Headers

Structure your comments using headers. Headers segment longer comments, making them easier to read.

Start a line with a hash character `#` to set a heading. Organize your remarks with subheadings by starting a line with additional hash characters, for example `####`. Up to six levels of headings are supported.

**Example:**  
```Markdown
# This is a H1 header
## This is a H2 header
### This is a H3 header
#### This is a H4 header
##### This is a H5 header
```

**Result:**  
![Export flow.](./media/approvals-markdown-support/mrkdown-headers.png)

## Paragraphs and line breaks

Make your text easier to read by breaking it up with paragraphs or line breaks. Enter two spaces prior to the line break to force most clients to start a new line.  

**Example:**  
```Markdown
This is line 1.(space)
Now text will appear on the next line.
```

**Result:**
This is line 1.  
Now text will appear on the next line. 

**Example 2**
```Markdown
This is line 1.(space, space)  

Line 2 has extra space before it.
```

**Result:**  
This is line 1.  

Line 2 has extra space before it.
  
## Lists

Organize related items with lists. You can add ordered lists with numbers, or unordered lists with just bullets.

Ordered lists start with a number followed by a period for each list item. Unordered lists start with a `*`. Begin each list item on a new line. In a Markdown file or widget, enter two spaces prior to the line break to begin a new paragraph, or enter two line breaks consecutively to begin a new paragraph.

### Ordered or numbered lists

**Example:**

```Markdown
0. First item.
0. Second item.
0. Third item.
```

**Result:**  
1. First item.
2. Second item.
3. Third item.

### Bullet lists

**Example:**

```Markdown
- Item 1
- Item 2
- Item 3
```

**Result:**

- Item 1
- Item 2
- Item 3

### Nested lists

**Example:**

```Markdown
1. First item.
   - Item 1
   - Item 2
   - Item 3
1. Second item.
   - Nested item 1
   - Nested item 2
   - Nested item 3
```

**Result:** 
1. First item.

    - Item 1
    - Item 2
    - Item 3
2. Second item.
    - Nested item 1
    - Nested item 2
    - Nested item 3


## Links

HTTP and HTTPS URLs are automatically formatted as links. 

You can set text hyperlinks for your URL using the standard markdown link syntax:

```Markdown
[Link Text](Link URL)
```

**Example:**  
```Markdown
[Power Automate](https://flow.microsoft.com)
```

**Result:**  
[Power Automate](https://flow.microsoft.com)

## Tables

Organize structured data with tables. 

- Place each table row on its own line 
- Separate table cells using the pipe character `|` 
- The first two lines of a table set the column headers and the alignment of elements in the table
- Use colons (`:`) when dividing the header and body of tables to specify column alignment (left, center, right) 
- Make sure to end each row with a CR or LF. 

**Example:**  
```Markdown
| Heading 1 | Heading 2 | Heading 3 |  
|-----------|:-----------:|-----------:|  
| Cell A1 | Cell A2 | Cell A3 |  
| Cell B1 | Cell B2 | Cell B3 |  
```


**Result:**  

| Heading 1 | Heading 2 | Heading 3 |  
|-----------|:-----------:|-----------:|  
| Cell A1 | Cell A2 | Cell A3 |  
| Cell B1 | Cell B2 | Cell B3<br>second line of text |  

 
## Emphasis (bold, italics, strikethrough)  

You can emphasize text by applying bold, italics, or strikethrough to characters:
- To apply italics: surround the text with an asterisk `*` or underscore `_`
- To apply bold: surround the text with double asterisks `**`.    
- To apply strikethrough: surround the text with double tilde characters `~~`.

Combine these elements to apply multiple emphases to text.    

**Example:**  
```Markdown
Use _emphasis_ in comments to express **strong** opinions and point out ~~corrections~~ 
**_Bold, italicized text_**  
**~~Bold, strike-through text~~**
```

**Result:**  
Use _emphasis_ in comments to express **strong** opinions and point out <s>corrections</s>   
**_Bold, italicized text_**   
**~~Bold, strike-through text~~**  

## Special characters

<table width="650px">
<tbody valign="top">
<tr>
<th width="300px">Syntax</th>
<th width="350px">Example/notes</th>
</tr>



<tr>
<td>
<p>To insert one of the following characters, prefix with a backslash:</p>

<p>```\   backslash ``` </p>
<p ><code>\`</code>   `backtick`</p>
<p >```_   underscore  ```</p>
<p >```{}  curly braces  ``` </p>
<p >```[]  square brackets ```</p>
<p >```()  parentheses  ```</p>
<p >```#   hash mark  ``` </p>
<p >```+   plus sign  ```</p>
<p >```-   minus sign (hyphen) ```</p>
<p >```.   dot  ``` </p>
<p >```!   exclamation mark ```</p>


</td>
<td>Some examples on inserting special characters
<p>Enter ```\\``` to get \\ </p>
<p>Enter ```\_``` to get \_ </p>
<p>Enter ```\#``` to get \# </p>
<p>Enter ```\(``` to get \( </p>
<p>Enter ```\.``` to get \. </p>
<p>Enter ```\!``` to get \! </p>
</td>
</tr>

</tbody>
</table>


[!INCLUDE[footer-include](includes/footer-banner.md)]
