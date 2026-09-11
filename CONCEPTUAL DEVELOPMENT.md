RSIS CONCEPTUAL DEVELOPMENT, SOURCE DISTINCTION, AND COMMERCIAL AVAILABILITY NOTICE 
Document title: Conceptual Development and Commercial Availability
Covered public repository: https://github.com/Loginistaken/rsis_edge_app
Covered branch / tree: main (https://github.com/Loginistaken/rsis_edge_app/tree/main)
Commercial product location: https://rsis-road-safety-inelligence-system.base44.app/
Claimed conceptual originator: Eric C. Lindau
GitHub account associated with the public concept archive: Loginistaken (Wiz-dIMENSIONAL)
Effective date of this notice: September 11, 2026  This notice applies to the entire rsis_edge_app GitHub repository page, 
the repository description, the README area, the Activity / Releases / Packages / Contributors / Languages side panels, and every 
file and documentation page visible in the repository tree, including each item listed below.1. Purpose of this notice
This document records the intended legal and commercial distinction between:Public conceptual development materials posted on GitHub under
Loginistaken/rsis_edge_app (and related RSIS concept writings under the same account); and  
The commercial RSIS product offered to the public on the Base44 platform.

The GitHub repository is published as a concept archive, architecture notebook, scaffolding record, and development reference. 
It is not the commercial product, not the production source of truth, not an app store listing, and not a grant of rights in the
Base44 commercial implementation except as required by GitHub’s terms and any license that actually accompanies the repository.
The commercial RSIS system that is offered for public use and sale is the application hosted
at:https://rsis-road-safety-inelligence-system.base44.app/Users who access RSIS through Base44 do so under the Software License Agreement,
Terms of Service, privacy terms, and platform rules of Base44 and official RSIS support channels—not under the GitHub file tree.
2.Conceptual development statement (updated)The concepts, architecture, and technical systems described in the Executive Overview and
in the repository files listed in Section 5 have been invented and
conceptually developed by Eric C. Lindau, in collaboration with advanced AI systems including
ChatGPT 5, Grok, and GitHub Copilot. Those co-engineering environments were used for structural modeling,
system architecture design, algorithm exploration, drafting, and implementation guidance.This document presents
the foundational concepts of RSIS Version 6 / RSIS edge-app thinking. Those concepts are separately implemented
and commercially available today as a mobile / web safety application on the Base44 platform at 
https://rsis-road-safety-inelligence-system.base44.app/.Users accessing RSIS through Base44 agree to
the Software License Agreement and Terms of Service governing intellectual property rights, 
data processing, privacy protections, and service limitations. RSIS is provided as a commercial 
safety assistance tool and does not guarantee accident prevention. Users remain fully responsible
for situational awareness and traffic-law compliance.Copyright in original human-authored 
expression arises automatically under applicable law. Patent rights exist only if and when 
a patent is filed and granted. Trade-secret protection applies only to information that is 
actually kept secret. Publication on a public GitHub repository generally discloses the posted
text and code and can limit trade-secret claims in those posted materials.For licensing, 
support, or terms clarification regarding the commercial product, visit the Base44 application 
or contact official RSIS support channels—not the GitHub issue tracker as a substitute for product 
support.3. What GitHub is — and what it is not3.1 GitHub status
The public repositoryhttps://github.com/Loginistaken/rsis_edge_app/tree/mainis designated by the originator as:a conceptual development record;
an architecture and documentation workspace;
a historical scaffold of RSIS Version 6 edge-app ideas;
a place where design notes, draft modules, Docker sketches, and simulation scripts were stored during development.

Repository metadata visible on the page (About text, languages breakdown showing Dart / Python / JavaScript, contributor 
“Loginistaken / Wiz-dIMENSIONAL,” commit history, “0 stars / 0 watching / 0 forks,” and “No releases published”) describes
that public concept archive. It does not convert the GitHub tree into the production commercial binary, hosted database, or 
Base44 deployment.3.2 Commercial statusThe product existing for public use and commercial availability is the Base44-hosted
RSIS application:RSIS – Road Safety Intelligence System
https://rsis-road-safety-inelligence-system.base44.app/That hosted application—not the GitHub file list—is the commercial
offering.3.3 Hard limits of this noticeThis notice cannot:create a patent that has not been filed or granted;
cancel GitHub’s Terms of Service;
revoke an MIT or other open-source license if one was published with the repo;
stop a person from reading public files already posted;
transfer ownership of third-party libraries, Flutter/Dart, FastAPI, Crow, Docker, PostgreSQL, or Base44 platform code;
make AI systems joint legal inventors for patent purposes in jurisdictions that require a human inventor.

If PROJECT OVERVIEW.md continues to say the project is licensed under the MIT License, that statement should be reconciled with this notice.
Either attach a clear LICENSE file that matches your intent, or remove/replace an MIT claim if you do not intend to give the public those 
rights in the GitHub artifacts.4. Repository-wide coverage clauseThis same updated legal notice covers:the repository
landing page at /Loginistaken/rsis_edge_app;
the tree/main file listing;
the About blurb describing RSIS version 6 _edge_app as an edge-computing framework for real-time sensor integration and user
interaction, combining a Python FastAPI backend, JavaScript WebSocket modules, and AI-driven edge processing for GPS and
Bluetooth sensors, alerts, and node simulations;
README content displayed at the bottom of the repository page;
Releases, Packages, Contributors, Languages, and Suggested workflows panels;
each individual file page under /blob/main/<filename>;
commit history and commit messages associated with those files;
any mirror, fork page, raw file URL, or download ZIP generated from this public repository.

Rule of construction: Every file in Section 5 is a conceptual / developmental artifact. None of those files,
standing alone, is the commercial Base44 product. The commercial product is the hosted application identified
in Section 1.5. File-by-file coverage (every repository page in the screenshots)Each entry below is covered 
by Sections 1–4. For each file, the legal position is the same: concept, scaffold, or design record only;
commercial rights and user terms live on Base44.Documentation and overview pagesRepository page / file
Role in the concept archive
Legal treatment
EXECUTIVE_OVERVIEW.md
Foundational concept write-up for RSIS Version 6 (edge intelligence, Blue-Web, alert hierarchy, sensor fusion)
Conceptual specification only. Does not sell or license the Base44 app.
PROJECT OVERVIEW.md
High-level project overview, setup notes, architecture outline
Conceptual / instructional text for the GitHub archive. Any “MIT License” sentence in this file must match the actual LICENSE file or be corrected.
RISIS-V6.md
Version 6 project-structure sketch (rsis_edge_app/, docker, mobile_app, backend, pwa_dashboard)
Design tree / scaffolding note only.
rsis_v_6_deployment.md
Deployment and structure notes for a Version 6.0 scaffold, Docker, mobile/PWA path
Conceptual deployment plan. Not the production Base44 host.
rsis_v_6_repository.md
Alternate tree (rsis_v6_edge_platform/) describing mobile node app, FastAPI, Crow engine, PWA, federated AI
Conceptual repository map only.
developer-build the native hardware bridge.md
Native hardware-bridge development notes
Concept / build diary only.
part-two-developer-build the native hardware bridge.md
Continuation of RSIS 4.1 / safety-beacon hardware-bridge documentation
Concept documentation only.
README section on the repository home page
Public-facing summary of the GitHub project
Concept summary only.

Backend / edge / simulation concept filesRepository page / file
Role in the concept archive
Legal treatment
Python FastAPI main.py
Draft FastAPI application / node-summary endpoints
Developmental code sketch, not the commercial hosted API unless separately deployed by the originator on Base44 or another controlled host.
models.py
Draft NodeSummary / Pydantic models
Conceptual data-model sketch.
edge_ai.py
Draft edge-AI / Flutter-related structure notes
Conceptual AI-edge module.
crow_connector.py
Draft process_hazard_tiles connector toward a Crow hazard service
Conceptual integration stub.
database.py
Draft database connection setup
Conceptual persistence sketch. Not the production Base44 database.
thousand-nodes.py
Synthetic node-generation script
Simulation / research helper only.
WebSocket.js
Draft WebSocket client for dashboard updates
Conceptual live-update module.

Mobile / UI concept filesRepository page / file
Role in the concept archive
Legal treatment
alerts.dart
Draft RsisAlerts class for notifications and haptics
Conceptual Flutter/Dart module.
dashboard.dart
Draft RsisDashboardScreen with WebSocket integration
Conceptual UI module.
login_screen.dart
Draft login screen
Conceptual UI module. Not the Base44 production login.
setup_gps_ble.dart
Draft SetupGpsBleScreen for GPS and Bluetooth setup
Conceptual device-setup module.

Packaging, environment, and orchestration sketchesRepository page / file
Role in the concept archive
Legal treatment
Dockerfile.backend
Draft backend container recipe
Conceptual packaging file.
Dockerfile.crow
Draft Crow-connector container recipe
Conceptual packaging file.
docker-compose.yml
Draft multi-service compose file
Conceptual local-orchestration sketch.
placeholders.env
Placeholder environment-variable names
Must not be treated as production secrets. If real credentials were ever committed, rotate them. This file is a concept placeholder only.

All of the above files, including truncated names as displayed on GitHub (“developer-build the native hardware br…”, “part-two-developer-build the native ha…”, and similarly shortened commit subjects), are included.6. Related public concept repositories under the same originatorTo avoid ambiguity, this notice also states the same rule for other public RSIS concept writings under the Loginistaken account, including without limitation:https://github.com/Loginistaken/Next-Generation-Road-Safety-Intelligence-System

Those repositories, if public, are likewise conceptual development records (version notes, beacon concepts, Base44-ready build writings, hybrid architecture notes). They are not the commercial Base44 listing. The commercial product remains:https://rsis-road-safety-inelligence-system.base44.app/If you want this paragraph to bind additional repos, add each exact URL here.7. Intellectual-property allocationIdeas and architecture. Eric C. Lindau claims origination of the RSIS concept family described in the Executive Overview (distributed edge collision-awareness, role-based nodes, GPS / BLE proximity as an input layer, hazard-tile thinking, alert tiers, and related system design).  
GitHub artifacts. Text and code actually written and committed to rsis_edge_app are public development records. Their reuse is controlled by (a) applicable copyright law, (b) GitHub Terms of Service, and (c) the repository LICENSE file, if any.  
Commercial implementation. The Base44 application, its hosted configuration, production data stores, trademarks in actual use, brand assets, and customer-facing terms are the commercial layer. Access is only under Base44 / RSIS product terms.  
AI assistance. Use of ChatGPT 5, Grok, and GitHub Copilot is acknowledged as drafting and engineering assistance. The originator claims the human-directed conception and selection of the system. AI output may contain non-original or third-party patterns; no warranty is made that every line is exclusively original.  
Third-party stack. FastAPI, Flutter/Dart, JavaScript, Docker, Crow/C++, PostgreSQL, WebSockets, GPS/BLE platform APIs, and Base44 remain the property of their respective owners and are used under their licenses.  
No accident-prevention warranty. RSIS is an assistance tool. It does not promise that collisions will be predicted or avoided.

8. User, privacy, and product terms (commercial layer only)Anyone using the public commercial app agrees that:the contract that matters for use of the live product is the Base44 / RSIS Terms of Service and privacy policy;
GitHub files are not a privacy notice for production telemetry;
location, Bluetooth, motion, and alert features, if enabled in the commercial app, are subject to device permissions and those product terms;
the operator does not guarantee uninterrupted service, complete hazard detection, or legal compliance by the user.

9. Reservation of rightsExcept for rights already granted by a posted open-source license or by GitHub’s standard visitor permissions (viewing, forking under GitHub rules, etc.), all rights in the RSIS commercial product are reserved.No GitHub visitor, by cloning or starring rsis_edge_app, obtains a license to brand, sell, or represent an app as official RSIS on Base44 or elsewhere.No statement in this notice is a public dedication of the Base44 product to the public domain.10. ContactConceptual archive: https://github.com/Loginistaken/rsis_edge_app/tree/main  
Commercial product: https://rsis-road-safety-inelligence-system.base44.app/  
Originator identified in the concept papers: Eric C. Lindau

Short block you can paste at the top of every listed fileIf you want the same notice on each repository page, put this header in every file from Section 5:text

CONCEPT ARCHIVE ONLY.
This file is part of the public conceptual development record for RSIS
at https://github.com/Loginistaken/rsis_edge_app
It is not the commercial product.

Invented / conceptually developed by Eric C. Lindau, with AI-assisted
engineering (ChatGPT 5, Grok, GitHub Copilot).

The commercial RSIS application offered to the public is:
https://rsis-road-safety-inelligence-system.base44.app/

Use of the commercial app is governed by Base44 / RSIS Terms of Service.
RSIS is a safety-assistance tool and does not guarantee accident prevention.
