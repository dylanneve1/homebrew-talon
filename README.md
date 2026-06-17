# homebrew-talon

Homebrew tap for [Talon](https://github.com/dylanneve1/talon) — a
multi-frontend AI agent with full tool access, streaming, cron jobs, and
plugins.

## Install

```bash
brew install dylanneve1/talon/talon
```

(equivalent to `brew tap dylanneve1/talon && brew install talon`)

## How it's maintained

`Formula/talon.rb` is **auto-bumped** by Talon's `publish` workflow on every
release: it points each macOS/Linux × x64/arm64 build at the matching
standalone binary attached to the corresponding
[Talon release](https://github.com/dylanneve1/talon/releases) and pins its
`sha256` from the release `SHA256SUMS`. Don't edit it by hand.
