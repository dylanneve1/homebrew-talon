# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.32.0/talon-darwin-arm64"
      sha256 "948db0be963d29668c7aa688e9d2a9f60a7bf9e56d8e1264ed5cfc921bbb5732"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.32.0/talon-darwin-x64"
      sha256 "72a5d84e1fba64e2748c4272cd50404ad29da3648bedafc6b5fae29b82ecf3ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.32.0/talon-linux-arm64"
      sha256 "b96d760dbf641bdfc2cd544114ab6c63616eb107e25766dd11b47b0c23fd77ed"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.32.0/talon-linux-x64"
      sha256 "58894c429a60706acbb607a02fb2fec376d32098029ff5ea271fda1e2ac22ea8"
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
