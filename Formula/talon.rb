# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.12.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.4/talon-darwin-arm64"
      sha256 "368d09c9fe1119a95d33970bc5a794ce0914cfbec69d51dd2510c66372a37cb5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.4/talon-darwin-x64"
      sha256 "eecf811310ae1cf12f1c76080d2e51f5ba74b02d6792ef689d7b012272ae2873"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.4/talon-linux-arm64"
      sha256 "5eb9d8dfb4523b59dbd1b42520fc7b331c1f55271dc83dd0aeb4c0034c4e27bd"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.4/talon-linux-x64"
      sha256 "fac17197ae9b8fb4ac53979658f903447f8537647fa5bf1820a602812af014d4"
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
