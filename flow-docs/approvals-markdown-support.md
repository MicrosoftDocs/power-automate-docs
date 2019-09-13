---
title: Use markdown to format Microsoft Flow approvals | Microsoft Docs
description: Learn to use markdown to format Microsoft Flow approval requests.
services: ''
suite: flow
documentationcenter: na
author: gcorvera
manager: kfile
editor: ''
tags: ''
ms.service: flow
ms.devlang: na
ms.topic: article
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 4/23/2018
ms.author: gcorvera
search.app: 
  - Flow
search.audienceType: 
  - flowmaker
  - enduser
---

# Use Markdown in Microsoft Flow approval requests

This article teaches you how to use [Markdown](https://en.wikipedia.org/wiki/Markdown) syntax to add rich formatting and tables to your approval requests.

> [!IMPORTANT]
> Approvals send an actionable message, and the actionable message renders Markdown depending on the Outlook client version. For a list of Outlook clients that support actionable messages, see [Outlook version requirements for actionable messages](https://docs.microsoft.com/en-us/outlook/actionable-messages/#outlook-version-requirements-for-actionable-messages)
> 
> If an Outlook client doesn’t support actionable messages, the messages are rendered in HTML format. So, in this case, Markdown is transformed into HTML and rendered in the HTML format. The Outlook client needs to be able to render HTML messages to display correctly.

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

![Export flow](./media/approvals-markdown-support/mrkdown-headers.png)

## Paragraphs and line breaks

Make your text easier to read by breaking it up with paragraphs or line breaks. Enter two spaces prior to the line break to begin a new paragraph, or enter two line breaks consecutively to begin a new paragraph.   
   
**Example**

Add lines between your text with the Enter key.
This spaces your text better and makes it easier to read.

**Result:**   
Add lines between your text with the Enter key.      
This spaces your text better and makes it easier to read.


**Example 2**

Add two spaces prior to the end of the line.(space, space)     
This adds space in between paragraphs.

**Result:**  
Add two spaces prior to the end of the line.   

This adds space in between paragraphs.
  

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

<pre>

- Item 1
- Item 2
- Item 3

</pre>

**Result:**

- Item 1
- Item 2
- Item 3

### Nested lists

**Example:**
<pre>

1. First item.
   - Item 1
   - Item 2
   - Item 3
1. Second item.
   - Nested item 1
   - Nested item 2
   - Nested item 3

</pre>

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
<pre>
&#91;Microsoft Flow](https://flow.microsoft.com)
</pre>

**Result:**

[Microsoft Flow](https://flow.microsoft.com)

### Anchor links

Anchor IDs are assigned to all headings when rendered as HTML. The ID is the heading text, with the spaces replaced by dashes (-) and all lower case.

**Example:**

<pre>
###Link to a heading in the page
</pre>

<br/>

**Result:**

The syntax for an anchor link to a section...

<pre>
[Link to a heading in the page](#link-to-a-heading-in-the-page)
</pre> 
<br/>
The ID is all lower case, and the link is case sensitive, so be sure to use lower case, even though the heading itself uses upper case.


## Tables

Organize structured data with tables. 

- Place each table row on its own line 
- Separate table cells using the pipe character `|` 
- The first two lines of a table set the column headers and the alignment of elements in the table
- Use colons (`:`) when dividing the header and body of tables to specify column alignment (left, center, right) 
- To start a new line, use the HTML break tag (`<br/>`) (Works within a Wiki but not elsewhere)  
- Make sure to end each row with a CR or LF. 

**Example:**

```
| Heading 1 | Heading 2 | Heading 3 |  
|-----------|:-----------:|-----------:|  
| Cell A1 | Cell A2 | Cell A3 |  
| Cell B1 | Cell B2 | Cell B3<br/>second line of text |  
```




**Result:**  

| Heading 1 | Heading 2 | Heading 3 |  
|-----------|:---------:|-----------:|  
| Cell A1 | Cell A2 | Cell A3 |  
| Cell B1 | Cell B2 | Cell B3<br/>second line of text |  

 
## Emphasis (bold, italics, strikethrough)  

You can emphasize text by applying bold, italics, or strikethrough to characters: 
- To apply italics: surround the text with an asterisk `*` or underscore `_`   
- To apply bold: surround the text with double asterisks `**`.    
- To apply strikethrough: surround the text with double tilde characters `~~`.   

Combine these elements to apply multiple emphasis to text.    

**Example:**

<pre>
Use _emphasis_ in comments to express **strong** opinions and point out ~~corrections~~ 
**_Bold, italicized text_**  
**~~Bold, strike-through text~~**
</pre>

<br/>

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

<p style="margin-bottom:2px;">```\   backslash ``` </p>
<p style="margin-bottom:2px;"><code>\`</code>   `backtick`</p>
<p style="margin-bottom:2px;">```_   underscore  ```</p>
<p style="margin-bottom:2px;">```{}  curly braces  ``` </p>
<p style="margin-bottom:2px;">```[]  square brackets ```</p>
<p style="margin-bottom:2px;">```()  parentheses  ```</p>
<p style="margin-bottom:2px;">```#   hash mark  ``` </p>
<p style="margin-bottom:2px;">```+   plus sign  ```</p>
<p style="margin-bottom:2px;">```-   minus sign (hyphen) ```</p>
<p style="margin-bottom:2px;">```.   dot  ``` </p>
<p style="margin-bottom:2px;">```!   exclamation mark ```</p>


</td>
<td>Some examples on inserting special characters
<p>Enter ```\\``` to get \\ </p>
<p>Enter ```\_``` to get _ </p>
<p>Enter ```\#``` to get \# </p>
<p>Enter ```\(``` to get \( </p>
<p>Enter ```\.``` to get \. </p>
<p>Enter ```\!``` to get \! </p>
</td>
</tr>

</tbody>
</table>
