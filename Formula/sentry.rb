class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.24.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.24.0/sentry-darwin-arm64.gz"
      sha256 "cdff4b78dc3a636f91252585764fad93d8f59d740db54ed02db15d7f7fc74bae"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.24.0/sentry-darwin-x64.gz"
      sha256 "e549c81b86215c752d274d4ac48d2087de5ec3f9a6df9ffce1b0896c9a61cf39"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.24.0/sentry-linux-arm64.gz"
      sha256 "5423d007ee92433dd49fbdbaeac63c80e5bef0bfd547e31b3da49559bc239483"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.24.0/sentry-linux-x64.gz"
      sha256 "9bfbd4d364c5cae9db0fe01274ea11795e3320ec9f9ca4cba4a084e51470819b"
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
