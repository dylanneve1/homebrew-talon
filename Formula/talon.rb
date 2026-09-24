# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.11.0/talon-darwin-arm64"
      sha256 "087b9c356bb11614d86466e10d36917c9524f3fe9f413d5c69984cbb42c8e4ff"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.11.0/talon-darwin-x64"
      sha256 "339df97eb508520a20c4d4544117d70b6791fb9ce03e2f9f66e54544a7dacbaf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.11.0/talon-linux-arm64"
      sha256 "318f8947b465d55393aa0a8c45ef3d35c0c4ed6766a67b6ad4f7d7890c041cf5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.11.0/talon-linux-x64"
      sha256 "2e79a93974bd4cf08dab82c99dd83698f8e2e3666a75cc150a31fe22729f3e28"
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
