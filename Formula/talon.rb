# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.16.0/talon-darwin-arm64"
      sha256 "f9b0bf07092c05806344ced4e65807b7a8ad1cb400f0d8ab991080fe3254117e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.16.0/talon-darwin-x64"
      sha256 "a5cadc32dbb82802209e53c743a50383091a0d31e6b901b805f9c72ecc0f1374"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.16.0/talon-linux-arm64"
      sha256 "0e7e2f676a23d17eb726800d0fbdcd32aea70ae331841a88f326936606bd1462"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.16.0/talon-linux-x64"
      sha256 "77348815efe41baef2775c2afe7cbde421096024791284435b61ba6ddd061196"
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
