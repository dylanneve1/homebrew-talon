# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.33.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.2/talon-darwin-arm64"
      sha256 "bf8e20f94270469b2f6f84fe027f7b0c315a0fdcd7f264202997c7e9b7a14bae"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.2/talon-darwin-x64"
      sha256 "bf8bebafc130ed6365b95b9a06b3cf40fc79ad57d693a6d7670a366ae3f2a0c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.2/talon-linux-arm64"
      sha256 "69986ea26a33ec8d779e65f1a0081dc8703070e09b03afddd46ebff089937445"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.2/talon-linux-x64"
      sha256 "abb5d200f7698301ac9033e48a794091bbbe480d5a7fd2a145bd1aa810b0d479"
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
