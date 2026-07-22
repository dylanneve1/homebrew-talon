# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.2/talon-darwin-arm64"
      sha256 "85f44e2da95bdb971b60c1f0000e7068c58143a3261b9a74e3cb907f6effc357"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.2/talon-darwin-x64"
      sha256 "1aaf404ebea4a86d61fbf1785b478e0f8a4b52a268eecac5b134803ce3e07ffe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.2/talon-linux-arm64"
      sha256 "d412ce8f55f84729eab443ca82635a875d7aaf9f627722942c5912407f3f55cb"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.2/talon-linux-x64"
      sha256 "b3ab6ef9ec860b6830bf109da2479452f875f10d0b0ea7df430be4e1a90ab8c6"
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
