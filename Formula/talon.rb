# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.43.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.43.0/talon-darwin-arm64"
      sha256 "78ed9663007253dd57ed02d10eabdb11b5c29ab0d5b731948e5a97ca066d9442"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.43.0/talon-darwin-x64"
      sha256 "422599825f5c1da75110f14a087db8e82362cfdb9d3942f058fac441a980c972"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.43.0/talon-linux-arm64"
      sha256 "26e7ade36507a11d36c115228d7eba52b7199db0d32d8e0b3de1aa65364105f1"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.43.0/talon-linux-x64"
      sha256 "595c5d6329ad79b2de6d8ec4fc1d6b5369f0e43dd691fa369a1c3645a1db670d"
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
