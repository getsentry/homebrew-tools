class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.39.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.39.0/sentry-darwin-arm64.gz"
      sha256 "68a21f0855971005df96d3547ca164d67d3bae73557e6edee4506b9e06217d57"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.39.0/sentry-darwin-x64.gz"
      sha256 "d0ab9c7be7e9e97ca618fe3ecf8dad8c95216b368b50e3ebe32a0bec73030e1f"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.39.0/sentry-linux-arm64.gz"
      sha256 "71c2c1180f131e6cfd1b4802e1c3615ac7f0c0a74dc0b52e316f5f07ade42212"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.39.0/sentry-linux-x64.gz"
      sha256 "504425b1c5ddb2cd3d2f3ba3580b5a051b820cfdbd1d40b8035af6ee77bd5c63"
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
