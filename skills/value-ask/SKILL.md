---
name: value-ask
description: Use when a user describes a goal or question and wants to be pointed to the right value-boardroom command with a short explanation.
disable-model-invocation: true
---

# Value Ask

User-entry dispatcher. The user states a goal or question in natural language (any language); `value-ask` maps it to the most fitting `value-*` command and explains what it does. It recommends — it does not run the command itself.

## Command

| Command | Purpose |
|---|---|
| `/value-ask [your question or goal]` | Recommend the right value-boardroom command and explain it |

Examples:
- `/value-ask 我想看这家公司的现金流是怎么来的`
- `/value-ask I'm worried a price cut would hurt the business`
- `/value-ask where do I even start?`

## Behavior

1. **Read the intent.** Restate the user's goal in one line so they can confirm you understood.
2. **Match the catalog.** Find the best command from the decision table below.
3. **Recommend.** Output the top command first, then at most two alternatives. For each: the command, a one-line explanation, and when to use it.
4. **Offer to proceed.** Ask whether to run the top recommendation. The user runs it; `value-ask` must not invoke another entry skill on its own.
5. **Fallback.** If nothing matches, recommend `/value-boardroom [company]` as the default starting point.

Keep the answer short — a recommendation, not a lecture.

## Decision Table

Map the user's intent to a command:

| If the user wants to… | Recommend |
|---|---|
| Start studying a company, set up the boardroom, or switch company | `/value-boardroom [company]` |
| Switch role mode — reverse roles, "examine me", or play an executive yourself | `/value-mode [briefing\|examination]` |
| Hear from a specific department or executive (CFO, supply, sales…) | `/value-role-<role>` shortcut, e.g. `/value-role-cfo` (auto-completes — type `/value-role-` and pick) |
| Visit several roles, or tour the whole company without retyping | `/value-role ceo cfo ...` to chain, or `/value-next` to step through |
| Gather facts, filings, earnings, or verify a source | `/value-research [topic]` |
| Check or revise modelling inputs / assumptions | `/value-assumption` |
| See what evidence has been collected | `/value-evidence` |
| Connect operations to FCF, margin, working capital, CapEx, ROIC | `/value-cashflow` |
| Test a shock, or build bear/base/bull scenarios | `/value-stress-test [shock]` |
| Pre-mortem: how the business could break or run out of cash | `/value-kill [year]` |
| Wrap the session into a traceable board conclusion | `/value-board-summary` |

## Rules

- Recommend, never execute. The user runs the chosen command.
- Rank at most three commands; always include a one-line explanation for each.
- This is a research and learning framework — do not steer toward investment recommendations, target prices, or trade instructions.
