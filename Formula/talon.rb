# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.22.0/talon-darwin-arm64"
      sha256 "38d382aa60a33969478ed569187c29a9cd0feb4845805f3b462c36e7b891dc80"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.22.0/talon-darwin-x64"
      sha256 "bef864303b0fdd7f2cb843d88805f1d322eb9e7b9499758875b24c482f3be801"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.22.0/talon-linux-arm64"
      sha256 "93a7d52fbb778d78d4bfba01947793f3e0f00ca5a057c450a0bbbc92773ef776"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.22.0/talon-linux-x64"
      sha256 "b62aac2bd52744c70c6a3ee5937bbfa55f84b4309c5948bcffe46aacb80140c8"
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
