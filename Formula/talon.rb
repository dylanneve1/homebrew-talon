# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.23.0/talon-darwin-arm64"
      sha256 "59a3c086263f26a6d6cb62e9105d96eabc6b0d9837f188b1afa2726bf5e87830"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.23.0/talon-darwin-x64"
      sha256 "e7181fc755954fad001eb88a933c1bc1bfecc7f240aceffd8f78df567519226d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.23.0/talon-linux-arm64"
      sha256 "e3d925d371de490723b0c92e998d475ebd91a153809ad2a4e97e8588147d3cf6"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.23.0/talon-linux-x64"
      sha256 "f68fb18d0b6fabe8ace543a616d8f76f451859bf3293c8ca87f6734b6038748a"
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
