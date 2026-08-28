# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.29.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.29.0/talon-darwin-arm64"
      sha256 "41fc03ede0e69735790abdec0b1101a9b392821bebda88caa838d035e3b396a1"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.29.0/talon-darwin-x64"
      sha256 "92eafe0d775a9d027c4ed5d5777028844b4f12792a4c0307fd69e9f330922e72"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.29.0/talon-linux-arm64"
      sha256 "f50005ba187bb047b2939a562832bee183672706663150706bf4b5dfc039c3f4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.29.0/talon-linux-x64"
      sha256 "a6d5791343049dbe2642aecc194f70a9e65b7e7162343e381124efd22cd4c097"
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
