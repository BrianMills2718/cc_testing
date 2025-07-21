# Slash Commands Demo

## Overview
Slash commands are custom prompts saved as Markdown files that can be invoked with `/command-name`.

## Key Features
- Reusable workflow automation
- Parameterized commands with arguments
- Project-specific or global commands
- Markdown-based prompt templates

## Demo Commands Created

### 1. `/analyze` - Multi-file Analysis
Analyzes project structure and provides insights.

### 2. `/refactor` - Code Refactoring Assistant
Helps refactor code with best practices.

### 3. `/test-gen` - Test Generator
Generates comprehensive tests for specified code.

### 4. `/security` - Security Audit
Performs security analysis on code.

### 5. `/perf` - Performance Analysis
Analyzes code for performance issues.

## Usage Examples

### Basic Usage
```
/analyze
```

### With Arguments
```
/refactor backend_api.py --style functional
/test-gen UserDashboard --framework jest
/security --scope authentication
```

## Command Locations
- Project-specific: `.claude/commands/`
- Global: `~/.config/claude/commands/`

## Testing Instructions
1. Try each command without arguments
2. Test commands with various arguments
3. Create a custom command
4. Test command chaining

## Advanced Features
- Commands can include tool usage
- Can reference other commands
- Support complex workflows
- Can include conditional logic