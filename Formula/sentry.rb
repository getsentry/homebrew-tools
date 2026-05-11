class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.33.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.33.0/sentry-darwin-arm64.gz"
      sha256 "a552082ff3bc1ff0718bee7fda0854050576423f6847c0270543edc40e47f20f"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.33.0/sentry-darwin-x64.gz"
      sha256 "5d53a31b031cf040b383962d772a56e1714df6aa68b4a49d35d2c226584b15e5"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.33.0/sentry-linux-arm64.gz"
      sha256 "ac371481dbf972f8815c045f6563f13a27cbf1274cbf4e55a9a7c94d33148421"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.33.0/sentry-linux-x64.gz"
      sha256 "ca1be8c13d895f0c423fd16548bd5fe6c6fe19cedf3bab74cb753ba2175df72f"
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
