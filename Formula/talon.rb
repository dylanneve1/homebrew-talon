# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.21.0/talon-darwin-arm64"
      sha256 "f9d4a5cd80077f2debc9897e5cf4fe2db6476c0cdcb643f3fb7b69db7e9a2328"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.21.0/talon-darwin-x64"
      sha256 "e215639ddea10dd66164050a794f991e8b990a5f9605ff7acf8c4c187e07a9c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.21.0/talon-linux-arm64"
      sha256 "a5c16ce4f6050019e321e7ba269eb96d430c6eabc14830033684585ba523b31c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.21.0/talon-linux-x64"
      sha256 "0c0e7d9a608f21704e0218bffbff4997276f183812fecb6e53408448eea7dfe4"
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
