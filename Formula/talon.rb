# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.27.0/talon-darwin-arm64"
      sha256 "5c0572c41d55b642c8ec6158907464347c6142f18564088b02b7755edd4886b5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.27.0/talon-darwin-x64"
      sha256 "1f81639be3303a3ec3ab1ce6904bd15ae72ea20a1ee127127f73277b11d21bfe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.27.0/talon-linux-arm64"
      sha256 "eb83e0eecec7bacb117602960180ba60007b1880e3d8a9811b2d3219856c3570"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.27.0/talon-linux-x64"
      sha256 "f2e8cedc7ebf8b2f89fd1d19e389714a62f6316edc7bc8f1ee810fad8ee6102b"
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
