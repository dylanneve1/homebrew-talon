# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.13.0/talon-darwin-arm64"
      sha256 "595906daa0e6aa661771decb68db41af0fcfe2363e80c20a5ac3fb73289fb7ec"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.13.0/talon-darwin-x64"
      sha256 "441ff92feb9f03e7823a9c6cd13892bc25ffcafe08a5c79129eb060ca1026ee0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.13.0/talon-linux-arm64"
      sha256 "a770a985ba2e55b8841a5afb88940aa4eddee8190ca7b815ca690212caa30bf9"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.13.0/talon-linux-x64"
      sha256 "2e41cb1db001dc8561e36aa966f523b81f5ce8557db6d7debd85b86591413a75"
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
