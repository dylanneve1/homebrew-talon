# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "3.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.1/talon-darwin-arm64"
      sha256 "2615b76c2874e365a80a2b435bc97626fea2d88c8ab122d4b1cfe7860cdc7017"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.1/talon-darwin-x64"
      sha256 "85cccba98a985f5550e3e8b344f246246e174ae7c398412aa07c7a298cb6e8a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.1/talon-linux-arm64"
      sha256 "4a41de110727e1cdba7af9403e743ef53737f048193a387c86943f1d802584be"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v3.6.1/talon-linux-x64"
      sha256 "c529d34bccc0d6100300f19368486eb8ed34cdfdd4a9b1052cfb66c81cf5439b"
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
