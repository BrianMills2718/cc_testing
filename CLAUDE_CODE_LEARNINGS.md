# Claude Code Usage Guide

Quick reference for using Claude Code tools and features effectively.

---

## Subagents (Task Tool)

**How to use multiple subagents:**
```
Launch multiple Task tools in a single message to run them concurrently
```

**Best for:** Independent tasks that don't need interaction  
**Example:** Creating multiple files, running parallel research, batch operations

---

## Todo Management

**TodoWrite:** Create and update task lists  
**TodoRead:** Check current tasks  
**Best practice:** Mark tasks completed immediately, only one "in_progress" at a time

---

## Configuration

**Check config:** `claude config list`  
**Set values:** `claude config set <key> <value>`  
**Global config:** `claude config set -g <key> <value>`

**Note:** Some environment variables may not be actively enforced

---

## Timeouts

**Default Bash timeout:** ~600 seconds (10 minutes)  
**Environment variables:** Accept large values but may not affect actual behavior  
**Variables:** BASH_DEFAULT_TIMEOUT_MS, BASH_MAX_TIMEOUT_MS, MCP_TIMEOUT, MCP_TOOL_TIMEOUT

---

## Tips

- Use subagents for parallel work
- Break complex tasks into todos
- Test actual behavior, not just parameter acceptance
- Configuration validation ≠ functional enforcement