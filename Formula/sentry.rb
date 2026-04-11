class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.26.1"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.26.1/sentry-darwin-arm64.gz"
      sha256 "c33b03072b869006af028856f705a673c9a5ab881ead7e62945a51ca37c8f9ff"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.26.1/sentry-darwin-x64.gz"
      sha256 "3255726a6b56dbaf5a91fae5d95d5c9c33db996ba911caa44879409cafd90c25"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.26.1/sentry-linux-arm64.gz"
      sha256 "562b50d3f9f109da6a25833e65922ec052c5a05d5530826dbe11c117b9313f57"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.26.1/sentry-linux-x64.gz"
      sha256 "1811eac8590a698d891a2bc8bcd4dab06fbd76cb3349866a642c26704ca86c70"
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
