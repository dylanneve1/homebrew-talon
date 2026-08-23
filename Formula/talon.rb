# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.25.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.2/talon-darwin-arm64"
      sha256 "1da7a401e438578b59b65ebc9e5e5f8c624f9ae4600051ce92b2e9dfefe9504e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.2/talon-darwin-x64"
      sha256 "69342db5aaafc95bbebbec5d168639a2a7683f1bce376b765b57e271fb0d14cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.2/talon-linux-arm64"
      sha256 "584d2508c8f6aded46aa360e7422f6399b1b93f6c83c4415137c4fb08c9bb917"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.2/talon-linux-x64"
      sha256 "04493ae8b20a3a0da987472d9c3a3d5bc75b585803a674353ee098f850e0707e"
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
