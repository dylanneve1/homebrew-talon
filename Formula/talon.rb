# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.9.1/talon-darwin-arm64"
      sha256 "66235a2a77bbd2b364be6de449b611ea3c9e128053700d462154b7c10edc0573"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.9.1/talon-darwin-x64"
      sha256 "028e7e72ed72a3598e9359a39973d3520bc8e0d0a226d04ac81cb644a82d1d4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.9.1/talon-linux-arm64"
      sha256 "b24ec31321c39dd634ae82fafcc67febf3745563c5c594fbae9741ad854b9115"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.9.1/talon-linux-x64"
      sha256 "7a49e0918aeb6a29cb3a5d7262a6f8f063ec74a271c6749e51f287692f83bc09"
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
