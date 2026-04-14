class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.27.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.27.0/sentry-darwin-arm64.gz"
      sha256 "fe9e459f5eff50771cac4cf02cde7bfeeb1c4ea5e89f3f3d18cde11dfe17f7de"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.27.0/sentry-darwin-x64.gz"
      sha256 "20589ca88f7a49c869d2fd672ea9565e32d847810ee94dfa6f1c2fbb11c5abaf"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.27.0/sentry-linux-arm64.gz"
      sha256 "c57efe0eff72c88696a150b4cf1305bd07a9bbb2adc0fbb76cc2035cab9d24ad"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.27.0/sentry-linux-x64.gz"
      sha256 "3527b3d2045d924d3330fea9c8b67786c59c9bb6a45a91597401b8b515268c69"
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
