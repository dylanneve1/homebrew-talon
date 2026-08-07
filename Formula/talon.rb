# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.19.0/talon-darwin-arm64"
      sha256 "156d40cd764a641bea2e42e114d2576d5fbcac59575d8bdee76a3064d62c96ea"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.19.0/talon-darwin-x64"
      sha256 "5707bba0e0312cefab2035f7cb1cdf15078b63c2446152a82e4e617c2af08183"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.19.0/talon-linux-arm64"
      sha256 "e90321fb7a3805f9628b236f659e8585862b95806c9c6bc3b19c194263e41668"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.19.0/talon-linux-x64"
      sha256 "daee94e3fa0e1ec6b3884150b10ecb3abf9d897bd54ec2d995561cbbed756331"
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
