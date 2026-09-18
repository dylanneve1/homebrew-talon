# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.0.0/talon-darwin-arm64"
      sha256 "abd57756f9da7e012be0b55efc7f489bf5173b499cbb3e6c62a11a223b6b7582"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.0.0/talon-darwin-x64"
      sha256 "12175d7613962ce6e28504d6097e797ee9f7b94bcc7c8b49c7022dab5fa944b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.0.0/talon-linux-arm64"
      sha256 "89d6b493ca855449d5253c8198bdea6bc0653a0ed1ee42581698154ca1af81cd"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.0.0/talon-linux-x64"
      sha256 "c36f98f0ed56a8c8ec24f13a8808244a177efed30617a56092e6e46936ffd4c1"
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
