# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.9.0/talon-darwin-arm64"
      sha256 "a025c8200392662b49a95a30359fbcad13128e4a7396cda8369038cc00110096"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.9.0/talon-darwin-x64"
      sha256 "be7b941a1bccd6e068437e8aca5d907d773296412bc6c6749df6c1321e79d6af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.9.0/talon-linux-arm64"
      sha256 "a019ee68a790658af4ebf976156b106afd4d8fd5d1978c0f7f5c4cb289380b1a"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.9.0/talon-linux-x64"
      sha256 "fa1d2293c7f2e8e9c7f972d970205004f57fddd692f5cf56da7d9d1e32290ae4"
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
