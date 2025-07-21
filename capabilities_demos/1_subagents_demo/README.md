# Subagents Demo

## Overview
This demo showcases Claude Code's ability to spawn up to 10 parallel subagents for concurrent task execution.

## Key Concepts
- Parallel execution with up to 10 subagents
- Task delegation and coordination
- Result aggregation from multiple agents
- Error handling across agents

## Demo Scenarios

### 1. Basic Parallel File Analysis
Ask Claude to analyze multiple files simultaneously:
```
"Analyze these 5 files in parallel and summarize their purposes:
- file1.py
- file2.js
- file3.md
- file4.yaml
- file5.json"
```

### 2. Multi-Language Code Review
```
"Review these components in parallel:
1. Python backend API
2. React frontend components
3. Database schema
4. API documentation
5. Test coverage"
```

### 3. Parallel Search and Replace
```
"Search for TODO comments across the entire codebase and categorize them by:
- Priority (HIGH, MEDIUM, LOW)
- Component (frontend, backend, docs, tests)
- Estimated effort
Use parallel agents to search different directories"
```

### 4. Concurrent Documentation Generation
```
"Generate documentation for each module in parallel:
- API endpoints documentation
- Component prop documentation
- Database schema documentation
- Configuration documentation"
```

## Expected Behaviors
- Claude will indicate when spawning subagents
- Each subagent works independently
- Results are aggregated and presented together
- If >10 agents needed, tasks are batched

## Testing Instructions
1. Create sample files in `test_files/` directory
2. Run each scenario and observe parallel execution
3. Note performance improvements vs sequential
4. Test the 10-agent limit with 12+ tasks

## Lessons to Document
- Optimal task sizes for subagents
- When parallel execution is most effective
- How to structure prompts for best parallelization
- Error handling patterns