# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.38.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.38.1/talon-darwin-arm64"
      sha256 "96ea3c4b879fd9501fc98f117047299719e652d4d6d96f66d0af214641704e31"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.38.1/talon-darwin-x64"
      sha256 "a85ebd34026a7055d59041b6240bedfb58a498bb75b73294f9ec69b818dab585"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.38.1/talon-linux-arm64"
      sha256 "ea817f7fd8ed25655f9ad04f0a0633fc442590bec633cda72e7cc92542229561"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.38.1/talon-linux-x64"
      sha256 "9ed9a89862b35dd4ae2e11acb47496be863c2d4f6bb52aee503e7b72ee336abb"
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
