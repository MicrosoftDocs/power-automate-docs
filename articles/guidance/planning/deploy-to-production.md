# Deploying and refining phase

When you are deploying an automation, it’s important to consider how you will
replace the current business process with the new automation, to avoid
disrupting the business.

## Deploying your automation to production

### Add redundant owners

If you have a flow which is used by your entire team, you don’t want people
calling you up while you’re on vacation if it breaks. Make sure you add a couple
of co-owners so that they can update the flow in your absence. Who you add
depends on how the flow is used. Probably at least your direct manager, who can
act as your proxy. Maybe your manager’s manager if all of their reports are
relying on it. If your group is large enough and/or if you have a lot of team
flows, you may consider creating a Security Group of 2-3 people who are willing
to set aside a small amount of time to keep an eye on all the team flows. Don’t
add your entire org as a co-owner though; that just invites more people to mess
up the flow. If your company has a [Center of
Excellence](https://docs.microsoft.com/power-platform/guidance/coe/starter-kit)
for Power Platform, they may have guidelines for flow ownership.

Also keep in mind that the access applies to not just the flows themselves but
to the connections they use. For example, if your flow sends mail from a shared
mailbox, make sure that the co-owners have access to that mailbox in case they
need to recreate the connection.

### Use solutions

Solutions are a great way to organize flows to manage versions and migrate from
one environment to another. You’ll need to start by adding (or asking your admin
to add) a Common Data Service database to your environment. After that’s done,
you can go to the Solutions tab to create a new solution for your team, or you
can create multiple solutions if you have a lot of flows that you’d like to
further organize. There are a number of other benefits too, such as [native
storage](https://docs.microsoft.com/powerapps/maker/common-data-service/data-platform-intro)
for your data, [child
flows](https://docs.microsoft.com/power-automate/create-child-flows) to reuse
functionality, and [solution
export](https://docs.microsoft.com/power-automate/overview-solution-flows) as
backup. There are also some known limitations to solutions though, so this may
not apply to all of your flows.

### Mark it as production

Solutions are the recommended way to organize flows. But sometimes your flow
can’t go in a solution, or sometimes your solution will get crowded with other
drafts and proofs of concept. Either way, we recommend prefixing the names of
your production flows with “[PROD]” so that co-owners know to leave it be unless
it has issues.

## Deploy the automation in stages

To make sure your deployment is successful, you should consider taking the
following approach.

1.  Use the automation with a small number of people.

2.  Check that there are no issues for those people.

3.  Have the remaining people start using the automation.
