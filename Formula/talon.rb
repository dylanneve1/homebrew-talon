# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.24.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.1/talon-darwin-arm64"
      sha256 "d96439de00e1203ad21e6d267df677b86836909f7a3bc10b4767dced32800b05"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.1/talon-darwin-x64"
      sha256 "6a045bf60816ed1fdd3e4579191cc1999ba468988318b0ca3213ee381ca7f37d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.1/talon-linux-arm64"
      sha256 "0efa9300d59aa7bd099030bc4e87dc106042ed9d758419ce1c2da4d00c0affa8"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.1/talon-linux-x64"
      sha256 "f64c7be70a8c0b066ca34ce82dc934c2b1b02058dc108fdd8732b667ec5ddb48"
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
