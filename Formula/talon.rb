# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.34.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.34.0/talon-darwin-arm64"
      sha256 "0247dfb6b83024b4b86182ae54d166c819665a6802911157519795f0260dc109"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.34.0/talon-darwin-x64"
      sha256 "06ce79d13e3955298c1eab30db5d622501b8c2537582a4620c43a518d15bb635"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.34.0/talon-linux-arm64"
      sha256 "a5e3e11e9dc392299cfdbcd08d7a6b06192af9e6255c174aa666a97d5a074105"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.34.0/talon-linux-x64"
      sha256 "3ea0b582d4ea5218931f732a34001a5175dd3c52b16e908f689d0f7eac392585"
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
