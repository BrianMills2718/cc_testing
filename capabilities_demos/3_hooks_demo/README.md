# Hooks Demo

## Overview
Hooks are shell commands that execute automatically in response to Claude Code events.

## Hook Types

### 1. `afterFileChange`
Runs after any file is modified.

### 2. `afterResponse`  
Runs after Claude provides a response.

### 3. `beforeToolUse`
Runs before a tool is executed.

### 4. `afterToolUse`
Runs after a tool completes.

### 5. `userPromptSubmitHook`
Runs when user submits a prompt.

## Demo Configurations

### 1. Auto-Formatter Hook
```json
{
  "afterFileChange": "if [[ $FILE_PATH == *.py ]]; then black $FILE_PATH; fi"
}
```

### 2. Test Runner Hook
```json
{
  "afterFileChange": "if [[ $FILE_PATH == *.test.js ]]; then npm test $FILE_PATH; fi"
}
```

### 3. Lint Checker Hook
```json
{
  "beforeToolUse": "if [[ $TOOL_NAME == 'Write' ]]; then echo 'Running linter...'; fi"
}
```

### 4. Git Auto-Commit Hook
```json
{
  "afterFileChange": "git add $FILE_PATH && git commit -m 'Auto-commit: Updated $FILE_PATH'"
}
```

### 5. Notification Hook
```json
{
  "afterResponse": "notify-send 'Claude Code' 'Task completed!'"
}
```

## Environment Variables
- `$FILE_PATH` - Path of changed file
- `$TOOL_NAME` - Name of tool being used
- `$EXIT_CODE` - Exit code of tool
- `$PROJECT_DIR` - Current project directory

## Configuration Files
- Project: `.claude/settings.json`
- Global: `~/.config/claude/settings.json`

## Testing Instructions
1. Create sample `.claude/settings.json`
2. Test each hook type
3. Chain multiple hooks
4. Test error handling
5. Measure performance impact

## Advanced Patterns
- Conditional execution based on file types
- Integration with CI/CD tools
- Custom quality gates
- Automated documentation updates