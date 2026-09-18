# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.3/talon-darwin-arm64"
      sha256 "2d0e283d1a409f9d46097b6e130f781301cc0cec0d240fc2f7b1711937b39c26"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.3/talon-darwin-x64"
      sha256 "9e4efbc06f3fc9ce9c6f08c99f0a52afec762e6dd9ae4ba2f191276afd07b20c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.3/talon-linux-arm64"
      sha256 "ddea44889fff2c933be00793c841bf5781319149824ca7b4bf709fef21fad22c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.3/talon-linux-x64"
      sha256 "ff84e7b3554166b49b09a1af983b82ccedacf43777d1195cbcc39eddf32cc704"
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
