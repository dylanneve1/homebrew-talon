# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.0/talon-darwin-arm64"
      sha256 "3cb45aee9b110d074b543624d3e32739047660c97516f22fd3264f5a65629454"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.0/talon-darwin-x64"
      sha256 "a0316c4768cef85d84045344ac9ddceb191c979ec516afdba4701411cde932ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.0/talon-linux-arm64"
      sha256 "a391089bdaf2af893ac2233e96487c764e067128ac37e82703db835a3fbcc5d9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.0/talon-linux-x64"
      sha256 "094e260606ba0f3217b2893904dd88743dd2049bcb674fdb5f7dc36d872c5bda"
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
