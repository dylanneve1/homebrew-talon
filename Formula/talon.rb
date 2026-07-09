# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.36.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.36.0/talon-darwin-arm64"
      sha256 "f12cf8865a159995b46648d305a5f93d3b74a57e18bb2a56791b306bc66e33e6"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.36.0/talon-darwin-x64"
      sha256 "2de9b9dd067122ef139168ae0119750c3739e1aa0e8aeeacc33d8e119686410e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.36.0/talon-linux-arm64"
      sha256 "5aad0003364f9b0b4080df4b137ecce86454d68968b92c74da14694ee5e8d778"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.36.0/talon-linux-x64"
      sha256 "156cf1d71fb791f0dee42e6ea533d845e5de8c43dc9bc39cb86f05817b998f90"
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
