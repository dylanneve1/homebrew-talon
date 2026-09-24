# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.15.0/talon-darwin-arm64"
      sha256 "95ce0aff3735036c21aae904e2fef4d61e8895c38046cf2b74df873533641f68"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.15.0/talon-darwin-x64"
      sha256 "3dc9bda16b9afa1596bc161cb3a7f6549d20713e5dff82e853c7abc101c80041"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.15.0/talon-linux-arm64"
      sha256 "d0b36c874dcb52cd69438f35aad1f9b77b9009f520055a758f0d6f7239aa6908"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.15.0/talon-linux-x64"
      sha256 "b0a559cddbd376c6e7ca1c734505974954d075296fd5eb0fbfe536736a604774"
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
