# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.37.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.4/talon-darwin-arm64"
      sha256 "14ecf3dd367bf640f8f19b9058e6499cf42025113d46b5f9ad54afba543722a3"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.4/talon-darwin-x64"
      sha256 "d3b7ed3bac6dd4aeef32a278e97e04ef64368262e04c57116b617b5e5aa5f9d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.4/talon-linux-arm64"
      sha256 "9b477fd72f6d9b3d3a64f05704746d7465b720ce79e6b2e436bac72c51303292"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.4/talon-linux-x64"
      sha256 "cbd7ed7a44941987b20444a26d762b0d80b9aff163e2bbfff41fee606465e5e9"
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
