# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.31.0/talon-darwin-arm64"
      sha256 "b62682570822f1aaf83d22b32febd7179863054ab06b7e6b6c4a0f99ee3d6ab9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.31.0/talon-darwin-x64"
      sha256 "cca39df30968f776c8e7f48314a9b2db0fa0d773ad2e97dc65afa285b931bba5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.31.0/talon-linux-arm64"
      sha256 "2281b05fe9fee94c432dc913ff0cf86f7775ccc54d27029b7fbe4b32eb13eeb6"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.31.0/talon-linux-x64"
      sha256 "229f1c8960e188c6dd4b0333bd3f7104bd1e52e4f4b9b5557a398c7a0df22190"
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
