# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.33.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.3/talon-darwin-arm64"
      sha256 "02f7441351fb5c5ddae66eaea7763d6ff2c04ab28a31e6e7b02434e8bcb4ffa0"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.3/talon-darwin-x64"
      sha256 "d3a87fa8663745cc3033e39c55010dd5c97fa8f33bcefdada7575b7e374b5a7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.3/talon-linux-arm64"
      sha256 "32d6c720d94b9782a6db761fd35db5b91918a51ffdc700391623c7ce6136bc50"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.3/talon-linux-x64"
      sha256 "b32b9a0b57f1a9ce17c63d9510d5f84d4f84ddbbc6b5c41f3e07ab547b21df4f"
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
