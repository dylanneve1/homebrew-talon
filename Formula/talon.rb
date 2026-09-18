# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.5.0/talon-darwin-arm64"
      sha256 "0a8c5d65974541d20661a80f77dc87e2c5987b2dea726aa873af17af1cf887ea"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.5.0/talon-darwin-x64"
      sha256 "6bb3a3c3e55f7f06a3ddceb4b4995f0fe5413c8e3dea95a244200e013becdc25"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.5.0/talon-linux-arm64"
      sha256 "06c94c4698a4e07c6a04de4d3aacc4e97065bde61e09f221ff160e8141f743ac"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.5.0/talon-linux-x64"
      sha256 "ab7c1610a1d26ae1c87dab2132a77f8fd04d1e9424768cb0e787854eb07bfef2"
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
