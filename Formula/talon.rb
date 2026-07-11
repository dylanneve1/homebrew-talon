# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.41.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.41.0/talon-darwin-arm64"
      sha256 "31809712c48f6ae29cb4b54bd65098de5f6c51c4670596e74a4b66668f371773"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.41.0/talon-darwin-x64"
      sha256 "2cfa4af8bf5bb0e265a636e950d2dd05399b655a1e721211d37d5ed37ae6736c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.41.0/talon-linux-arm64"
      sha256 "4792d652eb153c6dc4fcb749aeb82f211be804be20c8bedd66f2a26ae1c018df"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.41.0/talon-linux-x64"
      sha256 "913a78aa826604d37d333c4bb5acb5970d0478ecb4ba25cca09cf5cb15c81a31"
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
