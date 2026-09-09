# Homebrew tap for Quillframe

This is the official Homebrew tap for [Quillframe](https://github.com/Weightrotator/Quillframe), a human-directed system for rigorous AI-assisted novel writing, progressive creative exploration, and continuity-safe story knowledge.

Quillframe currently supports Apple Silicon Macs running macOS 13 or newer.

## Install

```bash
brew trust --formula Weightrotator/quillframe/quillframe
brew tap Weightrotator/quillframe
brew install quillframe
```

Current Homebrew releases require the first command before loading Ruby from a third-party formula. It trusts only the Quillframe formula, not every future package in the tap. This is a Homebrew security policy, not an approval process for the Quillframe name.

Upgrade later with:

```bash
brew update
brew upgrade quillframe
```

Quillframe is distributed under its [application EULA](https://github.com/Weightrotator/Quillframe/blob/main/EULA.md). It is not yet Apple-notarized; if macOS blocks the first launch, follow the brief Gatekeeper instructions in the [Quillframe README](https://github.com/Weightrotator/Quillframe#if-macos-blocks-the-first-launch).
