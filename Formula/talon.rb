# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.24.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.2/talon-darwin-arm64"
      sha256 "55e1d0c2cd0aab8ad2c1bcb0b77ea2c9cae28ebba83eea3e942e1545669b8abe"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.2/talon-darwin-x64"
      sha256 "d9a51ce2034a0f4accd17495fb2d0cb4acc2677841af2e243191f74f671060ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.2/talon-linux-arm64"
      sha256 "91ec807187ec7f2ce1e036c1c9f1acd9840bc0dd89ebe041d8d1cba662557c84"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.2/talon-linux-x64"
      sha256 "8a809bf240464c82e321b8a2d7ae639bb6506a4a6acad18af52987eb5403e16a"
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
