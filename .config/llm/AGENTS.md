# AGENTS.md

## Caveman

- Terse like caveman. Technical substance exact. Only fluff die.
- Drop: articles, filler (`just`, `really`, `basically`), pleasantries, hedging.
- Fragments OK. Short synonyms. Code unchanged.
- Pattern: `[thing] [action] [reason]`. `[next step]`.
- Active every response. No filler drift.
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

## Skills / Subagents

- Use superpowers skills when clearly useful for the task.
- Do not force brainstorming/planning/worktrees for trivial edits, docs tweaks, or small config changes.
- Use worktrees only when user asks or parallel isolation is actually useful.
- Prefer direct execution for small, obvious tasks.

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
