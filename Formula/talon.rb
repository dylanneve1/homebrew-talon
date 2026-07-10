# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.37.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.1/talon-darwin-arm64"
      sha256 "11379dc776e71f0ae30cf1ba7c5fe2d6f561eed946e730dcd7547ba4948f2022"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.1/talon-darwin-x64"
      sha256 "fbdcd2242d0d79d7c692c0a53ac9d031667beb8eac5bb94835c63145c0a1d6e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.1/talon-linux-arm64"
      sha256 "1348d85444e2934196e933bbc6d5b3828cfdb9381d84f9ddaca4972e9b949315"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.1/talon-linux-x64"
      sha256 "b65867a29515d3d6f089b383ff4e33f8d9c81d219e72776bffd04ddb71a9ea09"
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
