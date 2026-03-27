class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.21.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.21.0/sentry-darwin-arm64.gz"
      sha256 "8acc6eb48870470060db1e9ec28feb2cc4cf569ca605f5fd3c7a71ae1fabc12d"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.21.0/sentry-darwin-x64.gz"
      sha256 "8834d903b86a67867e61da1f57d8a6300db9a22a2e9ea14b3085c19d32729465"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.21.0/sentry-linux-arm64.gz"
      sha256 "971f975590379606b7d095507f2a2f18848c467c3b48685af20c5311868ddca4"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.21.0/sentry-linux-x64.gz"
      sha256 "4c076c689ba0966c8dfdab9237fd7839a82ef13aadb5c16f325d5e7204aff73a"
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
