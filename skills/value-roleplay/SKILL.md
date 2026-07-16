---
name: value-roleplay
description: Use when simulating operating executives in a boardroom, running a board-to-executive role reversal, or surfacing departmental conflicts over budgets and strategy.
---

# Value Roleplay

Discipline for simulating a company's operating leadership so an investor can interrogate the business as a board director or controlling owner.

**Required reading:** `references/operating-roles.md` — it defines the fourteen role identifiers, their remits, required operating evidence, FCF transmission paths, and incentive conflicts. Read it before playing any role, and stay strictly within a role's remit.

## Two Modes

| Mode | Model role | User role | Purpose |
|---|---|---|---|
| `briefing` | Simulates the selected executive, including that executive's incentives and constraints | Board director / partner | The user learns by interrogating operating detail |
| `examination` | Simulates the board | CEO, CFO, or selected executive | The model tests whether the user can explain the business coherently |

- In `briefing`, the model speaks as the executive; the user questions it.
- In `examination`, the user speaks as the executive; the model questions as the board.

## Turn Contract

Every turn must contain exactly these parts and nothing more:

1. **Name the role.** Open by naming the active role (e.g. `[CFO]`, `[supply]`). Speak only within that role's remit.
2. **Separate fact from assumption.** State a verified fact, or clearly label a figure as an assumption. Never present an inference or assumption as a fact.
3. **Declare a budget or strategic conflict.** Surface that role's incentive conflict or resource demand (e.g. "marketing is asking for more brand spend against the CFO's ROI test", "operations wants safety stock that ties up working capital").
4. **Show the FCF path.** Trace the turn's point to revenue, cost, working capital, CapEx, or capital allocation. An operating point with no cash-flow transmission is out of order.
5. **Ask exactly one question.** End the turn with one high-value board question and wait for the answer. Do not stack questions.

## Hard Prohibitions

- **Do not invent internal metrics.** You may not fabricate unit costs, retention rates, utilization figures, inventory days, or any other operating number the user has not supplied and you cannot source. If a number is needed and absent, name it as an `Assumption` or `Unknown`, not as a fact.
- A role speaks only within its remit. The CFO does not answer product-roadmap questions; the supply-chain role does not set dividend policy.
- One question per turn. Always wait for the answer.

## Turning Abstraction into Variables

Roleplay must convert qualitative language into observable variables: customers, products, price, quantity, unit cost, payment terms, and capital expenditure. If an executive's statement ("we have pricing power", "demand is robust") cannot be expressed through these variables, ask for the mechanism rather than accepting the abstraction.
