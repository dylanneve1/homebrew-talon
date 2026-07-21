# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.1.1/talon-darwin-arm64"
      sha256 "ed5f47b8db77d580178a9c3e9af8747b75497c9d46a5f568fb17c80a24bdf311"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.1.1/talon-darwin-x64"
      sha256 "288c848c0fa1a27fe85af40d55561166fa1eb5b18742dce8c17f170edd096ad1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.1.1/talon-linux-arm64"
      sha256 "9beda05ca3cee6e31b00bef60c5bb20b2618a5427b3199409901c4348f33b8e9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.1.1/talon-linux-x64"
      sha256 "41026bdfcfa9d96df8358c46dfea7fa590d88c740c29b15a94d216776b738396"
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
