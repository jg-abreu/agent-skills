# Skills guide

What each skill does and how I call it. The [README](README.md) lists where each one comes from; this file is for the day I forget which one to use.

## How to call a skill

- **Claude Code:** type `/skill-name` followed by the request, for example `/web-design-guidelines src/app/page.tsx`. Most skills also load on their own when the request matches their description ("review my UI", "diagnose this").
- **Manual** (marked below): these never load on their own. They run only when you type `/skill-name`.
- **Codex and other agents:** ask for the skill by name ("use the tdd skill to…").
- Some skills answer the first call with a one-line greeting and wait. Put the question in the same message to skip it.

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

---

## mattpocock/skills

### Engineering

| Skill | What it does | Example |
| --- | --- | --- |
| `ask-matt` · manual | Tells you which skill or flow fits your situation. | `/ask-matt I have a vague feature idea, where do I start?` |
| `setup-matt-pocock-skills` · manual | One-time setup per repo: issue tracker, triage labels and where domain docs live. Run it before the other engineering skills. | `/setup-matt-pocock-skills` |
| `grill-with-docs` · manual | Interviews you about a plan until it holds up, writing ADRs and glossary entries along the way. | `/grill-with-docs checkout with Paddle` |
| `to-spec` · manual | Turns the current conversation into a spec and publishes it to the issue tracker. No new interview. | `/to-spec` |
| `to-tickets` · manual | Splits a plan or spec into small end-to-end tickets with their blocking order. | `/to-tickets` |
| `wayfinder` · manual | For work too big for one session: a map of decision tickets on the tracker, resolved one at a time. | `/wayfinder phase 2 of the site` |
| `implement` · manual | Implements a piece of work from a spec or tickets. | `/implement #12` |
| `implement-spec` · manual | Implements the output of `/to-spec` + `/to-tickets`. | `/implement-spec` |
| `tdd` | Test-first, red-green-refactor, for features and bug fixes. | "fix the login bug with tdd" |
| `diagnosing-bugs` | A disciplined loop for hard bugs and performance regressions: reproduce, hypothesise, prove. | "diagnose: the deploy fails only on CI" |
| `code-review` | Reviews changes since a commit or branch on two axes: the repo's standards and what the issue asked for. | `/code-review since main` |
| `pr` | Writes the pull request description. | "write the PR body" |
| `prototype` | A throwaway prototype to answer one design question (a state model or a UI). | "prototype the cart states" |
| `codebase-design` | Vocabulary for deep modules: interfaces, seams, testability. | "design the interface of the payments module" |
| `improve-codebase-architecture` · manual | Scans the code for modules worth deepening, shows an HTML report, then grills you on the one you pick. | `/improve-codebase-architecture` |
| `domain-modeling` | Keeps the project's glossary and ADRs: terms, definitions, decisions. | "add 'Material' to the glossary" |
| `research` | Researches a question in primary sources and saves the findings as Markdown in the repo. | "research Paddle's Pix support" |
| `triage` · manual | Moves issues and outside PRs through triage states and writes briefs an agent can pick up. | `/triage` |
| `retro` · manual | Retrospective of a coding session: what worked, what to change. | `/retro` |
| `wizard` | Generates an interactive bash script that walks a human through steps only they can do (logins, dashboards, secrets). | "make a wizard to set up the Cloudflare secrets" |

### Productivity

| Skill | What it does | Example |
| --- | --- | --- |
| `grill-me` · manual | A relentless interview to sharpen a plan. | `/grill-me my study plan` |
| `grilling` | Same interview, loaded by phrases like "grill me". | "grill me on this decision" |
| `to-questionnaire` · manual | Turns a decision you can't answer alone into a questionnaire for someone else. | `/to-questionnaire questions for the CEO about refunds` |
| `teach` · manual | Teaches a concept inside the current workspace. | `/teach React Server Components` |
| `wait-what` · manual | "That didn't land": makes the agent explain its last message again, differently. | `/wait-what` |
| `handoff` · manual | Compacts the conversation into a handoff document for the next agent. | `/handoff` |
| `writing-for-agents` | How to write skills, `AGENTS.md` and `CLAUDE.md` that agents follow. | "review this AGENTS.md" |

### Misc

| Skill | What it does | Example |
| --- | --- | --- |
| `git-guardrails-claude-code` | Adds Claude Code hooks that block dangerous git commands (`push`, `reset --hard`, `clean`, `branch -D`). | "add git guardrails to this repo" |
| `setup-pre-commit` | Sets up Husky + lint-staged with Prettier, type checking and tests on commit. | "set up pre-commit hooks" |
| `migrate-to-shoehorn` | Replaces `as` assertions in TypeScript tests with `@total-typescript/shoehorn`. | "migrate these tests to shoehorn" |
| `scaffold-exercises` | Creates folders of exercises (problem, solution, explainer) for a course. | "scaffold a section on arrays" |

### In progress upstream

These may change or break between updates.

| Skill | What it does | Example |
| --- | --- | --- |
| `chief-of-staff` · manual | Pursues a long goal in one session by coordinating subagents. | `/chief-of-staff migrate the tests to Vitest` |
| `claude-handoff` · manual | Hands the conversation to a fresh background agent that keeps working. | `/claude-handoff` |
| `loop-me` · manual | Interviews you about the workflows you want to automate in the workspace. | `/loop-me` |
| `setup-ts-deep-modules` · manual | Adds dependency-cruiser so each TypeScript package is only reachable through its entry files. | `/setup-ts-deep-modules` |
| `writing-fragments` · manual | Writing, step 1: collect raw fragments, no structure yet. | `/writing-fragments` |
| `writing-beats` · manual | Writing, step 2: arrange the material into a sequence of beats. | `/writing-beats` |
| `writing-shape` · manual | Writing, step 3: shape it into an article, paragraph by paragraph. | `/writing-shape` |

---

## Front-end and UI

### anthropics/skills

| Skill | What it does | Example |
| --- | --- | --- |
| `frontend-design` | Picks a visual direction (type, colour, layout) that doesn't look like a template. In a project with its own theme, name the theme file in the request. | "design the home page following docs/theme.md" |
| `theme-factory` | Applies one of 10 preset themes, or a new one, to slides, docs or landing pages. Not for projects that already have a theme. | "apply a theme to this deck" |
| `web-artifacts-builder` | Builds larger claude.ai artifacts with React, Tailwind and shadcn/ui. | "build a budget tracker artifact" |
| `webapp-testing` | Drives a local app with Playwright: clicks, screenshots, browser logs. | "open localhost:3000 and test the checkout" |

### vercel-labs/agent-skills

| Skill | What it does | Example |
| --- | --- | --- |
| `web-design-guidelines` | Reviews UI code against Vercel's Web Interface Guidelines (focus, forms, touch, typography, i18n, hover) and lists findings as `file:line`. Reads code only; changes nothing. | `/web-design-guidelines src/components/Header.tsx` |
| `vercel-react-best-practices` | 70 React and Next.js performance rules (waterfalls, bundle size, server components, re-renders). Loads on its own when writing React. | "review the product page for performance" |

### addyosmani/web-quality-skills

| Skill | What it does | Example |
| --- | --- | --- |
| `accessibility` | WCAG 2.2 audit: alt text, contrast, headings, ARIA, keyboard, screen readers. Measures the live page when it is running. | `/accessibility audit the home page` |
| `web-quality-audit` | Lighthouse-style audit of performance, accessibility, SEO and best practices, measured on the running page. Best before a launch. | `/web-quality-audit http://localhost:3000 on mobile` |
| `performance` | Loading speed: images, fonts, cache, render-blocking JS, LCP, INP and CLS. Also used by `web-quality-audit`. | "the store page loads slowly on mobile" |

### emilkowalski/skills

| Skill | What it does | Example |
| --- | --- | --- |
| `animate` | Builds an animation in the order that makes it feel right: whether to animate at all, property, curve, duration, interruption and exit. Writes the code. | `/animate mobile menu sliding up, CSS only, with prefers-reduced-motion` |
| `find-animation-opportunities` | Finds where motion would help, with exact values, and where it shouldn't be added. Reads code only. | `/find-animation-opportunities src/app` |
| `review-animations` · manual | A strict review of existing motion code. Flags by default. | `/review-animations src/components/Menu.tsx` |

---

## Writing and discovery

| Skill | Package | What it does | Example |
| --- | --- | --- | --- |
| `humanizer` | blader/humanizer | Rewrites text that sounds AI-written (dashes everywhere, forced triads, inflated claims) without changing what it says. | "humanize this README" |
| `find-skills` | vercel-labs/skills | Searches [skills.sh](https://skills.sh/) for a skill, checks installs and source, and installs it. | `/find-skills accessibility` |

---

## jakeschincariol/founder-skill

Each skill plays one role in a company. Run them in the order of the table; later ones read what earlier ones wrote.

| Skill | What it does | Example |
| --- | --- | --- |
| `founder-board` | A three-member board scores the idea, names the risks and votes fund, fund with conditions, or pass. | "test my business idea: …" |
| `founder-competitors` | Maps direct and indirect competitors and substitutes from public sources, with prices and complaints, and finds the gap. | "who are my competitors?" |
| `founder-consumer` | A panel of simulated buyers (100, or 20 with `--quick`) sees the pitch; tallies who buys, who doesn't and why. | "run the consumer panel" |
| `founder-pricing` | Turns the panel's price answers into a price range, a good/better/best ladder and an opening offer. | "how much should I charge?" |
| `founder-offer` | Builds the offer: solutions to each buyer problem, honest bonuses, a guarantee and real urgency. | "make my offer better" |
| `founder-cfo` | Unit economics: margin, break-even, year 1 month by month, cash needed and what-if scenarios. | "is this profitable?" |
| `founder-marketing` | Positioning, channels, a dated 30-day campaign, the first hooks and a budget split. | "marketing plan" |
| `founder-brand` | Name (with trademark and domain checks), voice, tagline and a brief for the look. | "name my business" |
| `founder-ops` | Suppliers, staffing, opening and closing routines, permits and a risk register. | "what do I need to open?" |
| `founder-launch` | A cheap real-world test first, then a dated launch plan and the first 30 days. | "launch plan" |
| `founder-plan` | Compiles everything into one business plan with a verdict computed from the numbers. | "write my business plan" |
