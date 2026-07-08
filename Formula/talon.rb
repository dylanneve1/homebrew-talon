# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.35.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.35.0/talon-darwin-arm64"
      sha256 "a273a933b74b8bb4c262fa335bcb226d06695fb891c1f73d1eedc61efacdf6a2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.35.0/talon-darwin-x64"
      sha256 "4e6f5bb9cc81655768b0011a86efaa406ac95bd1993f1c4788576a2e9a6da18d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.35.0/talon-linux-arm64"
      sha256 "d269e0804a71918451af1e864d712060083dc42d5e6cdf37736912298781ce45"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.35.0/talon-linux-x64"
      sha256 "35d71308e2ae4ac02f452160ba08c256d9ae6d69e9618b134efa9699b8452481"
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
