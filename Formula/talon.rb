# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.0/talon-darwin-arm64"
      sha256 "937182013d47871302b90af15c244bd188e1512786789c891fcd74330a9b50a9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.0/talon-darwin-x64"
      sha256 "756e1e06b60670c6bcc0a1448e0de326775020bb61def2d783d7c68050addeb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.0/talon-linux-arm64"
      sha256 "29776b53be09cf9eba35de87ae7fbe10bd363031c9e4e3ae520439a3ca5d4c77"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.0/talon-linux-x64"
      sha256 "832f08057d1a899e9ad0a82d50992d6577153d1c4166dbd381866ecc634a88c3"
    end
  end

  def install
    # Homebrew downloads the bare binary asset under its remote
    # basename (talon-<os>-<arch>); install it as .
    bin.install Dir["talon-*"].first => "talon"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/talon --version")
  end
end
