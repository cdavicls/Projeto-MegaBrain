---
type: workflow
status: active
trigger: /today
last_verified: "2026-07-14"
tags: [workflow, planning, daily]
---

# Workflow - /today

Morning planning workflow. Build today's plan using live vault state plus the compiled personalization file.

## Step 1 - Get today's date
Use `YYYY-MM-DD`.

## Step 2 - Read compiled today prompt
Read `Machine/Personalization/today-prompt.md` if it exists.
This is the only personalization file `/today` should need by default.

## Step 3 - Check or create today's note
Look for `Home/Pessoal/Diario/YYYY-MM-DD.md`.
- If it exists, read it.
- If not, create it with a basic structure:
  - `# YYYY-MM-DD`
  - `## Prioridades`
  - `## Atividades`
  - `## Notas`

## Step 4 - Read recent execution state
Read the last 3 daily notes before today from `Home/Pessoal/Diario/` and pull forward:
- unchecked tasks
- blockers worth carrying

## Step 5 - Read open work
Read:
- task files in `Home/Pessoal/Atividades/`
- project notes in `Home/Projetos/`

## Step 6 - Build the plan
Use the compiled today prompt (if exists) plus the real vault state to determine:
- Top priorities
- Today's tasks
- Quick wins if any exist
- Watch-outs or drift warnings

## Step 7 - Present the plan
Use this format:

```
## Today's Plan - [Day, Date]

### Top Priorities
1. ...
2. ...
3. ...

### Today's Tasks
- [ ] ...

### Quick Wins
- [ ] ...

### Watch Out
- ...
```

## Step 8 - Write to today's note
After presenting the plan, ask whether to write it into today's note.
If yes, update `Home/Pessoal/Diario/YYYY-MM-DD.md` with the plan sections.
