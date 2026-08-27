class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.44.0"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.44.0/sentry-darwin-arm64.gz"
      sha256 "214be12306e6930dd6c93302e0172b75dd4b595f5204282e58be032e8e67113b"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.44.0/sentry-darwin-x64.gz"
      sha256 "54607370167d002f0011e9202ce87b3ebaa719e4520221c2943988965f9dec17"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.44.0/sentry-linux-arm64.gz"
      sha256 "ee7ae0cac2ba7b68c5993ec42ebda2bded51fb227a293ec2f25fbfb4e77e181b"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.44.0/sentry-linux-x64.gz"
      sha256 "85d8f13808d76f15c0cc49b40c0198408a54f364b952a61e3f8d2b7e2c591251"
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
