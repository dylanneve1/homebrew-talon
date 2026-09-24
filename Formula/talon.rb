# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.17.0/talon-darwin-arm64"
      sha256 "30b18bde6057647f056e26027f453bf6732a7503ab51f9e0ae62eb33a6b0b706"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.17.0/talon-darwin-x64"
      sha256 "96e827495be708ecd1477be03ccdc94eb3d10f77378e28b0a7fd0eaec0fedef5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.17.0/talon-linux-arm64"
      sha256 "e73b076c0005d306bee3c51f748a4639fe339a5a860c05d9e50e2d95fa72235e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.17.0/talon-linux-x64"
      sha256 "356f49fc0559cee70971a980e0ea8733e5a3a4aeac1a33aad890069a0e9cde4d"
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
