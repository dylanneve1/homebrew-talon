# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.37.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.3/talon-darwin-arm64"
      sha256 "7cf77934a6f481c3f72eddb93ddbe7dadc6d827a3fb2ab22167d023c5703b6e9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.3/talon-darwin-x64"
      sha256 "5c31083ab993888103c83422a84b30ccbb11dfeea00d1f04db040c9af3981f70"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.3/talon-linux-arm64"
      sha256 "40f629b1ff65b5a719c847cbbb3b40929e25f0f154e944d70c848bba6e8355e9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.3/talon-linux-x64"
      sha256 "9219ed5e2285e90c9d8fbf5b86434780ec5ff8e5eae078edaaa5d86ab04e94bd"
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
