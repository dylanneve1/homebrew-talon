# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.13.0/talon-darwin-arm64"
      sha256 "7a619e1f90ce840003cd66de816737f23f350d078aad7e8f041e1e0094e3ec14"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.13.0/talon-darwin-x64"
      sha256 "1047fd3fc6c517a1bc4f7e57027afbded2a753ea322c8e60761479446f14958b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.13.0/talon-linux-arm64"
      sha256 "27f5025251d2ff7853eb93f7a8b81f8ce3b404abb4ed1318cf637c60433b5bd8"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.13.0/talon-linux-x64"
      sha256 "6ca821422d6cb9d2d74e6145088abb8fd73836000dd142ab06c8f8243092b787"
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
