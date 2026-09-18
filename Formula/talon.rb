# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.0.1/talon-darwin-arm64"
      sha256 "74a9d00b57b724f767cf7e0c01f0470118dd870fdb35df89750583446f189b03"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.0.1/talon-darwin-x64"
      sha256 "2bef5703b932435e4bcb41f2a717025433a52afaeb8aa23659dcf669ebcbd016"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.0.1/talon-linux-arm64"
      sha256 "57a0ff54fad651be9326718f963f85e50a049b71bf0a60e8f108f583dfdfd6aa"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.0.1/talon-linux-x64"
      sha256 "fd83de860caeb0856e94b59420d08a3c3f4598f2d078931d42e4527dca71608c"
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
