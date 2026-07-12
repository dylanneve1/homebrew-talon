# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.46.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.46.1/talon-darwin-arm64"
      sha256 "1a2deda221e3bc99cb726698016cea7dd19aa641216752450c47715ee9f456ee"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.46.1/talon-darwin-x64"
      sha256 "90465867c60978a20dcf157d4bece402428ff8e64689b2cddd49e6ba8b041503"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.46.1/talon-linux-arm64"
      sha256 "a101438d5b01b34a4d647cf0c7f09cdcc4b3b117e07f691f11c38a90c8346489"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.46.1/talon-linux-x64"
      sha256 "76e935249d63f18d8b3692db90b4169c683f6da753d7f9a6fca3f5b9a74c7347"
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
