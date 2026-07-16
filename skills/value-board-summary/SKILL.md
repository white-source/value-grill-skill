---
name: value-board-summary
description: Use when a user explicitly wants to exit roleplay and synthesize the company research record into a traceable board conclusion.
disable-model-invocation: true
---

# Value Board Summary

User-entry skill that exits roleplay and synthesizes the session's company record into a traceable board conclusion. Invoked explicitly; never auto-triggered.

**Required reading:** `references/evidence-ledger.md` — its evidence classes (`Fact`, `Management statement`, `Inference`, `Assumption`, `Unknown`) and board-conclusion template define the structure below.

## Command

| Command | Purpose |
|---|---|
| `/board-summary` | Exit roleplay and prepare a traceable board conclusion from the session record |

## Six Required Sections

Every `/board-summary` output contains exactly these six sections, in order:

1. **FCF mechanism.** How the business turns customer payments into free cash flow — traced through price, volume, mix, cost, working capital, CapEx, and capital allocation.
2. **Stable and changing conditions over 5, 10, and 20 years.** Which operating assumptions are likely to hold versus shift across each horizon.
3. **Conditional bear, base, and bull cases.** Each case stated with its trigger, transmission path, FCF direction, and falsification criterion. Never a single pseudo-precise forecast.
4. **Up to three FCF drivers.** The key operating levers and their transmission mechanisms to cash.
5. **Counterevidence and unknowns.** The most dangerous evidence that should trigger reassessment, and unknowns ranked by materiality.
6. **Next board agenda.** The required role to consult, the evidence to obtain, and the operating metric to observe.

## Evidence Discipline

- Every claim in the summary must carry its evidence class from `references/evidence-ledger.md`.
- Never present an inference or assumption as a fact; never invent operating metrics.
- Time-sensitive facts must include their as-of date.

## Safety

This is a research and learning framework, not an investment recommendation. The summary must not include a buy/sell/hold recommendation, a target price, or a claimed probability of return.
