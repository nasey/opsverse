# Day 2 — Services & Logs (Linux Ops)

## Objective
Learn to distinguish between:
- **Service running** vs **service healthy**
- Process existence vs actual reachability
- Guessing vs diagnosing using logs

---

## Core Mental Model

When users report “the service is down”, follow this order:

1. **Check service state**  
   `systemctl status <service>`  
   → Is the service managed by systemd actually running?

2. **Check port binding**  
   `ss -lntp | grep <port>`  
   → Is any process listening on the expected port?

3. **Test reachability**  
   `curl localhost:<port>`  
   → Does the service respond at the application layer?

4. **Read logs**  
   `journalctl -u <service>`  
   `journalctl -f`  
   → What error or failure is the service reporting?

This prevents blaming “network” when the root cause is config or permissions.

---

## Key Definitions (Learned in Context)

- **Service**  
  A long-running process managed by systemd with lifecycle (start/stop/restart), logs, and restart policies.

- **systemd**  
  The Linux init and service manager responsible for starting services at boot and supervising them.

- **PID (Process ID)**  
  Unique identifier for a running process.

- **Port binding / Listening socket**  
  A process attached to a port and ready to accept connections (`ss -lntp` shows this).

- **Connection refused**  
  OS-level error indicating no process is listening on the target port.

- **Timeout**  
  Indicates network path/firewall/routing issues rather than local service state.

- **Logs**  
  Append-only records emitted by services describing what they are doing or why they failed.  
  `journalctl` is the primary interface for systemd logs.

- **Directory execute permission (x)**  
  Required to traverse into a directory. Missing `x` causes “permission denied” even if read permissions exist.

---

## Practical Exercises Completed

- Started and stopped a simple HTTP service using:
  `python3 -m http.server 8080`
- Verified port listeners and owning processes with:
  `ss -lntp`, `ps aux`
- Tested reachability with:
  `curl localhost:8080`
- Observed failures when the service was stopped (connection refused)
- Triggered and diagnosed permission-related failures
- Tailed logs live using:
  `journalctl -f`

---

## Artifact Built

**log_tail.sh**  
A small helper script to tail logs of any systemd service:

```bash
./log_tail.sh ssh
