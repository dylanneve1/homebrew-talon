# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.1/talon-darwin-arm64"
      sha256 "4f4fc12ca781737e488ad1aeed3ad4003e492b167bf172fe5c279cb583435078"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.1/talon-darwin-x64"
      sha256 "05e64a6244dbfe895dc829a633a98ba0e7cc048b35d06a7e3fd6170df618a39c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.1/talon-linux-arm64"
      sha256 "131300d3414fbb6b2abc05050f2aa548cf02d96453dcd14486dad9c2755f5955"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.1/talon-linux-x64"
      sha256 "1cb410091ad78df024370e922d88b589f6a5a11a53af578e8f8fd33e10bf3f8e"
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
