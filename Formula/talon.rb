# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.29.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.1/talon-darwin-arm64"
      sha256 "6e0ef46d47bf5adbcdf1d2b049907495db05520aad344d478ea7e6b6c303559f"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.1/talon-darwin-x64"
      sha256 "e6a9ed8b9150f77f60f7efdef7155b94cb15474bde0dd9dfe8fc1a57150f4b05"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.1/talon-linux-arm64"
      sha256 "0efda5877459c25f265b0f0b5bf625d359b4a474862e2585938bca8d1b903d6d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.1/talon-linux-x64"
      sha256 "6f527a610ad950ace09cf9f4a6f4523b3a5d8167268fb7062a6caf7fe9c88f35"
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
