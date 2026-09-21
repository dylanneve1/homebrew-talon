# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.4.0/talon-darwin-arm64"
      sha256 "b7ddd5f9b322d30accc06257c80b361b22d7ba483c730edce0bd3c0644997ad9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.4.0/talon-darwin-x64"
      sha256 "3eaa310e7731916db8b433539a83352010269ece9db2ed4f704ecb049e0fe15e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.4.0/talon-linux-arm64"
      sha256 "89521dfa2045a8009b0959d91c9d1eb9b174c276ebf88fb6e3f4a727353b74b5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.4.0/talon-linux-x64"
      sha256 "17cc341d069928d42034aa0dfde4c44bede4525e18110edcf83352a91505d8fb"
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
