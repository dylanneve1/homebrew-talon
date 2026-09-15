# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.35.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.35.0/talon-darwin-arm64"
      sha256 "118664a5661da8e8bf8f8664702a700fec33cd6362ced300fda40d3dbddcaf33"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.35.0/talon-darwin-x64"
      sha256 "35750b9333821dc63946d8e405dfb2a44db00f5a4abae448c280bdabd7ce987f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.35.0/talon-linux-arm64"
      sha256 "d9daa11af2ef9f4b7b3e01b4ecf0cbb267ed18150668cf1f7b6e09b3c7cda927"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.35.0/talon-linux-x64"
      sha256 "9841914434ef583701a7b010ebaaaa10923fab1359aeb52b75265012aeabc474"
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
