# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.50.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.50.0/talon-darwin-arm64"
      sha256 "9e73af881bca5798ca7cd9313d5be45b836628f6b8b53d551036cb97ec3f9899"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.50.0/talon-darwin-x64"
      sha256 "4004e24dd10e27cdceb91010cfc4d9e3c430bb27b79a9716c36648a03c8d4ef9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.50.0/talon-linux-arm64"
      sha256 "7609eed9c4563763659a0b4697c42556de2d11c38866769f95915bbfcab1edf2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.50.0/talon-linux-x64"
      sha256 "75f8d3a71c5a34121f1aacd647213278ecb78c62121e48eaccc019a7ab35bad5"
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
