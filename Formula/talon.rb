# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.0/talon-darwin-arm64"
      sha256 "10e72f6a3f27b0480e745dd6ae7d7cee72d6a92d91c8f1010d036fa01cb6d696"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.0/talon-darwin-x64"
      sha256 "1ce488f45f41074a423d565363f46608e4196c27f375bd5ebd90ab4bc9c8e00b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.0/talon-linux-arm64"
      sha256 "99a241957d8032f222bd7c2770ffd292202131c69efc2f178eeb3041673a7e4d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.0/talon-linux-x64"
      sha256 "4d12cca93dd0371e15d13ef59b555c9956464b3cf6734666d06024199fe8e84e"
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
