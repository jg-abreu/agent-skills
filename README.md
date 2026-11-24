# agent-skills

The agent skills I use with Claude Code and Codex, and one script that puts them back on any machine.

Skills live in hidden folders (`~/.agents/skills`, `~/.claude/skills`) and come from different authors. After a fresh install or a new PC, I had no list of what I used or where each skill came from. This repo is that list. It does not copy anyone's files: it points to each source and reinstalls everything with the [skills CLI](https://skills.sh/).

```powershell
git clone https://github.com/jg-abreu/agent-skills.git
cd agent-skills
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

One command, 55 skills from 5 packages, linked into Claude Code and the universal skills folder.

## Skills

Each skill keeps its author's license. The MIT license in this repo covers only `install.ps1` and this README.

### [mattpocock/skills](https://github.com/mattpocock/skills) · MIT

What I use it for: planning and building code with specs, TDD, reviews and bug diagnosis, plus writing and handoff between sessions.

| Group | Skills |
| --- | --- |
| Engineering | `ask-matt`, `code-review`, `codebase-design`, `diagnosing-bugs`, `domain-modeling`, `grill-with-docs`, `implement`, `implement-spec`, `improve-codebase-architecture`, `pr`, `prototype`, `research`, `retro`, `setup-matt-pocock-skills`, `tdd`, `to-spec`, `to-tickets`, `triage`, `wayfinder`, `wizard` |
| Productivity | `grill-me`, `grilling`, `handoff`, `teach`, `to-questionnaire`, `wait-what`, `writing-for-agents` |
| Misc | `git-guardrails-claude-code`, `migrate-to-shoehorn`, `scaffold-exercises`, `setup-pre-commit` |
| In progress (upstream) | `chief-of-staff`, `claude-handoff`, `loop-me`, `setup-ts-deep-modules`, `writing-beats`, `writing-fragments`, `writing-shape` |

The script installs these 38 by name. Other skills the author adds to the package are not installed until I add them here.

### [anthropics/skills](https://github.com/anthropics/skills) · Apache 2.0 (per skill)

What I use it for: front-end work, since I come from the back end. Visual direction, themes, React artifacts and browser testing with Playwright.

| Skill | Source |
| --- | --- |
| `frontend-design` | [skills/frontend-design](https://github.com/anthropics/skills/tree/main/skills/frontend-design) |
| `theme-factory` | [skills/theme-factory](https://github.com/anthropics/skills/tree/main/skills/theme-factory) |
| `web-artifacts-builder` | [skills/web-artifacts-builder](https://github.com/anthropics/skills/tree/main/skills/web-artifacts-builder) |
| `webapp-testing` | [skills/webapp-testing](https://github.com/anthropics/skills/tree/main/skills/webapp-testing) |

The repository has no top-level license. Each of these four skills ships its own `LICENSE.txt` (Apache 2.0).

### [vercel-labs/skills](https://github.com/vercel-labs/skills) · MIT

What I use it for: finding and vetting new skills before I install them.

| Skill | Source |
| --- | --- |
| `find-skills` | [skills/find-skills](https://github.com/vercel-labs/skills/tree/main/skills/find-skills) |

### [blader/humanizer](https://github.com/blader/humanizer) · MIT

What I use it for: editing READMEs, posts and articles so they don't read like a chatbot wrote them.

| Skill | Source |
| --- | --- |
| `humanizer` | [SKILL.md](https://github.com/blader/humanizer/blob/main/SKILL.md) |

### [jakeschincariol/founder-skill](https://github.com/Jakeschincariol/founder-skill) · MIT

What I use it for: testing a business idea before launch, with one skill per role in the company (board, CFO, marketing, operations and a panel of simulated buyers).

| Group | Skills |
| --- | --- |
| Validation | `founder-board`, `founder-competitors`, `founder-consumer` |
| Offer and money | `founder-pricing`, `founder-offer`, `founder-cfo` |
| Go to market | `founder-marketing`, `founder-brand`, `founder-launch` |
| Running it | `founder-ops`, `founder-plan` |

Source folders: [skills/](https://github.com/Jakeschincariol/founder-skill/tree/main/skills). The tools need Python 3.8 or newer.

## How it works

`install.ps1` checks that Node.js and git exist, then runs one command per package:

```powershell
npx.cmd skills add <owner/repo> -g -y -a universal claude-code --skill <names...>
```

- `-g` installs at user level, not inside a project.
- `-a universal claude-code` places the skill in `~/.agents/skills` and links it into `~/.claude/skills`.
- Symlinks are the CLI default (junctions on Windows), so each skill exists once on disk.
- `npx.cmd` instead of `npx` avoids PowerShell's execution policy blocking `npx.ps1`.

Running the script again reinstalls the same skills in place. At the end it prints a summary per package and the output of `npx skills ls -g`. It exits with code 1 if any package fails.

Requirements: Windows PowerShell 5.1 or newer, Node.js 18+, git. Python 3.8+ for the founder skills' tools.

## Works across agents

These skills follow the open [Agent Skills](https://agentskills.io) format: a folder with a `SKILL.md` file and optional resources. Claude Code reads `~/.claude/skills`; Codex, Gemini CLI, GitHub Copilot and other tools read `~/.agents/skills`. The same install serves all of them.

## Security

A skill runs with your agent's full permissions. It can tell the agent to run commands, edit files or call the network. Before installing a third-party skill, read its `SKILL.md` and any scripts it ships, and check the author and the repository. The [skills.sh](https://skills.sh/) page of each skill also shows automated risk checks.

## My own skills

Skills I write myself will go in a `skills/` folder in this repo, and the install script will pick them up from there.

## License

`install.ps1` and this README are under the [MIT License](LICENSE). The skills listed above belong to their authors and follow their own licenses.
