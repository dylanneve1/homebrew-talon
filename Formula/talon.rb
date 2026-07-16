# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.48.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.48.0/talon-darwin-arm64"
      sha256 "d5d59bdd511a46306930aa9915a4d2c6df31c6d217b863ba50f2fd8d7af245d5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.48.0/talon-darwin-x64"
      sha256 "290cf7eec11c19812d1860ed8190ed551498bd487468ce754ab21acf64b4e917"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.48.0/talon-linux-arm64"
      sha256 "15fd05232e46958070b2dd1ec246c93dc14b4de8f28d5e9e867cf16452489394"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.48.0/talon-linux-x64"
      sha256 "19a5d2ed1be97f665442e8e0d23a6cdf89f30bfac22af1b53bd0b5b03b43aba0"
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
