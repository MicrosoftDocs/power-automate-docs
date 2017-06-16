<properties
    pageTitle="Use functions inside conditions. | Microsoft Flow"
    description="Use advanced functions such as ""and"", ""or"", and ""Greater than"" with Microsoft Flow conditions."
    services=""
    suite="flow"
    documentationCenter="na"
    authors="msftman"
    manager="anneta"
    editor=""
    tags=""/>

<tags
    ms.service="flow"
    ms.devlang="na"
    ms.topic="article"
    ms.tgt_pltfrm="na"
    ms.workload="na"
    ms.date="06/19/2017"
    ms.author="deonhe"/>

# Use functions in conditions

You can use the **Condition** card in basic mode to quickly compare a single value with another value. However, there're times when you need to compare multiple values. For example, you may want to check the value of two columns in a spreadsheet or a database table. To compare multiple values, edit the **Condition** card in **Advanced mode** and use any combination of the following logical functions.

<table>
<tr>
    <th>Function</th>
    <th>Description</th>
    <th>Example</th>
</tr>
<tr>
    <td>and</td>
    <td>Returns true if both values are true.<br><b>Note</b>: Both arguments need to be Booleans.</td>
    <td>For example, this function returns false:
and(greater(1,10),equals(0,0))</td>

</tr>
<tr>
    <td>or</td>
    <td>Returns true if either parameter is true. <br><b>Note</b>: Both arguments need to be Booleans.</td>
    <td>For example, this function returns true:
or(greater(1,10),equals(0,0))</td>

</tr>
<tr>
    <td>equals</td>
    <td>Returns true if two values are equal.</td>
    <td>For example, if parameter1 is someValue, this function returns true:</td>

</tr>
<tr>
    <td>less</td>
    <td>Returns true if the first argument is less than the second. <br><b>Note</b>: Values can only be of type integer, float, or string.</td>
    <td>For example, this function returns true:
less(10,100)</td>
</tr>
<tr>
    <td>lessOrEquals</td>
    <td>Returns true if the first argument is less than or equal to the second. <br><b>Note</b>: Values can only be of type integer, float, or string.</td>
    <td>For example, this function returns true:
lessOrEquals(10,10)</td>
</tr>
<tr>
    <td>greater</td>
    <td>Returns true if the first argument is greater than the second. <br><b>Note</b>: Values can only be of type integer, float, or string.</td>
    <td>For example, this function returns false:
greater(10,10)</td>
</tr>
<tr>
    <td>greaterOrEquals</td>
    <td>Returns true if the first argument is greater than or equal to the second. <br><b>Note</b>: Values can only be of type integer, float, or string.</td>
    <td>For example, this function returns false:
greaterOrEquals(10,100)</td>
</tr>
<tr>
    <td>not</td>
    <td>Returns true if the parameters are false. <br><b>Note</b>: Both arguments need to be Booleans.</td>
    <td>For example, this function returns true:
not(contains('200 Success','Fail'))</td>
</tr>
<tr>
    <td>if</td>
    <td>Returns a specified value based on whether the expression resulted in true or false.</td>
    <td>For example, this function returns "yes":
if(equals(1, 1), 'yes', 'no')</td>
</tr>
</table>


## Use the OR function

Sometimes your workflow needs to take an action if the value of an item is valueA or valueB. For example, you may be tracking the status of tasks in a spreadsheet table. The table has a column named *status*. The possible values in the *status* column are:

- **Completed**
- **Blocked**
- **Unnecessary**
- **In progress**

You want to regularly remove any rows with a *status* column value of *completed* or *unnecessary*. To identify the rows that have its status column set to "completed" or "unnecessary":

1. Use the **Get rows** action for the spreadsheet service you're using. Microsoft flow supports Excel and Google Sheets.
1. Use **Apply to each** on each row of the spreadsheet table that has your data.
1. Add a **Condition** to the **Apply to each** card.
1. Edit the **Condition** card in advanced mode, and then add an **OR** function. This function checks the the value of each row (a row is known as an item when accessed in a function. If the value of the status column is *completed* or *unnecessary*, the or function evaluates to "true".

The or function should appear as shown here:

````@or(equals(item()?['status'], 'unnecessary'), equals(item()?['status'], 'completed'))````

Your **Condition** card resembles this image when you use the OR function:

   ![notification details](./media/use-functions-in-conditions/or-function.png)

## Use the AND function

Assume you have a table with two columns in a spreadsheet. The column names are Status and Completed. If you want to take an action on each row only when the Status column's value is "ready" and the Completed column's value is "yes", edit the **Condition** card in advanced mode and use the AND function. Here is what your condition card would resemble in this scenario:

The and function should appear as shown here:

````@and(equals(item()?['Status'], 'ready'), equals(item()?['Completed'], 'yes'))````

Your **Condition** card resembles this image when you use the OR function:

   ![notification details](./media/use-functions-in-conditions/and-function.png)

## Use the GREATER THAN function

## Check empty values

## Additional information