# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "4.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.6.1/talon-darwin-arm64"
      sha256 "976dec3e022bff8d323a5aa441731387bedbd7ec1d54723d599da79cb9edb344"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.6.1/talon-darwin-x64"
      sha256 "7ebdf13e89efc27451bf13ed858bb736d182e69571ad7ecc5ee438d933202ac0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v4.6.1/talon-linux-arm64"
      sha256 "df8e388a28bdcf80c9ffd9bd49bbc13e08b4413c8b6d018fd94ad2f5b407b7c2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v4.6.1/talon-linux-x64"
      sha256 "b3008a1adf9b56192ebc6f94375600006bc4659abe0c344d05618f25f99f8995"
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
