# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.1/talon-darwin-arm64"
      sha256 "56097de8f1d1d71b56c7cff41fc444152e25970316c33191483cf06e9c40e50c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.1/talon-darwin-x64"
      sha256 "1c02fe908af65a9983f41a6b1bf3497eed047659200d20cd0ea383bc7c1ba1f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.1/talon-linux-arm64"
      sha256 "6fd8e61545adcde867d1ab4836b8e38fbe87d5aba54eca7d04fe329c36ce697f"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.1/talon-linux-x64"
      sha256 "6951641552071eabfce3a8df4bcf87e631570c71c7ae2148d3e28518edcd043f"
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
