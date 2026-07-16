# Value Boardroom Skills

> **English** | [简体中文](README.zh-CN.md) | [日本語](README.ja.md) | [Español](README.es.md) | [Русский](README.ru.md) | [한국어](README.ko.md) | [العربية](README.ar.md)

Portable Agent Skills library that helps an investor study a listed company as an owner and operator. It uses role-based, Socratic boardroom conversations to connect operational choices to future free cash flow (FCF) — instead of producing generic investment reports or trading recommendations.

## Purpose

- Understand how a company creates, consumes, and allocates cash.
- Reason as a board director or controlling owner, not as a short-term trader.
- Separate verified facts from management claims, inferences, modelling assumptions, and unknowns.
- Convert departmental insights into a small, testable set of FCF drivers, scenarios, and counterevidence.

## Install

There are two ways to install, two philosophies:

- **Skills CLI** copies the skills into your project so you can edit them and make them your own.
- **Claude Code plugin** keeps them as a managed, read-only, always-current bundle you subscribe to rather than fork.

### Option 1 — Skills CLI (editable, works with any Agent-Skills harness)

```bash
npx skills@latest add white-source/value-grill-skill
```

Works with Claude Code, Codex, Cursor, Copilot, and other Agent-Skills-compatible harnesses. Files are copied into your repo and are yours to modify.

### Option 2 — Claude Code plugin (managed, plug-and-play)

Prefer a plug-and-play install you don't maintain by hand? This skill set also ships as a native Claude Code plugin. Instead of copying editable files into your repo, the plugin installs the whole set as a managed bundle that updates when a new version ships.

Inside Claude Code:

```
/plugin marketplace add white-source/value-grill-skill
/plugin install value-grill-skill@white-source
```

Or from your shell:

```bash
claude plugin marketplace add white-source/value-grill-skill
claude plugin install value-grill-skill@white-source
```

No separate setup step is needed — start a session with `/value-boardroom [company]` right away.

## Start

```
/value-boardroom [company name or ticker]
```

On start the session confirms the company (and identifier/market if known), the as-of date, the research aim, and the evidence mode. The role mode is just one quick question (default `briefing`) — no flags to type.

## Role reversal — the core mechanic

This library's signature feature is **role reversal**: you can study a company from either side of the boardroom table, and the same fourteen operating roles work in both directions.

| Mode | Model plays | You play | Why use it |
|---|---|---|---|
| `briefing` (default) | The selected executive — with their incentives, budgets, and conflicts | A board director / partner asking questions | Build understanding by cross-examining real operating detail. The executive must justify every number all the way to cash flow. |
| `examination` | The board | The CEO, CFO, or selected executive — answering | Pressure-test whether *you* actually understand the business. The board catches the gaps and hand-waving in your own reasoning. |

**briefing** = learn by interrogating. **examination** = learn by being interrogated. You pick the mode with one quick question at startup (default `briefing`), and switch any time with `/mode` — or just say it ("reverse roles", "考考我"). No restart needed. Either way, the turn contract is identical: state a fact or labelled assumption, expose one incentive conflict, trace a clear cash-flow path, and ask exactly one question.

## Operating roles

Fourteen roles cover the whole company. Enter one with the auto-completing `/role-<role>` shortcut (e.g. `/role-cfo`), chain several with `/role ceo cfo ...`, or step through with `/next`. Each speaks only within its remit, surfaces a budget or strategic conflict, and traces its point to revenue, cost, working capital, CapEx, or capital allocation.

| Role | What they own | What to interrogate |
|---|---|---|
| `secretary` | Board secretary / coach — agenda, question tree, evidence, assumptions | Whether every conclusion is sourced and traceable |
| `ceo` | CEO — business model, growth sources, strategy, culture, capital allocation | Business model defensibility (lock-in, switching cost, network effects), organic vs acquired growth, reinvestment rate, culture-talent alignment, returns on capital |
| `cfo` | CFO — profit quality, leverage, working capital, allocation | Cash conversion cycle, accrual vs cash profit, maintenance vs growth CapEx |
| `product` | Product / R&D — customer problem, roadmap, substitution risk | Pricing power, retention/churn, R&D efficiency |
| `marketing` | Marketing / brand — acquisition, loyalty, ad dependency | CAC, LTV, what declines first if advertising stops |
| `sales` | Sales — order quality, pricing, concentration | Realized price after discounts, customer concentration, receivables |
| `channel` | Channel — distributor inventory, merchandising, rebates | Channel inventory days, sell-through, channel margin |
| `supply` | Supply chain / procurement — input costs, supplier power | COGS supplier concentration, contract terms, lead times |
| `operations` | Operations / manufacturing — utilization, yield, unit cost | Capacity utilization, fixed-cost absorption, expansion CapEx |
| `customer-success` | Customer success / after-sales — retention, churn, renewals | Gross/net retention, expansion vs contraction, service cost |
| `people` | People / org — critical talent, incentives, succession | Attrition in key roles, incentive structure, bottlenecks |
| `legal-risk` | Legal / compliance / risk — licences, litigation, regulation | Contingent liabilities, regulatory exposure, data governance |
| `strategy-ma` | Strategy / M&A — new lines, expansion, acquisitions | Post-acquisition returns, goodwill, integration cost |
| `ir-pr` | IR / PR — commitments, transparency, reputation | Public guidance vs actuals, narrative vs operations |

## Command map

| Command | What it does |
|---|---|
| `/value-ask [question or goal]` | Describe what you want; get the right command with an explanation |
| `/value-boardroom [company]` | Initialize or reset a company boardroom session |
| `/mode [briefing\|examination]` | Switch role mode anytime — or just say "reverse roles" |
| `/role-<role>` | Single-role shortcut that **auto-completes** — type `/role-` and pick (e.g. `/role-cfo`) |
| `/role [role...]` | Chain several executives in sequence, e.g. `/role ceo cfo supply` |
| `/next` | Step to the next role on the suggested tour — no retyping |
| `/research [topic]` | Collect or request verifiable public information and classify it by evidence class |
| `/assumption` | View or revise material modelling assumptions |
| `/evidence` | Show the evidence ledger |
| `/cashflow` | Translate operating results into revenue, margin, working capital, CapEx, FCF, and ROIC |
| `/stress-test [shock]` | Run a named shock or build bear/base/bull cases through the cash-flow chain |
| `/kill [year]` | Pre-mortem: assume cash-flow failure by the chosen year and work backwards |
| `/board-summary` | Exit roleplay and synthesize a traceable board conclusion |

## Example: Pop Mart (泡泡玛特, HKEX: 9992)

> Not investment advice. Every claim carries an evidence class. [Full walkthrough (Chinese) →](docs/examples/popmart-walkthrough.md)

A condensed run of the main commands on a real listed company, with real sourced financials (Yahoo Finance TTM, Wikipedia). Every number is tagged by evidence class.

```text
> /value-boardroom Pop Mart --mode briefing
```
Company confirmed. Pop Mart International (HKEX: 9992), as-of July 2026. Briefing mode.

```text
> /role-cfo
```

| Metric | TTM (HKD) | Class |
|---|---|---|
| Revenue | 37.1B | `Fact` |
| Net income | 12.8B (margin 34%) | `Fact` |
| Levered FCF | 9.1B | `Fact` |
| Cash | 17.2B (D/E 12.6%) | `Fact` |
| ROE | 77.6% | `Fact` |

FCF/net ≈ 71% → ~29% of profit absorbed by working capital + CapEx (`Inference`). Light asset, high margin, low debt.

```text
> /cashflow
```
Avg price ¥59–69/box (`Fact`, Wikipedia) × units × IP mix → revenue ¥34B (`Fact`, Yahoo Finance TTM) → high margin → light WC (cash at sale) → CapEx (stores/roboshops/overseas) → **FCF HKD 9.1B TTM**. Three drivers: same-store traffic, overseas ROIC, premium-category mix (`Inference`).

```text
> /stress-test price -10%
```
Chain: price ↓ → volume? (`Unknown`) → fixed cost unchanged → operating leverage worsens → FCF pressured. **Bear/Base/Bull with falsification criteria**, not a single forecast.

```text
> /kill 2030
```
Pre-mortem: Labubu fatigue → comps weaken → overseas payback stretches >36 months → growth CapEx becomes a cash drain → 2030 crunch. **Early indicator**: overseas comps 3-quarter decline + payback >3yr.

```text
> /board-summary
```
Six-section conclusion: FCF mechanism tracked to sourced data, 5/10/20yr stability assessment, conditional scenarios, ≤3 drivers, counterevidence ranked by materiality, next agenda with roles + evidence + metrics to observe.

*Not investment advice. No target price, no buy/sell/hold.*

## Evidence classes

Every claim is labelled so conclusions stay traceable:

| Class | Meaning |
|---|---|
| `Fact` | A source-backed claim, including publication date and source |
| `Management statement` | A company claim not independently verified |
| `Inference` | An operating conclusion derived from cited facts |
| `Assumption` | A model input that could be falsified |
| `Unknown` | Material information without reliable support |

## Web research

Public-web research is used when available and source-dated. When research tools are unavailable, the skills degrade honestly: they state the missing evidence, name the primary sources to consult, suggest searches, and pose the next board question. They never invent data, sources, access, or verification.

## Safety boundary

This is a research and learning framework. It does **not** provide investment recommendations, target prices, buy/sell/hold calls, or trade instructions.

## Verify

```bash
npm test
```

Runs the Node built-in test runner (`node --test tests/skills.test.mjs`), which validates the skill layout, frontmatter, shared references, and safety contracts. Requires Node 20+.

## License

MIT
