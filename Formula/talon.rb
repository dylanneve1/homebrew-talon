# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.1.0/talon-darwin-arm64"
      sha256 "3e2e0c45c27541466ef65c5dd432ab0ffee27656328c35ad22591b110e593809"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.1.0/talon-darwin-x64"
      sha256 "4044e030ddd91b7fe18b5e24cf915e50b5a64127c0fa6a2e5c1b8b95cb4746cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.1.0/talon-linux-arm64"
      sha256 "b8acb2ce410b469ec97ea9b469540ad9476e1a38f2c44c1e43bfcb38292ff125"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.1.0/talon-linux-x64"
      sha256 "263db95d5a58e083dd46203b53afac1bbb76c944c4de902387b0a86019e13137"
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
