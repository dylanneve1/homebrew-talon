# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.46.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.46.0/talon-darwin-arm64"
      sha256 "008d38480b5f2ee16c878e90a8f05e9765512fa0cf3cd318e69f7464e04100c5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.46.0/talon-darwin-x64"
      sha256 "5f2e997ed9826e46b6552f4052a745cbc49c3354994515625d552f7c7486231a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.46.0/talon-linux-arm64"
      sha256 "c34dd8239f90332e9db80cb9ad85dbb250d6e68b9f4c0cbb27222907cc4e9377"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.46.0/talon-linux-x64"
      sha256 "c5fabd2c6600699579d0d1f27c9baafc2fb65ac878bf8df5e1d2516f93e3e3cc"
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
