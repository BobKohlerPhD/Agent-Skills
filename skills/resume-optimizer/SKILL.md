---
name: resume-optimizer
description: Assess fit or tailor a candidate's CV and cover letter to a supplied job posting using canonical career evidence and sandbox-only outputs. Use for targeted or stretch-role applications. Do not use for LinkedIn profiles, work without a supplied job posting, general career advice, interview preparation, or changes to canonical career documents.
---

# Resume Optimizer

Create truthful, role-specific analysis or application artifacts without modifying canonical career materials.

## Boundaries

- Work only inside `career-ai-sandbox/` unless the user explicitly changes the destination.
- Treat `../career-documents/` as read-only canonical evidence.
- Do not invent or inflate tools, titles, customers, deployments, credentials, metrics, publications, responsibilities, or clinical impact.
- Distinguish direct experience, supported transferable expertise, proposed application, evidence worth confirming, and unsupported requirements.
- Preserve dates, institutions, degrees, grant names, publication metadata, and quantitative claims unless the user supplies a correction.
- Paraphrase job-posting language rather than copying long phrases.

## Determine intent before writing

Choose the narrowest mode that satisfies the request:

- **fit-only**: assess fit and gaps; do not create or revise a CV or cover letter;
- **CV-only**: tailor and validate only the CV plus its supporting evidence record;
- **cover-letter-only**: draft only the letter plus the evidence needed to support it;
- **application-package**: create the requested CV, letter, reports, and validation artifacts;
- **do-not-tailor**: explain why a truthful application would materially misrepresent fit.

Do not turn a request to assess fit into authorization to generate an application package. Do not generate unrequested interview, networking, or company-preparation materials.

## Intake

Accept a pasted posting or a `.txt`/`.md` file under `job-descriptions/`. When the user says "latest" without a path, select the newest posting in `job-descriptions/inbox/`; if multiple plausible files have the same timestamp, ask which one.

Verify the posting, canonical evidence directories, and requested outputs before making changes. Normalize a new posting with `scripts/prepare_job.sh` only when a persistent application workspace is needed.

## Evidence and fit

1. Extract title, seniority, required and preferred qualifications, responsibilities, tools, domain terms, collaboration signals, location, and application constraints.
2. Search the closest current CV and the other canonical CVs, publication sources, and confirmed evidence. Absence from one CV is not proof that the experience is absent.
3. Assess separate fit dimensions: technical capability, analytical or scientific leadership, direct domain experience, conceptual or methodological transfer, seniority and scope, production or enterprise experience, and learning burden.
4. State an overall recommendation without averaging away a strong, evidence-backed transfer case.
5. Build an evidence ledger for material requirements. Label the provenance and the boundary of every proposed claim.
6. Ask only questions whose answers could materially change positioning and cannot be resolved from canonical sources. If work can proceed safely, record the question and continue.

## Artifact-producing modes

For CV, cover-letter, or package generation, read [references/application-package.md](references/application-package.md) and follow only the sections relevant to the requested artifacts.

Keep superseded outputs recoverable; do not silently overwrite an existing application. Preserve the selected baseline's Summary section verbatim unless the user explicitly requests a summary rewrite.

## Delivery

Report the selected mode, fit recommendation, evidence sources, material positioning choices, unsupported requirements, generated paths, and completed validations. For fit-only work, report that no application documents were changed.
