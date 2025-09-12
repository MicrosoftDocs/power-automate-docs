# Responsible AI FAQ for Flow Builder in Microsoft 365 Copilot  

These frequently asked questions describe the AI impact of Flow Builder, the AI assistant embedded in Microsoft 365 Copilot that helps you build automation flows using natural language.

### What is Flow Builder in Microsoft 365 Copilot?

Flow Builder is an AI-powered assistant within Microsoft 365 Copilot that helps you create, edit, and manage automation flows across Microsoft 365 apps such as Outlook, Teams, SharePoint, and Planner. You describe what you want to automate in natural language, and Flow Builder generates the corresponding flow for you. It also helps answer questions about your flows and provides documentation links as needed.

### What are the system’s capabilities?

Flow Builder can:  
- Create new flows from scratch based on your descriptions.  
- Edit existing flows according to your instructions.  
- Answer questions about the flow you’re working on.  
- Provide descriptions of your flows in plain language.  
- Offer helpful documentation links about Microsoft 365 automation.  
- Filter out unrelated questions.  
- Suggest when to save or test your flow.

### What is the system’s intended use?

Flow Builder is designed to make building automation workflows easier and faster, so you can get value from automation with minimal technical effort.

### How is Flow Builder evaluated? What metrics are used to measure performance?

Microsoft tracks several key metrics to ensure Flow Builder performs well and provides a positive experience. These include uptime (to ensure availability), user feedback through thumbs up/down on AI outputs, and reports of biased or inappropriate responses. This feedback helps maintain fairness, compliance, and quality.

### What are the limitations of Flow Builder? How can users minimize these limitations?

- Flow Builder supports only a limited set of Microsoft 365 connectors; third-party and custom connectors are not supported.  
- It cannot currently fix errors in existing flows automatically.  
- Since Flow Builder relies on natural language input in chat to specify locations like SharePoint sites or Teams channels, it may occasionally identify the wrong site or channel if the names are ambiguous or similar.  
- AI-generated flows should always be reviewed and tested before using in production.  
- Flow Builder is only available in English.

To minimize these limitations, provide clear and precise names when referencing sites, lists, or teams. Review and test all flows before enabling them.

### How does Flow Builder connect to services like SharePoint or Teams?

To connect to services such as SharePoint or Teams, simply mention the site, list, or team name in your natural language prompt. For example, you can say "save the response to the 'Invoices' list on the 'ContosoCRM' SharePoint site" or "post a message in the 'Budget Planning' channel of the 'Global Finance Operations' team."

If Flow Builder cannot resolve a location by name, it will prompt you to confirm or provide the URL to ensure accuracy and avoid errors. This helps avoid mistakes in environments where multiple sites or channels may have similar names.

### What operational factors and settings allow for effective and responsible use?

- Flow Builder is available within Microsoft 365 Copilot and subject to your organization’s access policies.  
- Always review and test AI-generated flows in the visual designer before enabling them.  
- Administrators manage Flow Builder access and settings through the Microsoft 365 admin center.  
- Training users on AI capabilities and limitations helps ensure responsible use.

### How can administrators manage Flow Builder in their organization?

Administrators can enable or disable Flow Builder for users through the Microsoft 365 admin center under Copilot settings. They can assign access to all users, specific groups, or disable it completely. Usage can be monitored to maintain security and compliance.

### Additional details

Flow Builder respects Microsoft’s privacy and security policies, and all data processing occurs securely in the cloud. Users always retain control and can edit, test, disable, or delete flows created by Flow Builder.
