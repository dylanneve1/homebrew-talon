# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.27.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.27.1/talon-darwin-arm64"
      sha256 "3475b0041cb342403eafd79e235e8e585d9924fb2a7ae4da7560745a547ccfe6"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.27.1/talon-darwin-x64"
      sha256 "9f47cb0f0db45e9464b3906286532ff1bfbcc8e96155210c5f936f5d2998e794"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.27.1/talon-linux-arm64"
      sha256 "153ec69f5216157d2c43c415479f9e2827340145e4c0359166d1b9892e661801"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.27.1/talon-linux-x64"
      sha256 "0ea955afea4abe546f83ca682fce24b7119404e4a84b658e83456ec3ce71ed7e"
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
