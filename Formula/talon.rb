# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.3/talon-darwin-arm64"
      sha256 "0b7e586958c1bae7e8eff673189dcb5a7e378580db55312b26e9b13aa1208293"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.3/talon-darwin-x64"
      sha256 "d90546cae3af3658155c37cdf4aefd9278517336acb95cb48be65d18f607de09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.3/talon-linux-arm64"
      sha256 "bad6759b1dd7eb7768e3cd49fe1c927460e27d0c774a55439cdbf52a8ec6891e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.3/talon-linux-x64"
      sha256 "b01fbfa7e71e83934050ec1ada88bbd56883b51f8edee6bb488d50f884cbf381"
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
