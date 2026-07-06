# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.32.0/talon-darwin-arm64"
      sha256 "24a2e297deafcc2ef576390d4b35c2dbb9441d7e12089076dd7bf081584a893b"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.32.0/talon-darwin-x64"
      sha256 "39d01ef808d5a10127a6213de1b8c80b5144cc8177718059f63b1d6543fee02d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.32.0/talon-linux-arm64"
      sha256 "a70ed3663bdcc4a23d6ff0f46351dc3ce85d00ffb19da234c5ae88a44e37351a"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.32.0/talon-linux-x64"
      sha256 "b0a4016fe0d831e49acdc42d4cc67fc8e517bedd71e172551a045c263951d3db"
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
