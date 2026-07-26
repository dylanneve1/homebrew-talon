# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.11.1/talon-darwin-arm64"
      sha256 "e435dc9088d6be6663814f469eacd53418cae2041a3de0caf0070bd9e1c22da8"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.11.1/talon-darwin-x64"
      sha256 "0d3f0e480b2bb28dd548ea597fcc7d6ef688b1b04cbee533d24a4d443253f371"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.11.1/talon-linux-arm64"
      sha256 "43d18fb26222f7c2844d6b5f86b8b0c58df1839730479eaab8f38259e6b4b256"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.11.1/talon-linux-x64"
      sha256 "253824da402a47521b020595c4b16db8120e2059a856598ca06fef8da0088b8f"
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
