# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.12.0/talon-darwin-arm64"
      sha256 "812e39010164aefdfcab7a8cc638d693b80f711dad8a3ad9ef60324e3efba9a7"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.12.0/talon-darwin-x64"
      sha256 "d120107238bed914004852dcfb388fd3a72e93004f66d8a03ab611bae1b4bc32"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.12.0/talon-linux-arm64"
      sha256 "9df93647c9d26bfe0be71a4abcc658026da75a6e35eedf1c4476ea4cd5a71c39"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.12.0/talon-linux-x64"
      sha256 "3d4ce55c1ff34ba27f0226f9e8bdaf8ae1d3a9f910954ecdf68f09a083372fc7"
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
