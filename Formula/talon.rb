# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.16.0/talon-darwin-arm64"
      sha256 "87ea08763ebc5ff6072d7821ed45049ae3fe67fdcf27a17eb2c212b3c7aad962"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.16.0/talon-darwin-x64"
      sha256 "3f79d492c0fc116b8e53d7428304b242d7d400d0e5589860bb1490edb42a9dd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.16.0/talon-linux-arm64"
      sha256 "648c367aa405ae65d05de27ebe4a69fc0a3ba170d42c3374d2968f1a9cdb3465"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.16.0/talon-linux-x64"
      sha256 "e177e648b22906ab4438f2e4e54ace78f868efbbeef9e0a40b6b5a4f6361b62b"
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
