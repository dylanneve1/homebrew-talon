# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.30.0/talon-darwin-arm64"
      sha256 "4c826a6c0695773db5a97e881c01204553aa447939892c2585c755fa121e1161"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.30.0/talon-darwin-x64"
      sha256 "e02e48b60e69d2d662c76398f96b040bf74891495df6fcbe82eaafbc4450c70c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.30.0/talon-linux-arm64"
      sha256 "3e23b5c5a476dbd25f15f8c9f9a2d423f83a2798036f96efdcc9b7b9f8fa9c8e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.30.0/talon-linux-x64"
      sha256 "f1ec93288e8255ac9f8b84fdcb0f2eee3827ae485e4908b936e5769f6eba1a8d"
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
