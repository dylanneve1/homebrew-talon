# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.6.0/talon-darwin-arm64"
      sha256 "91c70b78e15d08d771901d865f0e1e20dd859f54c6fd775bc800266a84a512f9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.6.0/talon-darwin-x64"
      sha256 "8edc64e892adf08f7791890a4d3ae79fd61b189f8213d3ea17bbb5a98ca5ce67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.6.0/talon-linux-arm64"
      sha256 "5e95b6bc384751828145d302ea331398d57e0eef366e0ecbfeb7fd1253ce6500"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.6.0/talon-linux-x64"
      sha256 "416f71f627b3da1a2ba09432d3c6ed9806280be89a53911665ca959eb68badcf"
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
