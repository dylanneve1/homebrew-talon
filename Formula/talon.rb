# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.33.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.0/talon-darwin-arm64"
      sha256 "53286f8c68c56c2bcd0176c80c1fcde839a0cc662faaa1e201b3752db9131498"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.0/talon-darwin-x64"
      sha256 "1599509af8f5e3dec8738928677a9a58c1ec983597cccf971a004963d9df952a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.0/talon-linux-arm64"
      sha256 "804d7f7966a9f948ff2652ffd6cebeb840e943ee4d18556e56a17b465f74fb9a"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.0/talon-linux-x64"
      sha256 "8bab69e9cb071026ff9aeecfc201a1671331276cf2c147322c2f4c69fb5ce862"
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
