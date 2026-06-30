# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.24.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.4/talon-darwin-arm64"
      sha256 "5d7dad78259d4b19e2327ebeac97e8cccc161b65c823738775902f2abe07ebf2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.4/talon-darwin-x64"
      sha256 "dd9eeb30d54bac19c9ec83a177cdf82466e4c7558b9525e14f398f169d9ad3c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.4/talon-linux-arm64"
      sha256 "357f9532f0a8376ab5d1b1bbb2abf185981a1289f100681546835b9762671420"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.4/talon-linux-x64"
      sha256 "16109352f21fa447939afab05cda8d220a749564eaef33714eb0612d79a1037c"
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
