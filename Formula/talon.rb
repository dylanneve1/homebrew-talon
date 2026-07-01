# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.28.0/talon-darwin-arm64"
      sha256 "21c7e147c15c7cf361edc82f63ce20c4ffbf147714246b5ec79080bee8dc624e"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.28.0/talon-darwin-x64"
      sha256 "b68fa9f3697cd687009c1320cbc344df9f538d6ddc8314b90b9f71ecf24a1a01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.28.0/talon-linux-arm64"
      sha256 "583cca2640b70427c2dba4db073de4484ddf93cb1f582245268c93b944378a34"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.28.0/talon-linux-x64"
      sha256 "8ce461c9fe8b173288bb45e1919999abef24c22b9d631d0614003c3626f19dc8"
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
