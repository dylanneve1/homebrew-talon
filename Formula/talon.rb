# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.18.0/talon-darwin-arm64"
      sha256 "4b179d956e972ebe4ac99ccdab836106bffe596d812684777a714cc5a8622586"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.18.0/talon-darwin-x64"
      sha256 "6948555d834bad024b2aaf50951f9a560d44545c5c4310e35e6fbbe7ad9b0e3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.18.0/talon-linux-arm64"
      sha256 "bb827970bae1d626db93212b00140d5fd6f7862326410fa1eb25beb7f4693b03"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.18.0/talon-linux-x64"
      sha256 "8bff6175e8f158dcdcf184a1348fb1843f5f3e7a74fb8d76558d75c77a01475b"
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
