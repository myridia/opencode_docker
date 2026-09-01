# AGENTS.md — opencode_docker

## What this is
Docker image packaging opencode.ai CLI with a comprehensive set of development tools (Rust, Python, Node.js, Docker-in-Docker, and many utilities) for use in OSC52-compatible terminals.

## Stack
- Docker (Debian base)
- Shell scripts (bash)
- Rust toolchain (via rustup)
- Python packages (pip)
- opencode.ai CLI

## Build
```bash
docker build -t myridia/opencode .
```

## Run
```bash
docker run -it --privileged myridia/opencode bash
# Inside container: opencode
```

## Structure
- `Dockerfile` — main image with dev tools, Rust, Python, Node.js, Docker CLI
- `entrypoint.sh` — starts dockerd + bash
- `Makefile` — build shortcuts
- `proxy/` — proxychains/redsocks config
- `example/` — usage examples and configs
- `pages/public/img/` — logos and screenshots

## Conventions
- No comments in code unless asked.
- Verify: `docker build -t myridia/opencode .`
