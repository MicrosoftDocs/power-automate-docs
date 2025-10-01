# Using Filters in OCPM Analysis (preview)
Filters are essential tools in object-centric process mining that allow analysts to focus on specific subsets of data by narrowing down events, objects, or object types based on defined criteria. Unlike case-centric event log filtering, object-centric filters must account for multiple interconnected object types and their relationships, enabling more nuanced analysis of complex business processes. By applying filters strategically, you can isolate bottlenecks, compare different process paths, analyze specific customer segments, or exclude outliers—ultimately transforming large, unwieldy datasets into meaningful insights. 

OCPM in Power Automate Process Mining supports the following filter types:
- **Object Type** filter
- **Object Proximity** filter
- **Object Attribute** filter
- **Timeframe** filter

## Managing Filters
Filters are managed in the filter tollbar at the top of the active tab. Filters are applied to all visuals and widgets in the active tab.

![Screenshot of the filter toolbar in Process Intelligence Studio for OCPM.](/media/object-centric-process-mining/ocpm-filter-toolbar.png)

### Adding a filter
To add a filter, navigate to the **Add filter** button in the toolbar and select the desired filter type. A configuration panel for the selected filter will open. Click **Apply** to confirm the filter criteria.

The actual filter setting will appear in the filter toolbar as a new button.

### Changing a filter
To change a filter setting, click the button with the actual filter criteria. A configuration panel for the selected filter will open. Click **Apply** to confirm the filter criteria changes.

The filter setting will reflect the changes in the filter toolbar.

### Removing a filter
To remove the filter, click **X** on the specific filter button.

To remove all currently set filters at once, click the **Clear filters** button in the filter toolbar.

## Object Type Filter
Object Type filters allow you to select which specific object types to include or exclude from your analysis, enabling you to focus on particular entities within your process ecosystem. For example, in an order-to-cash process, you might filter to show only "Orders" and "Customers" while temporarily excluding "Items" to simplify the process view and concentrate on customer-level behavior.

![Screenshot of the OCPM object type filter configuration panel.](/media/object-centric-process-mining/ocpm-filter-object-type.png)

In the configuration panel, select (or search and select):
- **Object Type** - checked object types will be included into the analysis

## Object Proximity Filter
Object Proximity filters enable you to analyze events based on the distance or degree of separation between different objects in the process. This allows you to focus on directly related objects (e.g., orders that contain specific items) or expand your view to include indirectly connected objects (e.g., customers linked through shared products), helping you understand the ripple effects and dependencies across your object-centric process network.

Proximity level used in the filter defines the degree of separation between objects:
- 1 level - select object
- 2 levels - directly connected objects (via common events) including the objects of the same object type
- 3 and more levels - recursively adding indirectly connected objects related to the objects identified in the previous level

![Screenshot of the OCPM object proximity filter configuration panel.](/media/object-centric-process-mining/ocpm-filter-object-proximity.png)

In the configuration panel, select (or search and select):
- **Object Type** - values for the selected object type will be loaded
- **Objects** - checked objects will be included in to the analysis
- **Proximity level** - choose the separation level for filtering

## Object Attribute Filter
Object Attribute filters allow you to select objects based on specific characteristics or properties, such as customer region, order value, product category, or any other attribute associated with an object type. By filtering on attributes, you can segment your analysis to compare different cohorts, investigate specific scenarios (e.g., high-value orders or premium customers), or isolate cases that meet particular business criteria relevant to your analysis goals.

![Screenshot of the OCPM object attribute filter configuration panel.](/media/object-centric-process-mining/ocpm-filter-object-attributepng)

In the configuration panel, select (or search and select):
- **Object Type** - attributes for the selected object type will be loaded
- **Attribute** - values for the selected attribute will be loaded
- **Proximity level** - choose the separation level for filtering
- **Attribute values** - objects of the selected object type that comply with the checked attribute values will be included into the analysis

## Timeframe Filter
Timeframe filters enable you to restrict your analysis to objects active within a specific time period, such as a particular quarter, month, or custom date range. This is essential for comparing process performance across different periods, analyzing seasonal trends, focusing on recent data for operational monitoring, or excluding historical data that may no longer reflect current process behavior.

![Screenshot of the OCPM timeframe filter configuration panel.](/media/object-centric-process-mining/ocpm-filter-timeframe.png)

In the configuration panel, select (or search and select):
- **Object Type** - objects of the selected object type will be analyzed whether they are active in the selected timeframe
- **Proximity level** - choose the separation level for filtering
- **Timeframe** - select the timeframe from pre-defined values or set a custom timeframe
