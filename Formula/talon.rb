# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.25.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.3/talon-darwin-arm64"
      sha256 "b312f3a88aa44922e005ec83e2fe3b818e878a835a3cfe4dda96bbc03c659a06"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.3/talon-darwin-x64"
      sha256 "63ea5c0e84886a3211825e7b9382a57b27e492e7bf7d13b91abf30116ba27876"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.3/talon-linux-arm64"
      sha256 "b2889e3766ba3af4678bd16c6266858b9b28c764cdf9f8df1873046669c17041"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.25.3/talon-linux-x64"
      sha256 "2416031542f040bc95b8dfef4382d1d22bdaf53091d1e4e5fbe624ec4d1e9307"
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
