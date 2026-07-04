# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.31.0/talon-darwin-arm64"
      sha256 "918d7d677ff7dcd55dc87f9ccbd2df79cbb20a6d3ac6388b16b6b113e646308c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.31.0/talon-darwin-x64"
      sha256 "2a473e5f87e5a571fce403fec35f092b557e5b78467d6e675c15b7ff2fb2b6bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.31.0/talon-linux-arm64"
      sha256 "b7ae5e02c29cc050cd98e5d2a7cafbf1be7b7a6faa56c147d59cd9facc42804f"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.31.0/talon-linux-x64"
      sha256 "03dc2dab79ac8701d2b4e596e3356c0eb28b504b1f27851a932d05c044685e02"
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
