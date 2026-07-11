# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.40.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.0/talon-darwin-arm64"
      sha256 "154f0659b859dd1ccd8bad9b2277cce9f74a487c99fc2edcf1dee740de5048e9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.0/talon-darwin-x64"
      sha256 "96427cf85a7a918eee85c7c86cae6712efd41dd5dbdab9e25e51925ef18691b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.0/talon-linux-arm64"
      sha256 "e7a00d9a5a9daef72157d979333bd8adecf8e053e976969216c2b2170a21ca2c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.0/talon-linux-x64"
      sha256 "7badfb657c90a67468b20fcdd1a740fac71076ed9b90942a90317f8bcc70b00b"
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
