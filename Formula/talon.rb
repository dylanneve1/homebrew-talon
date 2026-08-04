# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.17.0/talon-darwin-arm64"
      sha256 "e166ca9110f920a7d3fd942fc19091d0b97a56a487714703e791ee6f6a15256b"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.17.0/talon-darwin-x64"
      sha256 "af4820633667ac6e95c4ffc632edfebc0b003315535078a82999f9e1e1d7c841"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.17.0/talon-linux-arm64"
      sha256 "8f9af1c48abf6d01102f63b1bf4e708b385f675068ef7fa9d24b2b351d28d802"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.17.0/talon-linux-x64"
      sha256 "05800d5c32508befd0bac68b797a7e03934cd699b05e25daa7ecd94daed03f76"
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
