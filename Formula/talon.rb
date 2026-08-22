# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.24.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.24.1/talon-darwin-arm64"
      sha256 "20568ad0d40b96b7b12f12eb556844a26c189e9ddf29052301500b1f18f62079"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.24.1/talon-darwin-x64"
      sha256 "c3892655c60704d419ea2a987ceb85dcf7f778d0b4d04bc1186089b7c1f35da1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.24.1/talon-linux-arm64"
      sha256 "f324671f5411d06b33dffde6839d0ee8f0b27951ef0a4ae12121e9ea96d6822c"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.24.1/talon-linux-x64"
      sha256 "b69b7efaec8c7904fd2975b0eba5c2e6e4e19aa5a425d468b3629d1a5d044afe"
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
