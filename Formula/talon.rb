# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.52.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.52.0/talon-darwin-arm64"
      sha256 "ceb850e52ec7bb06fc00b1a960f5eeca4a4ed3ab0139824c5b81a9be3bad56b4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.52.0/talon-darwin-x64"
      sha256 "7f664851103294735f97e58937a2c17f56e203e003ca974131fdaaef24fa7136"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.52.0/talon-linux-arm64"
      sha256 "de839e71b1e22f6080457f3e3bbb5bf66608b438a348f71ff89e24335704dbce"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.52.0/talon-linux-x64"
      sha256 "f77ea1681c4e2d074864d11dcaedeb0d8065368bbfd8b0454d40a2868db7432e"
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
