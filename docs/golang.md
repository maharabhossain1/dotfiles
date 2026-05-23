# Go Setup

Installed via Homebrew. Managed by the `golang` Ansible role.

## Environment

| Variable | Value | Purpose |
|---|---|---|
| `GOPATH` | `~/go` | Go workspace root |
| `GOBIN` | `~/go/bin` | Where `go install` places binaries |
| `PATH` | includes `$GOBIN` and `/opt/homebrew/opt/go/bin` | Makes `go` and installed tools available |

## Workspace layout

```
~/go/
  bin/   — installed binaries (go install ...)
  src/   — source code (older convention, still used by some tools)
  pkg/   — compiled package cache
```

## Common commands

```zsh
go version              # verify install
go env                  # show all env vars
go install <pkg>@latest # install a CLI tool globally
go mod init <module>    # start a new module
go mod tidy             # sync go.sum with imports
go build ./...          # build all packages
go test ./...           # run all tests
```

## Adding tools globally

```zsh
go install golang.org/x/tools/gopls@latest       # LSP server
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install mvdan.cc/gofumpt@latest               # stricter gofmt
```

These land in `~/go/bin` which is already on PATH.

## Ansible role

`roles/golang/tasks/main.yml` — installs Go via Homebrew and creates the workspace dirs.
Triggered from `site.yml` after the `homebrew` role.
