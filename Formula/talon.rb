# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.38.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.38.0/talon-darwin-arm64"
      sha256 "eaac1ad401a9303fe8418cf6d33a9cbabe85edc83e11cc07bd873ad47e5ba062"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.38.0/talon-darwin-x64"
      sha256 "558e3cd8c8de654628c0312a1d56f7ff37ef559092f07277c10c86372f9c8c14"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.38.0/talon-linux-arm64"
      sha256 "3704de7bd83ca033cbd96609484483927217bc94d52d9a828c3537b436f28007"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.38.0/talon-linux-x64"
      sha256 "d0b9abd7aab16a18ec58f6b886ab3207a1a4706046e8fe94b6f89edf174aca0a"
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
