# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.47.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.0/talon-darwin-arm64"
      sha256 "19cf313adc7738e3d9ac507ba141294da9e08063679cdff5876669d53f139bb5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.0/talon-darwin-x64"
      sha256 "4f73616a7f68777efcd8e3e9d640bf079ef08e8a7fd3f09c823cb09b23b533bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.0/talon-linux-arm64"
      sha256 "2627cd97cff78a46a7bac9d7555026285e4dc88342150289c15d5b3096f843ef"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.0/talon-linux-x64"
      sha256 "41ec6a792288a6353c75aef3e7f0082d520366498fc1430b8717525863d7ad4b"
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
