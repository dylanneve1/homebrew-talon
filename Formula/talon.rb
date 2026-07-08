# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.34.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.34.1/talon-darwin-arm64"
      sha256 "ad84674fcb2df9f8b65c3f2b78eb3ffbc0e7abf8e5f9a1eac2e43fe73731b532"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.34.1/talon-darwin-x64"
      sha256 "41065884ce55f968fbae7f0650032f16c5c7b6bd87ca82618b99c0722025c0d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.34.1/talon-linux-arm64"
      sha256 "ea54b3eb44368ce4ebbe5b8996a9c3a5c9d8802194819e48bbc9ba3cac7cd80f"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.34.1/talon-linux-x64"
      sha256 "9fbd1f4022184726350dd2cb5b1cc3d3a79c7decd684de5552d6bfc3f8f34e1a"
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
