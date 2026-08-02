# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.15.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.2/talon-darwin-arm64"
      sha256 "c924990d453497d94f294a2cb93c13a7ce18d795bc43926a123d0b6e165fcb77"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.2/talon-darwin-x64"
      sha256 "4ffb94b8c7a6815ec3b5d4b0c708fd29f5de927c4934970fe9bdd72eac229172"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.2/talon-linux-arm64"
      sha256 "8c4ba4e3fa1cada4f918d6aa6fe36729e8f32317802fa81d77ec1f81ebfc1d81"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.15.2/talon-linux-x64"
      sha256 "6543742109486d874944aa55c47060a12dcdafd7074cf3ddb033ba17ef6e778c"
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
