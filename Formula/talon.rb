# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.1/talon-darwin-arm64"
      sha256 "97d7287be7c3140dc2116d9daffd54eebd6bd249bc2a108d7c3a16aa446d4356"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.1/talon-darwin-x64"
      sha256 "6f76d1acadd0d2d34f978c22dc00643d5f58821910a4610c6a2a6f5c950ca58b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.1/talon-linux-arm64"
      sha256 "1e083c56a5bc5e262d9753056731c4e760ca0a621396b6d7f4723ba282112570"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.1/talon-linux-x64"
      sha256 "51c7ccdda026614b63e90bbe2c5f4b21ae83ad4fe02fbbe4c7d1bd659c92120f"
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
