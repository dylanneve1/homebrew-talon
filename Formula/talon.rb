# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.14.0/talon-darwin-arm64"
      sha256 "0c63e6ccb8a6572e67e2ac91e86ca346a1b8b4eedc0a3866d8359b96edc9ab1d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.14.0/talon-darwin-x64"
      sha256 "5693b6dc807bf4603bc8b51f06be9e5c35a951d4d0deb7d6666f800b24ace28d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.14.0/talon-linux-arm64"
      sha256 "eb5af8decdff14e55f6dc206b559c4f65364ca9c56ad58894ca47bb4a73dcd54"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.14.0/talon-linux-x64"
      sha256 "b380a47f8420ff610ac8f372a80c61adfe403e90cc4c0f46bf3eba59fd79e650"
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
