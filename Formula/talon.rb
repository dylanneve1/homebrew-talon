# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.0/talon-darwin-arm64"
      sha256 "d305e5f85ac144a459feb134b38129c5644a800008091f32bb2af81702f41d36"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.0/talon-darwin-x64"
      sha256 "a6ec7b6e2aced83ab4e736eac1e98cf7895b7807ef239973f6adc3b0627cc774"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.0/talon-linux-arm64"
      sha256 "7dedf55835d51611875798c9843a8b6ffe3fcfee971e3f5f0c7b3af341885685"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.8.0/talon-linux-x64"
      sha256 "b464fd4a43e1f1fd7fb66e844f07eaecb70ca2b8f632cd7fd812da72c8daf342"
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
