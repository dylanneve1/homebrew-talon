# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.3.0/talon-darwin-arm64"
      sha256 "5ecd71fd19110f35ea47d0aea449f2d2e63cf7d47fead449a99974e4c3aab0a5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.3.0/talon-darwin-x64"
      sha256 "615bbad42005984a21d6c01a48c39262990da18162b64bd5216b896cdd58bd8e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.3.0/talon-linux-arm64"
      sha256 "8896330fd74f4db799a42aa29b625546eb8301a889bb5b86c248a9958ab877b2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.3.0/talon-linux-x64"
      sha256 "570d94ed1d743e07295237fb705363e738524bde76a2043b7f8e6e3d7aa7013c"
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
