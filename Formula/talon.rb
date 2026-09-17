# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.1/talon-darwin-arm64"
      sha256 "dffb66f02c9b6a637ae91dba9c0ddbe9533c1eacf45c8419c06a920cb5cd91c8"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.1/talon-darwin-x64"
      sha256 "a91e73fdd06d0db0d80a3a97baa025e2f6a57dab095a1afe3d4b40b1e028494e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.1/talon-linux-arm64"
      sha256 "010cab63a804512af50d2543e975996ba92eb53dfc9d3b4bd31207b2d48edce7"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.1/talon-linux-x64"
      sha256 "487a74d596c9d7b94c02f02dac8dc615c0c2ac8e9e25ec8b5caa2da8114ba9f5"
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
