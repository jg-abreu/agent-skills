# Skills guide

Each entry includes a task, an example prompt and the original source. In Codex, name the skill in your request. In Claude Code, use `/skill-name` followed by your request. Entries marked **manual** show the slash command.

- [Engineering and project work](#engineering-and-project-work) (33)
- [Interface and accessibility](#interface-and-accessibility) (12)
- [Writing and documentation](#writing-and-documentation) (5)
- [Skill discovery](#skill-discovery) (2)
- [Business planning](#business-planning) (11)

## Common flows

| Goal | Skills, in order |
| --- | --- |
| Shape and build a feature | `grill-with-docs` → `to-spec` → `to-tickets` → `implement` → `code-review` → `pr` |
| Fix a hard bug | `diagnosing-bugs` → `tdd` (regression test first) → `pr` |
| Build a UI | `frontend-design` or `animate` → `web-design-guidelines` → `accessibility` |
| Before launching a site | `web-quality-audit` → `performance` if something is slow |
| Test a business idea | `founder-board` → `founder-competitors` → `founder-consumer` → `founder-pricing` → `founder-offer` → `founder-cfo` → `founder-marketing` → `founder-brand` → `founder-ops` → `founder-launch` → `founder-plan` |
| Write an article | `writing-fragments` → `writing-beats` → `writing-shape` → `humanizer` |
| Don't know where to start | `ask-matt` (for mattpocock skills) or `find-skills` (for new ones) |

## Engineering and project work

| Skill | When to use it | Example prompt | Source |
| --- | --- | --- | --- |
| `setup-matt-pocock-skills` · manual | One-time setup per repo: issue tracker, triage labels and where domain docs live. Run it before the other engineering skills. | `/setup-matt-pocock-skills` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `grill-with-docs` · manual | Interviews you about a plan until it holds up, writing ADRs and glossary entries along the way. | `/grill-with-docs checkout with Paddle` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `to-spec` · manual | Turns the current conversation into a spec and publishes it to the issue tracker. No new interview. | `/to-spec` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `to-tickets` · manual | Splits a plan or spec into small end-to-end tickets with their blocking order. | `/to-tickets` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `wayfinder` · manual | For work too big for one session: a map of decision tickets on the tracker, resolved one at a time. | `/wayfinder phase 2 of the site` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `implement` · manual | Implements a piece of work from a spec or tickets. | `/implement #12` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `implement-spec` · manual | Implements the output of `/to-spec` + `/to-tickets`. | `/implement-spec` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `tdd` | Test-first, red-green-refactor, for features and bug fixes. | Use tdd to check that cancelling one enrollment frees exactly one seat. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `diagnosing-bugs` | A disciplined loop for hard bugs and performance regressions: reproduce, hypothesise, prove. | Investigate why the enrollment test passes locally but fails in CI. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `code-review` | Reviews changes since a commit or branch on two axes: the repo's standards and what the issue asked for. | `/code-review since main` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `pr` | Writes the pull request description. | Draft a PR description explaining the waitlist fix and its regression test. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `prototype` | A throwaway prototype to answer one design question (a state model or a UI). | "prototype the cart states" | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `codebase-design` | Vocabulary for deep modules: interfaces, seams, testability. | "design the interface of the payments module" | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `improve-codebase-architecture` · manual | Scans the code for modules worth deepening, shows an HTML report, then grills you on the one you pick. | `/improve-codebase-architecture` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `domain-modeling` | Keeps the project's glossary and ADRs: terms, definitions, decisions. | "add 'Material' to the glossary" | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `research` | Researches a question in primary sources and saves the findings as Markdown in the repo. | "research Paddle's Pix support" | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `triage` · manual | Moves issues and outside PRs through triage states and writes briefs an agent can pick up. | `/triage` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `retro` · manual | Retrospective of a coding session: what worked, what to change. | `/retro` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `wizard` | Generates an interactive bash script that walks a human through steps only they can do (logins, dashboards, secrets). | "make a wizard to set up the Cloudflare secrets" | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `grill-me` · manual | A relentless interview to sharpen a plan. | `/grill-me my study plan` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `grilling` | Same interview, loaded by phrases like "grill me". | Grill me on moving reminders from email to SMS. | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `to-questionnaire` · manual | Turns a decision you can't answer alone into a questionnaire for someone else. | `/to-questionnaire questions for the CEO about refunds` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `teach` · manual | Teaches a concept inside the current workspace. | `/teach React Server Components` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `wait-what` · manual | "That didn't land": makes the agent explain its last message again, differently. | `/wait-what` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `handoff` · manual | Compacts the conversation into a handoff document for the next agent. | `/handoff` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `git-guardrails-claude-code` | Adds Claude Code hooks that block dangerous git commands (`push`, `reset --hard`, `clean`, `branch -D`). | "add git guardrails to this repo" | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `setup-pre-commit` | Sets up Husky + lint-staged with Prettier, type checking and tests on commit. | "set up pre-commit hooks" | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `migrate-to-shoehorn` | Replaces `as` assertions in TypeScript tests with `@total-typescript/shoehorn`. | "migrate these tests to shoehorn" | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `scaffold-exercises` | Creates folders of exercises (problem, solution, explainer) for a course. | "scaffold a section on arrays" | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `chief-of-staff` · manual | Pursues a long goal in one session by coordinating subagents. | `/chief-of-staff migrate the tests to Vitest` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `claude-handoff` · manual | Hands the conversation to a fresh background agent that keeps working. | `/claude-handoff` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `loop-me` · manual | Interviews you about the workflows you want to automate in the workspace. | `/loop-me` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `setup-ts-deep-modules` · manual | Adds dependency-cruiser so each TypeScript package is only reachable through its entry files. | `/setup-ts-deep-modules` | [mattpocock/skills](https://github.com/mattpocock/skills) |

## Interface and accessibility

| Skill | When to use it | Example prompt | Source |
| --- | --- | --- | --- |
| `frontend-design` | Picks a visual direction (type, colour, layout) that doesn't look like a template. In a project with its own theme, name the theme file in the request. | "design the home page following docs/theme.md" | [anthropics/skills](https://github.com/anthropics/skills) |
| `theme-factory` | Applies one of 10 preset themes, or a new one, to slides, docs or landing pages. Not for projects that already have a theme. | "apply a theme to this deck" | [anthropics/skills](https://github.com/anthropics/skills) |
| `web-artifacts-builder` | Builds larger claude.ai artifacts with React, Tailwind and shadcn/ui. | "build a budget tracker artifact" | [anthropics/skills](https://github.com/anthropics/skills) |
| `webapp-testing` | Drives a local app with Playwright: clicks, screenshots, browser logs. | "open localhost:3000 and test the checkout" | [anthropics/skills](https://github.com/anthropics/skills) |
| `web-design-guidelines` | Reviews UI code against Vercel's Web Interface Guidelines (focus, forms, touch, typography, i18n, hover) and lists findings as `file:line`. Reads code only; changes nothing. | `/web-design-guidelines src/components/Header.tsx` | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `vercel-react-best-practices` | 70 React and Next.js performance rules (waterfalls, bundle size, server components, re-renders). Loads on its own when writing React. | "review the product page for performance" | [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) |
| `accessibility` | WCAG 2.2 audit: alt text, contrast, headings, ARIA, keyboard, screen readers. Measures the live page when it is running. | `/accessibility audit the home page` | [addyosmani/web-quality-skills](https://github.com/addyosmani/web-quality-skills) |
| `web-quality-audit` | Lighthouse-style audit of performance, accessibility, SEO and best practices, measured on the running page. Best before a launch. | `/web-quality-audit http://localhost:3000 on mobile` | [addyosmani/web-quality-skills](https://github.com/addyosmani/web-quality-skills) |
| `performance` | Loading speed: images, fonts, cache, render-blocking JS, LCP, INP and CLS. Also used by `web-quality-audit`. | "the store page loads slowly on mobile" | [addyosmani/web-quality-skills](https://github.com/addyosmani/web-quality-skills) |
| `animate` | Builds an animation in the order that makes it feel right: whether to animate at all, property, curve, duration, interruption and exit. Writes the code. | `/animate mobile menu sliding up, CSS only, with prefers-reduced-motion` | [emilkowalski/skills](https://github.com/emilkowalski/skills) |
| `find-animation-opportunities` | Finds where motion would help, with exact values, and where it shouldn't be added. Reads code only. | `/find-animation-opportunities src/app` | [emilkowalski/skills](https://github.com/emilkowalski/skills) |
| `review-animations` · manual | A strict review of existing motion code. Flags by default. | `/review-animations src/components/Menu.tsx` | [emilkowalski/skills](https://github.com/emilkowalski/skills) |

## Writing and documentation

| Skill | When to use it | Example prompt | Source |
| --- | --- | --- | --- |
| `writing-for-agents` | How to write skills, `AGENTS.md` and `CLAUDE.md` that agents follow. | "review this AGENTS.md" | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `writing-fragments` · manual | Writing, step 1: collect raw fragments, no structure yet. | `/writing-fragments` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `writing-beats` · manual | Writing, step 2: arrange the material into a sequence of beats. | `/writing-beats` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `writing-shape` · manual | Writing, step 3: shape it into an article, paragraph by paragraph. | `/writing-shape` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `humanizer` | Rewrites text that sounds AI-written (dashes everywhere, forced triads, inflated claims) without changing what it says. | "humanize this README" | [blader/humanizer](https://github.com/blader/humanizer) |

## Skill discovery

| Skill | When to use it | Example prompt | Source |
| --- | --- | --- | --- |
| `ask-matt` · manual | Tells you which skill or flow fits your situation. | `/ask-matt I have a vague feature idea, where do I start?` | [mattpocock/skills](https://github.com/mattpocock/skills) |
| `find-skills` | Searches [skills.sh](https://skills.sh/) for a skill, checks installs and source, and installs it. | `/find-skills accessibility` | [vercel-labs/skills](https://github.com/vercel-labs/skills) |

## Business planning

| Skill | When to use it | Example prompt | Source |
| --- | --- | --- | --- |
| `founder-board` | A three-member board scores the idea, names the risks and votes fund, fund with conditions, or pass. | Review my idea for a paid tutoring service for first-year students. | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |
| `founder-competitors` | Maps direct and indirect competitors and substitutes from public sources, with prices and complaints, and finds the gap. | Which alternatives do first-year students use for calculus tutoring, and what do they pay? | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |
| `founder-consumer` | A panel of simulated buyers (100, or 20 with `--quick`) sees the pitch; tallies who buys, who doesn't and why. | Run a simulated buyer panel for my weekly calculus group. What objections come up? | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |
| `founder-pricing` | Turns the panel's price answers into a price range, a good/better/best ladder and an opening offer. | Compare the panel’s price estimates with my break-even cost per seat. | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |
| `founder-offer` | Builds the offer: solutions to each buyer problem, honest bonuses, a guarantee and real urgency. | Build a four-session calculus package around the students’ top two objections. | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |
| `founder-cfo` | Unit economics: margin, break-even, year 1 month by month, cash needed and what-if scenarios. | How many seats must I fill to cover the tutor and room each week? | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |
| `founder-marketing` | Positioning, channels, a dated 30-day campaign, the first hooks and a budget split. | Draft the first two weeks of outreach for my evening tutoring group. | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |
| `founder-brand` | Name (with trademark and domain checks), voice, tagline and a brief for the look. | Suggest names for my tutoring service that a student can remember after hearing once. | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |
| `founder-ops` | Suppliers, staffing, opening and closing routines, permits and a risk register. | Plan booking, tutor scheduling and cancellations for the first week. | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |
| `founder-launch` | A cheap real-world test first, then a dated launch plan and the first 30 days. | Design a paid pilot for one calculus group before I rent a classroom. | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |
| `founder-plan` | Compiles everything into one business plan with a verdict computed from the numbers. | Compile the pilot results, pricing and costs into a plan I can share with a partner. | [jakeschincariol/founder-skill](https://github.com/jakeschincariol/founder-skill) |

[Installation and package licenses](README.md)
