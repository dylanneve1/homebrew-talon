# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.37.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.37.0/talon-darwin-arm64"
      sha256 "7d6ac062cfacea19dd1368ca3e149b7493013595c4ed38710cd4f5b4655ada92"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.37.0/talon-darwin-x64"
      sha256 "d158e81c2ac179dc454b615e8aa9d4df4729d9b0dbe56b21b1c73855d36f4275"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.37.0/talon-linux-arm64"
      sha256 "ee695bcb13d691c8c988d79f799c3742e59c653ab092db800d2c95e06dfd9a29"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.37.0/talon-linux-x64"
      sha256 "4a8828308a73ce59ade1cb0a8ccf15b56a71c1761190e866777724e5ea2a4ffa"
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
