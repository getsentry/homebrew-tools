class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.41.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.41.0/sentry-darwin-arm64.gz"
      sha256 "e9ae37dfee727c5b13401c4f6745d45d3678018c1ab03d9e09e16f69e23e0439"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.41.0/sentry-darwin-x64.gz"
      sha256 "a6866f73e3fa8399e82e63a19aa0b1fe94048e0f01729bbd88504cddb39a45a3"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.41.0/sentry-linux-arm64.gz"
      sha256 "fb9286752fc23cb467cacf5cf0cd9f7a3a9fc4bfb33bd157694cb947908c9fa7"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.41.0/sentry-linux-x64.gz"
      sha256 "d555a8647b8c7016b7642b4b968fff2789c0c82968c8f029cb82925b868930d1"
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
