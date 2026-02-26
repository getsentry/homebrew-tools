class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.13.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.13.0/sentry-darwin-arm64.gz"
      sha256 "0d6002fd4380bcf38192e855b50f0a71436d7aa277b7ed835053fb77cdc695b5"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.13.0/sentry-darwin-x64.gz"
      sha256 "f008fb24c415b14b8f54eb135c533dcca333f3edc7edf6d52bd2d4e527b58180"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.13.0/sentry-linux-arm64.gz"
      sha256 "f7c9863ad0bf419bcfe65956fa9c276a33356cf9128a2c4f791e6bbb79c89ce8"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.13.0/sentry-linux-x64.gz"
      sha256 "ec9510df82ba4efc133a7282387b1040a06010b3755ffe413c496f58fa13a358"
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
