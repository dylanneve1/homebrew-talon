# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.1/talon-darwin-arm64"
      sha256 "3d2ccf206de557d1ac251b65d08d3f6fc8b0896a7a98cba0fa7179971811207d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.1/talon-darwin-x64"
      sha256 "5d4dbb28060b041abf1263dbd88a692b31ca2be8218bdf2b80b1f73b2e47a3a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.1/talon-linux-arm64"
      sha256 "dd273b64bafa9dcb8ddb30eeebb44cad8208f8a7d7874a6553d7f66a82f2b84e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.1/talon-linux-x64"
      sha256 "bdb8a9ae81f7d696f580b4046b131061f42d5cd40cd4676628e7e2f6fbd42f1a"
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
