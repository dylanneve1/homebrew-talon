# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.18.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.18.1/talon-darwin-arm64"
      sha256 "b75c992696c1ba4fab9c162f105c5efc0028614a83ed85fff82e812726537ee4"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.18.1/talon-darwin-x64"
      sha256 "b11edaaa999fa1c1af4ea1cfb93e24612cf11a7c1e5526732440be1fe37cf90d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.18.1/talon-linux-arm64"
      sha256 "576b9b4127077dad9e76ad813b9cef205a3a5aefd8314d82b1827ea334fa4ebe"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.18.1/talon-linux-x64"
      sha256 "7fb8f8ab4982bca0cdc75e1cfbb96d32e29b5059946c828740e275e1bfce0291"
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
