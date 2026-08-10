# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.19.1/talon-darwin-arm64"
      sha256 "c1ea5c831f9592acf3954fc50087a8f1c72e3e4cf8645bfa5a688f0cfb018ded"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.19.1/talon-darwin-x64"
      sha256 "ab8f7c9fae1ba8ee6935fd176f6e2b8c20b8a236c257cafc25e8415f808160c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.19.1/talon-linux-arm64"
      sha256 "66a481a5ace701c3adad4ee0d0a68dce90c554e18ed49c1bd71496e2fb54d53f"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.19.1/talon-linux-x64"
      sha256 "3a4113c5be1a555cc79d2b51f425febf943062086e119733ec3038958396d502"
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
