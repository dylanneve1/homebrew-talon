# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.3/talon-darwin-arm64"
      sha256 "af5252019e8941097258da1852368e586afbad32708e48aee8e30103f82a1ca4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.3/talon-darwin-x64"
      sha256 "0c8d9449c38424e1f59445b2257760c308c0cddf3590b1a34033484a76c6dbcb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.3/talon-linux-arm64"
      sha256 "ce0182b3b02e969a24d5b0f4cf155d6edf12ffa5eaecbb09df266e325681f15d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.3/talon-linux-x64"
      sha256 "ed0fc93730b6d38750eae3bb9ee3763136b60b3f8031515519bb571ebc832e52"
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
