# GitHub Actions Demo

## Overview
Claude Code can respond to @claude mentions in GitHub issues and PRs through GitHub Actions.

## Setup Steps

### 1. Quick Setup (Recommended)
```bash
# In Claude Code, run:
/install-github-app
```

### 2. Manual Setup
1. Create `.github/workflows/claude-code.yml`
2. Add GitHub token as repository secret
3. Configure permissions

## Demo Workflows

### 1. PR Code Review
Create a PR and comment:
```
@claude Can you review this code for security issues and performance?
```

### 2. Issue Response
Create an issue:
```
@claude Help me implement a caching system for our API
```

### 3. Documentation Generation
```
@claude Generate API documentation for all endpoints in src/api/
```

### 4. Bug Investigation
```
@claude This test is failing intermittently. Can you investigate why?
[paste error logs]
```

### 5. Architecture Suggestions
```
@claude Suggest improvements to our current architecture for better scalability
```

## Workflow Configuration
```yaml
name: Claude Code
on:
  issue_comment:
    types: [created]
  pull_request_review_comment:
    types: [created]
  issues:
    types: [opened]
  pull_request:
    types: [opened]

jobs:
  claude-code:
    if: contains(github.event.comment.body || github.event.issue.body || github.event.pull_request.body, '@claude')
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: anthropics/claude-code-action@v1
        with:
          anthropic_api_key: ${{ secrets.ANTHROPIC_API_KEY }}
```

## Testing Instructions
1. Create a test repository
2. Install GitHub App or manual setup
3. Create issues with @claude mentions
4. Create PRs and request reviews
5. Test different command types

## Best Practices
- Clear, specific requests
- Provide context in mentions
- Use for code review
- Automate repetitive tasks
- Document generation