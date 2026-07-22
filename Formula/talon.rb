# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.5.0/talon-darwin-arm64"
      sha256 "d402d8e7406ad4364085cd63504fc869c1dfb0b07ce53d9f7a54921621cf5e44"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.5.0/talon-darwin-x64"
      sha256 "aa1e25750f969471356e84115135a0638ffa05c2983f084dc8afced02e470974"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.5.0/talon-linux-arm64"
      sha256 "8ab7070c7e868642b3a5c9ef25dc03505d1296b0dadf44a3be50a0eb8f56d159"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.5.0/talon-linux-x64"
      sha256 "d20145360706bebba7526d123c1b1589a4ec77b69343c9cccfed16a96fdce711"
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
