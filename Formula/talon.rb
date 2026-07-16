# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.53.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.53.0/talon-darwin-arm64"
      sha256 "fdfb7c927878a9f86c1b57d099309347ee40a6f149420a724cab175eab7b2749"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.53.0/talon-darwin-x64"
      sha256 "e394ee3d0e27f71ed950c6a8da5db7b5c2112a542fecd78796c68fc913d8c5bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.53.0/talon-linux-arm64"
      sha256 "367d8e1cba667983835178951d6af6276f00c1a2e100954e0bfe827992048205"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.53.0/talon-linux-x64"
      sha256 "e0b6049c580aac87849d8f6d4f8a47fb27ad470632548f72db664e7f1651e03f"
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
