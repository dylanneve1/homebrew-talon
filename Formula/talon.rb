# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.20.0/talon-darwin-arm64"
      sha256 "99c1fdfa4000552c5ebf36abf6fd0ec16f007a10a7e2c88e626faeeb73ce1cd1"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.20.0/talon-darwin-x64"
      sha256 "d61567998d3f1847186073c6cda86bba1a70d3a222d47fb8bbf6df58453d400e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.20.0/talon-linux-arm64"
      sha256 "dc96964eaf94fd909675d4a7f82b2a7ddb0b947e36dbf93363f8a58bf86e06b5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.20.0/talon-linux-x64"
      sha256 "e50ce019bd1438e107c2dbb7de8243201169b744aaedbad42d08c25a787b84d4"
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
