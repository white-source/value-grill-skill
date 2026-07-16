---
name: value-cashflow
description: Use when translating operating results into unit economics, free cash flow, ROIC, CapEx, working capital, or long-range cash-flow scenarios.
---

# Value Cashflow

Discipline for connecting operational choices to future free cash flow. The goal is to understand how a business creates, consumes, and allocates cash as an owner, not to produce a single pseudo-precise forecast.

## The Cash-Flow Bridge

Always build the full chain from customer value to capital allocation. Do not skip links — a conclusion that jumps from revenue to FCF hides the working-capital and CapEx that determine real cash generation.

```
customer value
   → price / volume / mix
      → variable cost and fixed cost
         → operating profit
            → receivables / inventory / payables (working capital)
               → operating cash flow
                  → maintenance CapEx and growth CapEx
                     → free cash flow
                        → capital allocation and ROIC
```

For every link, state the operating driver, the direction it pushes cash, and the evidence class behind the number.

## Required References

- `references/industry-adaptation.md` — select the closest business archetype (consumer/retail, manufacturing/automotive, SaaS/recurring, or platforms/marketplaces) and apply the leading operational metrics that map to FCF. Ask before applying a metric that does not fit the company's operating model.
- `references/evidence-ledger.md` — record each figure under its evidence class and use the cash-flow driver tree and assumption register templates.

## Discipline Rules

- **Select an archetype first.** Name the business archetype before applying industry metrics. If none fits cleanly, say so and ask.
- **Label unsupported inputs as assumptions.** Any figure the user has not supplied and you cannot source is an `Assumption`, with a stated range and a falsification condition — never a fact.
- **Test profit before inferring FCF growth.** When profit rises, check receivables, inventory, payables, and CapEx before concluding that free cash flow grew. Profit growth funded by accruals or channel inventory is not cash growth.
- **Separate maintenance from growth CapEx.** Only cash left after maintaining competitiveness is discretionary free cash flow.
- **Track the cash conversion cycle.** Days sales outstanding + days inventory outstanding − days payable outstanding. A widening gap converts profit into trapped working capital.
- **Scenario, not point forecast.** Present bear, base, and bull as conditional stories with triggers, transmission paths, and falsification criteria — never a single false-precision number.

## Driver Discipline

End with no more than three FCF drivers, each expressed as a mechanism (the operating variable and how it transmits to cash), backed by its evidence class, and paired with the metric that would disprove it.
