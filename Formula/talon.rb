# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.26.0/talon-darwin-arm64"
      sha256 "ea974027586e99d0d6fbc500ef199b484853143a3a822da10649186834f8abf4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.26.0/talon-darwin-x64"
      sha256 "779281ad252cb2360aa773fbdc65a65dd982fb879429e6af458189b78b129e64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.26.0/talon-linux-arm64"
      sha256 "54aa4f7547dc3300820208e915f0b4d902818cf0af94cccefeda51750d06b075"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.26.0/talon-linux-x64"
      sha256 "3439cab592ab0516f091bbcb628965cbb611d789c2aa481890fcfbda043f8d11"
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
