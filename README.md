# Agent skills

[![PowerShell installer](https://img.shields.io/badge/installer-PowerShell-2766A3)](install.ps1) [![MIT license](https://img.shields.io/badge/license-MIT-39764D)](LICENSE)

When I set up a new Windows machine, I want the skills I use in Claude Code and Codex back in one place. I keep my selection here with a PowerShell installer and a guide to when I use each skill.

[Browse the skills guide](GUIDE.md) · [View the installer](install.ps1)

## Usage examples

Suppose an enrollment test passes locally but fails in CI. Here is how I would work through it:

| Task | Skill | Example prompt |
| --- | --- | --- |
| Diagnose the failure | `diagnosing-bugs` | Use diagnosing-bugs to investigate why the enrollment test passes locally but fails in GitHub Actions. Start by comparing the two environments. |
| Capture the expected behavior | `tdd` | Use tdd to write a failing test for this case: when a student cancels, only the first person on the waitlist should get the seat. |
| Prepare the change for review | `pr` | Use pr to draft a pull request description from this branch. Explain what caused the failure, what changed, and how I tested it. |

[Explore all 63 skills and example prompts →](GUIDE.md)

## Install on Windows

You need PowerShell 5.1 or later, Git, and Node.js 18 or later with npm. Some individual tools have extra requirements: Python 3.8+ for the founder tools and `jq` for the web audit helper.

```powershell
git clone https://github.com/jg-abreu/agent-skills.git
cd agent-skills
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

The script calls the [skills CLI](https://skills.sh/) once per source, installs the selected names at user level in `~/.agents/skills`, and links them into `~/.claude/skills`. It prints a per-package summary and exits with code 1 if a package fails.

Running it again reinstalls those names from upstream. The list fixes which skills to fetch, while their contents can change between runs. Review a skill’s `SKILL.md` and bundled scripts before installing it.

## Sources

| Package | What I use it for | Skills | Upstream license |
| --- | --- | ---: | --- |
| [mattpocock/skills](https://github.com/mattpocock/skills) | Planning features, testing, reviewing changes and writing | 38 | MIT |
| [anthropics/skills](https://github.com/anthropics/skills) | Designing and testing interfaces | 4 | Apache 2.0 in each selected skill |
| [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | Reviewing UI and React performance | 2 | Per skill. The React skill declares MIT |
| [addyosmani/web-quality-skills](https://github.com/addyosmani/web-quality-skills) | Auditing accessibility, page speed and site quality | 3 | MIT |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) | Designing and reviewing interface motion | 3 | MIT |
| [vercel-labs/skills](https://github.com/vercel-labs/skills) | Finding skills for unfamiliar tasks | 1 | MIT |
| [blader/humanizer](https://github.com/blader/humanizer) | Editing drafts in the author's voice | 1 | MIT |
| [jakeschincariol/founder-skill](https://github.com/Jakeschincariol/founder-skill) | Testing a business idea and planning its launch | 11 | MIT |

## License

The installer and documentation are under the [MIT License](LICENSE). Each third-party skill is distributed by its author under its upstream terms.
