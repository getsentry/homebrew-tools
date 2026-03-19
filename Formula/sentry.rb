class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.18.1"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.18.1/sentry-darwin-arm64.gz"
      sha256 "036c1f4c41a3622fa8c8fc5ec4eee0a078f4439a7f8ebd1a2717a0ce0c84dcd2"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.18.1/sentry-darwin-x64.gz"
      sha256 "51196e6ef07793bc687a030cd0277e5087ab6a79302083f7d4de407d63dc2bfb"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.18.1/sentry-linux-arm64.gz"
      sha256 "b01b21d5fafc590e3348310963668bc7002d3ace0e6e95f23ee7392314429c72"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.18.1/sentry-linux-x64.gz"
      sha256 "61a27ec9a320d8df8cb1f49a3b70f53626ba8c0d2440082f42fc404887ba1d9b"
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
