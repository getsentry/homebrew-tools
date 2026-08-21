class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.43.0"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/cli/releases/download/0.43.0/sentry-darwin-arm64.gz"
      sha256 "c7b1b02fbfcb07a178e88a52dc457328e343ef9561b2d8250402eb9c8c123476"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/cli/releases/download/0.43.0/sentry-darwin-x64.gz"
      sha256 "e3431dcdf7fcddbf2acab0f49c501989a0cb195c56e3a0234bc0890f791786fb"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.43.0/sentry-linux-arm64.gz"
      sha256 "c4d059de567fbba9445c40666ff372b6ef9196a2d52310754802db4f469d361c"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/cli/releases/download/0.43.0/sentry-linux-x64.gz"
      sha256 "3003d78a3c0740acc39584009ca2dd6f28da9f0365cb2853d89c43a42a1f160b"
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
