# Linux Interview Cheat Sheet

---

## Day 1 — System Liveness & Reachability

- First 5 minutes on a slow/broken server?  
  → uptime/load, memory/disk, processes, listening ports, logs

- Why can a system be up but service unreachable?  
  → no process listening on expected port, wrong bind interface, firewall

- Load average vs CPU usage?  
  → load = queued work (CPU + IO wait), not CPU %

- Connection refused vs timeout?  
  → refused = no listener, timeout = network/firewall/path

- ps vs top?  
  → ps = snapshot, top = live view

- How to check what’s bound to a port?  
  → ss -lntp (maps ports to owning process)

- Why test curl on localhost first?  
  → isolates app/service issues from external network problems

---

## Day 2 — Services & Logs

- Process vs service?  
  → process = running program, service = systemd-managed lifecycle

- Service running but users can’t access it — debug order?  
  → systemctl status → ss -lntp → curl → journalctl logs

- What does systemctl show that ps doesn’t?  
  → service health, restart state, recent failures

- Where do you look for service logs?  
  → journalctl -u <service>, follow