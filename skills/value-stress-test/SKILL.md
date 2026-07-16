---
name: value-stress-test
description: Use when a user explicitly wants to run bear/base/bull scenarios, named shocks, or a cash-flow pre-mortem on a company under study.
disable-model-invocation: true
---

# Value Stress Test

User-entry skill for scenario analysis and pre-mortem. It traces a shock through the operating and financial chain and reports conditional outcomes — never a single pseudo-precise forecast. Invoked explicitly; never auto-triggered.

**Required reading:** `references/evidence-ledger.md` for evidence classes and the board-conclusion template, and `references/industry-adaptation.md` for the relevant operating metrics.

## Commands

| Command | Purpose |
|---|---|
| `/stress-test [shock or scenario]` | Trace a named shock or build bear/base/bull cases through the cash-flow chain |
| `/kill [year]` | Pre-mortem: assume material cash-flow failure by the chosen year and work backwards |

## `/stress-test`

A stress test follows the selected shock through every link in the chain and shows how it transmits to cash:

```
price → volume → mix → cost → receivables → inventory → payables → CapEx → FCF → financing → management response
```

For each step, state the direction and magnitude of the effect, the operating metric that tracks it, and the evidence class behind the number.

Output **bear, base, and bull cases** as conditional stories. Each case must specify:

1. **Trigger** — the event or condition that activates this case.
2. **Transmission path** — how it moves through price, volume, mix, cost, working capital, and CapEx.
3. **FCF direction** — the resulting free-cash-flow outcome.
4. **Falsification criterion** — the operating metric or event that would disprove this case.

Never collapse the three cases into a false-precision point forecast.

### Named shocks

Typical shocks to run on request include a 10% price decline, a 20% volume decline, a 30% raw-material increase, an extended collection period, high fixed-cost underutilization, and growth CapEx required merely to maintain competitiveness. Treat each shock as a conditional story, not a forecast.

## `/kill [year]`

A pre-mortem. Assume the company is materially cash-flow impaired by the chosen year, then work backwards to the most plausible mechanism.

1. **Assume failure** — the company cannot fund itself or destroys cash-generation capacity by the selected year.
2. **Work backwards through causes** — which operating driver (price, volume, mix, cost, working capital, or CapEx) most plausibly broke first, and how did it cascade into the cash-flow chain?
3. **Name an early indicator** — the leading operating metric or event that would have signalled this path while corrective action was still possible.
4. **Ask exactly one decision question** — the choice a board would face to avoid or survive that path. Wait for the answer.

## Discipline Rules

- Label every unsupported figure as an `Assumption` or `Unknown`, never as a fact.
- Distinguish maintenance from growth CapEx — only post-maintenance cash is discretionary.
- When profit is involved, test receivables, inventory, payables, and CapEx before inferring FCF growth.

## Safety

This is a research and learning framework. It does not produce investment recommendations, target prices, or trade instructions.
