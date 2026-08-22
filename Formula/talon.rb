# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.0/talon-darwin-arm64"
      sha256 "c74a9c95b38e1d67bb725716a72c9d54821c44aeee637cd0547ad4fa7f5a0456"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.0/talon-darwin-x64"
      sha256 "036eb8f72f690a2bf7805d91a38a7afbf17086ffa69abb75be2c06318f349f87"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.0/talon-linux-arm64"
      sha256 "0cfc97fb62ec4c701bd1c940791b0b788385d0d1c990da3e5ae0f41396c74372"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.0/talon-linux-x64"
      sha256 "c9da1f57034ae2b3b31c7dfcb6231a959eaeab231f70ecbe801e22e0ec32ffa6"
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
