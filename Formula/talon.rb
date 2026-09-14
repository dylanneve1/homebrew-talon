# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.34.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.34.1/talon-darwin-arm64"
      sha256 "9325bc0433babf3f1421c52b50c855903b7037a690c68508964ed67c95933e0c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.34.1/talon-darwin-x64"
      sha256 "bffb9a46b1b3972e41eb1275b47c9f2b43049fe6e80673cf03fbb3a8a08ce205"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.34.1/talon-linux-arm64"
      sha256 "97ae0d0649fe5133541cf06aff7c8dbc26c613a592541e8dc2ba139d9fdc71a1"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.34.1/talon-linux-x64"
      sha256 "83141146057faa835bdfe1342e5afc62dbe00e6c80da970c1802a2226658d619"
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
