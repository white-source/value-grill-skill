# Value Boardroom Skills Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Deliver an Agent-Skills-standard library that guides owner-style company research through role-based boardroom questioning and cash-flow reasoning.

**Architecture:** The library is documentation-first and composable. Three explicit user-entry skills orchestrate a boardroom session, stress tests, and synthesis; four model-invoked skills provide shared questioning, roleplay, research, and cash-flow discipline. Reference documents hold the role matrix, industry adaptations, and evidence templates. A Node built-in test validates the public contracts without third-party dependencies.

**Tech Stack:** Markdown, YAML frontmatter, Node.js built-in test runner, npm metadata, Agent Skills standard, optional Claude Code plugin metadata.

---

## File Structure

- `README.md`: installation, workflow, command map, safety boundary, and development verification.
- `package.json`: private package metadata and `npm test` script.
- `tests/skills.test.mjs`: required layout, metadata, reference, and safety tests.
- `skills/value-boardroom/SKILL.md`: explicit boardroom-session command and state contract.
- `skills/value-stress-test/SKILL.md`: explicit scenario and pre-mortem command.
- `skills/value-board-summary/SKILL.md`: explicit synthesis command.
- `skills/value-grilling/SKILL.md`: single-question Socratic interviewing discipline.
- `skills/value-roleplay/SKILL.md`: executive role, reversal, and conflict simulation discipline.
- `skills/value-research/SKILL.md`: source hierarchy and honest no-web fallback.
- `skills/value-cashflow/SKILL.md`: operating-driver-to-FCF mapping discipline.
- `references/operating-roles.md`: fourteen role accountabilities and prompts.
- `references/industry-adaptation.md`: consumer, manufacturing, SaaS, and platform metric maps.
- `references/evidence-ledger.md`: company-record, evidence, assumption, and summary templates.
- `.claude-plugin/plugin.json`: Claude Code plugin metadata.
- `.claude-plugin/marketplace.json`: optional marketplace metadata.
- `LICENSE`: MIT license.

### Task 1: Create a failing contract test and package manifest

**Files:**
- Create: `package.json`
- Create: `tests/skills.test.mjs`

- [ ] **Step 1: Write `package.json`**

```json
{
  "name": "value-grill-skill",
  "version": "0.1.0",
  "private": true,
  "description": "Portable boardroom skills for owner-style company and future cash-flow research",
  "license": "MIT",
  "scripts": { "test": "node --test tests/skills.test.mjs" },
  "engines": { "node": ">=20" }
}
```

- [ ] **Step 2: Write `tests/skills.test.mjs`**

```js
import assert from "node:assert/strict";
import { existsSync, readFileSync } from "node:fs";
import { join } from "node:path";
import test from "node:test";

const root = process.cwd();
const explicit = ["value-boardroom", "value-stress-test", "value-board-summary"];
const reusable = ["value-grilling", "value-roleplay", "value-research", "value-cashflow"];
const references = ["operating-roles.md", "industry-adaptation.md", "evidence-ledger.md"];
const skill = (name) => {
  const path = join(root, "skills", name, "SKILL.md");
  assert.ok(existsSync(path), `Missing ${path}`);
  return readFileSync(path, "utf8");
};

test("the complete skill set has standard frontmatter", () => {
  for (const name of [...explicit, ...reusable]) {
    assert.match(skill(name), /^---\nname: [a-z0-9-]+\ndescription: .+\n---/m);
  }
});

test("entry skills cannot be auto-invoked", () => {
  for (const name of explicit) assert.match(skill(name), /disable-model-invocation: true/);
});

test("shared references are present and linked", () => {
  for (const name of references) assert.ok(existsSync(join(root, "references", name)));
  assert.match(skill("value-boardroom"), /references\/operating-roles\.md/);
  assert.match(skill("value-boardroom"), /references\/evidence-ledger\.md/);
  assert.match(skill("value-cashflow"), /references\/industry-adaptation\.md/);
});

test("research, questioning, and safety contracts are explicit", () => {
  assert.match(skill("value-research"), /do not invent/i);
  assert.match(skill("value-grilling"), /one question at a time/i);
  assert.match(skill("value-board-summary"), /not.*investment recommendation/i);
});
```

- [ ] **Step 3: Run the test to verify it fails**

Run: `npm test`

Expected: FAIL with `Missing .../skills/value-boardroom/SKILL.md`.

- [ ] **Step 4: Commit the test harness**

Run: `git add package.json tests/skills.test.mjs && git commit -m "test: add skill library contract harness"`

### Task 2: Add the shared role, industry, and evidence references

**Files:**
- Create: `references/operating-roles.md`
- Create: `references/industry-adaptation.md`
- Create: `references/evidence-ledger.md`

- [ ] **Step 1: Write the role matrix**

Create `references/operating-roles.md` with a table containing these exact role identifiers: `secretary`, `ceo`, `cfo`, `product`, `marketing`, `sales`, `channel`, `supply`, `operations`, `customer-success`, `people`, `legal-risk`, `strategy-ma`, and `ir-pr`. Every row must include remit, required operating evidence, FCF transmission path, conflicting stakeholder, and one example board question. End with the rule: every role states facts or labelled assumptions only, exposes a conflict, and asks at most one question per turn.

- [ ] **Step 2: Write industry metric maps**

Create `references/industry-adaptation.md` with sections titled `Consumer brand and retail`, `Manufacturing and automotive`, `SaaS and recurring services`, and `Platforms and marketplaces`. Each section must map four leading operational metrics to FCF implications. Cover realized price/promotion/channel inventory/repurchase for consumer; orders/utilization/BOM/dealer inventory for manufacturing; NRR/CAC payback/deferred revenue/implementation cost for SaaS; and liquidity/take rate/concentration/trust-and-safety cost for platforms. End by requiring the model to select the closest archetype and ask before applying a metric that does not fit.

- [ ] **Step 3: Write evidence and conclusion templates**

Create `references/evidence-ledger.md` with these templates:

```markdown
## Evidence ledger
| ID | Class | Claim | Source and as-of date | Confidence | Why it matters | Next verification step |
|---|---|---|---|---|---|---|

## Assumption register
| ID | Input or range | Evidence | Confidence | Falsification condition | Owner |
|---|---|---|---|---|---|

## Cash-flow driver tree
Revenue = price × volume × mix
Operating cash flow = operating profit + non-cash charges − working-capital investment
Free cash flow = operating cash flow − maintenance and growth capital expenditure

## Board conclusion
1. Customer-payment-to-FCF mechanism
2. Stable and changing conditions over 5/10/20 years
3. Bear, base, and bull conditions
4. Up to three FCF drivers
5. Counterevidence and unknowns
6. Next board agenda
```

Define exactly five evidence classes: `Fact`, `Management statement`, `Inference`, `Assumption`, and `Unknown`. Require an as-of date for time-sensitive facts.

- [ ] **Step 4: Run the test**

Run: `npm test`

Expected: FAIL only because skill files are absent; it must not report a missing reference.

- [ ] **Step 5: Commit the references**

Run: `git add references && git commit -m "docs: add operating research references"`

### Task 3: Implement reusable model-invoked discipline skills

**Files:**
- Create: `skills/value-grilling/SKILL.md`
- Create: `skills/value-roleplay/SKILL.md`
- Create: `skills/value-research/SKILL.md`
- Create: `skills/value-cashflow/SKILL.md`

- [ ] **Step 1: Implement `value-grilling`**

Use this initial content, then add a compact claim → mechanism → evidence → one question → record loop and a stop condition for unavailable evidence:

```markdown
---
name: value-grilling
description: Use when helping an investor test a company, business model, cash-flow forecast, moat, or operating assumption through questions.
---

# Value Grilling

Ask one question at a time and wait for the answer. Look up externally verifiable facts when tools are available; ask the user only for decisions, observations, or private information. Treat abstract claims such as "strong brand", "network effect", or "high growth" as incomplete until they are translated into a customer, price, volume, cost, payment-term, or capital-expenditure mechanism.
```

- [ ] **Step 2: Implement `value-roleplay`**

Add frontmatter with `name: value-roleplay` and a trigger for executive simulation, boardroom reversal, or departmental conflict. Require reading `references/operating-roles.md`. Define `briefing` as model-as-executive/user-as-board and `examination` as model-as-board/user-as-executive. Every turn must name the role, separate fact from assumption, declare a budget or strategic conflict, show an FCF path, and ask exactly one question. Prohibit invented internal metrics.

- [ ] **Step 3: Implement `value-research`**

Add frontmatter with `name: value-research` and triggers for current company facts, filings, earnings, industry data, or source verification. Require source order: regulator filings and annual/interim reports; company releases and calls; company website; primary industry data; secondary reporting only as a lead. Every claim includes source title or URL and as-of date. Without browsing, output `Evidence needed`, `Primary sources to consult`, `Suggested searches`, and `Next board question`. Include: `Do not invent data, sources, access, or verification.`

- [ ] **Step 4: Implement `value-cashflow`**

Add frontmatter with `name: value-cashflow` and triggers for unit economics, FCF, ROIC, CapEx, working capital, or long-range scenarios. Require this bridge: customer value → price/volume/mix → variable/fixed cost → operating profit → receivables/inventory/payables → operating cash flow → maintenance/growth CapEx → FCF → capital allocation/ROIC. Link to `references/industry-adaptation.md` and `references/evidence-ledger.md`; select a business archetype and label unsupported inputs as assumptions.

- [ ] **Step 5: Run the tests**

Run: `npm test`

Expected: FAIL only because the three explicit entry skills are absent.

- [ ] **Step 6: Commit reusable skills**

Run: `git add skills/value-grilling skills/value-roleplay skills/value-research skills/value-cashflow && git commit -m "feat: add value research discipline skills"`

### Task 4: Implement explicit boardroom entry skills

**Files:**
- Create: `skills/value-boardroom/SKILL.md`
- Create: `skills/value-stress-test/SKILL.md`
- Create: `skills/value-board-summary/SKILL.md`

- [ ] **Step 1: Implement `value-boardroom`**

Use this frontmatter:

```markdown
---
name: value-boardroom
description: Use when a user explicitly wants to study a company as an owner through an operating boardroom, executive questioning, or role reversal.
disable-model-invocation: true
---
```

Require `references/operating-roles.md` and `references/evidence-ledger.md`. Define `/value-boardroom [company]`, `/role <role>`, `/research [topic]`, `/value-assumption`, `/value-evidence`, and `/value-cashflow`. Initialization confirms company, identifier/market if known, as-of date, research goal, evidence mode, and `briefing`/`examination` mode. Keep the portable company record from the design. Run one role turn only, and state that this skill may use reusable disciplines but never invokes another entry skill.

- [ ] **Step 2: Implement `value-stress-test`**

Use frontmatter `name: value-stress-test` and `disable-model-invocation: true`. Define `/value-stress-test` and `/value-kill`. A stress test traces the selected shock through price, volume, mix, cost, receivables, inventory, payables, CapEx, FCF, financing, and management response. Output bear/base/bull conditions, never a false-precision point forecast. `/value-kill` assumes material cash-flow failure by the selected year, works backwards through causes, names an early indicator, and asks one decision question.

- [ ] **Step 3: Implement `value-board-summary`**

Use frontmatter `name: value-board-summary` and `disable-model-invocation: true`. Define `/value-board-summary` with six required sections: FCF mechanism; 5/10/20-year stable and changing conditions; conditional bear/base/bull cases; at most three drivers; counterevidence and unknowns; next agenda. Require the evidence classes in `references/evidence-ledger.md`. Include: `This is a research and learning framework, not an investment recommendation.`

- [ ] **Step 4: Run the complete contract test**

Run: `npm test`

Expected: PASS with four passing subtests.

- [ ] **Step 5: Commit entry skills**

Run: `git add skills/value-boardroom skills/value-stress-test skills/value-board-summary && git commit -m "feat: add boardroom skill workflow"`

### Task 5: Add installation documentation and plugin metadata

**Files:**
- Modify: `README.md`
- Create: `.claude-plugin/plugin.json`
- Create: `.claude-plugin/marketplace.json`
- Create: `LICENSE`

- [ ] **Step 1: Write `README.md`**

Document: purpose; `npx skills@latest add white-source/value-grill-skill`; start command `/value-boardroom [company name or ticker]`; both modes; one-sentence descriptions of `/role`, `/value-research`, `/value-assumption`, `/value-evidence`, `/value-cashflow`, `/value-stress-test`, `/value-kill`, and `/value-board-summary`; the five evidence classes; optional and source-dated web research; no investment recommendations, target prices, or trade instructions; and `npm test` verification.

- [ ] **Step 2: Write `.claude-plugin/plugin.json`**

```json
{
  "name": "value-grill-skill",
  "version": "0.1.0",
  "description": "Owner-style company research and boardroom cash-flow skills",
  "author": { "name": "white-source" },
  "license": "MIT",
  "keywords": ["value-investing", "company-research", "cash-flow", "boardroom", "skills"]
}
```

- [ ] **Step 3: Write `.claude-plugin/marketplace.json`**

```json
{
  "name": "white-source",
  "owner": { "name": "white-source" },
  "description": "Portable owner-style company research skills for Claude Code and Agent Skills compatible agents.",
  "plugins": [{
    "name": "value-grill-skill",
    "source": "./",
    "description": "Boardroom roleplay and cash-flow research skills for understanding companies as an owner.",
    "category": "productivity",
    "keywords": ["value-investing", "cash-flow", "research"]
  }]
}
```

- [ ] **Step 4: Add `LICENSE`**

Add standard MIT license text with `Copyright (c) 2026 white-source`.

- [ ] **Step 5: Run verification and inspect package contents**

Run: `npm test && find skills references .claude-plugin -type f | sort`

Expected: Tests pass; output lists seven `SKILL.md` files, three reference documents, and two plugin JSON files.

- [ ] **Step 6: Commit distribution files**

Run: `git add README.md .claude-plugin LICENSE && git commit -m "docs: add installation and plugin metadata"`

### Task 6: Final review

**Files:**
- Verify: `README.md`, `skills/**/SKILL.md`, `references/*.md`, `.claude-plugin/*.json`

- [ ] **Step 1: Run automated checks**

Run: `npm test`

Expected: PASS with four passing subtests.

- [ ] **Step 2: Validate the two role modes and all role identifiers**

Confirm `value-boardroom` names `briefing` and `examination`; confirm `value-roleplay` assigns model/user responsibilities correctly; confirm every role identifier from `references/operating-roles.md` is accepted by `/role`.

- [ ] **Step 3: Validate research and safety rules**

Confirm `value-research` requires source and as-of date, defines a no-web fallback, and forbids invented information. Confirm `value-board-summary` forbids investment recommendations.

- [ ] **Step 4: Review whitespace and working tree**

Run: `git diff HEAD~4..HEAD --check && git status --short`

Expected: No whitespace errors and an empty working tree.

- [ ] **Step 5: Commit a final correction only if one was necessary**

Run: `if ! git diff --quiet; then git add README.md skills references .claude-plugin tests package.json LICENSE && git commit -m "chore: verify value skill library"; fi`

## Plan Self-Review

- **Spec coverage:** Tasks 2–4 implement all seven skills, fourteen operating roles, role reversal, research classification, FCF mapping, stress testing, pre-mortem, and board summaries. Task 5 covers portable installation and optional Claude Code metadata. Task 6 verifies the Version 1 Definition of Done.
- **Placeholder scan:** No TODO, TBD, or execution placeholders remain. Command-interface parameters such as `[company]` and `<role>` are literal user-facing syntax.
- **Type consistency:** Skill directory names, command names, role identifiers, and reference paths agree with the approved design and contract test.