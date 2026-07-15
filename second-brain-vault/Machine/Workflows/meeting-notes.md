---
type: workflow
status: active
trigger: /meeting-notes
last_verified: "2026-07-14"
tags: [workflow, meeting]
---

# Workflow - /meeting-notes

Turn a meeting transcript or rough notes into a clean meeting record, action items, and person updates.

## Step 1 - Read context
Read `Machine/Personalization/meeting-notes-prompt.md` if it exists.

## Step 2 - Parse the meeting
Extract:
- date
- meeting name/topic
- attendees
- decisions
- action items
- open questions

## Step 3 - Update people notes
Create or update person notes in `Home/Pessoal/Pessoas/`.
One file per person, named after them.

## Step 4 - Create tasks
Create task entries in `Home/Pessoal/Atividades/` for action items.

## Step 5 - Create the meeting note
Save to `Home/Pessoal/Conteudos e Recursos/YYYY-MM-DD - [meeting name].md`.

## Step 6 - Log it
Append a summary to today's daily note in `Home/Pessoal/Diario/` with the number of tasks and people updated.
