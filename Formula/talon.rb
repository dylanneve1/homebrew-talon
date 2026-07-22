# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.4.1/talon-darwin-arm64"
      sha256 "57c4322dfb95fbc2831098421f0800d47fc1c3735a7beb1af7e9c75417082383"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.4.1/talon-darwin-x64"
      sha256 "31a701cfc62da6215197047dc2eb51d76ac2a6198950295feb230203426bc801"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.4.1/talon-linux-arm64"
      sha256 "c483fa7275747bf943d5248bf1cab1797e2ea9dc4595142761a3b87ecf7bdf69"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.4.1/talon-linux-x64"
      sha256 "6dc34c9fb37e7cc3f9842c9cc3006c9b33108f4625cafeb32d1430b725fd07a8"
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
