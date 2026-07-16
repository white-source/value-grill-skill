---
name: value-research
description: Use when gathering current company facts, filings, earnings data, industry figures, or verifying a source for owner-style company research.
---

# Value Research

Discipline for gathering verifiable public information and classifying it honestly. Research informs questions and tests assumptions; it never replaces the user's board-level judgement.

## Source Hierarchy

Prefer primary sources, in this order. Use secondary reporting only as a lead, never as the sole support for a material conclusion.

1. **Regulator filings and annual/interim reports** — annual reports, 10-K/10-Q or equivalent, prospectuses, regulatory disclosures.
2. **Company releases and calls** — earnings releases, earnings-call transcripts, investor presentations, official guidance.
3. **Company website** — product pages, pricing, store or dealer locators, corporate governance disclosures.
4. **Primary industry data** — trade associations, government statistics, regulatory registries, audited industry benchmarks.
5. **Secondary reporting** — news, analyst notes, databases. Useful to locate a primary source; insufficient standing alone.

Every claim you record must carry its **source title or URL** and an **as-of date**. Timestamp any time-sensitive fact. Never state that a page you could not access was searched or verified.

## Evidence Classification

Label each piece of evidence using the five classes from `references/evidence-ledger.md`:

| Class | Use when |
|---|---|
| `Fact` | Source-backed, with publication date and source location |
| `Management statement` | A company claim not independently verified |
| `Inference` | An operating conclusion you derived from cited facts |
| `Assumption` | A model input that could be falsified |
| `Unknown` | Material information with no reliable support |

Never present an inference or assumption as a fact.

## No-Web Fallback

When research tools are unavailable or a source cannot be reached, do not fabricate an answer. Instead output these four sections for the topic in question:

- **Evidence needed** — what specific fact is missing and which evidence class it would occupy.
- **Primary sources to consult** — the regulator filings, reports, transcripts, or registries that would settle it.
- **Suggested searches** — concrete queries (filing IDs, company + report type + period, industry-statistic terms).
- **Next board question** — the question to bring back to the boardroom that the missing evidence would answer or refine.

## Hard Rule

Do not invent data, sources, access, or verification. If you did not retrieve a figure from a source, label it as an assumption or unknown and say so plainly.
