# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.5.1/talon-darwin-arm64"
      sha256 "af266896ca86ac433bdd247b25e40293391e3406d9e8272bfafe38e150de5dc0"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.5.1/talon-darwin-x64"
      sha256 "9b92e32785603fe5177d1e0f247d7a8ac313e08d1cb8568edb6b96946ff76f37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.5.1/talon-linux-arm64"
      sha256 "0341efd0c83fda8ea25d4caa8206b86e94edd4d7b56494ce66ac38e617b8b283"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.5.1/talon-linux-x64"
      sha256 "656925f5b62be80b3d1d5ff7f29848f99b4bb1352d09dec1b2fca3496c0a2798"
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
