# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.44.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.44.0/talon-darwin-arm64"
      sha256 "90d2e00742c009fc4177b84b04d97b99cdfe324468bfd43dfcbec0d3740d7817"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.44.0/talon-darwin-x64"
      sha256 "1031f61c3fc564e2a982f45292efad2711e20c643d14bd93d87aa0d984ef5a48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.44.0/talon-linux-arm64"
      sha256 "953d373d5c615bd2b074f644378aa4042df39074f802c4da1b979de755232a9b"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.44.0/talon-linux-x64"
      sha256 "ef7cfc9552619d69e23e71910ff3cf14dcb38f6435daa585383403e0b67c450b"
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
