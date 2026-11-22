# 🌸 Jung Psychological Types — LLM Wiki (CW 6)

> An academic LLM Wiki built with [Andrej Karpathy's LLM Wiki paradigm](https://github.com/karpathy/llm-wiki) for C. G. Jung's *Psychological Types* (Collected Works Vol. 6, Bollingen Series XX, Princeton University Press, 651 pages).

---

## 📖 About This Wiki

This repository is a **persistent, compounding knowledge base** automatically compiled and maintained by an LLM Agent (Antigravity / Gemini). Unlike RAG systems that re-derive knowledge on every query, this wiki **incrementally integrates** each ingested chapter into a structured, interlinked set of Markdown files — ready for instant querying, cross-referencing, and synthesis.

The LLM writes and maintains all wiki content; the human directs sourcing, strategy, and exploration.

---

## 🗂️ Repository Structure

```text
.
├── AGENTS.md               # Operating specification for the LLM Wiki Agent
├── index.md                # Categorized catalog of all wiki pages
├── log.md                  # Chronological audit log of all operations
├── _manifest.md            # Ingestion manifest with per-unit processing status
│
├── raw/                    # Immutable source documents
│   └── C.-G.-Jung-Collected-Works-Volume-6_-Psychological-Types.pdf
│
├── papers/                 # Structured cards for each chapter
│   ├── CH10-General-Description-of-the-Types.md   ✅ Completed
│   └── CH11-Definitions.md                         ✅ Completed
│
├── methods/                # Core cognitive function architecture pages
│   ├── Extraverted-Thinking.md    (Te)
│   ├── Extraverted-Feeling.md     (Fe)
│   ├── Extraverted-Sensation.md   (Se)
│   ├── Extraverted-Intuition.md   (Ne)
│   ├── Introverted-Thinking.md    (Ti)
│   ├── Introverted-Feeling.md     (Fi)
│   ├── Introverted-Sensation.md   (Si)
│   ├── Introverted-Intuition.md   (Ni)
│   └── Auxiliary-Function.md
│
├── concepts/               # Theoretical entity pages
│   ├── Individuation.md
│   ├── Self.md
│   ├── Archetype.md
│   ├── Anima-Animus.md
│   ├── Persona.md
│   ├── Soul.md
│   ├── Psyche.md
│   ├── Transcendent-Function.md
│   ├── Enantiodromia.md
│   ├── Participation-Mystique.md
│   ├── Libido.md
│   ├── Symbol.md
│   ├── Extraversion.md
│   ├── Introversion.md
│   ├── Rational-vs-Irrational-Functions.md
│   ├── Psychic-Compensation.md
│   └── Subjective-Factor.md
│
├── benchmarks/             # Comparative framework pages
│   └── Jung-Typological-Framework.md
│
├── syntheses/              # Cross-paper comparative analyses
│   └── MBTI-Analysis-and-Jungian-Origins.md
│
└── slides/                 # Interactive HTML presentations
    └── mbti-analysis-presentation.html   🌸 日系清新馬卡龍 Graph 簡報
```

---

## 📊 Current Wiki Status

| Category | Count | Key Pages |
| :--- | :---: | :--- |
| 📚 **Papers / Chapters** | 2 | CH10 (General Description), CH11 (Definitions) |
| ⚙️ **Methods / Architectures** | 9 | 8 Cognitive Functions + Auxiliary Function |
| 💡 **Concepts** | 17 | Individuation, Self, Archetype, Anima-Animus, Symbol… |
| 📊 **Benchmarks** | 1 | Jung-Typological-Framework (8-type matrix + MBTI comparison) |
| 🔬 **Syntheses** | 1 | MBTI Analysis and Jungian Origins |
| 📑 **Slides** | 1 | MBTI 介紹與深度分析 (日系馬卡龍 Graph 投影片) |

---

## 🗺️ Ingestion Roadmap

| Unit | Title | Pages | Status |
| :--- | :--- | :--- | :--- |
| **CH10** | General Description of the Types | pp. 319–390 | ✅ Completed |
| **CH11** | Definitions (57 core terms) | pp. 391–460 | ✅ Completed |
| **CH01** | The Problem of Types in Classical & Medieval Thought | pp. 23–76 | ⬜ Pending |
| **CH02** | Schiller's Ideas on the Type Problem | pp. 77–138 | ⬜ Pending |
| **CH03** | The Apollinian and the Dionysian | pp. 139–149 | ⬜ Pending |
| **CH04–CH09** | Historical & Disciplinary Type Problems | pp. 150–318 | ⬜ Pending |
| **EPIL** | Epilogue | pp. 461–468 | ⬜ Pending |
| **APP01–APP04** | Lecture Appendices (1913–1936) | pp. 470–522 | ⬜ Pending |

---

## 🛠️ LLM Wiki Operations

This wiki follows the [AGENTS.md](AGENTS.md) operating specification with four core workflows:

| Command | Action |
| :--- | :--- |
| `/map-toc` | Scan source document, build `_manifest.md` |
| `/batch-ingest [range]` | Process chapters autonomously, update all entity pages |
| `/query [question]` | Search wiki, synthesize cited answer |
| `/lint` | Health-check for orphan pages, dangling links, contradictions |

---

## 📌 Core Theoretical Framework

Built on **C. G. Jung's dynamic typology** (not modern MBTI static profiling):

- **8 Cognitive Functions**: $Te, Fe, Se, Ne, Ti, Fi, Si, Ni$
- **Psychic Compensation**: Dominant function's extreme one-sidedness generates unconscious polar counter-reaction
- **Individuation**: Psychological differentiation toward the realization of the Self (not mere type optimization)
- **Transcendent Function**: Reconciliation of conscious/unconscious opposites through the living symbol

---

## 📋 Conventions

- Every claim and definition includes an **exact page citation** `(p. XX)` from CW 6.
- All technical terms are **aggressively interlinked** with Obsidian-style `[[Wikilinks]]`.
- **Zero hallucination** on empirical claims — if a detail is absent from source, it is marked `[Not specified in source (p. XX)]`.
- Compatible with **Obsidian** for graph view, Dataview queries, and live wiki browsing.

---

## 📄 Source

**C. G. Jung** — *Psychological Types* (Collected Works, Vol. 6)  
Translated by H. G. Baynes, revised by R. F. C. Hull  
Bollingen Series XX · Princeton University Press  
ISBN: 978-0-691-09770-1

> *This wiki is an academic study aid. All intellectual property belongs to the original author and publisher.*
