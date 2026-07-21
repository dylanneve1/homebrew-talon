# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.2.0/talon-darwin-arm64"
      sha256 "7eb92818f6d3abdbf0cc7ccb2733127675db620be26b987b196026466fee97ef"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.2.0/talon-darwin-x64"
      sha256 "2d7f6d91bb06e5a679317ce473f9face39ceeea28c24fd07f692f8a687299a0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.2.0/talon-linux-arm64"
      sha256 "cf7f63844f28d904286bdab36d532277d5c1a010efcdea96d94a2f7af24769ea"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.2.0/talon-linux-x64"
      sha256 "30858a46069837dc304c6821b87f6575f097d89ea47f2c2d20948d3c140e6acc"
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
