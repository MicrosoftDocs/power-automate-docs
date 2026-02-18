## Set complex fields

Most Dataverse fields contains simple data types like where you can set the values intuitively. There are two types of fields that are frequently challenging: lookup and multiselect fields.

### Set lookup fields

Lookup fields require the following syntax: `<entity set name>(<item id>)`.

For example, if you set the value of the account table primary contact field to a contact record with ID value of `aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb`, you must set the lookup using this value: `contacts(aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb)`.

The tricky part is determining the entity set name. It is usually the same as the plural name of the table, but not always. Use the following procedure to get the correct entity set name for a table using [Power Apps](https://make.powerapps.com).

1. Sign in to [Power Apps](https://make.powerapps.com).

    To learn more about using the Power Apps interface, go to [Get started with Power Apps](/power-apps/maker/canvas-apps/intro-maker-portal).

1. On the left navigation pane, select **Tables**.
1. Set the filter to **All**.
1. Search for the table you are looking for and select it
1. In the **Table properties** area, expand the **Tools** menu.
1. Select the Copy set name command

:::image type="content" source="../media/set-complex-fields/copy-contact-entity-set-name.png" alt-text="Screenshot of Power Apps contact table with tools expanded and the Copy set name option selected":::

Using this method, you can always get the correct entity set name.

#### View all entity set names

Another way to quickly check entity set names is to use your browser navigate to `[Organization URI]/api/data/v9.2/`, where `[Organization URI]` represents the URL for your environment. This URL will return a list of all the entity set names. In the results, use <kbd>Ctrl</kbd>+<kbd>F</kbd> to search for the name you expect to confirm it exists.

```json
{
  "@odata.context": "[Organization URI]/api/data/v9.2/$metadata",
  "value": [
    {
      "name": "aadusers",
      "kind": "EntitySet",
      "url": "aadusers"
    },
    {
      "name": "accountleadscollection",
      "kind": "EntitySet",
      "url": "accountleadscollection"
    },
    {
      "name": "accounts",
      "kind": "EntitySet",
      "url": "accounts"
    },

 [Truncated for brevity]
```

[Learn more about this and other Web API resources](/power-apps/developer/data-platform/webapi/web-api-service-documents)

### Set multiselect fields

The user interface allows you to select only one option. To select multiple options, switch the input method to **Enter custom value**, and then enter a unique name for each option, separating each name with a comma.

Learn more about multiselect 'choices' columns:

- [Create a choice](/power-apps/maker/data-platform/custom-picklists)
- [Developer Guide: Choices columns](/power-apps/developer/data-platform/multi-select-picklist)