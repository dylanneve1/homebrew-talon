# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.0.1/talon-darwin-arm64"
      sha256 "d6061dc631dfb0992387fbfc77cdfbb3401ddf3883117e3b0f3e29802a0dce3c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.0.1/talon-darwin-x64"
      sha256 "a410845289e67430807338dbad2915adde382572df619b0c1f36344204aa984f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.0.1/talon-linux-arm64"
      sha256 "edeb9d7316164497c4116c214f4de7144bc26dc54cd3b4ce68c67f64dd835cc7"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.0.1/talon-linux-x64"
      sha256 "010681e2acab0038d43cba7388ab18464bdc6a1ec1f367d029fd2936545f21ed"
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
