# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.1/talon-darwin-arm64"
      sha256 "5e6b30ce66970600e37447752d2df0c317f1309043f040af34a01ceb0af00883"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.1/talon-darwin-x64"
      sha256 "e80bb0514f4cf628b7e0a4f4998ea80d5a173154aad89f4a84c0c21784603fb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.1/talon-linux-arm64"
      sha256 "75be464f7ed6e094f55c973840ea5f17728fb339236389f1b1de45110737b41c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.1/talon-linux-x64"
      sha256 "e63276fee7d2e816dbff573db461426a4dbc27f330f424a840ef9a9878ac4fa3"
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
