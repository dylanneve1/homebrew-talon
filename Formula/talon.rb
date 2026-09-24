# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.15.1/talon-darwin-arm64"
      sha256 "135f6782f25a9a9f428a252c862db5133e2eeaca0ae59963f8950d5298964794"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.15.1/talon-darwin-x64"
      sha256 "4ac95e51b59df0d190d63c5a1040046b05764cbec99e96b472641f50c7d24068"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.15.1/talon-linux-arm64"
      sha256 "29d5ec91423f3b41b44675a1c9c2333ad2327ec0e293d17957789ca62ce17e2e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.15.1/talon-linux-x64"
      sha256 "e875d15b83bfd2678f4fcad7fc7e9b21ac1c6ee6db41ad22782e4632a3007f48"
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
