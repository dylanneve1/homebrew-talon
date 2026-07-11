# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.42.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.2/talon-darwin-arm64"
      sha256 "cdd2e4cfe9e53c26463bf4d1e1bd021e4b4c902924d5d1a45b427190abcce2e2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.2/talon-darwin-x64"
      sha256 "c9cd8116f076360176793fb77037f2e0b186b8699fbda10b86af1dce2c8375a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.2/talon-linux-arm64"
      sha256 "3e1702412eacb4caca983dc6da383bcce5522aee60d41c88be4cb9287bd2f4d4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.2/talon-linux-x64"
      sha256 "9f66f2573eee8771a5aee37fd35bbffd77e496adbe2a7e330c90f6e6f99941e7"
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
