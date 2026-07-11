# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.42.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.1/talon-darwin-arm64"
      sha256 "2f0b8e1edfc2b3d336e581f2fbf6c8528f3c89e23d72d569a1cf1e8b2468b784"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.1/talon-darwin-x64"
      sha256 "db129f152c1113a752f67dcbc5fa81243e360f6b470d26304251bd184a9c8177"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.1/talon-linux-arm64"
      sha256 "c6a85db70e2718ff240de77f89c2ba25f6c8ffd87aeec539ddb15a617b2ac581"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.42.1/talon-linux-x64"
      sha256 "579e4037ef9f5723d6c100fccb748c907e3e4d9612da22ee24bd9f46980950a8"
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
