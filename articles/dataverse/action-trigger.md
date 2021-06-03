When an action is performed
---------------------------

**Pre-requisite**: To create a flow that triggers based on execution of a
Dataverse action, you must include it in a Catalog and a Category. To learn how
to create and manage Catalog and include actions in them, see [Catalog and
CatalogAssignment tables
(Preview)](https://docs.microsoft.com/en-us/powerapps/developer/data-platform/catalog-catalogassignment).
Your role must also have the permissions to use *sdkmessage*, *customapi*,
*workflows* and *catalogassignment* tables in Dataverse.

![Graphical user interface Description automatically generated with low confidence](media/fda27fcf4067248e47b7efd3daed4511.png)

As the name suggests, this trigger runs the flow whenever a Dataverse action is
performed. A Dataverse action is distinct from a Power Automate action. In
Dataverse, custom process actions, or simply actions, are a way of extending out
of the box operations on data. You can use them to define custom business logic
that is reusable. To learn more, see [Work with
actions](https://docs.microsoft.com/en-us/powerapps/maker/data-platform/actions)
and [Use Custom Process Actions with
code](https://docs.microsoft.com/en-us/powerapps/developer/data-platform/workflow-custom-actions).
To learn how to invoke Dataverse actions, see [Perform an unbound
action](#_Perform_an_unbound) and [Perform a bound ction](#_Perform_a_bound).

Following information is necessary to use this trigger –

-   **Catalog** – used to organize and manage Dataverse process actions, much
    like using folders to organize files

-   **Category** – used as a sub-classification within a Catalog

-   **Table name** – used to filter available actions by their associated table
    (bound actions), or to filter global actions (unbound actions). For unbound
    actions, select *(none)*.

-   **Action name** – used to identify the action that should trigger the flow
    after each successful execution

    ![Graphical user interface, text, application, email Description automatically generated](media/7373b607775f2b462f951a8df96e5625.png)

### Using dynamic content and action inputs / outputs

As a Dataverse custom action is meant for custom business logic, it accepts
inputs parameters and returns output parameters. When this trigger is executed,
these parameters are available as dynamic content in the flow and can be used in
subsequent steps as shown below.

![Graphical user interface, text, application Description automatically generated](media/fc29283af115f6b447aba24655ee2747.png)

The naming scheme of the parameters is as follows –

-   The prefixes *ActionInputs* and *ActionOutputs* specify whether it is an
    input or output parameter

-   The next literal is the name of the parameter

-   For complex data types such as an entity object, the last literal is the
    column name (for eg. *donotfax*)

![Graphical user interface, text, application, email Description automatically generated](media/2570885e7cba9c63b45ccaefc6b55056.png)
