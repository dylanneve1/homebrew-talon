# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.24.0/talon-darwin-arm64"
      sha256 "5ccd344dccde44c3316847acf4f4de547e46bc1f7f887bde57c0afce02e7e1e4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.24.0/talon-darwin-x64"
      sha256 "ad764ea4dd7d4e0560301196799d32c1926a27d1da6918657fb1c7c76b81030d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.24.0/talon-linux-arm64"
      sha256 "1b5bbbfc7bd9b9db2bb93aa7c9f3b8405d2c59a6a2b9e222a4707bc001ead11e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.24.0/talon-linux-x64"
      sha256 "dc9537fb9b124d60b6fe571e547408fba216f5acaa7532695c152964b8c45ed2"
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
