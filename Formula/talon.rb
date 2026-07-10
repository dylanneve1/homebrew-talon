# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.37.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.0/talon-darwin-arm64"
      sha256 "0ea8c5276efef019cc2219addcba018210765fd50603c78c8af6633e1803e728"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.0/talon-darwin-x64"
      sha256 "c41fffe260346b92abc5e984a3a26b49c00d0a947aecad6af8f35dc169e1c707"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.0/talon-linux-arm64"
      sha256 "c15a83eae505581f0e35ac05a4ab2de607288382264e423d0412b8c31b9f9310"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.0/talon-linux-x64"
      sha256 "b65e22b1d51e822693bb480bbb6cc86f7124ee9f11a29ee5b7e6c502953b9060"
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
