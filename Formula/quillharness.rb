class Quillharness < Formula
  desc "Human-directed system for rigorous AI-assisted novel writing"
  homepage "https://github.com/Weightrotator/QuillHarness"
  url "https://github.com/Weightrotator/QuillHarness/releases/download/v0.5.0a7/quillharness-macos-arm64"
  version "0.5.0a7"
  sha256 "393547538bbc4d4ab9de77bcf546ed82ddd106bf9ccbe29e64e728ba1bdb71b6"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    libexec.install "quillharness-macos-arm64" => "quillharness"
    chmod 0755, libexec/"quillharness"
    (bin/"quillharness").write <<~SH
      #!/bin/sh
      case "${1:-} ${2:-}" in
        "update install"|"update rollback")
          echo "This copy of QuillHarness is managed by Homebrew." >&2
          echo "Run: brew update && brew upgrade quillharness" >&2
          exit 2
          ;;
        "update status")
          "#{libexec}/quillharness" "$@"
          status=$?
          echo "Homebrew manages this installation. To upgrade, run: brew update && brew upgrade quillharness"
          exit "$status"
          ;;
        *) exec "#{libexec}/quillharness" "$@" ;;
      esac
    SH
  end

  def caveats
    <<~EOS
      QuillHarness is governed by its application EULA:
        https://github.com/Weightrotator/QuillHarness/blob/main/EULA.md

      This alpha is not yet notarized. If macOS blocks its first launch,
      follow the Gatekeeper instructions in the QuillHarness README. Do not
      disable Gatekeeper globally.

      QuillHarness checks for new releases at occasional workflow checkpoints.
      Homebrew owns this installation, so apply available updates with:
        brew update && brew upgrade quillharness
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/quillharness --version")
  end
end
