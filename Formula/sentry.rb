class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.17.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.17.0/sentry-darwin-arm64.gz"
      sha256 "907e9cb3a083d1a258208f31ac3f93c2e8ed6e4ff0548929e29aafdeba5fa2cf"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.17.0/sentry-darwin-x64.gz"
      sha256 "34425641c9a7707f68ada91d5a453d3478ec6d4df02a49b600690c3c35e3ffdf"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.17.0/sentry-linux-arm64.gz"
      sha256 "b8951f0e839265c8618adcb99dea401828f650392f82738bcb3af6dab8abd70a"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.17.0/sentry-linux-x64.gz"
      sha256 "1ffaeb7b42f542e1f07b58a4c5a9515a0f7adf96299cd345983303c8df4691a1"
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
