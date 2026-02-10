# Opsverse

Opsverse is a hands-on DevOps learning and experimentation repository focused on building real operational skills through incident-driven exercises and small practical projects.

The goal of this repo is not to collect notes or tutorials, but to document how systems behave under failure and how to debug them calmly and methodically — the way it’s done in real production environments.

---

## What’s inside

This repository is organized around practical labs, scripts, and small projects that mirror real DevOps/SRE workflows:

- **labs/**  
  Small, focused exercises to understand Linux, services, logs, networking, and failure modes.

- **scripts/**  
  Lightweight operational helpers built while learning (health checks, log tailing, etc).

- **terraform/**  
  Infrastructure-as-Code experiments for AWS (VPC, networking, compute, IAM).

- **mini-projects/**  
  Weekly scoped projects that tie multiple concepts together.

- **final-project/**  
  A consolidated project combining cloud infrastructure, CI/CD, containers, Kubernetes, and serverless components into a single coherent system.

- **docs/**  
  Daily notes, runbooks, incident write-ups, and architecture explanations.

- **lambdas/**  
  Small serverless functions used for API and automation experiments.

---

## Learning approach

The work in this repository follows a few principles:

- **Incident-driven learning**  
  Concepts are learned by breaking things and debugging them, not by passive reading.

- **Layered understanding**  
  Start from Linux fundamentals, then move up through cloud networking, containers, orchestration, and serverless.

- **Artifacts over theory**  
  Every learning unit produces something tangible: a script, a config, a runbook, or a small service.

- **Operational thinking**  
  Emphasis on logs, health checks, failure classification, and safe recovery rather than just “making it work”.

---

## How to use this repo

Each lab or project folder is self-contained and documented with a short README or notes describing:

- the goal of the exercise  
- what was intentionally broken  
- how it was diagnosed  
- what was fixed and why  

You can browse the commit history to see how issues were discovered and resolved over time.

---

## Disclaimer

This repository is a learning sandbox.  
Resources created here are for experimentation and practice only and are not production templates. Cloud resources should always be created in isolated accounts with cost controls enabled.

---

## Progress

- Linux fundamentals: system health, services, logs, permissions  
- Cloud & IaC: AWS networking and Terraform  
- Containers & CI/CD: Docker, pipelines, deployments  
- Orchestration & serverless: Kubernetes, API Gateway, Lambda, DynamoDB  
- Final consolidation: end-to-end DevOps project

---

## Contact

If you’re reviewing this repository as part of a hiring process and want context around any specific exercise or design decision, feel free to reach out.