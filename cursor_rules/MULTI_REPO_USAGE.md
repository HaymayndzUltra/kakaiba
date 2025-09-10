# Multi-Repo Usage for Scaffold Profiles (A–O)

## Install
1) Copy all files from `cursor_rules/` into your repo’s `.cursor/rules/`.
2) Ensure `.cursor/rules/generated/` exists (the generator writes there).

## Pick a profile and generate rules
Use in a Cursor prompt:
```
SELECT_SCAFFOLD id: <A..O>
GENERATE_FROM_PROFILE repoPath: /absolute/path/to/your/repo projectName: <name>
VALIDATE_RULES
```

Examples:
- Universal Baseline (A):
```
SELECT_SCAFFOLD id: A
GENERATE_FROM_PROFILE repoPath: /workspace/my-repo projectName: my-repo
VALIDATE_RULES
```
- Backend Node (D):
```
SELECT_SCAFFOLD id: D
GENERATE_FROM_PROFILE repoPath: /workspace/backend-node projectName: backend-node
VALIDATE_RULES
```
- Monorepo (H):
```
SELECT_SCAFFOLD id: H
GENERATE_FROM_PROFILE repoPath: /workspace/monorepo projectName: my-platform
VALIDATE_RULES
```

## Generate from a pasted tree
If you’re not ready with a path, paste a `tree` output:
```
MAKE_RULES_FROM_SCAFFOLD tree: <paste tree here>
```

## Backend communication triggers
After generation, use standardized triggers:
```
LINK_SERVICE from: api to: users via: api
EXPOSE_ENDPOINT service: users method: POST path: /api/users
EMIT_EVENT service: users channel: user.created payload: { id: "u1" } mode: dry
CALL_ENDPOINT service: users method: GET path: /api/users/u1 mode: dry
```

## Tips
- Triggers are project/service-scoped to avoid collisions.
- Keep generated files under `generated/`; extend by adding new `.mdc` files.
- Re-run `GENERATE_FROM_PROFILE` safely; it’s designed to be idempotent with backups.