# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.47.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.1/talon-darwin-arm64"
      sha256 "8844976cdf85f0ad7127284778853cd9d87c5fad05a0940187970b9a2a261be9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.1/talon-darwin-x64"
      sha256 "878fc6ff9bc64fde7ee549417d1ea49139413703db3fae5bdcfc59ded6fa3acb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.1/talon-linux-arm64"
      sha256 "e65e668895b8cb58f7485d540936d687d0fb2280faae562e2af01d453cae19f2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.1/talon-linux-x64"
      sha256 "3f2b31c68a3522dd5793443d8dfb907c59d05385fe3ab62c510f84b7a82741be"
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
