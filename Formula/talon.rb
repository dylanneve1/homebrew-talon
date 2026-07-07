# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.33.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.33.0/talon-darwin-arm64"
      sha256 "9b5c95e9ab3108ae002798e6dd9a9c5fde5834a1e5d47693b032e8e46c538c74"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.33.0/talon-darwin-x64"
      sha256 "20ae0eae7506432732adb5e684b234b718d2edfa51f8c9b569f59d931b6b6eb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.33.0/talon-linux-arm64"
      sha256 "b9984768fed585a80a183d3f444d1d3de611ec8dbc134c1f89d9274d183f863d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.33.0/talon-linux-x64"
      sha256 "447b89b4d82ecbb2b75fdbe4c9f72c13edea2e1823408fb65016d1d67694a2e5"
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
