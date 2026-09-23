# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.8.0/talon-darwin-arm64"
      sha256 "9d05fdab9c60598fbeedc2631f900bab34be1f3a85bcae7d69afd25eb6808ba5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.8.0/talon-darwin-x64"
      sha256 "9a5473b2c26fb8366f939174f5e2f42dd5367d38d396189a4c16e2a529ad3019"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.8.0/talon-linux-arm64"
      sha256 "0fe82d9166a8be7756b32885253d89504425401d82653d03da4621f65cabe963"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.8.0/talon-linux-x64"
      sha256 "f81d4f1e4dc0ea70c5fb5f3c7eae99a52371656f658fff6936bebbcf12bf6532"
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
