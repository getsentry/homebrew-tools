class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.35.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.35.0/sentry-darwin-arm64.gz"
      sha256 "f0c77887457fc3b987b698de70481603ad5be4ab22bffee976e739534b50ab16"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.35.0/sentry-darwin-x64.gz"
      sha256 "47228fc9700d604d450b98c2db0914fd920e50bb9634ce15ac7ef94c11538282"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.35.0/sentry-linux-arm64.gz"
      sha256 "812a40cc82e67e443162c8ef4314ad4bb2336452f67a90221632956e5af290d5"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.35.0/sentry-linux-x64.gz"
      sha256 "d0aebb11488804bef790eb0fe9d4583ae2f2b6b8d4539c66c47098dceda9d8e1"
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
