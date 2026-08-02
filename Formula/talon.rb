# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.15.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.3/talon-darwin-arm64"
      sha256 "d813cbe097734ffec2889a31072ab24d3e1dc6853e307379ffe0b4bb5ef9c017"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.3/talon-darwin-x64"
      sha256 "bd75fb88f5356be8d3ebc18cc2d4dd87be3530c200bca1bdccd6707e4ad06b81"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.3/talon-linux-arm64"
      sha256 "cd2c835195981df70ff3fcb991d0f0d2fa06be5acdfe4571e0422d8f17e28a8b"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.3/talon-linux-x64"
      sha256 "afa4515523d9cbcab856a4fdde6826a43a3d4b71a03e5b42eda48590e8628432"
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
