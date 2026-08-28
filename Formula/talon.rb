# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.28.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.28.1/talon-darwin-arm64"
      sha256 "88f9655ccf204ea67c2fdce5b555237a88bc52162043556edd09ff0529da0169"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.28.1/talon-darwin-x64"
      sha256 "dabc2aa7c299d2f1f36e6807b01837fbe71fda02ee96ffa36a59443a2ace659e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.28.1/talon-linux-arm64"
      sha256 "50a597cf3d549072e440520d8407a6e80259b980725ae6036285d4de0967c3e5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.28.1/talon-linux-x64"
      sha256 "c22799c2dc7f48ebb4d0dc7f25feef2e63b463a2112481fbfb7e1985a24f7c5a"
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
