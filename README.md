# APEX AI Agents

This application is a small Oracle APEX sample that demonstrates how to use native APEX AI features to build assistant-style experiences inside an app. It combines a prompt-configured AI assistant with a simple chatbot administration area, so the project works both as a functional demo and as a reference for low-code AI patterns in APEX.

To run this app, you need an Oracle APEX environment with native Generative AI support enabled, an Oracle Database schema for the application objects, and an external AI provider configured through APEX web credentials and Generative AI Services. This export is wired to an OpenAI endpoint (`https://api.openai.com/v1`) and references model `gpt-5.5`, uses Oracle APEX Accounts for authentication, and depends on Oracle APEX APIs such as `APEX_AI` plus a database table named `CB_CHATBOTS`. The repository does not explicitly publish an APEX version number in the README/export metadata here, so the practical requirement is an APEX release that supports `genAIService`, shared AI Agents, and the `showAiAssistant` action.

## What Does the App Do?
The home page is a lightweight entry page for the application. It presents the app branding and acts as the landing point for the navigation menu, which branches into the AI assistant and chatbot management features.

The main functional demo is page 2, **Low-Code AI Assistant**. On that page, the user provides a name, selects a language, and selects a domain. Those page items are submitted to a shared AI Agent definition, which uses them inside the system prompt and welcome message to shape the conversation at runtime.

The assistant itself is implemented with APEX native AI capabilities rather than custom JavaScript chat logic. The `OPEN_CHATBOT` button triggers the `showAiAssistant` action and renders the conversation inline inside the page region. The app also includes a process to revoke stored AI consent for the current user through `APEX_AI.REVOKE_USER_CONSENT_FOR_ALL`, which is useful when testing consent flows repeatedly.

The shared AI Agent named `open-ai-agent` is prompt-configured to behave as a scoped assistant. In the current export, it supports Geography and Math, enforces the selected language, adapts the welcome message for English, Spanish, and Portuguese, and refuses unsupported topics or languages according to the prompt rules.

The app also includes a simple chatbot maintenance module on pages 8 and 9. That module reads from and writes to the `CB_CHATBOTS` table through a report page and a modal form page, allowing users to create, update, and delete chatbot definitions with fields for name, prompt, welcome message, summary prompt, and current summary.

## Page Map
- `0` Global Page
- `1` Home
- `2` Low-Code AI Assistant
- `3` Low Code Agents Tools
- `8` Chatbots
- `9` Form Chatbots
- `9999` Login Page

## Supporting Objects
### Installed Objects
Supporting Objects are enabled in the export, but this repository only includes the supporting object definition container and substitutions metadata. The application itself references at least one database object, `CB_CHATBOTS`, which must exist in the target schema for the chatbot pages to work.

### Install Scripts
No install scripts are included in the exported `supporting-objects` folder in this repository.

### Upgrade Scripts
No upgrade scripts are included in the exported `supporting-objects` folder in this repository.

### Deinstall
No deinstall script is included in the exported `supporting-objects` folder in this repository.
