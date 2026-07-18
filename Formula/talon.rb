# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.5/talon-darwin-arm64"
      sha256 "0fb0e829a60b9c0b51d0fafbf5bc2f74210d1d0f8a75efaaf3549d47ac0c7dd6"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.5/talon-darwin-x64"
      sha256 "e0ec92517c260e407bb4b64e3a7d81dcd3afd66c36825ec56461c03fce0e39c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.5/talon-linux-arm64"
      sha256 "687194556c2f45980edd826a7dcd5028efdf9e8bd2f3699e7ebd391a7139c50e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.5/talon-linux-x64"
      sha256 "bdd25af0fe146415900c1c87fbeb893adb64360e69f69f76ebff4637fb51f474"
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
