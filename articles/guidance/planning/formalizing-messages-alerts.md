## Formalizing messages and alerts

When sending email notifications and Microsoft Teams messages, you may have
situations where you do not want to send it as yourself but still ensure people
can reach you when receiving them.

### Use shared senders

Sending messages from Power Automate as yourself is fine for smaller cases, but
as the process gets more formalized, we recommend changing it to a shared
sender. This helps the recipients know that it was sent via automation rather
than as personal nag. It has the added benefit that people won’t try to bug you
directly in response to something that’s meant to be purely informational. For
the Microsoft Teams connector, we have a few “Post as the Flow bot” actions that
are well suited to this. Outlook has “Send an email from a shared mailbox”,
though you’ll need to bring your own mailbox. This advice also applies to
updating tickets, creating records, etc., but the specifics will vary by
connector.

![Send an email form a shared mailbox](media/shared-mailbox.png "Send an email form a shared mailbox")

### Add a signature

When using automation to send emails and post messages, you want people to know
where it’s coming from. The shared mailbox helps the recipient identify that the
message is not coming from you directly. But there are cases where the
automation might break or start triggering too quickly, in which case you should
be easily reachable to correct the problem. This is especially important if the
automation works with people outside your org or external systems where the
recipient may not be aware of your flow. People may even want to contact you to
suggest ways to make your flow even better! We use a signature like “Sent with
Power Automate. Contact \<your email\> with questions.” You may also find it
helpful to link to the specific flow so that you can find it quickly if someone
forwards you the email.
