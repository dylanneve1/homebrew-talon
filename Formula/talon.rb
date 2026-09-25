# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/thefalconry/talon"
  version "5.19.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.19.0/talon-darwin-arm64"
      sha256 "3a2e757e4fae4b2d8ee6cb8dc10f49869dd4a9b3b239d566f33712d6c85f48d2"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.19.0/talon-darwin-x64"
      sha256 "4257ad11dcefcca50058964a239baca7ba78f48c941c7dae8b37d7ead101f21d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/thefalconry/talon/releases/download/v5.19.0/talon-linux-arm64"
      sha256 "5cb90f1da4338e9f284ed0dec5a3e9604fd545e89eb0550e3ae7b460732f223e"
    else
      url "https://github.com/thefalconry/talon/releases/download/v5.19.0/talon-linux-x64"
      sha256 "e8e8219c940e473bc4df43f48721eb67571ad8109c63282c435aa3a0ee6ebaf3"
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
