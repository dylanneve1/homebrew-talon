# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.37.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.2/talon-darwin-arm64"
      sha256 "12c94110b92c05c02c355565593375c2457ee3ce766c644c1712dd798fc1a726"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.2/talon-darwin-x64"
      sha256 "fe4337b3e90bde528a9186745b871c4f5fa102a4adc8908df8ef021724dfde27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.2/talon-linux-arm64"
      sha256 "87f56d71a3a376a1915b762683b2c0cea5bf8493a3a06f4a16bfa358ec9323d1"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.37.2/talon-linux-x64"
      sha256 "5ac3739994a25122653b4934a96e71a3beb44df94b86332079d25de42efa1fbf"
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
