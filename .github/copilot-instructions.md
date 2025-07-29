# Copilot Instructions for Power Automate Docs Repository

## Overview
This repository contains the technical documentation for Microsoft Power Automate, published at https://learn.microsoft.com/power-automate. The content is primarily Markdown files under the `articles/` directory, with supporting assets in subfolders.

## Key Structure
- **articles/**: Main documentation content. Each `.md` file is a standalone article, often cross-linked.
- **media/**: Images and diagrams referenced in articles.
- **includes/**: Markdown includes for reusable content blocks.
- **.github/**: GitHub workflows, issue templates, and this instructions file.

## Authoring Conventions
- All documentation is in Markdown. Numbered lists must use `1.` for every item.
- Use Microsoft Style Guide for tone, clarity, and accessibility.
- Metadata (YAML front matter) is required at the top of each article.
- Images must use the custom `:::image` directive with descriptive alt text.
- Cross-link articles using relative links (e.g., `[Overview](overview-cloud.md)`).
- Alerts use `> [!NOTE]`, `> [!IMPORTANT]`, etc.
- Tables should be in Markdown, with padded cells for readability.

## Developer/Writer Workflows
- **Build/Preview**: Use DocFX to build and preview documentation locally. See Microsoft Docs contributor guide for setup.
- **Validation**: Linting and build checks run on PRs. Common issues: trailing spaces, heading levels, image alt text, and broken links.
- **Testing**: No code tests; focus is on content linting and DocFX build success.
- **PR Review**: All changes require review by a Microsoft Docs team member.

## Patterns and Examples
- See `articles/create-variable-store-values.md` for variable documentation patterns.
- See `articles/flows-designer.md` for UI walkthroughs and legend formatting.
- Use includes from `includes/` for repeated callouts or tabbed content.

## Integration Points
- Content is published to Microsoft Learn via internal pipelines.
- Images and media must be referenced with relative paths.
- No direct code or API integration in this repo; focus is on documentation.

## Special Notes
- Do not add code samples unless they are for Power Automate expressions or JSON payloads.
- Do not use HTML tables; always convert to Markdown.
- Always check for and fix lint warnings before submitting.

---
For more details, see the [contributor guide](https://learn.microsoft.com/contribute).
