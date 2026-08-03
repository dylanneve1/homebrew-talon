# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.16.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.16.1/talon-darwin-arm64"
      sha256 "a027cf71f1d0b85063ccf89da569fb727fbaa42c5bce1eddb29ee98bebc0777d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.16.1/talon-darwin-x64"
      sha256 "488ac161bdfcb2f0e756c459510ee4cc920b213d2ce8bf8f4f0bab6ad762edda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.16.1/talon-linux-arm64"
      sha256 "4b9ffcbd98b53307c26d09f07ced3783f314ca5fd84d87c6c38f5d01320695c4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.16.1/talon-linux-x64"
      sha256 "0146e838f61170377875fc2bc0d2e61a7be22025c29894c55e2807501d3a9a42"
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
