# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.39.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.39.0/talon-darwin-arm64"
      sha256 "2ddba12f4441a2610791974259b0f2590e86fe905e9d44254a7176769121963b"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.39.0/talon-darwin-x64"
      sha256 "08d584f21e1a1118b0e8a7323a4400a48e3efdc55461a3d8999d793eb75a3ad0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.39.0/talon-linux-arm64"
      sha256 "b6da06b43b5b729d4f79264e49742a5067f5881810b60827102897b2d8a09b01"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.39.0/talon-linux-x64"
      sha256 "d8d1d56784cbf24ab971241aa6327010d4275ad9f5c7e365c5a38e5b9f52436f"
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
