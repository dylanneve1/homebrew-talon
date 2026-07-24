# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.7.0/talon-darwin-arm64"
      sha256 "3b0d4d6ff26e9d1a10903fa23274f25c379da20b4e2f6285f2b87f9d70eded0e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.7.0/talon-darwin-x64"
      sha256 "266c8386097ac9c160dc4774665c1237f8383a8e503976a6db743c4c552a30a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.7.0/talon-linux-arm64"
      sha256 "fe3d42d090494d8b491dc6b27222da359cf3c7513c087984f5cacd433fbb24d1"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.7.0/talon-linux-x64"
      sha256 "9a9a97bf1cb3ffdbaf783ab3d7cc7b406f08f95bf99b945c563b47f3d92f8cc3"
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
