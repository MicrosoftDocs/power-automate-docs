# Handling sensitive text

If you need to securely store and pass a sensitive text inside Web browser or
Desktop automation, you can define the [input as a sensitive
text](https://docs.microsoft.com/power-automate/ui-flows/inputs-outputs-desktop)
and store the sensitive text inside an [Azure Key
Vault](https://docs.microsoft.com/azure/key-vault/general/overview). This is
different from secure inputs and outputs as secure inputs and outputs mask the
data that has entered a specific action and can be applied to any action n (if
supported), whereas sensitive text is used to set up passing data to UI flows
actions .

![Setting up sensitive text in UI flows](media/ui-flow-secure-input.png "Setting up sensitive text in UI flows")

In this expense approval scenario, Abhay has the following steps to reimburse
cash to the applicant who submitted an expense form.

1.  Abhay checks the employee management app in Power Apps to look up the
    applicant’s banking information.

2.  Abhay logs into the online banking system.

3.  Abhay copies the employee’s banking information to the online banking system
    and copies the requested reimbursement amount from the expense report.

4.  Abhay submits the electronic banking request to send the money.

This example has some highly sensitive information such as the bank account
details, and the reimbursement amount. You can use secure input and secure
output to protect the information.

| **Information required**   | **Input or Output** | **Purpose**                                                 |
|----------------------------|---------------------|-------------------------------------------------------------|
| Employee’s name            | Input               | To send an email if expense is approved                     |
| Employee’s email           | Input               | To send an email if expense is approved                     |
| Employee’s employee number | Input               | To search in employee management system for banking number. |
| Bank account number        | Secure Input        | To reimburse money to employee                              |
| Bank sort code             | Secure Input        | To reimburse money to employee                              |
| Bank name                  | Secure Input        | To reimburse money to employee                              |
|                            |                     |                                                             |
| Payment result             | Output              | To keep record of payment result                            |
| Payment amount             | Secure Output       | To keep record of payment result                            |
