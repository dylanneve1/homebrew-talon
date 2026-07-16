# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.51.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.51.0/talon-darwin-arm64"
      sha256 "871d424ea3368f06c90bd22ac9c2a07369f018e1fb5d5e7f60fa6fd76cab2c62"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.51.0/talon-darwin-x64"
      sha256 "a00211724a797b4d49722f0494a1d918c7d06d58b01165216973b2e225af145d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.51.0/talon-linux-arm64"
      sha256 "f927e75ef565baba09a0007b477bb37bf5716c556a6beeecfc86ce06ddf20890"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.51.0/talon-linux-x64"
      sha256 "fdc1c5bd7cf62ec97c412adf060c7f8b64d4a50d8f6726f7f676540261dea26e"
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
