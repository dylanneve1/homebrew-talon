# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.12.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.3/talon-darwin-arm64"
      sha256 "9cb77edba1594d13dafe7e8dfbac3c5a0214f169a8c691e13e60e8bb47584702"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.3/talon-darwin-x64"
      sha256 "c465f5c21777eaacc55bb3b2db84ecb52c503249b5f11ca272eb9c3bb4dd276f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.3/talon-linux-arm64"
      sha256 "4c722af4e2e1a82c7c888545fc3696081642700e3b3c8d336cd55a46a52cffff"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.3/talon-linux-x64"
      sha256 "c6de6510771de7daf267b519d1208f680b4e1e63064915815d7418554fff434d"
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
