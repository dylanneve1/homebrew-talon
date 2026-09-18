# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.2/talon-darwin-arm64"
      sha256 "556223954b454c62d92f69ec596bfa05300d7b1a8cd7ab14bfc1f42fedf6c38e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.2/talon-darwin-x64"
      sha256 "d0f9860a75fff4040ba819e22d191fb6b62060b0300485813e9d7963af0bd49d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.2/talon-linux-arm64"
      sha256 "1407258cc236cf01e2ba29297a32766a2139e392fc0826a7c3c3a9119ad71109"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.3.2/talon-linux-x64"
      sha256 "fc2ce278ebade10e3c4a143b4b786812e0405881e937a8196c3a14bd09b4e362"
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
