# Day 1 — System Liveness & Reachability (Linux Ops)

## Objective
Build the habit of proving whether a system is **alive**, **healthy**, and **reachable** before assuming anything is broken.

---

## Triage Order (Mental Model)
When something “is down”, check in this order:

1. **Is the OS up?**  
   Commands: `uptime`, `top`, `free -h`, `df -h`  
   → Confirms stability, load, memory, disk pressure.

2. **Are processes running?**  
   Command: `ps aux`  
   → Confirms apps/daemons exist.

3. **Is anything listening on the network?**  
   Command: `ss -lntp`  
   → Shows listening ports and owning processes.

4. **Is the service reachable?**  
   Command: `curl localhost[:port]`  
   → Tests reachability at the HTTP layer.

This order prevents misdiagnosis (e.g., blaming “network” when no service is listening).

---

## Key Concepts

### Uptime & Load
- `uptime` shows system age and load averages (1/5/15 min).
- **Load average ≠ CPU usage.**  
  Load represents processes waiting for CPU or I/O.
- Compare load to CPU cores to judge pressure.
- Trends (rising vs falling) matter more than single values.

### Snapshot vs Live Monitoring
- `ps` = snapshot (scriptable, filterable).
- `top` = live view (good for spikes and trends).
- Typical flow: use `top` to find a hot PID → use `ps` to inspect it.

### Ports vs Services
- Ports don’t serve traffic — **processes do**.
- `curl localhost` defaults to port 80. If nothing listens on 80, failure is expected.
- **System up ≠ service reachable.**

### Failure Classification
- **Connection refused** → no listener on that port.  
- **Timeout** → network path/firewall/routing.  
- **HTTP 5xx** → app is up but unhealthy.

---

## Artifact Built
Created a small health-check script to quickly report:
- load (`uptime`)
- memory (`free -h`)
- disk (`df -h`)
- listening ports (`ss -lnt`)

**Lesson:** tiny shell syntax errors (spacing/quoting) can break ops scripts. Bash is strict.

---

## Git Practice (Ops Context)
- Commit small, logical changes.
- Write commit messages that explain **why**.
- Push to remote to keep an audit trail and visible proof of work.

---

## Interview-Ready Answers

- **How do you check if a Linux system is healthy?**  
  Start with uptime/load → resource pressure → processes → listening ports → reachability.

- **Why can a system be up but unreachable?**  
  No service listening on the expected port, wrong bind interface/port, or network/firewall blocks.

- **Difference between `ps` and `top`?**  
  `ps` is a snapshot; `top` is a live view.

- **What does load average indicate?**  
  Queue of runnable/blocked work; compare to CPU cores and watch trends.

---

## Outcome
By the end of Day 1:
- Can prove OS health vs service reachability.
- Can classify reachability failures correctly.
- Built and debugged a basic ops health-check script.
- Can explain triage steps calmly in interviews.