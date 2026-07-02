# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.29.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.3/talon-darwin-arm64"
      sha256 "aef754d24874dd14f9516e12974a7fdc96bbb45607ae185b36c2b4e287f517c0"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.3/talon-darwin-x64"
      sha256 "0cbc840e06dac84f4a7d2a15f98beb574e120f5e4815846dc76361cd13e9ef51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.3/talon-linux-arm64"
      sha256 "937c9bff8fd228490936a99284eb3dbbd766941092c5d7b86c23dd276222d4e1"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.3/talon-linux-x64"
      sha256 "23da61f3b2218abb3bc66c39ac44b2aa718e9684eb81ebe8c7880406f2160eb2"
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
