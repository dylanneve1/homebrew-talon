# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.5.0/talon-darwin-arm64"
      sha256 "66c09ca18b450797f0e5ba85fa45041020eb17b0748aa7af68288d803f6b82d2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.5.0/talon-darwin-x64"
      sha256 "9aa43a3fdb09af3ae5970ad1a2e3d214de9ea107479fd4c3ccf7b94dd8377541"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.5.0/talon-linux-arm64"
      sha256 "dcae069cb85713b3fad5ca9898691337bee310cfca41b84294f092ed9209ccda"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.5.0/talon-linux-x64"
      sha256 "e5b59b0951c337cb1e32eaaef2b682a6507317ef9811b99dfa11a884ae27b515"
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
