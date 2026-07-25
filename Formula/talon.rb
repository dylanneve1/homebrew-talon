# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.10.0/talon-darwin-arm64"
      sha256 "9ab3ce91fdc28806804a8acb13329fbe977f430d0d244514e882e6ca30a4a96f"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.10.0/talon-darwin-x64"
      sha256 "b2094132296ab583309e886d5144f2fe72dfc2b89315828238a58676661be12b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.10.0/talon-linux-arm64"
      sha256 "5d6df7da2a472db20c7b25cc9eaf042b7e3e082e82bfb55dec288121504e9016"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.10.0/talon-linux-x64"
      sha256 "a237ba618ca03d3f0a13ab6dc4db1d266077cd8b03757119533673adcb8c6dd4"
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
