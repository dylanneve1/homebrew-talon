# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.2/talon-darwin-arm64"
      sha256 "d1e0a893d970a290cdb1b4ae3b79b49aa047e90c5402848745a3f200ec33fb8e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.2/talon-darwin-x64"
      sha256 "606dcf89ead8035a25ced240267e7441fd291c1437591f857801a0b897704c19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.2/talon-linux-arm64"
      sha256 "304cc57854b2ba70cb2e309f7db5103f494d89771428e481fa4ef3eda63909d0"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.0.2/talon-linux-x64"
      sha256 "8a0fbc8d7ae7ab0047479f52f987b78d7ce8e2dce337c2591f026bbe9387e636"
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
