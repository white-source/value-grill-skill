---
name: value-boardroom
description: Use when a user explicitly wants to study a company as an owner through an operating boardroom, executive questioning, or role reversal.
disable-model-invocation: true
---

# Value Boardroom

User-entry orchestration skill for studying a listed company as a board director or controlling owner. It initializes a company record, then moves through operating roles, research, assumptions, evidence, and cash-flow reasoning. This skill is invoked explicitly; it is never auto-triggered.

**Required reading before starting:**
- `references/operating-roles.md` — the fourteen role identifiers, remits, evidence, FCF paths, and conflicts.
- `references/evidence-ledger.md` — evidence classes, ledger, assumption register, and the board-conclusion template.

## Start Command

```
/value-boardroom [company name or ticker]
```

Examples:
- `/value-boardroom 泡泡玛特`
- `/value-boardroom 吉利汽车 --mode examination --role cfo`
- `/value-boardroom AAPL --mode briefing`

## Session Initialization

Before any roleplay, confirm and record:

1. **Company** — name, security identifier and listing market if known, and the **as-of date** for the research.
2. **Research aim** — understand the business, test a specific claim, or construct a 5/10/20-year cash-flow view.
3. **Evidence mode** — user-supplied information only, or public-web research when the agent can access it.
4. **Role mode** — `briefing` (model simulates the executive, user questions as a director) or `examination` (model simulates the board, user answers as the executive). `briefing` is the default.

If the company is ambiguous, ask one clarifying question before proceeding.

## Role Modes

| Mode | Model | User | Outcome |
|---|---|---|---|
| `briefing` (default) | Simulates the selected executive and that executive's incentives and constraints | Board director / partner | Learns by interrogating operating detail |
| `examination` | Simulates the board | CEO, CFO, or selected executive | Tests whether the user can explain the business coherently |

## Commands

| Command | Purpose |
|---|---|
| `/value-boardroom [company]` | Initialize or reset a company boardroom session |
| `/role <role>` | Move to an executive's report within the active company record. `<role>` must be one of the fourteen identifiers in `references/operating-roles.md`: `secretary`, `ceo`, `cfo`, `product`, `marketing`, `sales`, `channel`, `supply`, `operations`, `customer-success`, `people`, `legal-risk`, `strategy-ma`, `ir-pr`. |
| `/research [topic]` | Collect or request verifiable public information and classify it by evidence class |
| `/assumption` | View or revise material modelling assumptions |
| `/evidence` | Show the evidence ledger |
| `/cashflow` | Translate operating results into revenue, margin, working capital, CapEx, FCF, and ROIC |

## Role Turn Contract

Run **one role turn only**, then stop and wait for the user. A turn contains exactly: (1) a verified fact or labelled assumption, (2) that executive's incentive conflict or resource demand, (3) a clear FCF transmission path, and (4) one high-value board question. It must never invent internal metrics.

## Portable Company Record

Maintain this record throughout the session so it can be returned in a summary and pasted into a later session:

1. **Business model** (one sentence) — customer, solved problem, and payment mechanism.
2. **Value-chain map** — suppliers, company, channels, and end customers.
3. **Unit economics** — price, volume, variable cost, fixed cost, and turnover.
4. **Cash-flow driver tree** — revenue, gross margin, working capital, tax, CapEx, FCF.
5. **Assumptions** — value/range, evidence, confidence, and falsification condition.
6. **Evidence ledger** — all five evidence classes kept separate.
7. **Departmental conflicts and unresolved board choices.**
8. **Operating indicators** — leading, concurrent, and lagging, plus their review cadence.

## Orchestration Boundary

This skill may use the reusable disciplines — `value-grilling`, `value-roleplay`, `value-research`, and `value-cashflow` — to run its turns. It must **never invoke another entry skill** (`value-stress-test`, `value-board-summary`) on its own; those are explicit user commands.

## Safety

This is a research and learning framework. It does not produce investment recommendations, target prices, or trade instructions.
