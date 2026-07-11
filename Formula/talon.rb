# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.40.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.2/talon-darwin-arm64"
      sha256 "de406a8b7ce21913f20d122b64a0b3602e790366c06fa26d6219c1b10e8b591d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.2/talon-darwin-x64"
      sha256 "22f847cdbd3585540c378c800a51c2503651f90ba253498cc88c93aa85179463"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.2/talon-linux-arm64"
      sha256 "375889704a54b49eb009fbf3a7fc9de5cae038f492e59d00c03d69408ca9f02f"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.40.2/talon-linux-x64"
      sha256 "1ebb148dd412c47ff6318558c7399ad5deab7a58fa45b16a7a401940835f333d"
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
