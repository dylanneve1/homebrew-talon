# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.18.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.18.2/talon-darwin-arm64"
      sha256 "a9e154e81bd70520d19e26e9d783d1fa6e9700380c32aa6c8ffa65c1c8a6bc0f"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.18.2/talon-darwin-x64"
      sha256 "aded4da0b0cf2570753221f55463fdcb45c2aab7889d71365082745fcefd975a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.18.2/talon-linux-arm64"
      sha256 "183e2a56ba59cdcc1f0851f8418e3ca3baeb2bab2c306de249778a6bc8827d85"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.18.2/talon-linux-x64"
      sha256 "8857feac2b46a99c9d278eda073d1187c87a5f22ad09208b33cc61175a8852f7"
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
