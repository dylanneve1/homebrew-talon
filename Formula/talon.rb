# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.8.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.2/talon-darwin-arm64"
      sha256 "92dc71ef7c04e3d8d7be306ee18c8ae147e52d9b188a61265c5ecaee2fe6945c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.2/talon-darwin-x64"
      sha256 "17488564b39029d025d2ee3415c717627d5d87c874d316bdd948006ed2a17f3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.2/talon-linux-arm64"
      sha256 "97a3d61c7e3797966169c976b48d9a15a657205b44fcada54aed12277dfa4ecd"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.2/talon-linux-x64"
      sha256 "32c01273faa3042d7c161fe51506f929887bcd0fe27d13fd1928dab4782e8ce0"
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
