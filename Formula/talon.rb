# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.11.0/talon-darwin-arm64"
      sha256 "f1009bb7d7277cafab25c527c9519875528e671f461ef3177a787022b30753ff"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.11.0/talon-darwin-x64"
      sha256 "5be898114c3c8af8a730e936936451ead9c35ee277bd138f71eb67588ae1ce51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.11.0/talon-linux-arm64"
      sha256 "11f34d9a531be8d03518a7164557410437d2ee3202bcf19b3a03c57951c5e1e2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.11.0/talon-linux-x64"
      sha256 "131c699593be4a21c0c4bbb007edf1e8536672c6bd10eec8b38dcad2a3954c44"
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
