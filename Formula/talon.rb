# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.0/talon-darwin-arm64"
      sha256 "fbe7718f359e5195700c72b0351bc65f9a8813cc176649220277a689b5038494"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.0/talon-darwin-x64"
      sha256 "dd940c02a940e6d957d45b8afce494647db74416627adfae97bb59abe95f3ee6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.0/talon-linux-arm64"
      sha256 "93042ab82a571c14c9a7fcd839d83c50a55a53ab4b914892ed7be97e7120e490"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.0/talon-linux-x64"
      sha256 "f7d8764eda256f982f83f76a46befe2924cce39a4b770e6115897e019ddae879"
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
