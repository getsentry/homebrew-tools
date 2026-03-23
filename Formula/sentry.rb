class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.20.0"
  license "FSL-1.1-MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.20.0/sentry-darwin-arm64.gz"
      sha256 "1723c9d2fb024bf21e00fa0b85e88ebf33a63af7b7976e77c365fc9cae61b4c4"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.20.0/sentry-darwin-x64.gz"
      sha256 "3dd57414f2160a974037268926bc34c8b917468deb12743e07ff463ec00ed1e8"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.20.0/sentry-linux-arm64.gz"
      sha256 "4846aed15d38d26b428b1525cb97abaf0caf3b8832ca187fb4915b4a940c54e0"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.20.0/sentry-linux-x64.gz"
      sha256 "bd22c102bdb6e99391d946a87c35a738a920eec025a5c3c0d41027095e8ec0a3"
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
