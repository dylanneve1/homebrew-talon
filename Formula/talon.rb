# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.32.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.32.1/talon-darwin-arm64"
      sha256 "7aee8baf8434483d3f703fc8a3c773d6979249e045d70d5c7a8c4b8db394bc6e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.32.1/talon-darwin-x64"
      sha256 "ea6220df4a0ee5bdd1cc56a2c995a9ed3404cfff1e1d11eb13a9821d0c24081f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.32.1/talon-linux-arm64"
      sha256 "94045696acd28f945f291c3139018e3abd4fc591e1925ac69f1acbca1f7e85af"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.32.1/talon-linux-x64"
      sha256 "2bf7b9653b0080271c7968c6d8ac339c3c0bf1f2e71fedc039205c7380e1ed0c"
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
