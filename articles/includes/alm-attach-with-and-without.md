4. If you newly imported the process, continue to step 5. If you didn't newly import the process, go to step 7.

1. Select the type of workspace to be used - Power BI workspace or Fabric workspace
    1. The dialog informs you whether you originally exported the process to Power BI or Fabric workspace
    2. In this step you can decide to change the destination to not match the original setup
  
        > [!IMPORTANT]
        > The semantic model structure is different for Power BI workspace and for Fabric workspace. This might potentially result in problems in your report visualizations, that must be resolved manually.

    3. Select **Continue**

1. Select a new workspace for this process by following these steps:
    1. For Power BI workspace - in the **Power BI workspace** dropdown menu, select a *different workspace*, which you'll use in the **Test** environment.
    1. For Fabric workspace - in the **Fabric workspace** dropdown menu, select a *different workspace*, which you'll use in the **Test** environment, in the **Lakehouse** dropdown menu select the destination Lakehouse.
    1. In the **Report Name** field, enter the *same report name* as your previous report.

        > [!IMPORTANT]
        > The report name must be identical to your previous report.

    1. To continue setting up the process, select **Continue**.

       :::image type="content" source="../includes/media/process-mining-alm/new-workspace.png" alt-text="Screenshot of selecting a new workspace for your process with the same report name as your previous report.":::

1. (If you didn't newly import the process) Attach a custom Power BI workspace to the process:
    1. Go to the process details page for the process.
    1. On the **Details** card, select **Edit**.
    1. From the **Power BI workspace (optional)** dropdown menu, select your **WkSpace B** Power BI workspace that you want to migrate customizations to.
    1. Provide the *same report name* as the name you used for the process in Dev environment.

        > [!IMPORTANT]
        >
        > The report name must be identical to the report name of the process in Dev environment.

    1. Select **Save** > **Continue**.
    1. From the command bar or in the report view, select **Refresh data**.
