# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.25.0/talon-darwin-arm64"
      sha256 "f60df77b64d1d1c02212e319fd7f7516c00afcfe79f1fc31f2494b871d33f3d9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.25.0/talon-darwin-x64"
      sha256 "9d8d553cb149bfb82d47c8bd77bf57e18949b7a78edd0c1200193e01e630a590"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.25.0/talon-linux-arm64"
      sha256 "52151d37c6040957d7854949b56c5150a52b372430dee8fa379ed82f74b34d38"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.25.0/talon-linux-x64"
      sha256 "779b93a44d05a171dfb5b97de2f95738453e4b1e7d06f837cd337961b680f55d"
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
