# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.4/talon-darwin-arm64"
      sha256 "0cf97a9d46b5646e547983eec4dfc39f517b7d8ebee5bce91f3afb0821cc11d2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.4/talon-darwin-x64"
      sha256 "93455189c99d33a63b2618fd4f77ec56b016202e2e6638209e464bbfdb0c0b43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.4/talon-linux-arm64"
      sha256 "9226a523a968eda0e76455f6b2872a6f0e49178c12255fa810a3c562f2bd7677"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.4/talon-linux-x64"
      sha256 "34b8e7b1b5936b780c2293705f4c7f3d331becce221c54e900b2686ee75a9a6d"
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
