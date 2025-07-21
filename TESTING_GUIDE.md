# Claude Code Capabilities Testing Guide

## Quick Start

All capability demos are set up in `capabilities_demos/`. Each demo is standalone and can be tested independently.

## Testing Order (No Setup → Setup Required)

### 1. Subagents Demo ✅
**Location**: `capabilities_demos/1_subagents_demo/`
**Test**: Ask Claude to analyze the test files in parallel
```
"Analyze all files in capabilities_demos/1_subagents_demo/test_files/ in parallel and find all TODO items, categorizing them by priority"
```

### 2. Slash Commands Demo ✅
**Location**: `.claude/commands/`
**Test**: Try the custom commands
```
/analyze
/refactor test_files/backend_api.py --style functional
/test-gen UserDashboard --framework jest
```

### 3. Hooks Demo ✅
**Location**: `.claude/settings.json`
**Test**: Modify a file and check `.claude/activity.log`
```
"Edit capabilities_demos/3_hooks_demo/test_hook.py and add a new function"
```

### 4. MCP Demo ✅
**Location**: `capabilities_demos/4_mcp_demo/`
**Test**: Use your configured MCP servers
```
"Store this project's structure in memory using the memory MCP server"
"Search GitHub for Claude Code examples using the github MCP"
"Research best practices for multi-agent systems using brave-search MCP"
```

### 5. GitHub Actions Demo ⚠️
**Location**: `capabilities_demos/5_github_actions_demo/`
**Setup**: Run `/install-github-app` in Claude Code
**Test**: Create a GitHub repo and mention @claude in issues/PRs

### 6. SDK Demo ⚠️
**Location**: `capabilities_demos/6_sdk_demo/`
**Setup**: 
```bash
cd capabilities_demos/6_sdk_demo
npm run install:ts  # For TypeScript
npm run install:py  # For Python
```
**Test**: Run the example scripts

## Lessons Learned Template

Create notes in `lessons_learned/capability_notes.md`:

```markdown
# Capability: [Name]
## What Worked Well
- 

## Challenges/Limitations
- 

## Best Practices
- 

## Integration Ideas
- 

## Performance Notes
- 
```

## Combined Capability Tests

After testing individually, try combinations:

1. **Subagents + MCP**: "Use parallel agents to search GitHub, web, and local files for [topic]"

2. **Slash Commands + Hooks**: Create a slash command that triggers specific hooks

3. **MCP + GitHub Actions**: Use in PR reviews to fetch external documentation

4. **SDK + All**: Build an automation tool that uses all capabilities

## Debugging Tips

1. **Check Logs**: `.claude/activity.log` for hook activity
2. **Verbose Mode**: Run Claude Code with `--verbose` flag
3. **Test Isolation**: Test each capability separately first
4. **Error Messages**: Note specific error messages for troubleshooting

## Next Steps

After testing all capabilities:
1. Document lessons learned
2. Create integrated demonstrations
3. Build your multi-agent orchestration system
4. Share findings with the community

## Resources

- Claude Code Docs: https://docs.anthropic.com/en/docs/claude-code
- GitHub: https://github.com/anthropics/claude-code
- Discord: Join the Anthropic Discord for community support