# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.32.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.32.1/talon-darwin-arm64"
      sha256 "ce29f0eb1d0d8b2b14c35ca5f86cf44192507e51b674b47a24a8466454a51231"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.32.1/talon-darwin-x64"
      sha256 "c11b70fe7feb35d9fd4fdf5a3d5517fee5c6d89ed6804902902a28431c776a66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.32.1/talon-linux-arm64"
      sha256 "d606352948d9a6371ce5cde6adc7e249bd2aaac34c6256f72e4046db9af706cc"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.32.1/talon-linux-x64"
      sha256 "263a2194e7038a29dc5305c79724835fe10eff9359e8d4e2e4940a294dfa421f"
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
