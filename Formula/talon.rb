# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.36.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.36.0/talon-darwin-arm64"
      sha256 "db2a0e3d029fe4e0e13caf500a7bd5973010081026d06db94153d45ce7a626e2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.36.0/talon-darwin-x64"
      sha256 "c8dbd773e49c5c470cb9337e74faf733e2dd45f92d270825388e264fa5cd4b83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.36.0/talon-linux-arm64"
      sha256 "3cec1d5a78e96d734a76012cbd2e00b78ef2d49c1892cb8aa4d45ce9e8cbc2c0"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.36.0/talon-linux-x64"
      sha256 "dfba43c272f7823de720a8e0aff62a11f30a8abb5615c249541045ce89bb95cd"
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
