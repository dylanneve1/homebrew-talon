# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.14.0/talon-darwin-arm64"
      sha256 "f04d830da9b192154c2c1f9f98d66477e87d5bd65eb356f809bd9729282191c6"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.14.0/talon-darwin-x64"
      sha256 "97e0ccacee666876c1df760f0fbe2b2120d633f6efd23997c038813f359175a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.14.0/talon-linux-arm64"
      sha256 "d3d43e3c8d3a2bf6442d91fe2e3933226b8d35922f621b75064179fcc064c239"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.14.0/talon-linux-x64"
      sha256 "42b259c278ef441efb8c277ffb08d5001193047a12016c488b31b9c7d06666fc"
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
