# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.29.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.0/talon-darwin-arm64"
      sha256 "37b29bc3fa7cf7cabf6fd38a4d74c111636e429cc40cc75c891d2d1cef6ef985"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.0/talon-darwin-x64"
      sha256 "733b9e5d206f18bf7bd45f0beb6fd4e539433c2e75ee2a24ada1e634469f7cdc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.0/talon-linux-arm64"
      sha256 "f76c07f65952c72206a73bce892d5c5811ea47458605a00b671f5a1fca32a9a4"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.0/talon-linux-x64"
      sha256 "e6b64e66e3d358758964ffece54a46e3bc156d55b1e8fa2066d5b1af0f1e190c"
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
