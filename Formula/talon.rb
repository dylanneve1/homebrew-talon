# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.28.0/talon-darwin-arm64"
      sha256 "ff165f3abc2a3e3b83facde610c0b003a6c3f23cc04e40c5db09d3d66bc8fa28"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.28.0/talon-darwin-x64"
      sha256 "493605b2f47c7c1171cf8d88a159d8e43d3039ff5bb81d9c04bbfe92041077e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.28.0/talon-linux-arm64"
      sha256 "3c4eeef898ed49e11636df240beccfe3e871d3853d0b29a1ee9cee6755dc9bb5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.28.0/talon-linux-x64"
      sha256 "1bac4b07949d3543a1a90a2bba1e524396b76746e46accff2405d89179b6e6cb"
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
