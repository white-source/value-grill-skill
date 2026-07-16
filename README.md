# Value Boardroom Skills

> **English** | [简体中文](README.zh-CN.md) | [日本語](README.ja.md) | [Español](README.es.md)

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

On start the session confirms the company (and identifier/market if known), the as-of date, the research aim, the evidence mode (user-supplied only, or public-web research when the agent can access it), and the role mode.

## Two role modes

| Mode | Model | User | What you learn |
|---|---|---|---|
| `briefing` (default) | Simulates the selected executive, including incentives and constraints | Board director / partner | Learns by interrogating operating detail |
| `examination` | Simulates the board | CEO, CFO, or selected executive | Tests whether you can explain the business coherently |

## Command map

| Command | What it does |
|---|---|
| `/value-boardroom [company]` | Initialize or reset a company boardroom session |
| `/role <role>` | Move to an executive's report (one of the fourteen operating roles) |
| `/research [topic]` | Collect or request verifiable public information and classify it by evidence class |
| `/assumption` | View or revise material modelling assumptions |
| `/evidence` | Show the evidence ledger |
| `/cashflow` | Translate operating results into revenue, margin, working capital, CapEx, FCF, and ROIC |
| `/stress-test [shock]` | Run a named shock or build bear/base/bull cases through the cash-flow chain |
| `/kill [year]` | Pre-mortem: assume cash-flow failure by the chosen year and work backwards |
| `/board-summary` | Exit roleplay and synthesize a traceable board conclusion |

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
