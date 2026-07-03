# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.29.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.4/talon-darwin-arm64"
      sha256 "e13d06bdca00d9dfa97b7b089e7d0c34e75baafec913e29929f0c40d1cfa0f85"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.4/talon-darwin-x64"
      sha256 "bb2793ddf9a6cba01a992f916cdc47fa624fe5a17f52cf28011fa1089b584d95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.4/talon-linux-arm64"
      sha256 "5aa90ae36a608f6e343d332dfabf9475bc087169dc090ce30678b23748cfbaca"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.29.4/talon-linux-x64"
      sha256 "7e08069d5f6f7b4f15a2176c733c1d995df65b5b72090e120930087c7cb3ad57"
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
