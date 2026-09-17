# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.2.0/talon-darwin-arm64"
      sha256 "f44f36cd54d1807852342cede9f4999276337701391d54d539ec88dcfb4b59d4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.2.0/talon-darwin-x64"
      sha256 "34018e330732747ca24840a1f167d294eb3602a053b84247d086303dedfa74f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.2.0/talon-linux-arm64"
      sha256 "4a517ba1628c505f6f3de261ddba07b484002ecca15358b5d5a0e76490132ada"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.2.0/talon-linux-x64"
      sha256 "c080d167b904481639ffae778e28649d14b313aaaf6e840fdd53023288aadc34"
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
