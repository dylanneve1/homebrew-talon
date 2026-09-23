# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.10.0/talon-darwin-arm64"
      sha256 "09c8c6f19a1dfeabedd1b282a8d5e16e8eb96eb08250ebdf2f8c19a341faa549"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.10.0/talon-darwin-x64"
      sha256 "d131b1f2ffca5eadccc52909d3d210b2c6a3dbcb5aac0fe73a562c0eaa98d5dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.10.0/talon-linux-arm64"
      sha256 "b30417747bc829fb7bbcdb280996dc6fa23d83726eabec3d41ce04cf5814d9d1"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.10.0/talon-linux-x64"
      sha256 "92ebe460e724b9d24d89d53130395bda3058e41a5c23a2165d60ced0f26e1427"
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
