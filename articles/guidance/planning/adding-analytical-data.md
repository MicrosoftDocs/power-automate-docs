### Adding analytical data to Common Data Service

In order to spot and identify bottlenecks within the automation, set up actions
within the automation that will log the start time of each activity or step. You
can do this by creating an entity that records the step name, start time, and
end time.

![Adding actions to store analytical data](media/store-analytical-data.png "Adding actions to store analytical data")

This allows you to keep track of how long it took for each end-to-end run of
automation to complete, and identify possible improvements to make your
automations even better.

You can analyze this data with Power BI to see which part of the process took
the longest time to complete, if you store the data in the Common Data Service.
