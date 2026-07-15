---
type: workflow
status: active
trigger: /interview
last_verified: "2026-07-14"
tags: [workflow, interview, context]
---

# Workflow - /interview

Conversational personalization workflow. Capture how the user works, what matters right now, and what `/today` should optimize for.

## Step 1 - Load current state
Read:
- `Home/Pessoal/Agenda/business-profile.md`
- `Home/Pessoal/Agenda/audience-profile.md`
- `Home/Pessoal/Agenda/writing-style.md`
- `Machine/Personalization/operator-profile.md`
- `Machine/Personalization/today-prompt.md` (if exists)
- the last 2 daily notes in `Home/Pessoal/Diario/` if they exist
- project notes in `Home/Projetos/` if they exist

Tell the user you are going to personalize the vault and regenerate the compiled prompts used by `/today`.

## Step 2 - Ask about current reality
Ask one question at a time:
1. "What are you actually working on right now?"
2. "What matters most over the next 30 days?"
3. "What projects or responsibilities should this vault keep in view?"

## Step 3 - Ask about planning style
Ask one question at a time:
1. "How do you want `/today` to plan your days — focused, balanced, or aggressive?"
2. "How many true priorities do you want in a normal day?"
3. "Do you want suggested time blocks, or just a priority list?"

## Step 4 - Update vault notes
Create or update project notes in `Home/Projetos/` for any active project surfaced.
Update these files so the user can read them directly:
- `Home/Pessoal/Agenda/business-profile.md`
- `Home/Pessoal/Agenda/audience-profile.md`
- `Home/Pessoal/Agenda/writing-style.md` if relevant
- `Machine/Personalization/operator-profile.md`

## Step 5 - Regenerate compiled prompts
Rewrite this file based on the interview answers:
- `Machine/Personalization/today-prompt.md`

The point is to compile the user's preferences into prompt-ready instructions so `/today` does not need to read a pile of separate preference files each run.

## Step 6 - Log it
Append to today's daily note in `Home/Pessoal/Diario/`:
`- [HH:MM] /interview - personalization updated.`

## Step 7 - Close
Summarize what changed and recommend `/today` as the next step.
