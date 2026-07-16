# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.49.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.49.0/talon-darwin-arm64"
      sha256 "e3499e7a99ef5a05c9dd97c1d4a55efaed84d0d1fbef9fbf0fda5df906425cac"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.49.0/talon-darwin-x64"
      sha256 "e0c5edcd2d94eab254f708dd9df6c1d29e43137847eb84e9e3b940e23301d846"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.49.0/talon-linux-arm64"
      sha256 "a5c72dd602477e59ff3f279f2d905b2b94c0143a1e980e6271b9064795fa284c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.49.0/talon-linux-x64"
      sha256 "ce34c6adfce05499ec6d4feb921eca09a1f0ff52df01b1f32e4c0ac68b71a460"
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
