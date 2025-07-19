# Guild System Development Guide

## Overview

The Guild System is an innovative approach to parallel development using Claude Code's capabilities combined with git worktrees. It allows multiple specialized "guilds" (teams/agents) to work on different aspects of a project simultaneously.

## How Guild System Works

### Core Concept
Each guild is a **git worktree** - a separate working directory that shares the same git repository but can be on different branches. This allows:
- **Parallel development** on different features
- **Isolated environments** for each guild
- **Shared git history** and easy merging
- **Specialized focus** per guild

### Guild Types (Standard Pattern)
1. **AI/LLM Guild** - LLM integration, prompts, intelligent features
2. **Infrastructure Guild** - DevOps, deployment, scaling, containers
3. **Observability Guild** - Monitoring, logging, metrics, alerting  
4. **Security Guild** - Authentication, authorization, security scanning

### Directory Structure
```
main-project/
├── [main code on master branch]
├── guild-ai-llm/           # Worktree on ai-llm-sprint1 branch
├── guild-infrastructure/    # Worktree on infrastructure-sprint1 branch
├── guild-observability/     # Worktree on observability-sprint1 branch
├── guild-security/         # Worktree on security-sprint1 branch
└── guild-implementation-plans/  # Guild coordination docs
```

## Global Claude Code Automation

Your global Claude Code setup (`~/.claude/settings.json`) provides automatic guild support:

### Automatic Guild Detection
- **Any directory** with `guild-` in the path triggers guild automation
- **Works across all projects** - not just autocoder4_cc

### Guild Hooks (Automatic)
- **Activity logging** - All guild work logged to `~/.claude/guild-logs/`
- **Auto-testing** - Python files automatically tested with pytest
- **Auto-formatting** - Python files formatted with Black
- **Progress tracking** - Phase completion automatically detected
- **Desktop notifications** - Guild milestones trigger notifications
- **Completion validation** - Sprint completion files trigger validation

### Guild Status Reporting
When you stop a Claude session in a guild directory:
- **Phase progress** - Shows completed phases (0/3, 1/3, etc.)
- **Sprint status** - Shows if Sprint 1 is complete
- **Validation status** - Shows if Gemini validation passed
- **Reminder prompts** - Suggests completion verification commands

## Setting Up Guild System

### 1. Create Git Worktrees
```bash
# From your main project directory
git worktree add guild-ai-llm ai-llm-sprint1
git worktree add guild-infrastructure infrastructure-sprint1  
git worktree add guild-observability observability-sprint1
git worktree add guild-security security-sprint1
```

### 2. Create Guild Implementation Plans
```bash
mkdir guild-implementation-plans
# Add planning documents for each guild
```

### 3. Start Guild Development
```bash
# Work in each guild simultaneously
cd guild-ai-llm && claude
cd guild-infrastructure && claude  # (in another terminal)
cd guild-observability && claude   # (in another terminal)
cd guild-security && claude        # (in another terminal)
```

## Guild Development Workflow

### Phase Structure (Standard)
Each guild typically has 3 phases:
- **Phase 1**: Foundation and core setup
- **Phase 2**: Feature implementation  
- **Phase 3**: Integration and optimization

### Phase Completion
Create these files as you complete phases:
- `PHASE_1_COMPLETE.md` - Documents Phase 1 completion
- `PHASE_2_COMPLETE.md` - Documents Phase 2 completion  
- `PHASE_3_COMPLETE.md` - Documents Phase 3 completion
- `SPRINT_1_COMPLETE.md` - Documents overall sprint completion

### Validation Process
1. **Complete all phases** - All 3 phases documented and working
2. **Create sprint completion** - `SPRINT_1_COMPLETE.md` with full summary
3. **Run Gemini validation** - Use `/gemini-validate-claims` to verify
4. **Address any issues** - Fix problems found by validation
5. **Mark validation passed** - `GEMINI_VALIDATION_PASSED.md` when clean

## Guild Coordination

### Communication Between Guilds
- **Shared planning docs** in `guild-implementation-plans/`
- **Regular merges** to share progress between guilds
- **Cross-guild dependencies** documented in planning

### Merging Guild Work
```bash
# From main branch
git merge ai-llm-sprint1
git merge infrastructure-sprint1
git merge observability-sprint1  
git merge security-sprint1
```

## Testing Guild System

### Hello World Guild Test
Create a simple project with minimal guild implementation:
1. **AI Guild** - Simple LLM integration (hello world response)
2. **Infrastructure Guild** - Basic deployment (simple Dockerfile)
3. **Observability Guild** - Basic logging (hello world logs)
4. **Security Guild** - Basic auth (simple API key check)

### Validation Criteria
- ✅ All 4 guilds can be created and work independently
- ✅ Claude Code automation works in each guild
- ✅ Phase completion tracking works
- ✅ Sprint completion and validation works
- ✅ Guild work can be merged successfully

## Benefits of Guild System

### Development Advantages
- **Parallel progress** - Multiple aspects developed simultaneously
- **Specialized focus** - Each guild optimizes for their domain
- **Isolated testing** - Guild work tested independently
- **Faster iteration** - No waiting for other guild completion

### Claude Code Advantages  
- **Contextual specialization** - Each guild has domain-specific context
- **Reduced complexity** - Each guild focuses on subset of system
- **Better tool usage** - Domain-specific tools available per guild
- **Automated coordination** - Global hooks manage guild interaction

### Project Management Advantages
- **Clear ownership** - Each guild owns their domain
- **Progress visibility** - Phase completion clearly tracked
- **Risk mitigation** - Guild isolation reduces cross-contamination
- **Scalable approach** - Add more guilds as project grows

## Advanced Guild Patterns

### Multi-Sprint Planning
- **Sprint 1**: Foundation (MVP functionality)
- **Sprint 2**: Enhancement (advanced features)
- **Sprint 3**: Optimization (performance, polish)

### Cross-Project Guild Reuse
Use the same guild pattern across different projects:
- **Same guild types** (AI, Infrastructure, Observability, Security)
- **Same automation** (global Claude Code hooks work everywhere)
- **Same workflow** (phase completion, validation)
- **Reusable patterns** (guild coordination approaches)

### Guild Specialization Examples
- **AI Guild**: RAG systems, prompt optimization, model integration
- **Infrastructure Guild**: Kubernetes operators, CI/CD, auto-scaling
- **Observability Guild**: Prometheus metrics, distributed tracing, dashboards
- **Security Guild**: RBAC, secrets management, vulnerability scanning

The Guild System transforms Claude Code from a single-agent tool into a coordinated multi-agent development environment, enabling sophisticated parallel development workflows.