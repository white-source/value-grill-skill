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

That is the only thing you must type. Company name or ticker is the only required input — **mode and role are chosen during the session, never required up front**.

Examples:
- `/value-boardroom 泡泡玛特`
- `/value-boardroom 吉利汽车`
- `/value-boardroom AAPL`

> Optional power-user shortcut: you may still write `--mode briefing|examination` and `--role <role>` in the start command, e.g. `/value-boardroom 吉利汽车 --mode examination --role cfo`. It is never required.

## Session Initialization

Keep it light — ask at most the essentials, never a long form:

1. **Company** — name, identifier and market if known, and the **as-of date**.
2. **Mode** — ask once, as a single short question: *"Briefing (I play the executive, you question me) or Examination (you play the executive, I question you)?"* Default to `briefing` the moment the user says "start", "随便", or doesn't care.
3. **Research aim** — only if it isn't already obvious from the conversation.
4. **Evidence mode** — user-supplied only, or public-web research when the agent can access it. Default to user-supplied.

If the company is ambiguous, ask one clarifying question before proceeding.

## Role Modes

| Mode | Model | User | Outcome |
|---|---|---|---|
| `briefing` (default) | Simulates the selected executive and that executive's incentives and constraints | Board director / partner | Learns by interrogating operating detail |
| `examination` | Simulates the board | CEO, CFO, or selected executive | Tests whether the user can explain the business coherently |

Switch modes any time with `/mode`, or just say it in plain language ("reverse roles", "考考我", "我来当 CFO"). No need to restart the session.

## Commands

| Command | Purpose |
|---|---|
| `/value-boardroom [company]` | Initialize or reset a company boardroom session |
| `/mode [briefing\|examination]` | Switch role mode anytime. `briefing` = you interrogate the executive; `examination` = the board interrogates you. Plain language works too. |
| `/role [role...]` | Visit one or more roles. **Single role**: prefer the auto-completing `/role-<role>` shortcuts below. **Several roles** (e.g. `/role ceo cfo supply`): played in sequence, one turn each, with a "continue?" prompt between them — no need to retype each one. |
| `/next` | Step to the next role on the suggested agenda (see below), skipping roles already visited. Keeps a full-company tour moving with a single word. |
| `/research [topic]` | Collect or request verifiable public information and classify it by evidence class |
| `/assumption` | View or revise material modelling assumptions |
| `/evidence` | Show the evidence ledger |
| `/cashflow` | Translate operating results into revenue, margin, working capital, CapEx, FCF, and ROIC |

> Every `<role>` must be one of the fourteen identifiers in `references/operating-roles.md`: `secretary`, `ceo`, `cfo`, `product`, `marketing`, `sales`, `channel`, `supply`, `operations`, `customer-success`, `people`, `legal-risk`, `strategy-ma`, `ir-pr`.

**Single-role shortcuts (auto-completable):** each role is also its own slash command — type `/role-` and pick from the list, no need to type the role name: `/role-secretary`, `/role-ceo`, `/role-cfo`, `/role-product`, `/role-marketing`, `/role-sales`, `/role-channel`, `/role-supply`, `/role-operations`, `/role-customer-success`, `/role-people`, `/role-legal-risk`, `/role-strategy-ma`, `/role-ir-pr`.

## Role Agenda (Suggested Tour)

When chaining roles (`/role ceo cfo ...`) or stepping with `/next`, follow this default order through the company. Reorder or skip to fit the company and the research aim:

1. `secretary` — set the agenda and the evidence standard
2. `ceo` — business model, growth, strategy, culture, capital allocation
3. `cfo` — profit quality, cash, returns
4. `product` — customer problem, pricing, retention
5. `marketing` — acquisition, brand, ad dependency
6. `sales` — order quality, realized price, concentration
7. `channel` — distributor inventory, sell-through
8. `supply` — input costs, supplier power
9. `operations` — utilization, unit cost, capacity
10. `customer-success` — retention, churn, renewals
11. `people` — talent, incentives, succession
12. `legal-risk` — licences, litigation, regulation
13. `strategy-ma` — expansion, M&A, returns
14. `ir-pr` — commitments, narrative vs operations

## Chaining Roles

When the user chains roles (`/role ceo cfo supply`) or says "继续/next": play the next role for **one turn only**, then offer to continue — e.g. *"继续到 [cfo]？回复「继续」，或 `/role <角色>` 自选，或说「停」结束。"* End the chain the moment the user says stop or changes topic.

## Role Turn Contract

Run **one role turn only**, then stop and wait for the user. A turn contains exactly: (1) a verified fact or labelled assumption, (2) that executive's incentive conflict or resource demand, (3) a clear FCF transmission path, and (4) one high-value board question. It must never invent internal metrics. When chaining multiple roles, after the turn offer to advance to the next role (see *Chaining Roles*) instead of waiting silently.

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
