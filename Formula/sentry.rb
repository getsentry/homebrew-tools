class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.31.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.31.0/sentry-darwin-arm64.gz"
      sha256 "76d7c22b188ada76ae67f774205df1fda3cce8f48c775b3bf24e889a4f6f59a8"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.31.0/sentry-darwin-x64.gz"
      sha256 "4e5c3e54e281715681db3f180dbf33c87ddf9579db22b0aea24e45b3fed1c86e"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.31.0/sentry-linux-arm64.gz"
      sha256 "0eba8ce7619042619d28cfc8db1f220cf500e723f1d0897600b3724c51d28d55"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.31.0/sentry-linux-x64.gz"
      sha256 "87248eab608f597f317e81d5f381eed29d808cc40d3d133c01708e0bdfb311c1"
    else
      raise "Unsupported Linux CPU architecture: #{Hardware::CPU.type} (only 64-bit arm and x86_64 are supported)"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["sentry-*"].first => "sentry"
  end

  def post_install
    system bin/"sentry", "cli", "setup", "--method", "brew", "--no-modify-path"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry --version").chomp
  end
end
