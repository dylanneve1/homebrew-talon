# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.30.0/talon-darwin-arm64"
      sha256 "1a7e41ea5972c7e2d2649ffa17fd90372e983184bbf7a4d0fcd4c110fa9df914"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.30.0/talon-darwin-x64"
      sha256 "b520c1f9366c15f6853931ed6cfa32565be41e38dea67456c8effd04977dbb7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.30.0/talon-linux-arm64"
      sha256 "7476f46d8626c2a1a8518a1bd8a94cd7b7cc9d10b4fb6cbc09885713759044c9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.30.0/talon-linux-x64"
      sha256 "0fe170e2a689fff68f825e57f62a00ab4224b3af18276272be328ea82769ca94"
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
