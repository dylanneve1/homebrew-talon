# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.30.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.30.1/talon-darwin-arm64"
      sha256 "2b8f33e357789bf4879c53c66a76cc5eed499ea2ea3b4e80ac14fd784d2ed250"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.30.1/talon-darwin-x64"
      sha256 "4d291b291f0214655713f4bdf2f34208200d476bfffeb6d85e69d032021bd986"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.30.1/talon-linux-arm64"
      sha256 "5ed55eb15085b60dd9a8997d26d092da92edcc685aa6c461c66260033ca60409"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.30.1/talon-linux-x64"
      sha256 "6abe5e8cef31b34eef7d5ae652cad768c5f66ac4cb9436ca80318178cfebb821"
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
