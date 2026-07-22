# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.0/talon-darwin-arm64"
      sha256 "a88c5296007f5b0253a85a45506e46beda9486825ca7df52383fb29d53bb31c8"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.0/talon-darwin-x64"
      sha256 "dbff7e1e2561c693d200b6702f6023665061461f1cf288f08d54ac10f66f135a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.0/talon-linux-arm64"
      sha256 "73e705559191e562099e2e9f27148b53ce4fd7178f2a7b29e042fefc27b4ad03"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.0/talon-linux-x64"
      sha256 "0c8aa58ba932c9286ae076b48b3f561665ece803b0254f8a29cee9268aee65a2"
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
