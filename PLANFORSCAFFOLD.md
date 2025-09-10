- Frontend (SPA at SSR/meta frameworks)
- Backend/API (Node, Python, Java, .NET)
- Full-stack monorepo
- Serverless
- Mobile
- Data/ML
- Library/SDK
- CLI tools
- IaC/Terraform
- Microservices platform

Kasama rin ang **universal baseline** (mga folder at patakaran na dapat laging meron sa kahit anong proyekto).

---

# A. Universal Baseline (lahat ng proyekto, anumang framework)

**Purpose:** I-standardize ang kalidad, seguridad, portability, at operability.

**Folder Tree**

```
<project-root>/
  docs/
    architecture/
    decisions/           # ADRs (Architecture Decision Records)
    runbooks/            # On-call, troubleshooting, playbooks
    standards/           # coding, branching, review, security baselines
  .github/               # or .gitlab/
    workflows/           # CI/CD pipelines (lint, test, build, release)
    issue_templates/
    pr_templates/
  config/
    app/                 # app-level configs (framework config files)
    env/                 # .env.example, env schema & docs (no secrets)
    feature_flags/
    secrets/             # pointer docs to secret manager (walang plaintext)
  scripts/               # dev utilities (format, lint, db seed, etc.)
  tools/                 # linters, generators, git hooks config
  test/
    unit/
    integration/
    e2e/
    fixtures/
  src/                   # pangunahing application/source code
  public/                # static assets (kung applicable)
  build/                 # build artifacts (git-ignored)
  dist/                  # distribution artifacts (git-ignored)
  ops/
    docker/              # Dockerfiles variants, compose, healthchecks
    k8s/                 # manifests/helm charts (kung kailangan)
    terraform/           # infra per env (kung IaC dito nakalagay)
    observability/
      logging/
      metrics/
      tracing/
    security/
      threat_model/
      dependencies_policies/
  migrations/            # db schema migrations (kung may DB)
  data/                  # sample data, synthetic datasets (hindi PII)
  i18n/                  # translations/localization resources
  .vscode/ or .idea/     # workspace recommendations (optional)
  LICENSE
  CHANGELOG.md
  CONTRIBUTING.md
  CODE_OF_CONDUCT.md
  README.md              # malinaw na quickstart + architecture overview

```

**Mahalagang paliwanag**

- **docs/**: Panatilihing updated ang **architecture diagram**, **ADRs**, at **runbooks** para mabilis ang onboarding at incident response.
- **config/**: Ihiwalay ang **runtime config** (per env), **feature flags**, at **secrets** (walang plaintext secrets sa repo; gumamit ng secret manager) upang predictable at secure ang deployments.
- **scripts/**/**tools/**: Lahat ng paulit-ulit na gawain (lint, format, audit, bundle, test, db-reset, seed) ay may nakahandang task na pareho sa dev/CI.
- **test/**: Maglagay ng malinaw na separation: **unit** (pure logic), **integration** (components na nag-uusap), **e2e** (end-to-end scenarios).
- **ops/**: Standardize sa containerization, deployment manifests, observability (logs/metrics/traces), at security (SBOM/dependency policy, threat model).
- **migrations/**: Database changes ay versioned at reproducible.
- **i18n/**: Handang-handa sa localization.
- **Governance files** (LICENSE, CONTRIBUTING, CODE_OF_CONDUCT, CHANGELOG) para sa legal, contributions, at version history.

---

# B. Frontend – SPA (React, Vue, Svelte, Angular)

**Kailan gamitin:** Pure client-side app o SPA shell.

**Folder Tree**

```
frontend-spa/
  src/
    app/                 # app shell, layout, routing glue
    pages/               # route-level views (kung may router convention)
    components/
      ui/                # reusable presentational comps
      data/              # data-aware comps (containers)
    styles/              # global, tokens, utilities
    hooks/               # custom hooks (kung React)
    store/               # state mgmt (Redux/Pinia/Zustand/etc.)
    services/
      api/               # API clients, SDK wrappers
      cache/             # caching layer (SW, IndexedDB)
      auth/              # auth flows, guards
    lib/                 # helpers, utils, adapters
    assets/              # images, fonts, icons
    i18n/
  public/                # static files served as-is
  test/
    unit/
    e2e/                 # Playwright/Cypress structure (walang code)
    accessibility/
  config/
    app/                 # bundler config refs, router config
    env/                 # env schema (e.g., PUBLIC_ vars), examples
    feature_flags/
  scripts/
  tools/                 # lint/format/stylelint configs; git hooks
  ops/
    docker/
    observability/       # web vitals collection plan, RUM endpoints
  docs/

```

**Paliwanag–puntos kritikal**

- **Routing** sa **pages/** (opinyonado) o **app/** (custom).
- **State mgmt** hiwalay (store/).
- **Services/api/** para central API access, retries, auth tokens, at error normalization.
- **Accessibility testing** (axe, pa11y) structure sa **test/accessibility/**.
- **RUM/Web Vitals** plan sa **ops/observability/**.

---

# C. Frontend – SSR/Meta Frameworks (Next.js, Nuxt, SvelteKit, Astro)

**Kailan gamitin:** SEO-friendly, SSR/SSG/ISR, edge rendering.

**Folder Tree**

```
frontend-ssr/
  src/
    app/ or pages/       # depende sa framework (routing + data fetching)
    components/
      server/            # server components (kung supported)
      client/            # client components
    styles/
    services/
      api/
      auth/
      cms/               # headless CMS clients/adapters
    lib/
    i18n/
    middleware/          # edge middleware (auth/geolocation/ab-test)
  public/
  test/
    unit/
    e2e/
    performance/         # lighthouse budgets, SSR timing checks
  config/
    app/
    env/
    feature_flags/
  scripts/
  tools/
  ops/
    docker/
    observability/
  docs/

```

**Paliwanag–puntos kritikal**

- **Server vs Client components** separation (kung applicable).
- **Middleware/** para auth, rewrites, AB tests sa edge.
- **CMS adapters** hiwalay upang madali palitan.
- **Performance budgets** at SSR timing checks.

---

# D. Backend/API – Node.js (Express, Fastify, NestJS, Hapi)

**Kailan gamitin:** High-throughput JSON APIs, real-time, o BFFs.

**Folder Tree**

```
backend-node/
  src/
    app/                 # bootstrap, server wiring (framework main module)
    modules/
      <feature-name>/
        controllers/
        services/
        repositories/
        entities/        # schema/DTOs
        validators/
        routes/          # route definitions (kung hindi auto)
    common/
      errors/
      middleware/
      utils/
      config/            # runtime config loaders
      logging/
      auth/
    db/
      migrations/
      seeds/
    integrations/
      external/<service>/   # e.g., payment, notifications
    events/
      publishers/
      subscribers/
      schemas/
    jobs/
      workers/
      schedules/
  test/
    unit/
    integration/
    e2e/
  config/
    env/
    feature_flags/
    security/            # rate limits, CORS, CSP docs, policies
  scripts/
  tools/
  ops/
    docker/
    k8s/
    observability/       # log format, metrics, tracing spec
  docs/

```

**Paliwanag–puntos kritikal**

- **Modular by feature** para scalability.
- **Integrations/** hiwalay upang malinaw ang external deps (retry, circuit-breakers).
- **Events/** (pub/sub) at **jobs/** (workers/schedules) para async work.
- **Security policies** (input validation, rate limit, CORS) nasa **config/security/**.

---

# E. Backend/API – Python (FastAPI/Flask o Django)

**Kailan gamitin:** Data-heavy, Pythonic ecosystem, o admin-heavy apps.

**Folder Tree (FastAPI/Flask style)**

```
backend-py/
  src/
    app/
      main.py (reference-only in docs)   # (walang code, pangalan lang)
      api/
        routers/
        dependencies/
        schemas/
      core/
        config/
        security/
        logging/
      services/
      repositories/
      models/
      tasks/           # Celery/RQ scheduling structure
    db/
      migrations/
      seeds/
  test/
    unit/
    integration/
    e2e/
  config/
    env/
    feature_flags/
  scripts/
  tools/
  ops/
    docker/
    observability/
  docs/

```

**Folder Tree (Django conventions)**

```
backend-django/
  src/
    project/           # settings/, urls/, wsgi/asgi, as project package
      settings/
        base.py        # (pangalan lang; walang code)
        dev.py
        prod.py
      urls.py
      asgi.py
    apps/
      <app_name>/
        admin/
        models/
        views/
        urls/
        forms/
        serializers/
        signals/
        templates/<app_name>/
        static/<app_name>/
    shared/
      middleware/
      utils/
      permissions/
    db/
      migrations/
  test/
    unit/
    integration/
    e2e/
  config/
    env/
    feature_flags/
  scripts/
  tools/
  ops/
    docker/
    observability/
  docs/

```

**Paliwanag–puntos kritikal**

- Django: hatiin ang **settings** sa base/dev/prod; i-encapsulate ang business logic sa **apps/**.
- FastAPI/Flask: **api/routers** + **dependencies** para clear DI patterns; **schemas/** para Pydantic-like contracts.

---

# F. Backend – Java (Spring Boot)

**Kailan gamitin:** Enterprise JVM stack, strict typing, rich ecosystem.

**Folder Tree**

```
backend-spring/
  src/
    main/
      java/
        com/example/project/
          config/
          controllers/
          services/
          repositories/
          domain/          # entities, value objects
          dto/
          security/
          util/
      resources/
        application.yml     # (filename lang; walang laman)
        db/
          migration/        # Flyway/Liquibase
    test/
      java/
        ... (mirror of main packages)
  config/
    env/
    feature_flags/
  scripts/
  tools/
  ops/
    docker/
    observability/
  docs/

```

**Paliwanag–puntos kritikal**

- Gumamit ng **db/migration/** para versioned schema.
- **application.yml** per env via profiles; secrets sa external manager.

---

# G. Backend – .NET (ASP.NET Core Web API)

**Kailan gamitin:** Windows/Linux friendly, enterprise tooling.

**Folder Tree**

```
backend-dotnet/
  src/
    Project.Api/
      Controllers/
      Models/
      DTOs/
      Filters/
      Middleware/
      Config/
    Project.Application/
      Services/
      Interfaces/
      Validators/
    Project.Infrastructure/
      Persistence/
      Repositories/
      Migrations/
      Integrations/
    Project.Domain/
      Entities/
      ValueObjects/
      Events/
  test/
    UnitTests/
    IntegrationTests/
    ApiTests/
  config/
    env/
    feature_flags/
  scripts/
  tools/
  ops/
    docker/
    observability/
  docs/

```

**Paliwanag–puntos kritikal**

- Clean Architecture layering: **Domain**, **Application**, **Infrastructure**, **Api**.
- **Migrations/** via EF Core; configs per env.

---

# H. Full-stack Monorepo (Turborepo, Nx, PNPM/Yarn workspaces)

**Kailan gamitin:** Maraming apps/packages na nagsi-share ng code.

**Folder Tree**

```
monorepo/
  apps/
    web/                # frontend
    api/                # backend
    admin/              # backoffice/tooling
  packages/
    ui/                 # shared UI components
    utils/              # shared helpers
    config/             # shared eslint/tsconfig/postcss configs
    sdk/                # shared client SDK
  docs/
  test/
    e2e/                # cross-app e2e
  config/
    env/
    feature_flags/
  scripts/
  tools/
  ops/
    docker/
    k8s/
    observability/
  .github/
    workflows/
  README.md

```

**Paliwanag–puntos kritikal**

- Gumamit ng **packaging boundaries** (apps vs packages).
- Centralize **shared configs** sa **packages/config/** para DRY.
- CI na kayang mag-cache at mag-run ng affected-only builds/tests.

---

# I. Serverless (AWS Lambda/Serverless Framework/SAM, Vercel/Netlify Functions)

**Kailan gamitin:** Event-driven, pay-per-use, mabilis mag-deploy.

**Folder Tree**

```
serverless-app/
  functions/
    <domain>/
      handlers/
      events/          # event contracts/schemas
      validators/
      middlewares/
  layers/
    shared/            # shared libs (no secrets)
  config/
    env/
    permissions/       # IAM policies references
    feature_flags/
  test/
    unit/
    integration/
  ops/
    templates/         # SAM/Serverless Framework templates
    observability/     # structured logs, traces, dashboards
    deployment/        # stages: dev/stage/prod
  scripts/
  tools/
  docs/

```

**Paliwanag–puntos kritikal**

- **functions/** by domain; **layers/** para shared deps.
- **permissions/** hiwalay ang IAM policy definitions.
- **observability/** dapat may cold-start at concurrency dashboards.

---

# J. Mobile (React Native, Flutter, Android, iOS)

**Kailan gamitin:** Native o cross-platform apps.

**Folder Tree**

```
mobile-app/
  app/                 # cross-layer: navigation, screens, state
    navigation/
    screens/
    components/
    services/
      api/
      auth/
      storage/         # secure storage abstractions
    assets/
    i18n/
    styles/
  android/             # native project (auto-generated but organized)
  ios/                 # native project (auto-generated but organized)
  test/
    unit/
    integration/
    e2e/               # Detox/Appium structure
  config/
    env/
    feature_flags/
    build/             # build variants, signing docs (walang secrets)
  scripts/
  tools/
  ops/
    observability/     # crash reporting, performance monitoring setup
  docs/

```

**Paliwanag–puntos kritikal**

- Clear na **navigation/** at **screens/** separation.
- **Secure storage** wrapper; huwag mag-commit ng keys.
- E2E infra (Detox/Appium) nakahanda kahit walang test code.

---

# K. Data/ML Project (ETL + Training + Serving)

**Kailan gamitin:** Analytics, ML experiments, model serving.

**Folder Tree**

```
data-ml/
  data/
    raw/
    processed/
    features/
    models/            # trained artifacts (git-ignored)
  notebooks/           # exploration, EDA (export to docs)
  src/
    etl/
      extract/
      transform/
      load/
    ml/
      features/
      training/
      evaluation/
      serving/
    common/
      io/
      utils/
      config/
  test/
    unit/
    integration/
    regression/        # model regression checks
  config/
    env/
    pipelines/         # orchestrator DAGs (Airflow/Prefect)
    feature_store/
  ops/
    docker/
    observability/     # drift, performance monitoring plan
    deployment/        # batch/online serving strategies
  scripts/
  tools/
  docs/
    reports/
    model_cards/       # fairness/ethics/performance summaries

```

**Paliwanag–puntos kritikal**

- Ihiwalay ang **ETL** at **ML** modules; may **model_cards/** para governance.
- **Regression tests** para maiwasan performance drift.
- **Pipelines/** para reproducibility ng buong flow.

---

# L. Library/SDK (multi-language optional)

**Kailan gamitin:** Reusable package para sa apps.

**Folder Tree**

```
library-sdk/
  src/
    core/
    adapters/
    transports/        # http/grpc/etc.
    errors/
  test/
    unit/
    contract/          # public API surface tests
  docs/
    api_reference/     # generated reference (walang code dito)
    guides/
  config/
    env/
    publishing/        # release rules, semver, registry docs
  scripts/
  tools/
  ops/
    security/          # supply chain checks, SBOM, license scanning
  examples/            # minimal usage samples (text-only structure)
  CHANGELOG.md
  README.md
  LICENSE

```

**Paliwanag–puntos kritikal**

- Strict **public API contracts** (semantic versioning).
- **Publishing/** docs para release process at registry setup.
- **Security**: license/SBOM scans para compliance.

---

# M. CLI Tool

**Kailan gamitin:** Developer productivity o admin automation.

**Folder Tree**

```
cli-tool/
  src/
    commands/
      <topic>/
        index.*         # entrypoint name only (walang code)
        options/
        handlers/
    services/
    utils/
  test/
    unit/
    integration/
  config/
    env/
    completions/       # shell completion scripts structure
  scripts/
  tools/
  docs/
    usage/
    recipes/
  ops/
    packaging/         # installers, standalone builds

```

**Paliwanag–puntos kritikal**

- **commands/** hierarchy para discoverability.
- **completions/** para shell UX.
- **packaging/** para cross-platform distribution.

---

# N. IaC / Terraform Repo

**Kailan gamitin:** Infra versioning per environment.

**Folder Tree**

```
infra-terraform/
  envs/
    dev/
      main.tfvars       # filenames only; walang secrets
      backend.tfvars
    stage/
    prod/
  modules/
    network/
    compute/
    storage/
    observability/
    security/
  policies/
    opa/                # policy-as-code structure
  ops/
    pipelines/          # plan/apply approvals
    states/             # remote state docs
  docs/
    runbooks/
    architecture/

```

**Paliwanag–puntos kritikal**

- **modules/** para reusable infra units.
- **envs/** para separation ng state/vars.
- **policies/** (OPA) for guardrails.

---

# O. Microservices Platform (multi-service + shared infra)

**Kailan gamitin:** Maraming independent services na may shared tooling.

**Folder Tree**

```
platform/
  services/
    <svc-a>/
      src/
      test/
      config/
      ops/
    <svc-b>/
      ...
  shared/
    libs/
    contracts/            # protobuf/openapi schemas
    config/
    ci/
    observability/
    security/
  gateways/
    api-gateway/
    edge/
  data/
    migrations/
    seeds/
  ops/
    k8s/
      base/
      overlays/
    terraform/
    deployment/
    runbooks/
  docs/
    architecture/
    decisions/
    SLOs/                 # service-level objectives & error budgets

```

**Paliwanag–puntos kritikal**

- **contracts/** para API/schema na versioned at shared.
- **k8s/base** + **overlays** (dev/stage/prod) para kustomize/helm pattern.
- **SLOs/** at error budgets para reliability governance.

---

## Paano Piliin at I-adapt sa “kahit anong framework”

1. **Kilalanin ang kategorya** (SPA, SSR, backend API, mobile, atbp).
2. **Kopyahin ang baseline** (Section A) + ang scaffold ng kategorya.
3. **I-map ang conventions ng framework** (hal. Django apps/, Next.js app/pages/, Spring package structure) sa katumbas na mga folder sa scaffold.
4. **Ilagay ang config lamang bilang filenames** (walang secrets, walang code), at i-documenta sa **docs/** kung paano sila ginagamit.
5. **I-setup ang CI/CD** gamit ang **.github/workflows/** (o GitLab CI) para lint → test → build → scan → package → release → deploy.
6. **I-enforce quality gates**: unit/integration/e2e test folders, coverage thresholds (naka-document), accessibility/performance checks (para sa web).
7. **I-document ang ops**: containerization, health checks, runbooks, rollback strategies, SLOs.
8. **I-govern**: ADRs, CHANGELOG, semver (para sa libraries), CODE_OF_CONDUCT, CONTRIBUTING.
9. **I-secure**: secret management reference, dependency policy, SBOM, threat model.
10. **I-observe**: logging format, metrics list, traces, dashboards plan.

---

## Quick Checklist (para siguradong “walang kulang”)

- [ ]  **docs/**: README (quickstart), architecture, ADRs, runbooks
- [ ]  **config/**: env schema, feature flags, secrets policy
- [ ]  **scripts/**/**tools/**: lint, format, audit, test, build, release runners
- [ ]  **test/**: unit, integration, e2e (+ accessibility/performance kung web)
- [ ]  **ops/**: docker, deploy manifests, observability (logs/metrics/traces)
- [ ]  **migrations/**: db changes (kung may DB)
- [ ]  **i18n/**: translation scaffolding (kung user-facing)
- [ ]  **Legal & governance**: LICENSE, CONTRIBUTING, CODE_OF_CONDUCT, CHANGELOG
- [ ]  **Security**: dependency policy, SBOM, threat model, secrets policy
- [ ]  **Performance**: budgets at monitoring (lalo na sa SSR/SPA)
- [ ]  **Release mgmt**: semver rules, tags, release notes flow