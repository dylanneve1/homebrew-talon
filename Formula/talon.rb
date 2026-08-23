# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.26.0/talon-darwin-arm64"
      sha256 "9b595f96cb36522cc60b9fc7365479f3dc50da9a7d72c217678be1841f81e1b3"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.26.0/talon-darwin-x64"
      sha256 "427b52c989eb1df7001d7c7655d2f2f35db6fc52f71521d2ea9548f4f9d218ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.26.0/talon-linux-arm64"
      sha256 "bf1e30e29e843229631ce8732fb0f93dd6d34962b337268e89d5a0b25e8ca334"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.26.0/talon-linux-x64"
      sha256 "beb6d5ff6b9a514da5e561c21ddcb452ccb5c74a3edc1e8cbe174c6ebc40f17c"
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
