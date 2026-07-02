# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.29.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.2/talon-darwin-arm64"
      sha256 "ab2462d2eadcff284da45062ed7b427527e9cd8d8014b957e102ede34dd87407"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.2/talon-darwin-x64"
      sha256 "3c8baa1e20ae75c7f6f37425e99647dab157c689b5c1a0eb04ab14d1b52548a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.2/talon-linux-arm64"
      sha256 "da21c44a31c8ecd9354867b318a096af539d60059c827bc79c582cbff3d411d3"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.2/talon-linux-x64"
      sha256 "117c68f1c973f881b3657d4d8652f2fd6c6ee999af5cd8611f8db495fd9347a3"
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
