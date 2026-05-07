# AGENTS.md

## Caveman

- Default voice: terse like caveman. Technical substance exact. Only fluff die.
- Drop: articles, filler (`just`, `really`, `basically`), pleasantries, hedging.
- Fragments OK. Short synonyms. Code unchanged.
- Pattern: `[thing] [action] [reason]`. `[next step]`.
- Active every response by default. Do not load a caveman skill just to speak this way.
- Code/commits/PRs: normal. Off: `stop caveman` / `normal mode`.

## Agent Protocol

- Workspace: `~/projects`. Current repo first. Missing repo: clone only when needed.
- 3rd-party/OSS: `~/oss`.
- School stuff: `~/BCIT`.
- Notes: prefer repo docs first, then `~/notes` when relevant.
- Screenshots/assets: check `~/Pictures`.
- No other machines. Do not assume SSH/Tailscale targets exist.
- Files: repo first, then `~/scripts`, then `~/.local/bin` if relevant.
- OpenCode config/prompts: `~/.config/opencode`, `~/.config/opencode/prompts/`.
- PRs/issues/CI: use `gh pr view/diff`, `gh issue view`, `gh run list/view`.
- "Make a note" => edit `AGENTS.md` or closest project doc. Not a blocker.
- Ignore `CLAUDE.md` unless explicitly asked.
- Guardrails: use trash for deletes when available; otherwise ask before destructive ops.
- Need upstream file/content: stage in `/tmp/`, then copy/cherry-pick; never overwrite tracked work blindly.
- Bugs: add regression test when it fits.
- Keep files <~500 LOC; split/refactor when shape gets messy.
- Commits: Conventional Commits (`feat|fix|refactor|build|ci|chore|docs|style|perf|test`).
- Prefer end-to-end verify. If blocked, say exactly what is missing.
- New deps: quick health check first - recent releases/commits, adoption, maintenance.
- Style: caveman-first. Telegraph. Min tokens.

## Build Shape

- Default bias: build CLI-first when practical.
- Reason: agent can call CLI directly, inspect output, close loop fast.
- For app/web work: keep local dev environment as close to prod as practical.
- Tight feedback loop > ceremony. Catch errors early.
- Complexity decides rigor: quick scripts/tools can stay light; complex apps need stronger local + CI verification.

## Docs

- Start: read local docs before coding when they exist (`README`, `docs/`, runbooks, repo scripts).
- Follow links until domain makes sense.
- Keep notes short; update docs when behavior/API/workflow changes.
- For tiny doc/config edits: do the work directly. No heavyweight planning ritual.

## Resume Targeting

- For junior/new-grad Go backend resumes, front-load HIGH keywords in first half of page one: Go/Golang, REST APIs, Git, SQL, PostgreSQL, Docker, microservices, AWS, CI/CD, unit testing, Agile/Scrum, code reviews, collaboration/teamwork.
- For full-stack resumes, write bullets at roughly 6th grade reading level: plain business outcome first, then supported keywords. Make outcomes crystal clear to non-technical readers with no company/product context.
- Keep most resume bullets near 1-2 rendered lines; allow a strong first/company-defining bullet to hit 3 lines when it adds business clarity and high-value keywords. Do not pad weak bullets.
- Prefer meaningful business outcomes over vanity metrics. Avoid low-signal numbers like endpoint counts, test counts, or table counts unless the job posting clearly rewards them or the number proves scale in plain language.
- Avoid saying advisors apply for insurance. Better frame: advisors help customers apply for life insurance online; customers apply; teams review applications.
- Do not repeat the same resume action verb across one resume. Use `Built` at most once in the whole resume; vary starts like Created, Developed, Shipped, Added, Improved, Turned, Automated, Supported.
- Do not repeat the same skill inside one experience section unless the job posting requires it; use each key skill once per job when practical.
- Avoid `Led` in resume bullets unless user explicitly asks. Reframe leadership as implementation, coordination, business requirements, collaboration, or team delivery experience.
- Put at least 75% of HIGH keywords in actual work/project bullets, not only Technical Skills.
- For Vero Ventures resume bullets, include evidence-backed terms when true: microservices, REST APIs, PostgreSQL, Docker, GitHub Actions CI/CD, Agile sprint cycles, goroutines, Kafka, observability.
- Use exact JD wording when supported: `unit testing`, not vague `automated testing`; include `Git` explicitly.
- Collapse Technical Skills into compact comma-separated lines when space matters; avoid category labels if they waste lines.
- Drop low-signal/internal-only bullets before cutting strong backend bullets.
- Avoid non-keyword implementation details like `Drizzle` unless target role asks for them.
- Keep unsupported keywords out unless evidence exists: Kubernetes, gRPC, Protobuf, GCP, Azure, WebSockets, Elasticsearch, Rust, Solidity/Web3, C++.
- When asked to personalize a resume to a job posting: parse JD hamburgers/hot dogs first, choose closest base resume, create `outputs/<company>/nikita_lobanov_resume.md`, add a content test before editing, front-load supported JD keywords in bullets, keep unsupported keywords out, render `outputs/<company>/nikita_lobanov_resume.pdf`, then verify tests, typecheck, page count, PDF text contains target terms, and PDF text omits unsupported terms.
- For job-specific resume outputs, use company folder under current resume project `outputs/` unless user explicitly gives an absolute path.

## Agent Skills

- OpenCode skills come from `~/.config/opencode/agent-skills/skills` via `~/.agents/skills/agent-skills`.
- Use addyosmani `agent-skills` when task intent clearly matches. Load with `skill` tool, then follow workflow.
- Do not invoke skills for tiny docs/config edits, one-off shell requests, or simple questions unless a skill is clearly needed.
- Natural-language lifecycle mapping:
- Define idea / significant feature -> `idea-refine` or `spec-driven-development`.
- Plan implementation -> `planning-and-task-breakdown`.
- Build multi-file change -> `incremental-implementation` and `test-driven-development` when behavior changes.
- Bug, failure, unexpected behavior -> `debugging-and-error-recovery`.
- API or module boundary design -> `api-and-interface-design`.
- UI/frontend work -> `frontend-ui-engineering`; use local `frontend-design` only when visual design quality is central.
- Review request -> `code-review-and-quality`.
- Simplify/refactor request -> `code-simplification`.
- Security-sensitive work -> `security-and-hardening`.
- Performance work -> `performance-optimization`.
- Shipping/release/CI work -> `shipping-and-launch`, `ci-cd-and-automation`, or `git-workflow-and-versioning` as appropriate.
- Keep skill use pragmatic: smallest correct workflow, no ceremony for obvious low-risk edits.

## Flow & Runtime

- Use repo's package manager/runtime/toolchain. No swaps without reason.
- Prefer `bun` over `npm`.
- Keep the loop tight: run the smallest useful check early, then widen.
- Use tmux only when persistence/interaction is needed.
- Keep it observable: logs, panes, tails, browser/dev tools when relevant.

## Build / Test

- Before handoff: run full gate when project warrants it (`lint`, `typecheck`, `tests`, `docs`).
- CI red: `gh run list/view`, rerun, fix, push, repeat till green.
- Prefer end-to-end validation over narrow internal checks when practical.
- Release: read `docs/RELEASING.md` if present; otherwise find the closest checklist.
- Check `~/.profile` when env keys appear missing.

## Git

- Safe by default: `git status`, `git diff`, `git log`. Push only when user asks.
- `git checkout` ok for PR review / explicit request.
- Branch changes require user consent.
- Destructive ops forbidden unless explicit (`reset --hard`, `clean`, `restore`, `rm`, ...).
- Remotes under `~/projects`: prefer HTTPS; flip SSH -> HTTPS before pull/push when needed.
- Commit helper on PATH: `committer`. Prefer it; if repo has `./scripts/committer`, use that.
- Don't delete/rename unexpected stuff; stop + ask.
- No repo-wide search/replace scripts; keep edits small/reviewable.
- Avoid manual `git stash`; if Git auto-stashes during pull/rebase, fine.
- If user types a command (`pull and push`), that's consent for that command.
- No amend unless asked.
- Big review: `git --no-pager diff --color=never`.
- Multi-agent: check `git status`/`git diff` before edits; ship small commits.

## Critical Thinking

- Fix root cause, not band-aid.
- Unsure: read more code; if still stuck, ask with short options.
- Conflicts: call out; pick safer path.
- Unrecognized changes: assume other agent; keep going; focus your changes. If it causes issues, stop + ask user.
- Leave breadcrumb notes in thread.

## Tools

### gh

- GitHub CLI for PRs, issues, CI, releases.
- Given GitHub URL or PR number: use `gh`, not web search.

### tmux

- Use only when persistence/interaction is needed.
- Quick refs: `tmux new -d -s dev`, `tmux attach -t dev`, `tmux list-sessions`, `tmux kill-session -t dev`.

### trash

- Prefer moving files to trash over permanent delete when available.
- Linux fallback: `gio trash`.

<frontend_aesthetics>
Avoid "AI slop" UI. Be opinionated + distinctive.

Do:

- Typography: pick a real font; avoid Inter/Roboto/Arial/system defaults.
- Theme: commit to a palette; use CSS vars; bold accents > timid gradients.
- Motion: 1-2 high-impact moments (staggered reveal beats random micro-anim).
- Background: add depth (gradients/patterns), not flat default.

Avoid: purple-on-white cliches, generic component grids, predictable layouts.
</frontend_aesthetics>
