# Dotfiles

Zsh, Git, and shared Neovim configuration for Arch Linux and macOS. Linux also
includes Ghostty and mpv settings. The repository does not configure a
desktop session or change your login shell.

## Install

Clone this repository somewhere permanent: installed dotfiles are symlinks into
the checkout; bundled fonts are copied into the user font directory. Run setup
as your regular user. On macOS, install the
[Command Line Tools and Homebrew](https://docs.brew.sh/Installation) first;
both Apple Silicon and Intel Homebrew prefixes are detected.

```sh
./setup --dry-run --install-packages --backup
./setup --install-packages --backup
./setup --check
exec zsh -l
```

`--install-packages` uses `arch/packages.txt` with `sudo pacman -Syu --needed` on
Arch, or `macos/Brewfile` with `brew bundle` on macOS. Arch performs a full system
upgrade. Package managers retain their normal prompts. Omit this flag to link
files only. Homebrew/Command Line Tools installation is a prerequisite, not run
by this script. Other Linux distributions need their own package installation;
`--platform arch` can stage the Linux links there.

Existing files, directories, and unrelated symlinks cause a reported conflict
and a nonzero exit. `--backup` moves each conflict to an adjacent
`NAME.backup.TIMESTAMP.PID` before installing the replacement. To restore one,
remove the replacement link or font file and move its backup to the original
name. Rerunning setup is safe. `--dry-run` does not write files or run package
managers; `--check` checks installed links, font files, commands, and editor
versions without changing dotfiles or fonts.

`XDG_CONFIG_HOME` and `XDG_DATA_HOME` are respected, including paths with spaces.
Keep `ZDOTDIR` unset or equal to `$HOME`. Shell caches and history use the XDG
cache/state directories.
The legacy `./machack.sh` entry point runs `./setup --platform macos`; package
installation now requires the explicit `--install-packages` flag there too.

To use zsh for future logins, run `chsh -s "$(command -v zsh)"` with a zsh path
listed in `/etc/shells`. macOS's built-in `/bin/zsh` also works.

## Fonts

Setup installs all eight hinted TrueType faces from `IosevkaSerif/TTF`:
regular, bold, italic, bold italic, and their extended-width variants. Their
embedded family name matches Ghostty's `font-family = Iosevka Serif`.

- Linux: `$XDG_DATA_HOME/fonts/IosevkaSerif` (default `~/.local/share/fonts/IosevkaSerif`),
  followed by a font-cache refresh. See the [Fontconfig directory configuration](https://fontconfig.pages.freedesktop.org/fontconfig/fontconfig-user.html).
- macOS: `~/Library/Fonts`, the [current-user font directory](https://support.apple.com/guide/font-book/change-font-book-settings-fntbk1004/mac).

Unhinted TrueType and WOFF2 variants are kept in the checkout and are not installed.
Matching installed font files are left untouched on reruns; conflicts use the
same `--backup` behavior as dotfiles. Restart your terminal after installation.

## Neovim

Both profiles link `arch/config/nvim`. Open `nvim` after installing packages and
allow Lazy and Treesitter to finish downloading plugins/parsers. Use
`:Lazy restore` to restore the checked-in plugin versions, and `:checkhealth` to
verify the editor. The pinned Treesitter version requires Neovim 0.12+, the
tree-sitter CLI 0.26.1+, a C compiler, curl, and tar; the manifests supply these
(macOS gets its compiler from Command Line Tools).
[Upstream requirements](https://github.com/nvim-treesitter/nvim-treesitter/blob/427e9222363d07c32d6db6169e4049c28d58d141/README.md#requirements).

The manifests install `typescript-language-server`, TypeScript, `ty`, `zls`,
Zig, `ols`, and Odin. Only available language servers are enabled; restart Neovim
after installing a missing one. Keep Zig and ZLS versions compatible when using
project-specific toolchains. The fff plugin downloads a native binary; its source
build fallback additionally needs Cargo/Rust. A failed Lazy bootstrap reports
the error and leaves the base editor usable, including in headless sessions.

## Flags that still depend on the machine or project

- The optional Rush config is retained; Rush itself is not installed. Optional
  aliases for Cargo, Kubernetes, Terraform, gcloud, Kakoune, and other development
  tools require those tools separately. Kubernetes context aliases on macOS still
  name specific work clusters; authenticate and configure them before use.
- Git identity and SMTP settings are personal. `bc` and `bruh` assume a `master`
  branch; the macOS `squash` alias assumes `main`. Adjust these for your projects.
  The original new-repository defaults remain `main` on Arch and `master` on macOS.
  The optional `lockb` diff driver on macOS requires Bun.
- SSH uses an existing desktop or forwarded agent. The Linux fallback socket is
  used only when present; setup does not create an agent or load SSH keys.
- The installed Arch OLS package omits its `builtin` data directory. Get the
  source matching your OLS release, then export `OLS_BUILTIN_FOLDER` pointing to
  that source's `builtin` directory before starting Neovim. `setup --check`
  detects missing data. This directory comes from OLS, not the Odin compiler.
  [OLS installation requirements](https://github.com/DanielGavin/ols#installation).
- Hyprland, UWSM, Tofi, and Waybar configuration has been removed. Setup cleans up old
  symlinks pointing to the deleted files in this checkout; unrelated user files
  are preserved. Installed applications and system services are not removed.
- `todo/etc/asound.conf` is an unapplied, hardware-specific ALSA reference.
