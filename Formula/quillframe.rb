class Quillframe < Formula
  desc "Human-directed system for rigorous AI-assisted novel writing"
  homepage "https://github.com/Weightrotator/Quillframe"
  url "https://github.com/Weightrotator/Quillframe/releases/download/v0.5.0a3/quillframe-macos-arm64"
  version "0.5.0a3"
  sha256 "195e8b7df130daf7952743ba3fc19b05c7fdea4068bc7444e2a5018a6b4601ce"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    libexec.install "quillframe-macos-arm64" => "quillframe"
    chmod 0755, libexec/"quillframe"
    (bin/"quillframe").write <<~SH
      #!/bin/sh
      case "${1:-} ${2:-}" in
        "update install"|"update rollback")
          echo "This copy of Quillframe is managed by Homebrew." >&2
          echo "Run: brew update && brew upgrade quillframe" >&2
          exit 2
          ;;
        "update status")
          "#{libexec}/quillframe" "$@"
          status=$?
          echo "Homebrew manages this installation. To upgrade, run: brew update && brew upgrade quillframe"
          exit "$status"
          ;;
        *) exec "#{libexec}/quillframe" "$@" ;;
      esac
    SH
  end

  def caveats
    <<~EOS
      Quillframe is governed by its application EULA:
        https://github.com/Weightrotator/Quillframe/blob/main/EULA.md

      This alpha is not yet notarized. If macOS blocks its first launch,
      follow the Gatekeeper instructions in the Quillframe README. Do not
      disable Gatekeeper globally.

      Quillframe checks for new releases at occasional workflow checkpoints.
      Homebrew owns this installation, so apply available updates with:
        brew update && brew upgrade quillframe
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/quillframe --version")
  end
end
