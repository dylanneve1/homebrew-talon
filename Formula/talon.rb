# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.25.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.1/talon-darwin-arm64"
      sha256 "ad148cf5a95c493e32240ee0051e4e3be7fdf82bc8d149052d1e7435030ada86"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.1/talon-darwin-x64"
      sha256 "d0f4b8318a7269d29470e716fd9b9ad321d86beb310fe2a97f05ef005ef20d20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.1/talon-linux-arm64"
      sha256 "29d3de4b3be915ef9f747c4fc93a6cb1fec6534ad94dcb8026614df8c3b3eb7a"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.1/talon-linux-x64"
      sha256 "108c7bec3a834bac3fa593edce0684f5084f346a65e8a6c75a439481b3f9fede"
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
