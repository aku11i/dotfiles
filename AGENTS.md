# Repository Guidelines

## Project Structure & Module Organization
This repository manages shell/editor/tooling dotfiles and deployment helpers.

- Root dotfiles: files like `.gitconfig`, `.tmux.conf`, `.vimrc`, and `.zshrc` are symlinked into `$HOME`.
- `.config/`: app-specific configs (`fish/`, `nvim/`, `alacritty/`, `lazygit/`, `git/`).
- `.bin/`: small executable utilities intended for `$HOME/.bin`.
- `scripts/`: operational scripts for setup and maintenance (`deploy.sh`, `brewfile.sh`, `caskfile.sh`, etc.).

Prefer adding new app config under `.config/<app>/` and setup automation under `scripts/`.

## Build, Test, and Development Commands
There is no compile/build step; workflow is script-driven.

- `bash scripts/deploy.sh`: symlink repository dotfiles into `$HOME`.
- `bash scripts/brewfile.sh`: install CLI packages via Homebrew/Linuxbrew.
- `bash scripts/caskfile.sh`: install macOS GUI apps with Homebrew Cask.
- `sh scripts/github-cli-extensions.sh`: install `gh` extension(s).
- `bash scripts/removeBrokenSymlinks.sh`: find and remove broken symlinks in common dotfile paths.

Run commands from repository root (`~/.dotfiles`).

## Coding Style & Naming Conventions
- Shell scripts use `bash`/`sh` shebangs and fail-fast behavior (`set -e`).
- Keep scripts idempotent where possible (safe to re-run).
- Use descriptive kebab-case file names in `scripts/` (example: `removeBrokenSymlinks.sh`).
- Fish config files should stay focused by topic in `.config/fish/conf.d/` (example: `node.fish`, `docker.fish`).
- Neovim Lua plugin config is organized as one plugin/topic per file in `.config/nvim/lua/plugins/`.

## Testing Guidelines
No dedicated automated test framework is defined. Validate changes with syntax checks and manual verification.

- `bash -n scripts/*.sh`
- `fish -n .config/fish/config.fish`
- `nvim --headless "+qa"` (sanity-check init load)
- Re-run `bash scripts/deploy.sh`, then confirm symlinks for touched files.

Document manual checks in PRs when changing startup logic, shell PATH handling, or editor plugins.

## Commit & Pull Request Guidelines
Recent history favors Conventional Commit style:

- `feat(fish): add nix-daemon configuration`
- `chore(nvim): remove copilot chat plugin`

Use `type(scope): short imperative summary` when possible. Keep commits focused and atomic.

PRs should include:
- What changed and why.
- OS/environment tested (`macOS`, `Ubuntu/Debian`, or `WSL`).
- Validation steps run (commands + notable results).
- Screenshots only for visual/theme-related changes.
