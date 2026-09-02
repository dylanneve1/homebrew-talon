# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.33.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.1/talon-darwin-arm64"
      sha256 "fd86c8e8e1c5dcea18b783c09501dcf834587d64993291c4c54a81c2d878cac4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.1/talon-darwin-x64"
      sha256 "c7720d34eaabcd7cfbf9ecc4f928eebb99d4f85be6fb8f43b39e72e0fa6644aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.1/talon-linux-arm64"
      sha256 "00769b42f7eb692b6aefde5960a1d22153debfcff7c66af65724b0c6929821a8"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.1/talon-linux-x64"
      sha256 "f8bc976f38cafb083d46ea91a96582f346ed4bcd665eecb32fde150b6d9131da"
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
