# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.4.0/talon-darwin-arm64"
      sha256 "d728279b544a38fd62a496daeac662ac15ae7f568b29706b66b629f382c9683e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.4.0/talon-darwin-x64"
      sha256 "c5b410b7150ce09a14d89abe261edbf7d06fa8b98c812a502e1ede0496e3d972"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.4.0/talon-linux-arm64"
      sha256 "4fe3ac7c7c5bd7208c0aeaa6d642bb03e2b2af06bded0d2d155bbb4b8947a0a9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.4.0/talon-linux-x64"
      sha256 "296fedaaf096d1d027375c367ddabc6fe356b6e52c4c48ce29a44bdec3584299"
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
