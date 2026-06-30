# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.24.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.3/talon-darwin-arm64"
      sha256 "94935af64e7e75d238de078f5850aceeb0e9d696e08009cffbe498fb21088272"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.3/talon-darwin-x64"
      sha256 "f9bca24bd32313e5f1890cb42639774b2b336c899a9712f94971225776f06c50"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.3/talon-linux-arm64"
      sha256 "32d3d0a15f359906d5753b514ded99234e62efefe3968c27e08a69233e91188a"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.3/talon-linux-x64"
      sha256 "8d496b110525ff4afd37872cb1ec5cf66266fea63d63e1d1564f97fbf73e39ad"
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
