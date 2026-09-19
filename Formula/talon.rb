# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.2/talon-darwin-arm64"
      sha256 "567790efd1a01fc324d5b6f6980a08a57d1a8f4380c76c42859b4790d759a23f"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.2/talon-darwin-x64"
      sha256 "f816b151a0b99bac742c9665bce82480c08c52df0f40c3152f85c426b932abd6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.2/talon-linux-arm64"
      sha256 "b949347d0549a5dec19d014249d26e14e11e9eb1994da965b7cb1b6eb3361442"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.2/talon-linux-x64"
      sha256 "79ebf9583bfc50348f7fec0440f6980a2c50abcdd1656436527d604a8cc4466f"
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
