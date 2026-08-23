# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.27.0/talon-darwin-arm64"
      sha256 "dedeb9473f7fe79a37186e392eba59c9435e0173c73499b9d6fd1dc3b6a0a39b"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.27.0/talon-darwin-x64"
      sha256 "5770b900c98ef7afeeb4f27da6e5b2dffbad7bf050ded17db36d7121f38ff82d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.27.0/talon-linux-arm64"
      sha256 "d5e24cc78a2f6c0446a07bbb777a782d790d0d4f0e2d42fe23e7aa1cf53a5ae9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.27.0/talon-linux-x64"
      sha256 "7e1d7466d2dc621ef066f2c3368282498396704d9ec8da363b881b040f7def25"
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
