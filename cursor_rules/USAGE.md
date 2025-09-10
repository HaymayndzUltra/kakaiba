# Cursor Rules: Scaffold-Driven Role Generation & Backend Communication

## Overview
This rule set lets Cursor generate role-based MDC rules from a scaffold and control backend communication via triggers.

## Files
- `master_scaffold_orchestrator.mdc` — Orchestrates scaffold ingestion and generation
- `scaffold_to_roles.mdc` — Maps scaffold to domain/group rules
- `backend_communication.mdc` — Defines communication triggers for services, APIs, and events

## Installation
1. Copy all `.mdc` files in `cursor_rules/` to your project’s `.cursor/rules/` directory.
2. Ensure the directory `.cursor/rules/generated/` exists (the system will write there).

## Quick Start
### Generate from a repository path
Prompt in Cursor:
```
MAKE_RULES_FROM_SCAFFOLD path: /workspace/app
```

### Generate from a pasted tree
```
MAKE_RULES_FROM_SCAFFOLD tree: <paste your tree here>
```

### Summarize detected domains
```
SCAFFOLD_SUMMARIZE path: /workspace/app
```

## Backend Communication Examples
- Register service links:
```
LINK_SERVICE from: users to: orders via: event
```
- Expose and call endpoints (dry-run):
```
EXPOSE_ENDPOINT service: users method: POST path: /api/users
CALL_ENDPOINT service: users method: GET path: /api/users/u1 mode: dry
```
- Define channel and emit event:
```
DEFINE_CHANNEL service: users channel: user.created
EMIT_EVENT service: users channel: user.created payload: { id: "u1" } mode: dry
```

## Best Practices
- Use project/service-scoped trigger names to avoid collisions (the generator does this automatically).
- Keep generated files under `generated/` and avoid manual edits; extend via new MDCs instead.
- Run `VALIDATE_RULES` after generation to check trigger uniqueness and references.

