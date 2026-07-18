# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.0/talon-darwin-arm64"
      sha256 "e0a1d2ea755b11dde9e7c2a249d4e0bf87482eb53944b07e02cfa178c7e9076c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.0/talon-darwin-x64"
      sha256 "644830d179b7f7768187703b3118cd582759c92e2aff16395fe9106e6db6ecd4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.0/talon-linux-arm64"
      sha256 "0f33c396904538fd83be7a82f134a6a66a420726dbec9eadc9184252f3e719e9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.0/talon-linux-x64"
      sha256 "b3a7933eb7d4681fcc3526086bdab37526c22051f84f85a38ba0fa4a5dc7b8e1"
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
