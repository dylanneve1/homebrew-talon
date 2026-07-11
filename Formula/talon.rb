# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.40.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.1/talon-darwin-arm64"
      sha256 "e696edac3191082660c44a4199c1317a87376f586edba028c2fbd26d2867d7ba"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.1/talon-darwin-x64"
      sha256 "7385b4accb5c35885049e8362bc0d300e5e127f3bd1af556d8a46548e620fda2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.1/talon-linux-arm64"
      sha256 "1c970d14db911e7e72f9db46424aaf45c3848e45b263ee77a63c81e4c7075c2e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.1/talon-linux-x64"
      sha256 "bd5d51dd90d756f0054f84e8462c80531298fb07cdb3a71f264db444ad8d8917"
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
