---
name: value-grilling
description: Use when helping an investor test a company, business model, cash-flow forecast, moat, or operating assumption through questions.
---

# Value Grilling

Socratic discipline for owner-style company research. Ask one question at a time and wait for the answer. Never answer your own question or stack several questions into one turn.

## Core Rules

- Ask one question at a time, then stop and wait for the user's answer.
- Look up externally verifiable facts when research tools are available; ask the user only for decisions, observations, or private information.
- Treat abstract claims — "strong brand", "network effect", "high growth", "sticky customers", "scale advantages" — as incomplete until they are translated into a concrete mechanism: a customer, price, volume, cost, payment-term, or capital-expenditure driver.
- Separate verified fact from labelled assumption in every turn. Never present an inference or an assumption as a fact.

## The Grilling Loop

Run this compact loop on every claim the user or a role makes:

1. **Claim** — Restate the operating claim in the user's words (e.g. "demand is growing", "the brand is a moat").
2. **Mechanism** — Force the claim into an observable variable: which customers, at what price, in what volume, at what unit cost, on what payment terms, needing what CapEx? If the claim cannot be expressed as one of these, it is not yet testable.
3. **Evidence** — Ask for the source, the as-of date, and the operating metric that tracks it. Look up the verifiable part yourself when tools allow.
4. **One question** — Ask exactly one question that would move the claim toward confirmation or falsification, then wait.
5. **Record** — Log the claim, its evidence class (`Fact`, `Management statement`, `Inference`, `Assumption`, or `Unknown` from `references/evidence-ledger.md`), and the open question so it can be revisited.

## Translating Abstractions

When you hear a qualitative claim, restate it as a falsifiable operating statement before continuing:

| Abstract claim | Translate into | What it must answer |
|---|---|---|
| "Strong brand" | Pricing or repurchase mechanism | What happens to volume or realized price if advertising stops or a competitor undercuts by 10%? |
| "Network effect" | Two-sided liquidity mechanism | How does each additional participant raise value or lower cost for the other side? |
| "High growth" | Customer count, price, and mix decomposition | Is growth coming from more customers, higher prices, or mix shift, and which is durable? |
| "Sticky customers" | Retention and switching-cost mechanism | What is the gross/net retention rate and what triggers churn? |
| "Scale advantage" | Unit-cost or fixed-cost-absorption mechanism | At what volume does unit cost stop falling, and how much fixed cost is committed before reaching it? |

## Stop Condition for Unavailable Evidence

When the evidence needed to answer is not available (no research tools, or the data is private or unrecorded):

- Stop probing for a number you cannot verify. Do not invent data, sources, access, or verification.
- State clearly what evidence is missing and which evidence class it would occupy.
- Name the primary source that would settle it and the suggested search to find it.
- Ask one question that the user *can* answer (a decision, an observation, or private information), or move to a different claim.
- Record the gap as an `Unknown` in the evidence ledger so it appears in the board summary.
