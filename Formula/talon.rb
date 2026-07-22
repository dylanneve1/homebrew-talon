# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.3.0/talon-darwin-arm64"
      sha256 "041845af55afa27a625377313761aa5078b6ea020a48bc6b2477db4d5c4859ba"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.3.0/talon-darwin-x64"
      sha256 "eff5b8c706f079a269aa1df0e5ab694a5afe7a8d85b37f528734ad1e86b127ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.3.0/talon-linux-arm64"
      sha256 "c79653e20636424c940d78829386403d72501c50bf3bdb09c19b651debf10010"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.3.0/talon-linux-x64"
      sha256 "8cce18ceda53ddfdb463e993a514d0886e05dfae3471eab80429e76a58680625"
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
