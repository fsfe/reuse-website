---
# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "Comparison of license compliance projects"
---

It is easy to get confused by the multitude of initiatives and tools that help
with software license compliance. Provided below is a short and incomplete
overview of some noteworthy projects.

REUSE does not intend to replace, but rather complement them. We try to solve
unclear and missing license and copyright information at the very source. We
empower developers to ensure proper and exhaustive licensing of their project.

- [**SPDX**](https://spdx.org) is the rock upon which REUSE is built. SPDX
  defines a standardized way to share copyright and licensing information
  between projects and people. Read more in [our FAQ](/faq/#what-is-spdx).
- [**ClearlyDefined**](https://clearlydefined.io) collects and displays meta and
  security information about a large number of projects distributed on different
  package registries. It also motivates developers and curators to extend data
  about a project's licensing and copyright situation. REUSE in comparison
  concentrates on fixing the problem at the file level for individual projects,
  which in turn will ease ClearlyDefined's efforts.
- [**OpenChain**](https://www.openchainproject.org) focuses on making Free
  Software license compliance more transparent, predictable, and understandable
  for participants in the software supply chain. OpenChain recommends REUSE as
  one component to increase clarity of the licensing and copyright situation,
  but has higher requirements to achieve full conformance.
- [**FOSSology**](https://www.fossology.org) is a toolkit for Free Software
  compliance. It stores information in a database, and includes license,
  copyright and export scanners. It is more complex than REUSE and its tool, and
  rather optimized for compliance officers and lawyers. REUSE instead intends to
  have all licensing and copyright information stored in or next to the source
  files to safeguard this information when reused elsewhere. Projects that are
  REUSE-compliant have their licensing information detected much more easily by
  FOSSology (specifically its `Ojo` agent).
- [**ORT**](https://oss-review-toolkit.org/), the OSS Review Toolkit, is a set
  of tools that complement existing compliance projects. Its scanner tool runs
  the license scanner of your choice on the source code of projects and their
  transitive dependencies. If these are REUSE-compliant, it will be much easier
  for ORT to correctly determine the licenses of all files used in the project.
- [**AboutCode**](https://aboutcode.org/) is a stack of Software Composition
  Analysis tools, most pertinently among them the [ScanCode
  Toolkit](https://github.com/nexB/scancode-toolkit). These tools detect
  licensing information and generate an inventory of components. Projects that
  are REUSE-compliant have their licensing information detected much more easily
  by ScanCode.
