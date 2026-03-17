class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.16.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.16.0/sentry-darwin-arm64.gz"
      sha256 "d33d3d36ed5ba311726efcc19f93b3338b06773c9d840b6eebe769896b773107"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.16.0/sentry-darwin-x64.gz"
      sha256 "b72d07eed6d4dca7dcd82ce03dbb28d0f87c25cd2437f06ca605dc698aa3a6ff"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.16.0/sentry-linux-arm64.gz"
      sha256 "4ef797a093e0d35128a7043fc9ee35b8fde7dc9818b3e729dc62921014dbf750"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.16.0/sentry-linux-x64.gz"
      sha256 "ad1e029d4188d6c43412c3c6597045d1c8d52419bb86cceaeaa0843e6cf661ef"
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
