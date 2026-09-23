# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.6.0/talon-darwin-arm64"
      sha256 "48738b617ebfb581ab7a009070afaddcb4e4caecb566fb612e93ebd0aadd11ea"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.6.0/talon-darwin-x64"
      sha256 "d49922bd82230f69b119a6f40a379394f25b20ecd064e0dbccdbd004ab8fd216"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.6.0/talon-linux-arm64"
      sha256 "f801c2b91c376bc2e89c36dab02e7fc9bf61fe73f28580d82cc7091cbc888a9b"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.6.0/talon-linux-x64"
      sha256 "c78e2564407f255ebed882f8d4bb36ae1959de8397ab7af42d24e38dd1d1d221"
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
