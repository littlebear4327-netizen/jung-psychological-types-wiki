# AGENTS.md - Academic Paper LLM Wiki Engine

This repository is an **LLM Wiki** adhering to Andrej Karpathy's LLM Wiki paradigm, specifically customized for **large-scale academic research documents and papers (e.g. 600+ page dissertations, proceedings, or paper compendiums)** with an emphasis on **high-throughput, automated batch ingestion (泛讀/快速結構化)**.

The Wiki is a persistent, compounding, interlinked knowledge base. You (the LLM Agent) are the compiler, maintainer, and curator. The user is the director.

---

## 1. Core Operating Principles

1. **Obsidian-Native Interlinking**: Use Obsidian-style Wikilinks `[[Target Page]]` aggressively. Every method, benchmark, and core concept mentioned in a paper must link to its respective entity page.
2. **High Signal-to-Noise Ratio (泛讀原則)**: When batch ingesting, avoid unnecessary prose or filler text. Focus on:
   - **What problem is tackled?** (Why)
   - **What is the core novel mechanism?** (How)
   - **What are the empirical takeaways and numbers?** (Results)
   - **What are the edge cases / limitations?** (Critique)
3. **Strict Page Traceability**: Because the primary source is 600+ pages, every major claim, formula, or finding **MUST** include an exact page citation, e.g., `(p. 42)` or `(pp. 115-117)`.
4. **Zero Hallucination on Empirical Claims**: Do not guess baselines, benchmark scores, or mathematical formulations. If a detail is missing or ambiguous, explicitly mark it as `[Not specified in source (p. XX)]`.
5. **Compounding Maintenance**: Ingesting a paper or chapter is never a single-file write. It must trigger updates across:
   - The paper/chapter card (`papers/` or `chapters/`)
   - Relevant methodology pages (`methods/`)
   - Relevant benchmark pages (`benchmarks/`)
   - High-level concept pages (`concepts/`)
   - The central index (`index.md`)
   - The audit log (`log.md`)

---

## 2. Directory Structure

```text
.
├── AGENTS.md               # This operating specification
├── index.md                # Categorized catalog of all wiki pages
├── log.md                  # Chronological audit log of all operations
├── raw/                    # Immutable source documents (600+ page PDF, text, figures)
├── papers/                 # (or chapters/) Structured cards for each paper or chapter
├── methods/                # Core algorithms, architectures, training techniques
├── benchmarks/             # Datasets, evaluation suites, standardized metrics
├── concepts/               # Theoretical paradigms, problem definitions, domain concepts
└── syntheses/              # Cross-paper comparative tables, literature reviews, surveys
```

---

## 3. Workflows & Command Protocols

When the user asks you to perform an operation, adhere strictly to these protocols:

### Workflow A: `/map-toc` (目錄探勘與建檔清單)
*Used when introducing a new large document (e.g., 600+ pages).*
1. Inspect the source PDF/file in `raw/` to locate the Table of Contents, Executive Summary, or Paper Collection Index.
2. Create or update `_manifest.md` containing:
   - Unit Index (Chapter / Paper Number)
   - Title & Authors (if applicable)
   - Page Range (e.g., `p. 1-28`, `p. 29-54`)
   - Processing Status: `[ ] Pending`, `[-] In Progress`, `[x] Completed`
3. Append an entry to `log.md`.

### Workflow B: `/batch-ingest [range or count]` (自動化批次泛讀)
*Used to process a sequence of papers/chapters autonomously.*
For each unit in the manifest:
1. **Read & Extract**: Read the text within the assigned page range.
2. **Create Unit Card**: Create `papers/<ID>-<ShortTitle>.md` using the **Paper Page Template**.
3. **Update Entity Pages**:
   - If a new method is introduced, create `methods/<MethodName>.md` (or update it if it already exists by adding a new section linking back to this paper).
   - If a standard benchmark is evaluated, update `benchmarks/<BenchmarkName>.md` with the new scores and comparison.
   - If an overarching topic is discussed, cross-link it in `concepts/<ConceptName>.md`.
4. **Update `index.md`**: Insert the new page under the appropriate category with a 1-line TL;DR.
5. **Update Manifest & Log**: Mark the unit as `[x] Completed` in `_manifest.md` and log to `log.md`.
6. Proceed to the next unit without stopping unless a critical parsing blocker occurs.

### Workflow C: `/query [question]` (知識庫檢索與問答)
1. First, consult `index.md` and relevant entity pages to gather facts.
2. Synthesize an answer directly citing the wiki pages using wikilinks and original page citations (e.g. `[[FlashAttention-2]] (p. 204)`).
3. **Compounding check**: If the synthesized response represents a novel cross-paper comparison or non-trivial survey analysis, save it as a new file under `syntheses/` and register it in `index.md`.

### Workflow D: `/lint` (知識庫健檢與一致性維護)
Perform a systematic sweep to identify:
- **Orphan Pages**: Pages with no inbound wikilinks from `index.md` or other pages.
- **Dangling Links**: `[[Links]]` that point to non-existent markdown files.
- **Empirical Contradictions**: Cases where Paper A claims superiority over Method X on Benchmark Y, while Paper B reports conflicting observations under similar settings.
- Output a structured Markdown report summarizing needed fixes.

---

## 4. Page Templates & Schemas

### 4.1 Paper / Chapter Card Template (`papers/<ID>-<Slug>.md`)

```markdown
---
id: "CH01" # or "Paper-2024-Author"
title: "Full Chapter / Paper Title"
page_range: "pp. 1-24"
tags: [paper, topic/alignment, method/dpo]
status: completed
---

# Full Chapter / Paper Title

- **Source File**: `raw/document.pdf` (pp. 1-24)
- **TL;DR**: 1-2 sentence core thesis of this chapter/paper.

## 1. Problem Statement & Motivation
- **Core Challenge**: What exact bottleneck or open question does this work address? `(p. 2)`
- **Key Flaw of Prior Work**: Why do existing approaches fail or perform sub-optimally? `(p. 3)`

## 2. Core Method & Mechanisms
- **Proposed Approach**: `[[Method-Name]]`
- **Key Insight**: The architectural or mathematical trick that makes it work. `(p. 7)`
- **Mathematical / Algorithmic Formulation**:
  $$ L_{DPO}(\pi_\theta; \pi_{ref}) = -\mathbb{E}_{(x, y_w, y_l)} \left[ \log \sigma \left( \beta \log \frac{\pi_\theta(y_w|x)}{\pi_{ref}(y_w|x)} - \beta \log \frac{\pi_\theta(y_l|x)}{\pi_{ref}(y_l|x)} \right) \right] $$ `(p. 9)`

## 3. Experimental Setup & Benchmarks
- **Evaluated On**: `[[Benchmark-A]]`, `[[Benchmark-B]]` `(p. 14)`
- **Key Results**:
  | Model / Setting | Metric A (GSM8K) | Metric B (HumanEval) | Page |
  | :--- | :--- | :--- | :--- |
  | Baseline | 65.4 | 48.2 | p. 16 |
  | Proposed | **74.1** | **55.8** | p. 16 |

## 4. Critical Takeaways & Limitations
- **Key Assumptions**: What prerequisites are required for this to hold? `(p. 20)`
- **Observed Failure Modes / Limitations**: Where does it break down? `(p. 21)`

## 5. Connections & Entity Links
- **Builds on**: `[[Prior-Method-A]]`, `[[Prior-Paper-B]]`
- **Competes with / Contrasts with**: `[[Alternative-Method-C]]`
- **Concepts Involved**: `[[Concept-X]]`, `[[Concept-Y]]`
```

### 4.2 Method Entity Template (`methods/<MethodName>.md`)

```markdown
---
type: method
aliases: [Alternative Acronym]
tags: [method, architecture]
---

# Method Name

## Overview
High-level summary of what this algorithm, architecture, or technique does.

## Key Formulation & Working Principle
Mathematical formulation or schematic logic.

## Papers Utilizing or Proposing This Method
- `[[Paper-A]]` (Proposed here) - Key contribution: `...` (p. 12)
- `[[Paper-B]]` (Evaluated / Extended) - Observed that under low memory settings, it achieves 2x speedup (p. 88)

## Known Trade-offs & Limitations
- Pro: ...
- Con: ...
```

### 4.3 Central Index Template (`index.md`)

```markdown
# Wiki Central Index

> Total Papers: X | Total Methods: Y | Total Concepts: Z

## 📚 Papers & Chapters
- `[[papers/01-Intro-LLMs]]` - High level survey of decoder-only transformers (pp. 1-35).

## ⚙️ Methods & Architectures
- `[[methods/DPO]]` - Direct Preference Optimization without reinforcement learning reward modeling.

## 📊 Benchmarks & Datasets
- `[[benchmarks/MMLU]]` - Massive Multitask Language Understanding test suite.

## 💡 Topics & Concepts
- `[[concepts/Test-Time-Compute]]` - Search vs inference scaling dynamics.

## 🔬 Syntheses & Literature Reviews
- `[[syntheses/Alignment-Paradigm-Evolution]]` - Comparative evolution from RLHF, PPO to DPO and KTO.
```

### 4.4 Chronological Log Template (`log.md`)

```markdown
# Execution Log

## [2026-11-22] init | Initialized LLM Wiki structure and AGENTS.md
## [2026-11-22] map-toc | Mapped table of contents for raw/thesis.pdf (32 chapters detected)
## [2026-11-22] ingest | Ingested Chapter 01 (pp. 1-35) -> created papers/01-intro.md, updated index.md
```
