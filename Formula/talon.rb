# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.42.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.0/talon-darwin-arm64"
      sha256 "352ef8fc346a3395d4e2cac2251b2edc225c1eb2b53fb83c7edc506efca82fd4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.0/talon-darwin-x64"
      sha256 "89769bc46ab07e43aba3cfa9287800c09c493b629f45e67b1f04b5908572a12a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.0/talon-linux-arm64"
      sha256 "30e28619dd9244b55e248c21c382ce38124dc503fb2843e4bfe0ffeecbf4099f"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.0/talon-linux-x64"
      sha256 "aae44841eb9ead49a898df95b2f41e94f6e712ac3f6a7be8953b0f034585f2e2"
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
