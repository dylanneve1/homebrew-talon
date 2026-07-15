# typed: false
# frozen_string_literal: true

# Homebrew formula for Talon — auto-bumped by the talon publish workflow.
class Talon < Formula
  desc "Multi-frontend AI agent with full tool access, streaming, cron jobs, and plugins"
  homepage "https://github.com/dylanneve1/talon"
  version "1.47.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.2/talon-darwin-arm64"
      sha256 "a815ef36c2dd5a2efc4a3f57c093e2b73b4853a69b4801005a4702317d91f9cf"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.2/talon-darwin-x64"
      sha256 "3feb1f46157342a206fb70cc67f43a2b96f78db44acf8d6df63df34bc2195124"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.2/talon-linux-arm64"
      sha256 "1f192fc5456ee76fd647eb999a768a2f826e5a8ac383127be927c1dafd519f1d"
    else
      url "https://github.com/dylanneve1/talon/releases/download/v1.47.2/talon-linux-x64"
      sha256 "0a36560f4ec2cb850e529ea7ce2398696418adf5316146455f263155dd3f22f5"
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
