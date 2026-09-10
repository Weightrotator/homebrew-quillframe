# Homebrew tap for QuillHarness

This is the official Homebrew tap for [QuillHarness](https://github.com/Weightrotator/QuillHarness), a human-directed system for rigorous AI-assisted novel writing, progressive creative exploration, and continuity-safe story knowledge.

QuillHarness currently supports Apple Silicon Macs running macOS 13 or newer.

## Install

```bash
brew trust --formula Weightrotator/quillharness/quillharness
brew tap Weightrotator/quillharness
brew install quillharness
```

Current Homebrew releases require the first command before loading Ruby from a third-party formula. It trusts only the QuillHarness formula, not every future package in the tap. This is a Homebrew security policy, not an approval process for the QuillHarness name.

Upgrade later with:

```bash
brew update
brew upgrade quillharness
```

If you installed an earlier Quillframe alpha, migrate once with `brew uninstall quillframe`, `brew untap Weightrotator/quillframe`, and the QuillHarness installation commands above. Existing story repositories remain compatible.

QuillHarness is distributed under its [application EULA](https://github.com/Weightrotator/QuillHarness/blob/main/EULA.md). It is not yet Apple-notarized; if macOS blocks the first launch, follow the brief Gatekeeper instructions in the [QuillHarness README](https://github.com/Weightrotator/QuillHarness#if-macos-blocks-the-first-launch).
