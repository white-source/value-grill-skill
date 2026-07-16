# Value Boardroom Skill Library — Design

## Purpose

Build a portable Agent Skills library that helps an investor understand a listed company as an owner and operator. The skills use role-based, Socratic boardroom conversations to connect operational choices to future free cash flow (FCF), rather than producing generic investment reports or trading recommendations.

The design follows the composable convention used by [mattpocock/skills](https://github.com/mattpocock/skills): small user-invoked orchestration skills sit above reusable model-invoked discipline skills. Each skill has its own standard `SKILL.md`, so the library can be installed by `npx skills@latest add white-source/value-grill-skill` into Claude Code, Codex, and other Agent-Skills-compatible harnesses. A Claude Code plugin manifest is an optional distribution enhancement.

## Goals

- Help the user understand how a company creates, consumes, and allocates cash.
- Make the user reason as a board director or controlling owner, not as a short-term trader.
- Support two learning modes: the model reports as operating executives, or the user reports as an executive to a model-led board.
- Separate verified facts, management claims, inferences, modelling assumptions, and unknowns.
- Convert departmental insights into a small, testable set of FCF drivers, scenarios, counterevidence, and follow-up research.
- Permit web research when available, while degrading honestly when it is unavailable.

## Non-goals for Version 1

- Share-price targets, buy/sell/hold recommendations, or promises of investment returns.
- Automated valuation, real-time monitoring, data warehousing, or web applications.
- Access to paid data sources, access-control bypasses, or claimed real-time facts without evidence.
- Hard-coded conclusions about individual companies or countries.

## Skill Architecture

```text
skills/
  value-boardroom/       # User entry: initialize and orchestrate a boardroom session
  value-stress-test/     # User entry: scenario analysis and pre-mortem
  value-board-summary/   # User entry: synthesize the investment-research record
  value-grilling/        # Model discipline: one question at a time; facts vs decisions
  value-roleplay/        # Model discipline: executive roles, reversals, and conflicts
  value-research/        # Model discipline: source hierarchy and evidence classification
  value-cashflow/        # Model discipline: operating levers to FCF/ROIC/CCC
references/
  operating-roles.md     # Roles, accountabilities, evidence, conflicts, questions
  industry-adaptation.md # Industry-specific operational metrics
  evidence-ledger.md     # Research-record and summary templates
.claude-plugin/
  marketplace.json       # Optional native Claude Code distribution metadata
```

### Invocation boundary

`value-boardroom`, `value-stress-test`, and `value-board-summary` are explicit user commands. Their frontmatter disables automatic model invocation so ordinary conversations cannot accidentally enter a boardroom simulation.

The remaining skills are model-invoked reusable practices. An entry skill may use them, but a user entry skill must not invoke another user entry skill. This mirrors the distinction between user-orchestrated and model-invoked skills in the reference library.

## Interaction Contract

### Session initialization

`/value-boardroom [company name or ticker]` creates a company record and first confirms:

1. Company, security identifier, listing market, and as-of date.
2. The research aim: understand the business, test a claim, or construct a 5/10/20-year cash-flow view.
3. Evidence mode: user-supplied information only, or public-web research when the agent can access it.
4. Role mode: `briefing` or `examination`.

Examples:

- `/value-boardroom 泡泡玛特 --mode briefing`
- `/value-boardroom 吉利汽车 --mode examination --role cfo`

### Role modes

| Mode | Model role | User role | Learning outcome |
|---|---|---|---|
| `briefing` (default) | Simulates the selected executive, including the executive's incentives and constraints | Board director / partner | Learns by interrogating operating detail |
| `examination` | Simulates the board | CEO, CFO, or selected executive | Tests whether the user can explain the business coherently |

### Commands

| Command | Purpose |
|---|---|
| `/role <role>` | Move to an executive's report within the active company record |
| `/research [topic]` | Collect or request verifiable public information and classify it |
| `/assumption` | View or revise material modelling assumptions |
| `/evidence` | Show the evidence ledger |
| `/cashflow` | Translate operating results into revenue, margin, working capital, CapEx, FCF, and ROIC |
| `/stress-test` | Run bear/base/bull scenarios or a named shock |
| `/kill` | Conduct a pre-mortem: explain how the company could destroy its cash-generation capacity |
| `/board-summary` | Exit roleplay and prepare a traceable board conclusion |

Each role turn contains only: (1) verified fact or labelled assumption, (2) that executive's incentive or budget request, (3) the FCF transmission path, and (4) one high-value board question. It must wait for the user's answer before continuing.

## Operating Roles

| Role | Required operating subject | Cash-flow mapping | Constructive conflict |
|---|---|---|---|
| Board secretary / investment coach | Agenda, question tree, evidence, assumptions | Ensures conclusions remain traceable | Requires verifiable answers from every role |
| CEO | Growth sources, strategic boundaries, resource choices | Revenue growth and reinvestment rate | Growth versus return discipline |
| CFO | Profit quality, leverage, working capital, allocation | OCF, CapEx, FCF, ROIC, CCC | Rejects unproven budgets |
| Product / R&D | Customer problem, roadmap, substitution, R&D success | Pricing, retention, R&D, maintenance CapEx | Requests patient investment |
| Marketing / brand | Acquisition, loyalty, brand, advertising dependency | CAC, LTV, selling expense, recurring revenue | Requests brand spend versus CFO ROI demand |
| Sales | Order quality, pricing, concentration, discounts, incentives | Revenue, price, receivables, collections | Requests discounts and looser credit terms |
| Channel | Distributor inventory, merchandising, rebates, channel economics | Contract liabilities, receivables, inventory, selling expense | Seeks channel margin while company seeks price control |
| Supply chain / procurement | Input costs, concentration, purchasing power, delivery | Gross margin, inventory, payables | Safety stock versus cash release |
| Operations / manufacturing | Utilization, yield, unit cost, delivery, service | Fixed cost, depreciation, CapEx, unit economics | Capacity expansion versus uncertain demand |
| Customer success / after-sales | Retention, churn, complaints, renewals, service burden | Repeat rate, deferred revenue, service cost | Exposes product and sales overpromises |
| People / organization | Critical talent, incentives, bottlenecks, succession | Labour cost, execution capacity, long-term expenses | Retention versus margin protection |
| Legal / compliance / risk | Licences, litigation, regulation, quality, data | Contingent liabilities, interruption, discount rate | Vetoes risky near-term growth |
| Strategy / M&A | New business, international expansion, acquisition logic | Reinvestment returns, goodwill, cash consumption | Expansion ambition versus allocation discipline |
| IR / public relations | External commitments, transparency, reputation, crisis | Funding capacity, brand resilience, valuation risk | Challenges gaps between narrative and operations |

Roleplay must turn abstract language into observable variables such as customers, products, price, quantity, unit cost, payment terms, and capital expenditure. A role speaks only within its remit, exposes an incentive conflict, and asks one question.

## Evidence and Research Discipline

### Evidence classes

| Class | Definition |
|---|---|
| Fact | A source-backed claim, including publication date and source |
| Management statement | A company claim not independently verified |
| Inference | An operating conclusion derived from cited facts |
| Assumption | A model input that could be falsified |
| Unknown | Material information without reliable support |

### Research rules

- Prefer primary sources: annual/interim reports, earnings releases, filings, company websites, earnings-call transcripts, regulator records, and underlying industry data.
- Use secondary reporting as a lead only; do not make it the sole support for a material conclusion.
- Timestamp sensitive facts and never state that inaccessible pages were searched or verified.
- If research tools are unavailable, provide the missing evidence, primary sources to locate, suggested queries, and the next question; do not manufacture an answer.
- Research informs questions and tests assumptions. It does not replace the user's board-level judgement.

## Company Record

The session maintains the following portable record, which can be returned in a summary and pasted into a later session:

1. One-sentence business model: customer, solved problem, and payment mechanism.
2. Value-chain map: suppliers, company, channels, and end customers.
3. Unit economics: price, volume, variable cost, fixed cost, and turnover.
4. Cash-flow driver tree: revenue, gross margin, working capital, tax, CapEx, FCF.
5. Assumptions: value/range, evidence, confidence, and falsification condition.
6. Evidence ledger: all five evidence classes kept separate.
7. Departmental conflicts and unresolved board choices.
8. Leading, concurrent, and lagging operating indicators plus their review cadence.

## Stress Testing

The model runs bear, base, and bull cases as conditional stories—not artificial precision. Each case specifies the trigger, path through price/volume/cost/working capital/CapEx, resulting FCF direction, and evidence that would disprove it.

Typical named shocks include a 10% price decline, 20% volume decline, 30% raw-material increase, extended collection period, high fixed-cost underutilization, and capital expenditure required merely to maintain competitiveness. `/kill` asks what would make the company cash-flow impaired in the chosen timeframe, then traces the mechanism backwards.

## Board Summary Contract

`/board-summary` always contains:

1. How the business turns customer payments into free cash flow.
2. What is likely to be stable versus changing over 5, 10, and 20 years.
3. Bear, base, and bull cases with stated conditions.
4. No more than three key FCF drivers and their transmission mechanisms.
5. The most dangerous counterevidence that should trigger reassessment.
6. Unknowns ranked by materiality.
7. The next board agenda: required role, evidence to obtain, and operating metric to observe.

The summary must not include investment recommendations, a target price, or a claimed probability of return.

## Acceptance Scenarios

1. With only a company name, the model researches where possible or labels missing facts; it never invents executive-report numbers.
2. When a user claims a strong brand moat, the model asks for a concrete mechanism such as pricing, repurchase, channel power, or the effect of stopping advertising.
3. In `examination` mode, a user acting as CFO receives one question that tests working-capital and CapEx reasoning.
4. When sales asks for longer terms to win an order, CFO traces the impact on the cash conversion cycle and FCF rather than making a generic objection.
5. When profit rises, the workflow tests receivables, inventory, payables, and CapEx before inferring FCF growth.
6. For a 10-year view, the result presents conditioned bear/base/bull cases and falsification criteria—not a single pseudo-precise forecast.
7. Without research capability, the agent produces sources to seek, queries, and a question tree rather than pretending it accessed current information.

## Version 1 Definition of Done

A user can install the library into a standards-compatible agent, start a company boardroom in either role mode, visit multiple operating roles, and receive a traceable evidence ledger, three-or-fewer FCF drivers, scenario counterevidence, and a next-research agenda.