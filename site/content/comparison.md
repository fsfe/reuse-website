---
# SPDX-FileCopyrightText: Free Software Foundation Europe e.V.
# SPDX-License-Identifier: CC-BY-SA-4.0

title: "Comparison of license compliance projects"
---

It is easy to get confused by the multitude of initiatives and tools that help with software license compliance. Provided below is a short and incomplete overview of some noteworthy projects.

REUSE does not intend to replace, but rather complement them. We try to solve unclear and missing license and copyright information at the very source. We empower developers to ensure proper and exhaustive licensing of their project.

* [**SPDX**](https://spdx.org) is the rock upon which REUSE is built. SPDX defines a standardized way to share copyright and licensing information between projects and people. Read more in [our FAQ](/faq/#what-is-spdx).
* [**ClearlyDefined**](https://clearlydefined.io) collects and displays meta and security information about a large number of projects distributed on different package registries. It also motivates developers and curators to extend data about a project's licensing and copyright situation. REUSE in comparison concentrates on fixing the problem at the file level for individual projects, which in turn will ease ClearlyDefined's efforts.
* [**OpenChain**](https://www.openchainproject.org) focuses on making Free Software license compliance more transparent, predictable, and understandable for participants in the software supply chain. OpenChain recommends REUSE as one component to increase clarity of the licensing and copyright situation, but has higher requirements to achieve full conformance.
* [**FOSSology**](https://www.fossology.org) is a toolkit for Free Software compliance, stores information in a database, and includes license, copyright and export scanners. It is more complex than REUSE and its helper tool and rather optimized for compliance officers and lawyers. REUSE instead intends to have all licensing and copyright information stored in or next to the source files to safeguard this information when reused elsewhere.
* [**ORT**](http://oss-review-toolkit.org/), the OSS Review Toolkit, is a set of tools that complement existing compliance projects. It has the ability to analyze transitive dependencies declared by various package managers, and can download the source code for all dependencies in order to get it scanned by the license scanner of your choice. Furthermore, ORT is able to evaluate license findings against customizable policy rules, and it can create different reports like disclosure documents or Bill-Of-Materials (BOMs) in multiple formats.
