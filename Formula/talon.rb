# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.2/talon-darwin-arm64"
      sha256 "da36ccd03fa8b89b20b7f58c22e14d0fff67ae31d455a2bed30c3b86b111449d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.2/talon-darwin-x64"
      sha256 "444538627b9b75e72395591a39a6794334fe8f43726ea62ed76af0e9cddb5b4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.2/talon-linux-arm64"
      sha256 "2e77f8b59495db122c23a85eb8b60820afc03bd398967ea46b57ab21d1bf2f13"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.12.2/talon-linux-x64"
      sha256 "c8e8a090a76748181744bdadd294a219f2cabe35c27a432c99530a409f509ecb"
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
