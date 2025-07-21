# MCP (Model Context Protocol) Demo

## Overview
MCP servers extend Claude Code with additional tools and resources. You already have several configured!

## Your Available MCP Servers
- **filesystem**: File system operations
- **github**: GitHub API integration  
- **fetch**: Web content fetching
- **brave-search**: Web and local search
- **memory**: Knowledge graph for context
- **puppeteer**: Browser automation
- **context7**: Library documentation
- **metamcp**: Meta-MCP operations
- **ide**: IDE integration

## Demo Scenarios

### 1. Memory Server - Knowledge Graph
```
"Create a knowledge graph of the project structure with entities for:
- Components and their relationships
- Key functions and dependencies
- TODO items and their priorities"
```

### 2. GitHub Server - Repository Operations
```
"Search GitHub for similar projects, analyze their structure, and create a comparison report"
```

### 3. Brave Search - Research
```
"Research best practices for [topic] and create a summary with examples"
```

### 4. Context7 - Documentation
```
"Get the latest React hooks documentation and create examples"
```

### 5. Puppeteer - Web Automation
```
"Navigate to [website], take screenshots of key sections, and extract data"
```

## Resource References
Use `@resource` to reference MCP resources:
- `@file:path/to/file`
- `@url:https://example.com`
- `@github:owner/repo`

## MCP Slash Commands
Combine MCP with slash commands:
```
/mcp-analyze @github:facebook/react
/mcp-docs @context7:react/hooks
```

## Testing Instructions
1. Test each MCP server individually
2. Combine multiple MCP servers
3. Use resource references
4. Create custom MCP workflows
5. Test error handling

## Advanced Patterns
- Chaining MCP operations
- Caching with memory server
- Automated web scraping
- Cross-server data flow