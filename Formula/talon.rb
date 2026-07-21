# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.1.0/talon-darwin-arm64"
      sha256 "3fac338f0101d78978ca0f7874f403760a0aadf7ea156854702045ad94e7c191"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.1.0/talon-darwin-x64"
      sha256 "45725c17de4878ebfc954bfa9c640ec7b892580c2d8b811fbd7ca79c4d439d18"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.1.0/talon-linux-arm64"
      sha256 "83a7f30f5f3e19070b77d34d0a0b9a3b8802fbc1d06d49e8b3b1dbfb07f2d236"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.1.0/talon-linux-x64"
      sha256 "37ffa1de01b5a4e15a4f2ccfb7203e987e22678e5caf5926eb9314aa7343857d"
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
