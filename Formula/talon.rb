# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.45.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.45.0/talon-darwin-arm64"
      sha256 "7b2acde2d6bb14b5c92cc1be79be8b9c5cf77d73fcf9b9acee65e7be7dcddc6d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.45.0/talon-darwin-x64"
      sha256 "5434153a5f488805fc193c655cbca46a909832d025faa32781c4b304aa9a1a2c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.45.0/talon-linux-arm64"
      sha256 "09b2e82b57b0537c2d8f490940b861ae9f8de09b49a7c9dc7c6f9670d7a0b4ba"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.45.0/talon-linux-x64"
      sha256 "7f0f2a9f015ae3a46affefda7fc80f05d007dd0aaf09afabf1d318bae4e5c336"
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
