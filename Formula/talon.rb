# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.12.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.5/talon-darwin-arm64"
      sha256 "90f34079b131e0da0418be4d7ca0b494cb0de306018f157c5aec6639becf1376"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.5/talon-darwin-x64"
      sha256 "c524f1989d3d6857e841e56490a589655f4c5613ac5990be7d14e178cf95c311"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.5/talon-linux-arm64"
      sha256 "7b4a0644e2d82feaab6bd51308d09dbbdb540375a943603e494b98c5b6116d65"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.5/talon-linux-x64"
      sha256 "507788e29accaf00aaf1af6cf739d1a2ae7907546b0c822fb70146bd92a95e1d"
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
