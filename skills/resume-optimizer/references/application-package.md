# Application package contract

Read the sections relevant to CV, cover-letter, or full-package generation. Fit-only requests do not require this reference.

## Canonical sources

Choose the closest maintained CV as the structural baseline. Resolve the actual file in the canonical source directory instead of encoding the candidate's name in this skill:

- Data science, ML, or analytics: `../career-documents/cv/versions/*_CV_DataScience.tex`
- Consulting or statistical strategy: `../career-documents/cv/versions/*_CV_Consulting.tex`
- Industry or broadly technical roles: `../career-documents/cv/versions/*_CV_Industry.tex`
- Neuroscience, neurobiology, or imaging: `../career-documents/cv/versions/*_CV_Neuroscience.tex`
- Full academic history: `../career-documents/cv/*_CV.tex`

Require exactly one match for the selected baseline. If a pattern is missing or ambiguous, inspect the canonical directory and ask the user only when the intended source cannot be determined safely.

Additional evidence:

- Publications: `../career-documents/publications/publication_references.tex`
- Abstract evidence: `../career-documents/publications/publication_abstracts.md`
- Cover-letter framework: `../career-documents/cover-letters/*_Cover_Letter_Framework.html`
- Optional source notes: `../career-documents/cover-letters/*_Cover_Letter_Source_Notes.docx`
- User-confirmed evidence: `evidence/`
- Keyword routing bank: `ats-keywords-wordbank.md`

The keyword bank is not evidence. Treat current employment, affiliation, email, citation counts, and h-index as time-sensitive and verify them from current canonical sources or with the user.

## Positioning modes

Choose the least invasive mode that can make the requested case:

- `light`: reorder or lightly revise skills and a small number of bullets;
- `standard`: tailored requested artifacts plus evidence and change records;
- `deep`: substantial but truthful restructuring plus explicit gap analysis;
- `moonshot-bridge`: strongest defensible case for an unconventional or stretch role, with an explicit requirement-to-transfer map;
- `conservative-keyword`: restrained alignment when transfer would otherwise become speculative;
- `do-not-tailor`: no artifact generation when truthfulness would be compromised.

A stretch request is permission to maximize truthful transfer, not to convert transfer into direct-experience claims.

## Evidence ledger

For each material requirement or keyword, use one of these labels:

- direct CV evidence;
- publication or abstract evidence;
- transferable expertise with its underlying evidence;
- application hypothesis phrased as a potential contribution;
- absent from canonical sources and worth confirming;
- unsupported and omitted.

For a stretch application, also record employer need, supporting evidence, defensible positioning language, and the boundary that must not be crossed.

## CV generation

Copy the selected baseline into `cv-optimized/` using a company-role-year filename and edit only the copy. Generate only a CV when that artifact was requested.

- Preserve the baseline Summary verbatim unless the user explicitly requests a rewrite.
- Put role-specific positioning in skills, selected projects, experience bullets, and the cover letter.
- Keep LaTeX structurally simple: conventional headings and bullets, no icons, skill bars, tables, or complex layout additions.
- Include the full publication list only when an academic posting explicitly requests it; otherwise use selected publications only when they materially support the application.
- Use measurable context only when supported by canonical evidence.

## Cover-letter generation

Write the requested letter under `cover-letters-optimized/`.

- Use one primary evidence theme and at least one employer-specific reason.
- Explain why the underlying expertise transfers instead of apologizing for an unconventional background.
- Aim for one page; use the existing validation range as a diagnostic rather than inventing content to hit a word count.
- Describe proposed contributions as future applications, not past experience.

## Claim guardrails

- Preserve "functional connectivity" without a hyphen when used as a noun.
- Describe clinical-trial work as treatment-response phenotyping, clustering, harmonization, prediction, or clinical correlates—not identification of effective treatments or pharmacotherapies.
- Do not claim publication in *The Lancet*.
- Do not emphasize a contract end date unless the application requires it.
- Prefer concrete evidence to adjectives such as "ideal," "cutting-edge," "high-impact," or "expert."

## Supporting reports

Create only the reports needed by the selected intent under `reports/<slug>/`:

- `fit-and-evidence.md`: required for a full package and for any substantial CV tailoring;
- `change-log.md`: required for changed application artifacts;
- `manifest.md`: required when build or semantic validation is performed.

Do not create empty compliance files for fit-only work. A fit-only response may be delivered directly unless the user asks to persist it.

## Build and validation

For a generated CV:

```bash
scripts/build_cv.sh cv-optimized/<file>.tex
scripts/export_cv_text.sh cv-optimized/<file>.pdf
scripts/validate_sandbox.sh
```

Inspect both the rendered PDF and extracted text. Fix overflow, awkward page breaks, missing glyphs, placeholders, stale contact details, or ATS extraction problems before delivery.

For a cover-letter-only request, run the sandbox validator and inspect the letter; do not build an unrelated CV.

Record a semantic review in the manifest when a manifest is required:

- the distinctive transfer advantage is visible early;
- every bridge names real underlying evidence;
- application hypotheses are future-facing;
- gaps are acknowledged once and proportionately;
- the document explains why the candidate could add value.
