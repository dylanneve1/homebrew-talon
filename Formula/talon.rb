# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.0.0/talon-darwin-arm64"
      sha256 "01aab84b4ebec4c1ad95aca63474511816f75c42cf9f6a9d14564faedc2a7d66"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.0.0/talon-darwin-x64"
      sha256 "6d6ccef50c8bf5bc488b3efa6112dec9a38f48a7774468bddf367c07c245c089"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.0.0/talon-linux-arm64"
      sha256 "59f0019c4d442e907f7559111df2988a11a2131cdfdc2b6f8e219b22c6ff3695"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.0.0/talon-linux-x64"
      sha256 "ab556ad183a7c6f07cc6f10e86dc5447e2a71740c1a1f90be99a0d428ac12698"
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
