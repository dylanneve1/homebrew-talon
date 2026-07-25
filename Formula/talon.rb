# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.9.0/talon-darwin-arm64"
      sha256 "afd7a41524150c1b034e823db0c63180bf5beda12684c993126d2b6cf63d1607"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.9.0/talon-darwin-x64"
      sha256 "b5e84c98577b61ae6c7d867f0b4c1a8838255044a59d88db399348955c679280"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.9.0/talon-linux-arm64"
      sha256 "f11c9a85a9d9956146508b0a28083191f7ee88d051f6bd2bae214d5824fba5bc"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.9.0/talon-linux-x64"
      sha256 "e35b35aedee9475043597bcaf9c162f365059fdb55387d6619c70dadfd80cc81"
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
