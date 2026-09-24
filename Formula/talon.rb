# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.18.0/talon-darwin-arm64"
      sha256 "825cfd08801094a46d1a099389eef98cf8b4efa9ba4af43568b2686db2ac8fe9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.18.0/talon-darwin-x64"
      sha256 "c00b5a116e8294296867c995f3625bfc153be5edd57be44e07b11d1b4c32e916"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.18.0/talon-linux-arm64"
      sha256 "f7d83fe6597504ab68d3242a3a9a07a329d568d2a8bc3376909daa304ae7614e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.18.0/talon-linux-x64"
      sha256 "63f089c1937fb6d0cca53983d36d8b6f07643cee5b3e75d56adec5dc7cbd69d5"
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
