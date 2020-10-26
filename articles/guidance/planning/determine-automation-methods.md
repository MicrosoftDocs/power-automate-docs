Once the process design is complete, the next step is the architectural design
to focus on how you will automate that process.

### Determining which automation methods to use

Ideally, all the systems you want to automate have Power Automate connectors.
Check the [list of
connectors](https://docs.microsoft.com/connectors/custom-connectors/) to see if
there are connectors available for the system you plan to automate. Once you
find the connector, make sure that the actions you need are available for that
connector. (For example, a connector for an email system might have actions for
“send,” “reply,” and “delete.”)

If there are no connectors available, you have the following options to choose
from:

-   Create a custom connector

-   Web browser automation

-   Desktop application automation

-   Use the HTTP Connector

#### Creating a custom connector 

If you are a developer or your organization has a developer who can create
[custom connectors](https://docs.microsoft.com/connectors/custom-connectors/),
this will be the preferred method of automation.

#### Web browser automation

If you couldn’t find a connector, and if the system is a web/browser based
application or a website, web browser automation is what you should consider.
Web browser automation automates steps / processes as if a human were using the
browser by mimicking keyboard and mouse movements.

Web browser automation can be achieved either by [Web UI
flows](https://docs.microsoft.com/power-automate/ui-flows/create-web) or by
[Building a
WebAutomation](https://docs.winautomation.com/en/building-a-webautomation-process.html)
Process using Power Automate Desktop.

#### Desktop application automation

If you couldn’t find a connector, and if the system is a desktop application on
a PC, this is the automation method to use. Power Automate has capabilities that
mimicking human keyboard and mouse movements.

Desktop application automation can be achieved by by [creating a new
Process](https://docs.winautomation.com/en/create-a-new-process.html) using
Power Automate Desktop.

The chart below shows the comparison of the different methods.

| Method                         | Ease of use | Requires development background                   | Easily affected by system changes | Setup / Development time |
|--------------------------------|-------------|---------------------------------------------------|-----------------------------------|--------------------------|
| Connector                      | Easiest     | No                                                | No                                | None                     |
| Custom Connector               | Easiest     | Yes                                               | No                                | 1-2 days                 |
| Web browser automation         | Easy        | Preferably with a basic knowledge of CSS and HTML | Yes                               | 3-4 days                 |
| Desktop application automation | Easy        | No                                                | Yes                               | 3-4 days                 |

In complex automation scenarios, you can combine all these types of automations
mentioned above.

### Triggering the automation to start

With any of the automation methods above, you need to consider how to trigger
(start) these automations. The ways you can trigger an automation are as
follows:

-   Automated triggers

-   Instant / Manual triggers

-   Scheduled Triggers

#### Automated triggers

With an **automated trigger**, a system automatically starts the automation when
a condition is met. (Note: Not all connectors include automated triggers.)

Example triggers:

-   When an email is received in Outlook

-   When a new file is placed inside OneDrive

-   When a new record is created inside Common Data Service

-   When an item was modified in Sharepoint custom list

![Automated triggers](media/automated-triggers.png "Automated triggers")

An example use case for the expense report would be to set an automated trigger
for when a new record is created in the expense approvals entity in Common Data
Service. This is so that Power Apps can be used to create a form, which then
creates a new record in Common Data Service.

#### Instant / Manual triggers 

**Instant / Manual** trigger is a type of trigger where a user needs to manually
start that automation or the trigger is instantaneously started. This can be
triggered directly from a [Flow
button](https://docs.microsoft.com/en-us/power-automate/introduction-to-button-flows)
or some of Microsoft services.

![Instant triggers](media/instant-triggers.png "Instant triggers")

#### Scheduled triggers 

**Scheduled** triggers are set with a specific date and time to trigger and to
repeat on a periodic basis. It is useful for situations where you need to
automate a specific task daily, weekly, monthly etc.

In the expense report example, a good case to use scheduled triggers would be
that the accounting team wants to send an automated email when the weekly BI
report is ready on a Friday.

![Scheduled triggers](media/scheduled-triggers.png "Scheduled triggers")
