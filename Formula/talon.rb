# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.24.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.5/talon-darwin-arm64"
      sha256 "97e874db3f9f9ceddcfa62bb63c60ece29b881badd9d6d0f86bc354a687ccd9e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.5/talon-darwin-x64"
      sha256 "281537259f4cfe694bba3b4723cb59cce1d68761f43611afaca4a2169e1d486e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.5/talon-linux-arm64"
      sha256 "0a23de07b1b7f02b7105a128e94ac4b51b7f7ed5e2f41a8ad7b65b7b80029b55"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.5/talon-linux-x64"
      sha256 "fb37cf3aceef578c25f38cbd005a395223ecf0e2697dbe9e31f791b515c6b676"
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
