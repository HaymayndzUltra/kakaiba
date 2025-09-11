# Scaffold Profiles (A–O)

Use these with the index triggers in `_index.mdc` and the master orchestrator.

- A: Universal Baseline → GEN_BASELINE_RULES
- B: Frontend SPA → GEN_FE_SPA_RULES
- C: Frontend SSR → GEN_FE_SSR_RULES
- D: Backend Node → GEN_BE_NODE_RULES
- E: Backend Python → GEN_BE_PY_RULES (+ BE_FASTAPI_RULES / BE_DJANGO_RULES)
- F: Backend Spring → GEN_BE_SPRING_RULES
- G: Backend .NET → GEN_BE_DOTNET_RULES
- H: Monorepo → GEN_MONO_RULES
- I: Serverless → GEN_SERVERLESS_RULES
- J: Mobile → GEN_MOBILE_RULES
- K: Data/ML → GEN_DATA_ML_RULES
- L: Library/SDK → GEN_LIB_SDK_RULES
- M: CLI Tool → GEN_CLI_RULES
- N: IaC/Terraform → GEN_IAC_RULES
- O: Microservices Platform → GEN_PLATFORM_RULES

Example flow in Cursor:
```
SELECT_SCAFFOLD id: D
GENERATE_FROM_PROFILE repoPath: /workspace/my-backend projectName: my-backend
VALIDATE_RULES
```