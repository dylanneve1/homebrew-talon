# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.4.0/talon-darwin-arm64"
      sha256 "6751cd906ec406276333da8d079e4189090166910196f831f733e7ed147315b0"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.4.0/talon-darwin-x64"
      sha256 "344aa31b825ee8c6c91fc591197281ad2da5a9e592d706f61cd5317efade088a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.4.0/talon-linux-arm64"
      sha256 "3f01fa98d8f17aceaf798c36e62e8b8a81af4869d2f57a0629e4f691a947c5ab"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.4.0/talon-linux-x64"
      sha256 "6265f11c4fb25289e9d5377b587b49d447d0081a021e57119c893b3bcd692738"
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
