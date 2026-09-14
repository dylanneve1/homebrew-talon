# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.33.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.4/talon-darwin-arm64"
      sha256 "cdf4a1857c8457fc843bc590a48a8a4d289e70875dff3e4a92c50aa0da861721"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.4/talon-darwin-x64"
      sha256 "917b8c05c082e49a5f0daaf48520bea90d77f3ed0cc2f976dc50c7653c5915b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.4/talon-linux-arm64"
      sha256 "c29d4dbe39b60fe7f551d79769fd7fe1be8d604c6c8b80dbcf5b8cf013b4e43e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.33.4/talon-linux-x64"
      sha256 "40206fc25a73543345f4c821ee9db25cb3f77e18a00ca47cef2574deba7b563e"
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
