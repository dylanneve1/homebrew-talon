# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "2.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.2/talon-darwin-arm64"
      sha256 "378eb653ee263f885b2cddfd6ef063fc20b55abd8960c518a998b5a95dcc32cb"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.2/talon-darwin-x64"
      sha256 "616432d8f9c4a712b2d518ca221c851fd93b3b1be73c000fc9c8ccd8c8702237"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.2/talon-linux-arm64"
      sha256 "f5074adbcaf08574a4a616c8518321b3cd331205b7014c41f721bc65bb751fde"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v2.0.2/talon-linux-x64"
      sha256 "7ba32cdda0faabc83dd17b62dedf24edfee6f9fb7a9622c41a1e608a77135931"
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
