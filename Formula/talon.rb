# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "5.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.4.1/talon-darwin-arm64"
      sha256 "6ab1b649f6d25362dc0f15dd4dce4d47c4b26bbd7d0018bea2f99bf6d1c42a7d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.4.1/talon-darwin-x64"
      sha256 "588bcdb4a5d5962173c1b9df6b95b0c6fdc20e64940ad8e10b0ca7345fc88779"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v5.4.1/talon-linux-arm64"
      sha256 "872d7789ccaf3f7299310fdc1d4ba7b249977b80b23b0a95039e5b7f42e589c2"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v5.4.1/talon-linux-x64"
      sha256 "5a27b35e21247ad0ad3ae8e561740d3a1286a99b50a5728023ab07e49ca7cbc6"
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
