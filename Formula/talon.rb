# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.1/talon-darwin-arm64"
      sha256 "91d1f80c697d222245f80878d17a907222dcd6a5fe2d62b9ed9d478bd50c4f84"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.1/talon-darwin-x64"
      sha256 "6e86a3f92c11c49585f5c7da7de62db798a075f8a8a48566c1ac03e9837c1fa1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.1/talon-linux-arm64"
      sha256 "6dacbeb72932012ea8f88fd261a826581ccab8a27d1947b0b59f87e0b6855be5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.1/talon-linux-x64"
      sha256 "4c64090f243e993a9a72c60af3fccd35d80f1f8f49c0cb8dde751a9e6daa87ab"
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
