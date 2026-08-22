# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.22.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.22.1/talon-darwin-arm64"
      sha256 "f00103a60190ae785df1782061d788ed31f27107beda78184cd21b186b08e14d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.22.1/talon-darwin-x64"
      sha256 "d75adb0db46b788156909cb4710bfcaddbac50a34855a467f5dfad6079aa53a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.22.1/talon-linux-arm64"
      sha256 "9ad85285eb5b6e57d67fcc313381432d0078fba99e5021916cc26473298bd3c6"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.22.1/talon-linux-x64"
      sha256 "1906e29988e5e65086626cd40f8c2b68e0689c8b4b514873a48047b8c9527245"
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
