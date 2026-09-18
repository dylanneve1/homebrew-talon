# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.0/talon-darwin-arm64"
      sha256 "49511e0c74232d820756f4079caf53ad521d68e080801426cf7fa03a50f8ffaf"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.0/talon-darwin-x64"
      sha256 "0ff750986ab259d81841c7080b366a70a45ff51fb5e8bd1550e5eb19f5a17c40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.0/talon-linux-arm64"
      sha256 "87ccf13b4e6600287a74c923cf8f60f3bb0f8da1ade0468135712e90bf047e60"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.2.0/talon-linux-x64"
      sha256 "a21f1bcad0ce62ef71578bccc46106173359d0e3ee99a6fee952539c342f262b"
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
