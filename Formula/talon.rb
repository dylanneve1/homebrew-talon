# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.34.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.34.0/talon-darwin-arm64"
      sha256 "7a7770e83bda5a43b0803ffc167c8b026b2c74812f4f748be389a05b477c7ff5"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.34.0/talon-darwin-x64"
      sha256 "92b3b2f23509dedd7a82e1ef42860738ff8d8c7e60ec74ceb6f0bda4c228348d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.34.0/talon-linux-arm64"
      sha256 "ec0b50440db8c5c7e6f1172b816572ce05d897463f3bffd7185a49ed3d50ed67"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.34.0/talon-linux-x64"
      sha256 "0395a5163eb7b9bf7140c174466104d25417b4e3f850e392bdacfbfd3803dfca"
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
