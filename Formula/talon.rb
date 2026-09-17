# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.1.0/talon-darwin-arm64"
      sha256 "5a7fb248a0a8289062030dca62cafab77c784f7602d05ca1ebb5cdf3bedd275b"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.1.0/talon-darwin-x64"
      sha256 "331b72de075448837132712c5633ec9aadf993b55bd33e8ff00b15cfeec40458"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.1.0/talon-linux-arm64"
      sha256 "8c08072a77f28c9b4d251fe8ea9dbc1637f5f91896e3294ffc57fe030af2d01a"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.1.0/talon-linux-x64"
      sha256 "c6fdc9be6799fc29ea944954728511fcab4e5c5f9b35069da16bbca19c7db2a9"
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
