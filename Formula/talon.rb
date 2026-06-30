# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.0/talon-darwin-arm64"
      sha256 "a96f7ec31667efcde2473e9cc0b2e99a2264f8e65f82eeaa06e373e8c569e16b"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.0/talon-darwin-x64"
      sha256 "59ccaca80eda2bc284c88ae8cf73a8aa0cb6a97887be86616e208e6c29f9b010"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.0/talon-linux-arm64"
      sha256 "e8cd3dcd126049b9217ee2ac8163dba0cb94aef9cdd4cdf57d7b4ae6e067e764"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.24.0/talon-linux-x64"
      sha256 "c123cfbd07e7e20209c0f4f249cb397de3c38f889a65d4409d766cacc35b351e"
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
